class AddCurrentDateToConnections < ActiveRecord::Migration
  def change
  	add_column :connections, :current_date, :datetime
  end
end
