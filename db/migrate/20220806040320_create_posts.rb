class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.integer :user_id
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
