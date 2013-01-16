class Comment < ActiveRecord::Base
  attr_accessible :blog_entry_id, :comments, :name

  belongs_to :blog_entry
end
