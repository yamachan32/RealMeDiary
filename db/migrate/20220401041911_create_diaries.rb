class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.date :diary_date,              null: false
      t.string :title,                 null: false
      t.text :text
      t.timestamps

      t.references :user,              null: false, foreign_key: true
    end
  end
end
