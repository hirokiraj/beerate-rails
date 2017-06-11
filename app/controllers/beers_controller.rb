# frozen_string_literal: true

class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      redirect_to beer_path(@beer), notice: 'Beer created'
    else
      render 'new'
    end
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      redirect_to beer_path(@beer), notice: 'Beer updated'
    else
      render 'edit'
    end
  end

  def destroy
    @beer = Beer.find(params[:id])
    @beer.destroy
    redirect_to beers_path, notice: 'Beer destroyed'
  end

  private

  def beer_params
    params.require(:beer).permit(
      :name, :style, :country, :brewery,
      :international_bitterness_unit, :alcohol_by_volume, :original_gravity
    )
  end
end
