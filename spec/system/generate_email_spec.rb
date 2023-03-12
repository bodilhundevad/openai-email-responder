require "rails_helper"

RSpec.describe "generating an email response", type: :system do

  it "allows a user to generate an email response providing email, description, and tonality" do #pending: "Describing Unit Tests"
    email = FactoryBot.create(:email)
    visit root_path
    expect(page).to have_field("email_received")
    expect(page).to have_field("email_description")
    expect(page).to have_select("email_tonality"), options: ["business", "business-casual", "casual"]

    fill_in "email_received", with: email.received
    fill_in "email_description", with: email.description
    fill_in "email_tonality", with: email.tonality

    click_on("Generate email")
    expect(page).to have_selector("#email_response")
    expect(page).to have_current_path(root_path)
  end

  it "does not allow a user to generate an email response without providing email or description", pending: "TBD" do
  end
end
