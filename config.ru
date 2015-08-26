require 'bundler'

Bundler.require

require './lib/sample_app'
run Sinatra::Application
