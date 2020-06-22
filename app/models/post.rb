class Post < ApplicationRecord
  belongs_to :user, optional: true
  # default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :contain, presence: true
  
  has_many :comments, dependent: :destroy
  has_many :fab, dependent: :destroy
   
  def favorited_by?(user)
      fabs.where(user_id: user.id).exists?
  end
  
  mount_uploader :contain, ImageUploader
end
