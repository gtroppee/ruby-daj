def extension(filename)
  File.extname(filename).gsub('.', '')
end

def daj(data = nil)
  Daj.new(data)
end
