class RecipeComment < ActiveRecord::Base
  
  belongs_to :recipe
  belongs_to :chef
  belongs_to :comment
  
end