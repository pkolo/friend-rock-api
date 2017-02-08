class BandSerializer < ActiveModel::Serializer
  attributes :name, :genres

  has_many :locations, key: :location

  def genres
    object.genres.map do |genre|
      genre.name
    end
  end

  def locations
    object.locations.first.name
  end
end
