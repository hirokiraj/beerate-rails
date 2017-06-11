# frozen_string_literal: true

RSpec.describe HomeController do
  describe '#index' do
    it 'returns successful response' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end
