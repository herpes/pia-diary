class CreateSongMemos < ActiveRecord::Migration
  def change
    create_table :song_memos do |t|
      t.integer :practice_id, :null => false
      t.string :memo

      t.timestamps
    end
  end
end
