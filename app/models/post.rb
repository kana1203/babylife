class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre 
  has_many :comments, foreign_key: "post_id", dependent: :destroy
  has_many :favorites
  
  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end

  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  mount_uploader :image, ImageUploader
end
