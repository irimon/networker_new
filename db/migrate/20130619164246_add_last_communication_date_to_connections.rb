class AddLastCommunicationDateToConnections < ActiveRecord::Migration
  def change
	add_column :connections, :last_communication_date, :datetime
  end
end
