# frozen_string_literal: true

RSpec.describe BeersController do
  describe 'params' do
    pending('enable this when shoulda_matchers are updated to work with rails 5.1')
    # it do
    #   params = { beer: attributes_for(:beer) }
    #   should permit(
    #     :name, :style, :country, :brewery,
    #     :international_bitterness_unit, :alcohol_by_volume, :original_gravity
    #   )
    #     .for(:create, params: params)
    #     .on(:beer)
    # end
  end

  describe '#index' do
    let(:beer1) { create(:beer) }
    let(:beer2) { create(:beer) }
    let(:beer3) { create(:beer) }

    it 'renders index page' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns collection of all beers' do
      get :index
      expect(assigns(:beers)).to match_array([beer1, beer2, beer3])
    end
  end

  describe '#show' do
    let(:beer) { create(:beer) }

    it 'renders show page' do
      get :show, params: { id: beer.id }
      expect(response).to render_template(:show)
    end

    it 'returns beer with given id' do
      get :show, params: { id: beer.id }
      expect(assigns(:beer)).to eq(beer)
    end

    it 'raises error when beer with given id is not existing' do
      expect do
        get :show, params: { id: beer.id + 10 }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '#new' do
    it 'renders new form template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    it 'creates a new beer properly' do
      expect do
        post :create, params: { beer: attributes_for(:beer) }
      end.to change(Beer, :count).from(0).to(1)
    end

    it 'redirects to beers index after creation' do
      post :create, params: { beer: attributes_for(:beer) }
      expect(response).to redirect_to(beer_path(Beer.last))
    end

    it 'renders new form with errors if parameters are invalid' do
      post :create, params: { beer: { country: 'asd' } }
      expect(response).to render_template(:new)
    end

    it 'sets flash message when beer was created' do
      post :create, params: { beer: attributes_for(:beer) }
      should set_flash[:notice]
    end
  end

  describe '#edit' do
    let(:beer) { create(:beer) }

    it 'renders edit form template' do
      get :edit, params: { id: beer.id }
      expect(response).to render_template(:edit)
    end

    it 'finds proper beer with given id' do
      get :edit, params: { id: beer.id }
      expect(assigns(:beer)).to eq(beer)
    end

    it 'raises error when beer with given id is not existing' do
      expect do
        get :edit, params: { id: beer.id + 10 }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '#update' do
    let(:beer) { create(:beer) }
    let(:new_name) { Faker::Beer.name }

    it 'finds proper beer with given id' do
      put :update, params: { id: beer.id, beer: { name: new_name } }
      expect(assigns(:beer)).to eq(beer)
    end

    it 'raises error when beer with given id is not existing' do
      expect do
        put :update, params: { id: beer.id + 10, beer: { name: new_name } }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'updates beer with new attributes' do
      put :update, params: { id: beer.id, beer: { name: new_name } }
      expect(beer.reload.name).to eq(new_name)
    end

    it 'redirects to beer page after update' do
      put :update, params: { id: beer.id, beer: { name: new_name } }
      expect(response).to redirect_to(beer_path(beer))
    end

    it 'renders edit form with errors if parameters are invalid' do
      put :update, params: { id: beer.id, beer: { country: 'ASD' } }
      expect(response).to render_template(:edit)
    end

    it 'sets flash message when beer was updated' do
      put :update, params: { id: beer.id, beer: { name: new_name } }
      should set_flash[:notice]
    end
  end

  describe '#destroy' do
    let(:beer) { create(:beer) }

    it 'raises error when beer with given id is not existing' do
      expect do
        delete :destroy, params: { id: beer.id + 10 }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'properly deletes beer' do
      beer
      expect do
        delete :destroy, params: { id: beer.id }
      end.to change(Beer, :count).from(1).to(0)
    end

    it 'redirects to beers index page' do
      delete :destroy, params: { id: beer.id }
      expect(response).to redirect_to(beers_path)
    end

    it 'sets flash message when beer was updated' do
      delete :destroy, params: { id: beer.id }
      should set_flash[:notice]
    end
  end
end
