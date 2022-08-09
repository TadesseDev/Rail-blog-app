class AddAllIndexs < ActiveRecord::Migration[7.0]
  def change
    add_index :posts, :authorId
    add_index :likes, :authorId
    add_index :likes, :postId
    add_index :comments, :authorId
    add_index :comments, :postId
  end
end
