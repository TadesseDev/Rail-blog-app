class AddUsersAndPostsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :likes, :users, column: :authorId
    add_foreign_key :likes, :posts, column: :postId
  end
end
