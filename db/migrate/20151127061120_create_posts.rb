class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title,             null: false, length: { maximum: 20 }
      t.text :body,                null: false
      t.string :category,          null: false, length: { maximum: 20 }
      t.string :image

      t.timestamps null: false
    end
  end
end
