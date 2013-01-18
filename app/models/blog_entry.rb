class BlogEntry < ActiveRecord::Base
  attr_accessible :story, :title, :updated_at, :user, :image
  belongs_to :user

  validates :title, :story, :presence => true

  mount_uploader :image, ImageUploader
end
