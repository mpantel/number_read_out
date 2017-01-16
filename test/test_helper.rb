require 'simplecov'
require 'byebug'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'number_read_out'

require 'minitest/autorun'
