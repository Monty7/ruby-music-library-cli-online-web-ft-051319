require 'pry'

class Artist 
  extend Concerns::Findable
  #include Findable::InstanceMethods
  # extend Nameable::ClassMethods
  # extend Persistable::ClassMethods
  # include Persistable::InstanceMethods
  
  attr_accessor :name, :songs
 # attr_reader :genres
  
    @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    all.clear
  end
  
  def self.create(song)
   self.new(song)
   # new_song.artist = self
  end
  
  def add_song(song)
  #  binding.pry
  # new_song = Song.new(song)
   if !self.songs.include?(song)
    self.songs << song
    end
    
   if song.artist == nil
    song.artist = self
    #binding.pry
    
    end
  end
  
  def genres
    #binding.pry
    # @genres = genres
    artist_genres = []
    
    self.songs.each do |song|
      if !artist_genres.include?(song.genre)
        
        artist_genres << song.genre
      end
    end
    artist_genres
  end
  

  # def self.find_by_name(name)
  #   @@all.detect {|artsit| artsit.name == name}
  # end
end