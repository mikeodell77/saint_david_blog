class Comments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.string :name
      t.text :comment
      t.integer :blog_entry_id

      t.timestamps
    end
  end

  def down
  end
end
