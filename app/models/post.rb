class Post < ApplicationRecord
  belongs_to :user
  #validates :content_or_picture, presence :true
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  has_many :likes
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end
  private

  def content_or_picture
    content.presence or picture.presence
  end
end
