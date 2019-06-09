require 'pry'
class Song 
  extend Concerns::Findable

  # extend Nameable::ClassMethods
  # extend Persistable::ClassMethods
  # include Persistable::InstanceMethods
  
  attr_accessor :name, :files
  attr_reader :artist, :genre
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
   @@all.clear
  end
  
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
   # binding.pry
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end
  
  def self.new_from_filename(filename)
   # binding.pry
    song_name = filename.split(" - ")[1]
    song_artist = filename.split(" - ")[0]
    song_genre = filename.split(" - ")[2].gsub(".mp3", "") 
    
    new_genre = Genre.find_or_create_by_name(song_genre)
    new_artist = Artist.find_or_create_by_name(song_artist)
    
    new_song = Song.new(song_name, new_artist, new_genre)
   # @artist.add_song(new_song)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
   
  end

end