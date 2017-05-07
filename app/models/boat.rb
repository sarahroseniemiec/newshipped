class Boat < ApplicationRecord
  # validations
  validates_presence_of :name, :amtcontainers, :location
  validates :name, uniqueness: true
  validates :location, inclusion: {in: ["New York", "Shanghai", "Barcelona", "Amsterdam", "Le Havre", "Sydney", "Buenos Aires", "Veracruz"]}
  validates :amtcontainers, numericality: {
  greater_than: 0 }

  # avatar
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "defaultboat_:style.png"
  validates_attachment_content_type :avatar, content_type:  /\Aimage\/.*\z/

  # associations
  has_many :boat_jobs
  has_many :jobs, through: :boat_jobs

end
