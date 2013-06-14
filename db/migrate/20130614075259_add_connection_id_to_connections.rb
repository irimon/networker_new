class AddConnectionIdToConnections < ActiveRecord::Migration
  def change
  	add_column :connections, :connection_id, :integer
  end
end
