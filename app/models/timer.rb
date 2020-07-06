class Timer < ApplicationRecord
  belongs_to :user
  default_scope -> { order(date: :asc) }
  validates_presence_of :name, :unit, :date, :user_id
end
