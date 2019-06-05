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
  
  def self.new_from_filename(name)
    self.files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end