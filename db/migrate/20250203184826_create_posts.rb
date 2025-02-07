class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :contents
      t.string :address, null: false  #住所 
      t.float :latitude, null: false #緯度
      t.float :longitude, null: false #経度
      t.datetime :visited_at, null: false, default: -> { 'CURRENT_TIMESTAMP' } #訪問日時
      t.integer :visibility, null: false #投稿の公開有無

      t.timestamps
    end
  end
end
