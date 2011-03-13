class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :votes
  has_many :comments
  validates_presence_of :body
  validates_length_of :body, :maximum=>255
  paginates_per 7

end
