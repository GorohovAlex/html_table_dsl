require 'simplecov'
require 'pry'

SimpleCov.minimum_coverage 100
SimpleCov.start do
  add_filter '/spec/'
end

RSpec.configure do |config|
  config.order = :random
end
