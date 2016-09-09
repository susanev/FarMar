#spec helper
require 'simplecov'
require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

SimpleCov.start
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new