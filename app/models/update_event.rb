# == Schema Information
#
# Table name: update_events
#
#  id            :integer          not null, primary key
#  content       :string(255)
#  stamp         :time
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  connection_id :integer
#

class UpdateEvent < ActiveRecord::Base
  attr_accessible :content, :stamp
  belongs_to :connection
end
