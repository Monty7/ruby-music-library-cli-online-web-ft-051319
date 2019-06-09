class MusicImporter

  attr_accessor :path

  def initialize (path = './db/mp3s')
    @path = path
  end

  def files
    files = []
    Dir.foreach(path) do |file|
      if file.end_with?('mp3')
        files << file
      end
    end
   files
  end

  def import
    #binding.pry
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end