module RubyDaj
  FORMATS = %w(json yml csv csvh tsv tsvh)
  def self.root
    File.dirname __dir__
  end
end

require 'json'
require 'yaml'
require 'csv'
require_relative 'ruby-daj/helpers'
require_relative 'ruby-daj/reader'
require_relative 'ruby-daj/writer'
require_relative 'ruby-daj/daj'
