class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :composer_id
      t.string :name
      t.string :opus
      t.string :key
      t.integer :memo_id
    end
  end
end
