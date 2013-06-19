# == Schema Information
#
# Table name: connections
#
#  id               :integer          not null, primary key
#  first_name       :string(255)
#  last_name        :string(255)
#  industry         :string(255)
#  headline         :string(255)
#  country          :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  connection_id    :integer
#  uniquness_number :string(255)
#

class Connection < ActiveRecord::Base
  attr_accessible :country, :first_name, :headline, :industry, :last_name, :connection_id, :uniquness_number
  belongs_to :user
  has_many :update_events
  
  def add_update_event(new_update)
		if update_events.find_by_content(new_update).nil?
			update = UpdateEvent.new
			update.content = new_update
			update.connection = self
			update.save
		end
	end

	
end
