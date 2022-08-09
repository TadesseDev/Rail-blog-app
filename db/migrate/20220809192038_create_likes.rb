class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.bigint :authorId
      t.bigint :postId

      t.timestamps
    end
  end
end
