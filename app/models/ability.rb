class Ability < ApplicationRecord
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :manage, Food, user: user

      can :manage, Recipe, user: user

    end
  end
end
