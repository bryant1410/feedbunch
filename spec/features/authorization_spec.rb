require 'spec_helper'

describe 'authorization' do

  before :each do
    @normal_user = FactoryGirl.create :user
    @admin_user = FactoryGirl.create :user_admin
  end

  it 'shows Resque link to admin users' do
    login_user_for_feature @admin_user
    visit read_path

    page.should have_css 'a[href="/resque"]'
  end

  it 'does not show Resque link to non-admin users' do
    login_user_for_feature @normal_user
    visit read_path

    page.should_not have_css 'a[href="/resque"]'
  end

  it 'does not allow access to Resque to non-admin users' do
    login_user_for_feature @normal_user
    expect {visit '/resque'}.to raise_error ActionController::RoutingError
  end
end