def resources_path(file)
  "#{RubyDaj.root}/spec/resources/#{file}"
end

def delete_resources(*filenames)
  filenames.each{|filename| FileUtils.remove_file(resources_path(filename))}
end