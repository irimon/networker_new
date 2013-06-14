class Connection < ActiveRecord::Base
  attr_accessible :country, :first_name, :headline, :industry, :last_name, :connection_id, :uniquness_number
  belongs_to :user
end
