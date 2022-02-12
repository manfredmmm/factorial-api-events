class Event < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :description, length: { maximum: 600 }
  validates :start_date, presence: true, comparison: { less_than: :end_date }
  validates :end_date, presence: true
end
