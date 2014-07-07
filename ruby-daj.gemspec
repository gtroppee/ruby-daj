#encoding: utf-8
Gem::Specification.new do |s|
  s.name        = 'ruby-daj'
  s.version     = '0.1.0'
  s.date        = '2014-06-07'
  s.summary     = "Read and write data in ruby without further ado"
  s.authors     = "Guillaume Troppée"
  s.email       = 'gtroppee@gmail.com'
  s.files       = Dir["README.md","Gemfile", "spec/*", "lib/**/*"]
  s.homepage    ='http://rubygems.org/gems/ruby-daj'
  s.license     = 'MIT'

  s.add_development_dependency "rspec"
end