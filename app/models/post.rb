class Post < ApplicationRecord
  belongs_to :user
  #validates :content_or_picture, presence :true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  private

  def content_or_picture
    content.presence or picture.presence
  end
end
