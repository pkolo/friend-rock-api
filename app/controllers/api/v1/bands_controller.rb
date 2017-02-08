class Api::V1::BandsController < ApplicationController
  respond_to :json

  def show
    respond_with Band.find(params[:id])
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

  protected

    def band_params
      params.require(:band).permit(:name, :user)
    end
end
