# == Schema Information
#
# Table name: connections
#
#  id                      :integer          not null, primary key
#  first_name              :string(255)
#  last_name               :string(255)
#  industry                :string(255)
#  headline                :string(255)
#  country                 :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :integer
#  connection_id           :integer
#  uniquness_number        :string(255)
#  last_communication_date :datetime
#  current_date            :datetime
#

class Connection < ActiveRecord::Base
  attr_accessible :country, :first_name, :headline, :industry, :last_name, :connection_id, :uniquness_number, :picture_url
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
	
	def set_last_communication_date(date)
		last_communication_date = date
	end
	
	def get_last_communication_date
		last_communication_date
	end

	def should_send_update(time_ago)
		if !update_events.last.nil?
			current_date = Time.now.to_date 
			latest_date = current_date - time_ago.to_i
			res = (latest_date > update_events.last.created_at.to_date)
		else
			false
		end
	end
			
	
end
