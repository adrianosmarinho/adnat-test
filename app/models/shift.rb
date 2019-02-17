class Shift < ApplicationRecord
  belongs_to :user

  #there must be a start time and a finish time
  validates :start, presence: true
  validates :finish, presence: true
end
