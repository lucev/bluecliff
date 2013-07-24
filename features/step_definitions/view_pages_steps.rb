Given /^I am viewing "(.+)"$/ do |url|
  visit(url)
end

Then /^I should see "(.+)"$/ do |text|
  response_body.should =~ Regexp.new(Regexp.escape(text))
end

Then /^page should have a title "(.+)"$/ do |title|
  response_body.should have_xpath('//title', :content => title)
end

Then /^I should be on a page with title "(.+)"$/ do |title|
  response_body.should have_xpath('//title', :content => title)
end