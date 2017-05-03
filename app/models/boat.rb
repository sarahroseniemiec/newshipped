class Boat < ApplicationRecord
  validates_presence_of :name, :amtcontainers, :location
  validates :name, uniqueness: true
  validates :location, inclusion: {in: ["New York", "Shanghai", "Barcelona", "Amsterdam", "Le Havre", "Sydney", "Buenos Aires", "Veracruz"]}
  validates :amtcontainers, numericality: {
  greater_than: 0 }

  has_many :boat_jobs
  has_many :jobs, through: :boat_jobs

end
