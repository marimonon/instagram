class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true
  has_many :photos, dependent: :destroy
    accepts_nested_attributes_for :photos
  
  has_many :comments, dependent: :destroy
  has_many :fab, dependent: :destroy
  
  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end
  

end
