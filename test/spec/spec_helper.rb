require 'bundler/setup'
Bundler.setup

$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'ssh/bookmarks' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end
