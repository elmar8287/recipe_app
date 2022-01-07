class User < ApplicationRecord
  after_create :set_default_role
  
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :recipes
  has_many :foods

  validates :name, presence: true

  private

  def set_default_role
    update(role: 'user')
  end
end
