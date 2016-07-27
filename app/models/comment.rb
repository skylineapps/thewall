class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  has_many :likes

  validates :content, :presence => true
end
