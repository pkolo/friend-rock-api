class BandSerializer < ActiveModel::Serializer
  attributes :id, :name, :genres, :location, :friendships

  def genres
    object.genres.map do |genre|
      genre.name
    end
  end


  def friendships
    object.friendships.map do |friendship|
      other_band_in friendship
    end
  end

  def other_band_in(friendship)
    object == friendship.band_one ? friendship.band_two : friendship.band_one
  end

end
