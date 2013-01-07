class BlogEntry < ActiveRecord::Base
  attr_accessible :story, :title, :updated_at, :user
  belongs_to :user

  validates :title, :story, :presence => true
end
