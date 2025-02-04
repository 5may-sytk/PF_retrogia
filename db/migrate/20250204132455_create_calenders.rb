class CreateCalenders < ActiveRecord::Migration[6.1]
  def change
    create_table :calenders do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :location #場所
      t.datetime :event_at #訪問日時

      t.timestamps
    end
  end
end
