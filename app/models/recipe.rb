class Recipe < ActiveRecord::Base
  has_many :likes
  belongs_to :chef
  
  validates :chef_id, presence: true
  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :summary, presence: true, length: {minimum: 10, maximum: 150}
  validates :description, presence: true, length: {minimum: 20, maximum: 500}
  mount_uploader :picture, PictureUploader
  validate :picture
  default_scope -> { order(updated_at: :desc) }
 
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
 
  private
  	def picture_size
    	if picture.size > 5.megabytes
      	errors.add(:picture, "Should be less than 5MB")
    	end
  	end
end
