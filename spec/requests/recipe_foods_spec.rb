require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Akasha', email: 'akasha@mail.com', password: 'password') }

  let(:recipe) do
    Recipe.create(name: 'Chicken filet', description: 'Cook it', preparation_time: '1 hour', cooking_time: '1 hour',
                  public: true, user: user)
  end

  let(:recipe_food) { RecipeFood.create(recipe_id: recipe.id) }
  describe 'GET /new' do
    before do
      sign_in user
      get new_recipe_recipe_food_path(recipe_id: recipe.id)
    end

    it 'returns http ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
