class User < ActiveRecord::Base
	has_many :messages
	has_many :comments
	has_many :likes
	
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save do 
  	self.email.downcase!
  end

  def self.join_messages
  	self.joins(:messages).select(:id, :name, :content, :vote).order(:vote => :DESC)
  	
  end

end
