require 'watir-webdriver'
require 'cucumber'
require 'test/unit/assertions'
include Test::Unit::Assertions

After do |scenario|
  @Browser.close
end