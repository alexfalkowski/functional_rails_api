Then(/^I should have the following people:$/) do |expected|
  trimmed_diff! expected, Person.all
end

Then(/^I should have no people\.$/) do
  expect(Person.count).to eq(0)
end
