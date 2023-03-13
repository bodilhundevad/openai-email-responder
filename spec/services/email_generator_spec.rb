require 'rails_helper'

describe EmailGenerator do
 context "when making requests to API, response", :vcr do
    let(:email) { build_stubbed :email }
    let(:response) { EmailGenerator.new(email).call }

    it "is HTTParty::Response" do
      expect(response).to be_an(HTTParty::Response)
    end

    it "includes email message" do
      email_message = response.dig("choices", 0, "text")
      expect(email_message).to be_a(String)
      expect(email_message).not_to be_empty
    end
  end
end
