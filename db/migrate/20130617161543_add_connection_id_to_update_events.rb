class AddConnectionIdToUpdateEvents < ActiveRecord::Migration
  def change
    	add_column :update_events, :connection_id, :integer
  end
end
