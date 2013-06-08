class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string :first_name
      t.string :last_name
      t.string :industry
      t.string :headline
      t.string :country

      t.timestamps
    end
  end
end
