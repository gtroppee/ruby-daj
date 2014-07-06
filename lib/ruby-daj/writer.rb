class Writer

  def initialize(data)
    if data.nil?
      raise ArgumentError, 'Data is required in order to perform this operation. Please use the following form "daj(your_data) > your_file" and everything should be fine.'
    else
      @data = data
    end
  end

  # Writing
  #--------

  # Call operator as writer
  def write(ext, filename)
    ext = @kind || ext
    RubyDaj::FORMATS.include?(ext) ? send(:"write_#{ext}", filename) : write_plain_text(filename)
  end

  def write_plain_text(filename, encoding = 'utf-8')
    File.open(filename, "w:#{encoding}") {|f| f.puts @data }
  end

  def write_json(filename)
    File.open(filename, "w") {|f| f.puts @data.to_json }
  end

  def write_yml(filename)
    File.open(filename, "w") {|f| f.puts @data.to_yaml }
  end

  def write_csv(filename)
    CSV.open(filename, "w") do |csv|
      @data.each {|data| csv << data}
    end
  end

  def write_csvh(filename)
    CSV.open(filename, "w") do |csv|
      csv << @data.first.keys # adds the attributes name on the first line
      @data.each {|hash| csv << hash.values}
    end
  end

  def write_tsv(filename)
    CSV.open(filename, "w", col_sep: "\t") do |tsv|
      @data.each {|data| tsv << data}
    end
  end

  def write_tsvh(filename)
    CSV.open(filename, "w", col_sep: "\t") do |tsv|
      tsv << @data.first.keys # adds the attributes name on the first line
      @data.each {|hash| tsv << hash.values}
    end
  end
end