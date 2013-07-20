require 'rubygems'
require 'bundler'

require 'sinatra'
require 'data_mapper'
require 'dm-timestamps'
require 'dm-validations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

get '/' do
  @posts = Post.all(:order => :created_at.desc)
  haml :"posts/index"
end

get '/posts/new' do
  @title = "New post"
  haml :"posts/new"
end

post '/posts/create' do
  @post = Post.create(:title => params[:title], :slug => params[:slug], :content => params[:content])
  redirect '/'
end

get '/:slug/?' do
  @post = Post.first(:slug => "#{params[:slug]}")
  if(!@post.nil?)
    haml :"posts/show"
  else
    status 404
    haml :"404"
  end
end

get '/*' do
  status 404
  haml :"404"
end

class Post
  include DataMapper::Resource

  property  :id,          Serial
  property  :title,       String, :required => true
  property  :slug,        String, :required => true, :unique => true
  property  :content,     Text
  property  :created_at,  DateTime

  DataMapper.auto_upgrade!
end

helpers do

  def link_to(url,text=url,opts={})
    attributes = ""
    opts.each { |key,value| attributes << key.to_s << value << "\" "}
    "<a href=\"#{url}\" #{attributes}>#{text}</a>"
  end

end