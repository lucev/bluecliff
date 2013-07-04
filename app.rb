require 'rubygems'
require 'bundler'

require 'sinatra'

get '/' do
  "Hello World!"
end

get '/*' do
  status 404
  body "404 page doesn't exist"
end