class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      t.references :user, null: false
      t.references :post, null: false

      t.timestamps
    end
  end
end
