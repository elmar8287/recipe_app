require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Akasha', email: 'akasha@mail.com', password: 'password') }

  describe 'GET /index' do
    before do
      sign_in user
      get recipes_path
    end

    it 'returns http ok' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should include correct placeholder' do
      expect(response.body).to include('Create a recipe')
    end
  end
end
