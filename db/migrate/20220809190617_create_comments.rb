class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :authorId
      t.bigint :postId
      t.text :text

      t.timestamps
    end
  end
end
