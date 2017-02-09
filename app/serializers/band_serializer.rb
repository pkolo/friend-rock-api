class BandSerializer < ActiveModel::Serializer
  attributes :name, :genres, :location

  def genres
    object.genres.map do |genre|
      genre.name
    end
  end

end
