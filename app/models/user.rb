class User < ApplicationRecord
  after_create :set_default_role

  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy

  validates :name, presence: true

  private

  def set_default_role
    update(role: 'user')
  end
end
