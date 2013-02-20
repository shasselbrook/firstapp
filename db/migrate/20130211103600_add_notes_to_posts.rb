class AddNotesToPosts < ActiveRecord::Migration
  def up
    change_table :posts do |p|
      p.string :notes
    end
  end
  def down
    remove_column :posts, :notes
  end
end
