class Ingredient < ApplicationRecord
  has_many :doses

  validates :name, presence: true, uniqueness: true

  before_destroy :check_for_cocktails

  private

  def check_for_cocktails
    if cocktails.count > 0
      errors.add_to_base("cannot delete ingredient when used in cocktail")
      return false
    end
  end

end
