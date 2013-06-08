class AddUserIdToBasicProfiles < ActiveRecord::Migration
  def change
	 add_column :basic_profiles, :user_id, :integer

  end
end
