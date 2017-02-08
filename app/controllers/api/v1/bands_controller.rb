class Api::V1::BandsController < ApplicationController
  respond_to :json

  def show
    respond_with Band.find(params[:id])
  end

  def create
    band = Band.new(band_params)
  end

  protected

    def band_params
      params.require(:band).permits(:name)
    end
end
