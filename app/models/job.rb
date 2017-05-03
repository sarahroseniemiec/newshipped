class Job < ApplicationRecord
  validates_presence_of :description, :origin, :destination, :cost, :amtcontainers, :name
  validates :name, uniqueness: true
  validates :description, length: { minimum: 50 }
  validates :origin, inclusion: { in: ["New York", "Shanghai", "Barcelona", "Amsterdam", "Le Havre", "Sydney", "Buenos Aires", "Veracruz"] }
  validates :destination, inclusion: { in: ["New York", "Shanghai", "Barcelona", "Amsterdam", "Le Havre", "Sydney", "Buenos Aires", "Veracruz"] }
  validates :cost, numericality: { greater_than: 1000 }
  validates :amtcontainers, numericality: true

end
