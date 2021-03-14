class Text < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy

  def self.sort_by_duration(array, type)
    if type == "asc"
      array.sort { |x, y| x.duration.to_f <=> y.duration.to_f }
    else
      array.sort { |x, y| y.duration.to_f <=> x.duration.to_f }
    end
  end

  def self.sort_by_date(array, type)
    if type == "asc"
      array.sort { |x, y| x.created_at <=> y.created_at }
    else
      array.sort { |x, y| y.created_at <=> x.created_at }
    end
  end
end
