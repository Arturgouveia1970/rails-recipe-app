class Inventory < ApplicationRecord
  validates :user_id, presence: false

  belongs_to :user, class_name: 'User'
  has_many :inventory_foods, foreign_key: :inventory_id, class_name: 'InventoryFood', dependent: :destroy
  has_many :foods, through: :inventory_foods, foreign_key: :inventory_id, class_name: 'Food', dependent: :destroy
  has_many :recipes, through: :user, foreign_key: :inventory_id, class_name: 'Recipe', dependent: :destroy
end
