class Photo < ApplicationRecord
  belongs_to :post, optional: true
  validates :image, presence: true
  
  mount_uploader :image, ImagesUploader
end
