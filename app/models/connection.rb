class Connection < ActiveRecord::Base
  attr_accessible :country, :first_name, :headline, :industry, :last_name
  belongs_to :user
end
