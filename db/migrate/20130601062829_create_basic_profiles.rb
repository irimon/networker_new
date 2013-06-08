class CreateBasicProfiles < ActiveRecord::Migration
  def change
    create_table :basic_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :headline
      t.string :industry
      t.string :location
      t.string :specialities
      t.string :summary

      t.timestamps
    end
  end
end
