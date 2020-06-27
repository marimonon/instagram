class Comment < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user, optional: true
  default_scope -> { order(created_at: :desc) }
  validates :textcomment, presence: true
end
