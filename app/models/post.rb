class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :votes
  has_many :comments
  validates_presence_of :body
  validates_length_of :body, :maximum=>255
<<<<<<< HEAD
<<<<<<< HEAD
  paginates_per 7
=======
>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400
=======
>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400

end
