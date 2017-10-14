# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review), notice: 'Review created'
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review), notice: 'Review updated'
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: 'Review destroyed'
  end

  private

  def review_params
    params.require(:review).permit(
      :beer_id, :aroma ,:appearance, :flavor, :mouthfeel, :overall,
      :aroma_score, :appearance_score, :flavor_score, :mouthfeel_score, :overall_score, :total_score,
      :stylistic_accuracy ,:technical_merit, :intangibles,
      :acetaldehyde, :alcoholic, :astringent, :diacetyl, :dms, :estery, :grassy, :light_struck,
      :metallic, :musty, :oxidized, :phenolic, :solvent, :sour_acidic, :sulfur, :vegetal, :yeasty
    )
  end
end
