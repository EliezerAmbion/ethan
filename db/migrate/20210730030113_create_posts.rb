class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :rating
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
