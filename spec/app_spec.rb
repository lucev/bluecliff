require 'spec_helper'

describe "post" do
  
  it "should require title" do
    post = Post.new
    post.should_not be_valid
    post.errors[:title].first.should match "Title must not be blank"
  end

  it "should require slug" do
    post = Post.new
    post.should_not be_valid
    post.errors[:slug].first.should match "Slug must not be blank"
  end
end