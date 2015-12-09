class Post < ActiveRecord::Base

  has_many :comments

  mount_uploader :image, ImageUploader

  validates :title,
    presence: true, length: { maximum: 20 }
  validates :category,
    presence: true, length: { maximum: 20 }
  validates :body,
    presence: true
end
