class Ingredient < ActiveRecord::Base
  
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 50 }
  
end