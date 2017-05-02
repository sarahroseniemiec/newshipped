class Boat < ApplicationRecord
  validates_presence_of :name, :amtcontainers, :location
  validates :name, uniqueness: true
  validates :location, inclusion: {in: ["New York", "Shanghai", "Barcelona", "Amsterdam", "Le Havre", "Sydney", "Buenos Aires", "Veracruz"]}
  validates :amtcontainers, numericality: true

end
