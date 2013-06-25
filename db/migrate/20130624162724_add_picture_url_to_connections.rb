class AddPictureUrlToConnections < ActiveRecord::Migration
  def change
	  	add_column :connections, :picture_url, :string

  end
end
