class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.text :text
      t.integer :commentsCount
      t.integer :likesCount

      t.timestamps
    end
  end
end
