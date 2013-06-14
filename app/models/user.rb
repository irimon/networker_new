# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at _     :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  
  has_one :BasicProfile, :dependent => :destroy
  
  has_many :connections, foreign_key: "connection_id", dependent: :destroy
  #has_many :connections, dependent: :destroy
  #before_save { |user| user.email = email.downcase }
   before_save { email.downcase! }
   before_save :create_remember_token

  validates :name, presence: true
  validates :email, presence: true,  uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  
   # def set_BasicProfile_name= (name)
		# self.BasicProfile.first_name = name
    # end
	
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
	
  

end
