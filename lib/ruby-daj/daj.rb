# Main class
#===========
class Daj
  attr_accessor :kind

  # Constructor
  def initialize(data = nil)
    @data = data
  end

  # Less than operator as read file
  def <(filename)
    ext = kind || extension(filename)
    Reader.new.read(ext, filename)
  end

  def >(filename)
    ext = kind || extension(filename)
    Writer.new(@data).write(ext, filename)
  end

  # Methods
  #--------
  RubyDaj::FORMATS.each do |format|
    define_method(format) do |data = nil|
      daj = Daj.new(data); daj.kind = format; daj
    end
  end
end