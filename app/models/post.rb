class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre 
  
  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
  # mount_uploader :image, ImageUploader
end
