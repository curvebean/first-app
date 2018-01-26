class CreateTable < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :image_name
      t.string :content
      t.integer :user_id
      t.timestamps
    end
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
    create_table :talks do |t|
      t.string :content
      t.string :image_name
      t.integer :send_user_id
      t.integer :sended_user_id

      t.timestamps
    end
    create_table :friends do |t|
      t.integer :from_id
      t.integer :to_id

      t.timestamps
    end
  end
end
