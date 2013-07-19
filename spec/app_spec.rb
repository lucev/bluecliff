require 'spec_helper'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/test.db")
  DataMapper.finalize
  Post.auto_migrate!
end

describe 'Sinatra App' do
  it 'should respond to GET' do
    get '/'
    last_response.should be_ok
  end
end

describe "post /posts/create" do
  it "should insert the post in the database" do
    lambda do
      post "/posts/create", params = {
        :title => 'title',
        :body => 'body'
      }
    end.should {
      change(Post, :count).by(1)
    }
  end
end