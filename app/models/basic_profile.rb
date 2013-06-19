# == Schema Information
#
# Table name: basic_profiles
#
#  id           :integer          not null, primary key
#  first_name   :string(255)
#  last_name    :string(255)
#  headline     :string(255)
#  industry     :string(255)
#  location     :string(255)
#  specialities :string(255)
#  summary      :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#

class BasicProfile < ActiveRecord::Base
  attr_accessible :first_name, :headline, :industry, :last_name, :location, :specialities, :summary
  belongs_to :user
  
  validates :user_id, presence: true

	
end
