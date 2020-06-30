class Post < ApplicationRecord
  belongs_to :user, optional: true
  # default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :contain, presence: true
  
  has_many :comments, dependent: :destroy
  has_many :fabs, dependent: :destroy
   
  def fabd_by(user)
    # user_idとpost_idが一致するfabを検索する
    Fab.find_by(user_id: user.id, post_id: id)
  end
  
  mount_uploader :contain, ImageUploader
end
