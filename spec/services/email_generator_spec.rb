require 'rails_helper'

describe EmailGenerator do
  let(:email) { build_stubbed :email, :tonality_business }
  let(:email_generator) { EmailGenerator.new(email) }

  describe "generate_response" do
    it "returns a string" do
      expect(email_generator.generate_response).to be_a(String)
    end
    it "returns an email response from ChatGPT"

    end
  end
end
