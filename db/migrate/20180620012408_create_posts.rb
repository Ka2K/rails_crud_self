class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      # t.string :username => t.integer :user_id -> 1:N 관계를 위해
      # user_id로 네이밍 되어있는 것은 실제로 외부에 있는것을 가지고 오는 것이다라고 인식하는것이 약속이다.
      t.string :title
      t.text :content
      t.timestamps null: false
    end
  end
end
