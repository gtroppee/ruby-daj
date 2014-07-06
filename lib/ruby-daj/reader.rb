class Reader

	# Reading
	#--------

	# Reader abstract
	def read(ext, filename)
		RubyDaj::FORMATS.include?(ext) ? send(:"read_#{ext}", filename) : read_plain_text(filename)
	end

	def read_plain_text(filename)
		File.read(filename).chomp
	end

	def read_json(filename)
		json = JSON.parse(File.read(filename))
		json.kind_of?(Array) ? json[0] : json
	end

	def read_yml(filename)
		YAML.load_file(filename)
	end

	def read_csv(filename)
		CSV.read(filename)
	end

	def read_csvh(filename)
		CSV.read(filename, headers: true).map{|row| Hash[row.map{|col, row| [col, row]}]}
	end

	def read_tsv(filename)
		# TODO Refactor this ugliness
		CSV.read(filename, col_sep: "\t").map{|x| x.map{|x| x.split(" ")}}.map(&:flatten)
	end

	def read_tsvh(filename)
		CSV.read(filename, col_sep: "\t", headers: true).map do |row| 
			headers = row.headers[0].split(' ')
			fields  = row.fields[0].split(' ')
			Hash[headers.each_with_index.map{|_, index| [headers[index], fields[index]]}]
		end
	end

end