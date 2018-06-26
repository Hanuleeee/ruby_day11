class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|

      t.string :title
      t.text :contents
      t.integer :user_id  # 외래키가 될 겁니다.
      
      t.timestamps
    end
  end
end
