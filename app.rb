require 'rubygems'
require 'bundler'

require 'sinatra'
require 'data_mapper'
require 'dm-timestamps'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

get '/' do
  @posts = Post.all
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

get '/:slug' do
  @post = Post.first(:slug => "#{params[:slug]}")
  if(!@post.nil?)
    haml :"posts/show"
  else
    status 404
    body "404 page doesn't exist"
  end
end

class Post
  include DataMapper::Resource

  property  :id,          Serial
  property  :title,       String
  property  :slug,        String
  property  :content,     String
  property  :created_at,  DateTime

  validates_uniqueness_of :slug

  DataMapper.auto_upgrade!
end

helpers do

  def link_to(url,text=url,opts={})
    attributes = ""
    opts.each { |key,value| attributes << key.to_s << value << "\" "}
    "<a href=\"#{url}\" #{attributes}>#{text}</a>"
  end

end