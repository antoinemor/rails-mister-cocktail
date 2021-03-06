class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
