class Mission < ApplicationRecord
  belongs_to :planet
  belongs_to :scientist

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :planet_id, uniqueness: true
  validates :scientist_id, uniqueness: true
end
