class Api::V1::RelationshipsController < ApplicationController
  respond_to :json

  def send_friend_request
    band_one = current_user.bands.first
    band_two = Band.find(params[:band_id])
    relationship = Relationship.new(band_one: band_one, band_two: band_two, status: 0, action_band: band_one)
    if relationship.save
      head 204
    else
      render json: { errors: relationship.errors, status: 422 }
    end
  end

end
