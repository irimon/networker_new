class AddUniqunessNumberToConnections < ActiveRecord::Migration
  def change
	add_column :connections, :uniquness_number, :string
  end
end
