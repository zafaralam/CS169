# Movies steps that can be matached to steps

Given /^the following movies exist:$/ do |movie_table|
  movie_table.hashes.each do |movie|
    Movie.create!(movie)
  end
  # table is a Cucumber::Ast::Table
  # express the regexp above with the code you wish you had
end

When /^I fill in the "(.*?)" with "(.*?)"$/ do |arg1, arg2|
  fill_in arg1, :with => arg2
end

Then /^the director of "(.*?)" should be "(.*?)"$/ do |arg1, arg2|
  assert page.body =~ /#{arg1}.+Director.+#{arg2}/m
end

