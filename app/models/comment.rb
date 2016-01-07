class Comment < ActiveRecord::Base
  
  has_many :recipe_comments
  
  validates :comment, presence: true, length: { minimum: 1, maximum: 500 }
  
end