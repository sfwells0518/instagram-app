class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :post_image
      t.text :caption
      t.integer :profile_id
      t.integer :user_id

      t.timestamps
    end
  end
end
