class UpdateColumnTypeForStoryInBlogEntries < ActiveRecord::Migration
  def up
  	change_column :blog_entries, :story, :text
  end

  def down
  end
end
