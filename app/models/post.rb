class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user

  default_scope -> { order(created_at: :desc) }

  mount_uploader :image, ImageUploader

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
