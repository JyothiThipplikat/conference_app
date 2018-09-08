class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :agenda, presence: true
  validates :time, presence: true
end
