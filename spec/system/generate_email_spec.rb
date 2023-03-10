require "rails_helper"

RSpec.describe "generating an email response", type: :system do

  it "allows a user to generate an email response to their pasted email", pending: "Describing Unit Tests" do
    email_content = FactoryBot.create(:email)
    visit root_path
    fill_in "Email", with: email_content
    click_on("Generate email")
    expect(page).to have_selector("#email_response")
    expect(page).to have_current_path(root_path)
  end
end
