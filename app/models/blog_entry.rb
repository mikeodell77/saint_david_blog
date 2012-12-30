class BlogEntry < ActiveRecord::Base
  attr_accessible :story, :title, :updated_at
end
