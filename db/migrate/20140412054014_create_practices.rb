class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.timestamp :practice_begin
      t.timestamp :practice_end
      t.integer :song_id
    end
  end
end
