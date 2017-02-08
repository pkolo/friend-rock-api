class Api::V1::BandsController < ApplicationController
  respond_to :json

  def show
    band = Band.find(params[:id])
    render json: band
  end

  def create
    band = Band.new(band_params)
    band.user = User.find(1)

    if band.save
      render json: band, status: 201, location: [:api, band]
    else
      render json: { errors: band.errors }, status: 422
    end
  end

  def update
    band = Band.find(params[:id])

    if band.update(band_params)
      render json: band, status: 200, location: [:api, band]
    else
      render json: { errors: band.errors }, status: 422
    end
  end

  def destroy
    band = Band.find(params[:id])
    band.destroy
    head 204
  end

  protected

    def band_params
      params.require(:band).permit(:name, :user, :tag_list)
    end
end
