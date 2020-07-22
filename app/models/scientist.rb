class Scientist < ApplicationRecord
  has_many :missions
  has_many :planets, through: :missions

  validatates :name, presence: true
  validatates :name, uniqueness: true
end
