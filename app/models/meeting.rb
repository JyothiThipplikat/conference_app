class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :agenda, presence: true
  validates :time, presence: true

  belongs_to :speaker
  has_many :meeting_topics
  has_many :topics, through: :meeting_topics
end
