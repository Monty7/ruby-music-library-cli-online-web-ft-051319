module Concerns
  module Findable
    
  def create(name)
    self.new(name)
  end
  
  def find_by_name(name)
    self.all.detect {|song| song.name == name }
  end
  
  def find_or_create_by_name(name)
    if !self.find_by_name(name)
     self.create(name)
    # save
   else
     find_by_name(name)
    end
   # binding.pry
  end

  end
end