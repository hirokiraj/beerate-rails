# frozen_string_literal: true

RSpec.describe ReviewsController do
  describe 'params' do
    pending('enable this when shoulda_matchers are updated to work with rails 5.1')
    # it do
    #   params = { review: attributes_for(:review, :with_beer) }
    #   should permit(
    #     :beer_id, :aroma ,:appearance, :flavor, :mouthfeel, :overall,
    #     :aroma_score, :appearance_score, :flavor_score, :mouthfeel_score, :overall_score, :total_score,
    #     :stylistic_accuracy ,:technical_merit, :intangibles,
    #     :acetaldehyde, :alcoholic, :astringent, :diacetyl, :dms, :estery, :grassy, :light_struck,
    #     :metallic, :musty, :oxidized, :phenolic, :solvent, :sour_acidic, :sulfur, :vegetal, :yeasty
    #   )
    #     .for(:create, params: params)
    #     .on(:review)
    # end
  end

  describe '#index' do
    let(:review1) { create(:review, :with_beer) }
    let(:review2) { create(:review, :with_beer) }
    let(:review3) { create(:review, :with_beer) }

    it 'renders index page' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns collection of all reviews' do
      get :index
      expect(assigns(:reviews)).to match_array([review1, review2, review3])
    end
  end

  describe '#show' do
    let(:review) { create(:review, :with_beer) }

    it 'renders show page' do
      get :show, params: { id: review.id }
      expect(response).to render_template(:show)
    end

    it 'returns review with given id' do
      get :show, params: { id: review.id }
      expect(assigns(:review)).to eq(review)
    end

    it 'raises error when review with given id is not existing' do
      expect do
        get :show, params: { id: review.id + 10 }
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
    let(:beer) { create(:beer) }
    it 'creates a new beer properly' do
      expect do
        post :create, params: { review: attributes_for(:review).merge(beer_id: beer.id) }
      end.to change(Review, :count).from(0).to(1)
    end

    it 'redirects to beers index after creation' do
      post :create, params: { review: attributes_for(:review).merge(beer_id: beer.id) }
      expect(response).to redirect_to(review_path(Review.last))
    end

    it 'renders new form with errors if parameters are invalid' do
      post :create, params: { review: { aroma_score: 100 } }
      expect(response).to render_template(:new)
    end

    it 'sets flash message when beer was created' do
      post :create, params: { review: attributes_for(:review).merge(beer_id: beer.id) }
      should set_flash[:notice]
    end
  end

  describe '#edit' do
    let(:review) { create(:review, :with_beer) }

    it 'renders edit form template' do
      get :edit, params: { id: review.id }
      expect(response).to render_template(:edit)
    end

    it 'finds proper beer with given id' do
      get :edit, params: { id: review.id }
      expect(assigns(:review)).to eq(review)
    end

    it 'raises error when beer with given id is not existing' do
      expect do
        get :edit, params: { id: review.id + 10 }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe '#update' do
    let(:review) { create(:review, :with_beer) }
    let(:new_aroma) { Faker::Lorem.paragraph }

    it 'finds proper review with given id' do
      put :update, params: { id: review.id, review: { aroma: new_aroma } }
      expect(assigns(:review)).to eq(review)
    end

    it 'raises error when review with given id is not existing' do
      expect do
        put :update, params: { id: review.id + 10, review: { aroma: new_aroma } }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'updates review with new attributes' do
      put :update, params: { id: review.id, review: { aroma: new_aroma } }
      expect(review.reload.aroma).to eq(new_aroma)
    end

    it 'redirects to review page after update' do
      put :update, params: { id: review.id, review: { aroma: new_aroma } }
      expect(response).to redirect_to(review_path(review))
    end

    it 'renders edit form with errors if parameters are invalid' do
      put :update, params: { id: review.id, review: { aroma_score: 100 } }
      expect(response).to render_template(:edit)
    end

    it 'sets flash message when review was updated' do
      put :update, params: { id: review.id, review: { aroma: new_aroma } }
      should set_flash[:notice]
    end
  end

  describe '#destroy' do
    let(:review) { create(:review, :with_beer) }

    it 'raises error when review with given id is not existing' do
      expect do
        delete :destroy, params: { id: review.id + 10 }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'properly deletes review' do
      review
      expect do
        delete :destroy, params: { id: review.id }
      end.to change(Review, :count).from(1).to(0)
    end

    it 'redirects to reviews index page' do
      delete :destroy, params: { id: review.id }
      expect(response).to redirect_to(reviews_path)
    end

    it 'sets flash message when review was updated' do
      delete :destroy, params: { id: review.id }
      should set_flash[:notice]
    end
  end

end
