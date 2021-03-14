class Audio < ApplicationRecord
  belongs_to :text

  has_one_attached :audio_file
end
