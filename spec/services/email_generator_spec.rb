require 'rails_helper'

describe EmailGenerator, :aggregate_failures do
  describe "generated prompt" do
    let(:email) { create :email }
    context "received" do
      let(:received) { email.received }
      it "is present" do
        prompt = EmailGenerator.new(email).body[:prompt]
        expect(prompt).to include(received)
      end
      it "is not present" do
        email = create :email, :received_empty
        prompt = EmailGenerator.new(email).body[:prompt]
        expect(prompt).not_to include(received)
        p prompt
      end
    end
    context "description" do
      let(:description) { email.description }
      it "is present" do
        prompt = EmailGenerator.new(email).body[:prompt]
        expect(prompt).to include(description)
      end
      it "is not present" do
        email = create :email, :description_empty
        prompt = EmailGenerator.new(email).body[:prompt]
        expect(prompt).not_to include(description)
        p prompt
      end
    end
    context "tonality" do
      let(:tonality) { email.tonality }
      it "is present" do
        prompt = EmailGenerator.new(email).body[:prompt]
        expect(prompt).to include(tonality)
      end
      it "is not casual" do
        email = create :email, :tonality_business
        prompt = EmailGenerator.new(email).body[:prompt]
        expect(prompt).not_to include(tonality)
        p prompt
      end
      it "is not present" do
        email = create :email, :tonality_empty
        prompt = EmailGenerator.new(email).body[:prompt]
        expect(prompt).to include(tonality)
      end
    end
  end

  describe "when making requests to API, response", :vcr do
    let(:response) { EmailGenerator.new(email).call }
    let(:email) { create :email }

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
