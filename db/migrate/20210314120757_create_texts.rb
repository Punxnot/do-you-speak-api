class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string :title
      t.text :text
      t.string :audio
      t.string :author
      t.integer :level
      t.integer :duration

      t.timestamps
    end
  end
end
