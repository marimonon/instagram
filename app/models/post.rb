class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :contain, presence: true
  has_many :photos, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  has_many :fab, dependent: :destroy
  
  accepts_nested_attributes_for :photos 
   
  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end
end
