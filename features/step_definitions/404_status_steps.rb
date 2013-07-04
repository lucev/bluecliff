Given /^I request "(.*)"$/ do |url|
  visit(url)
end

Then /^I should get response with status "(.*)"$/ do |status|
  response.status.should == status.to_i
end
