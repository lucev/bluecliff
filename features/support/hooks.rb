Before do
  if !$dunit
    Post.create(:title => "My Post", :slug => "my-post", :content => "Lorem ipsum dolor sit amet.")
    $dunit = true
  end
end