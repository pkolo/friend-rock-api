class Api::V1::RelationshipsController < ApplicationController
  respond_to :json

  def send_friend_request
    current_band = current_user.bands.first
    band_two = Band.find(params[:band_id])
    relationship = Relationship.new(band_one: current_band, band_two: band_two, status: 0, action_band: current_band)
    if relationship.save
      head 204
    else
      render json: { errors: relationship.errors, status: 422 }
    end
  end

  def accept_friend_request
    band_one = Band.find(params[:band_id])
    current_band = Band.find(1)
    relationship = Relationship.find_by(band_one: band_one, band_two: current_band)

    if current_band.pending_requests.include?(relationship)
      relationship.update(status: 1, action_band: current_band)
      head 204
    else
      render json: { errors: "You can only accept pending friend requests" }
    end
  end
end
