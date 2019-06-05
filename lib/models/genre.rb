require 'pry'
class Genre 
 extend Concerns::Findable

  # extend Nameable::ClassMethods
  # extend Persistable::ClassMethods
  # include Persistable::InstanceMethods
  
  attr_accessor :name, :songs
  
    @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  def self.reset_all
    all.clear
  end
    
  def self.count
    all.size
  end
  
  def self.destroy_all
    all.clear
  end
  
  def self.create(name)
    self.new(name)
  end
  
  def artists
    #expect(genre.artists).to include(artist)
    artist_songs = []
    self.songs.each do |song|
      if !artist_songs.include?(song.artist)
        artist_songs << song.artist
      end
    end
    artist_songs
  end
end