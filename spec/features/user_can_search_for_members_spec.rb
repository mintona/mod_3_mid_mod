require 'rails_helper'
# As a user,
# When I visit "/"
# And I Select “Gryffindor” from the select field
# (Note: Use the existing select field)
# And I click "Search For Members“
# Then I should be on page “/search”
# Then I should see a total of the number of members for that house. (21 for Gryffindor)
# And I should see a list of the 21 members of the Order of the Phoenix for house Gryffindor.
#
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
RSpec.describe "As a user" do
  scenario "I can search for members by house" do
    visit root_path

    select "Gryffindor", from: :house

    click_button "Search For Members"

    expect(current_path).to eq("/search")

    expect(page).to have_content("Number of Members: 21")
    expect(page).to have_css(".members")

    within(".members") do
      expect(page).to have_css(".member_info") #21 times
    end

    within(".member_info").first do
      expect(page).to have_content("Name")
      expect(page).to have_content("Katie Bell")
      expect(page).to have_content("Role")
      expect(page).to have_content("Student")
      expect(page).to have_content("House")
      expect(page).to have_content("Gryffindor")
      expect(page).to have_content("Patronus")
    end
  end
end