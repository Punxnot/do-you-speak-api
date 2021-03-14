class RemoveAudioFromTexts < ActiveRecord::Migration[5.2]
  def change
    remove_column :texts, :audio, :string
  end
end
