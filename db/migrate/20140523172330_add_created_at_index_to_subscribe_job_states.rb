class AddCreatedAtIndexToSubscribeJobStates < ActiveRecord::Migration
  def change
    add_index :subscribe_job_states, [:created_at], name: 'index_subscribe_job_states_on_created_at'
  end
end
