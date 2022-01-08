class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, :food_id, presence: true

  def total_price
    quantity * food.price
  end
end
