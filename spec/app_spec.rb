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

describe "link_to helper" do
  it "should render link without text" do
    link = link_to 'http://www.example.com'
    link.should match '<a href="http://www.example.com">http://www.example.com</a>'
  end

  it "should render link with text" do
    link = link_to 'http://www.example.com', 'example text'
    link.should match '<a href="http://www.example.com">example text</a>'
  end

  it "should render link with attributes" do
    link = link_to 'http://www.example.com', 'example text', :id => 'bluecliff',:class => 'link'
    link.should match '<a href="http://www.example.com" id="bluecliff" class="link">example text</a>'
  end
end