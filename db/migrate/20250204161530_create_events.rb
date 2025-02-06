class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.string :location
      t.datetime :event_date

      t.timestamps
    end
  end
end
