##
# Controller to access the Feed model.

class FeedsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html, only: [:index, :show, :refresh]
  respond_to :json, only: [:create]

  ##
  # list all feeds the currently authenticated is suscribed to

  def index
    @feeds = current_user.feeds
    @folders = current_user.folders
    respond_with @feeds, @folders
  end

  ##
  # Return HTML with all entries for a given feed, as long as the currently authenticated user is suscribed to it.
  #
  # If the param :id is "all", all entries for all feeds subscribed by the current user will be returned.
  #
  # If the requests asks for a feed the current user is not suscribed to, the response is a 404 error code (Not Found).

  def show
    feed_id = params[:id]

    # If asked for feed_id="all", respond with entries of all feeds
    if feed_id == 'all'
      @entries = current_user.entries
    else
      # If asked for a feed id, respond with entries for this feed
      @entries = current_user.feeds.find(feed_id).entries
    end

    if @entries.present?
      respond_with @entries, layout: false
    else
      head status: 404
    end

    return
  rescue ActiveRecord::RecordNotFound
    head status: 404
  end

  ##
  # Fetch a feed and save in the database any new entries, as long as the currently authenticated user is suscribed to it.
  #
  # After that it does exactly the same as the show action: return HTML with all entries for the feed

  def refresh
    @feed = current_user.feeds.find params[:id]
    if @feed.present?
      FeedClient.fetch @feed.id
      @feed.reload
      respond_with @feed, layout: false
    else
      head status: 404
    end
  rescue ActiveRecord::RecordNotFound
    head status: 404
  end

  ##
  # Subscribe the authenticated user to the feed passed in the params[:subscribe][:rss] param.
  # If successful, return HTML with the entries of the feed.
  #
  # If the param is not the URL of a valid feed, search among known feeds and return HTML with any matches.

  def create
    feed_url = params[:subscription][:rss]
    # If user is already subscribed to the feed, return 304
    if current_user.feeds.where(fetch_url: feed_url).present? || current_user.feeds.where(url: feed_url).present?
      head status: 304
    else
      # User is not yet subscribed to the feed
      @feed = Feed.subscribe feed_url, current_user.id
      if @feed
        respond_with @feed
      else
        #TODO respond with html for search results
        head status: 404
      end
    end
  end
end
