require "rails_helper"

RSpec.describe "generating an email response", type: :system do
  let(:email) { build_stubbed :email, :tonality_business }
  it "allows a user to generate an email response providing email, description, and tonality" do #pending: "Describing Unit Tests"
    visit root_path

    fill_in "email_received", with: email.received
    fill_in "email_description", with: email.description
    choose(email.tonality)
    click_on("Create Email")

    expect(page).to have_selector("#email_response")
    expect(page).to have_current_path(root_path)
  end

  it "does not allow a user to generate an email response without providing email or description", pending: "TBD" do
  end
end
