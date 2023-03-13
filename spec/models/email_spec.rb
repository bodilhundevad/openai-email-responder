require 'rails_helper'

RSpec.describe Email, type: :model do

  describe "creation" do
    context "validation" do
      let(:email_received_empty) { build_stubbed :email, :received_empty }
      let(:email_description_empty) { build_stubbed :email, :description_empty }
      let(:email_received_description_empty) { build_stubbed :email, :received_empty, :description_empty }
      it "allows creation of email without received email" do
        expect(email_received_empty).to be_valid
      end
      it "allows creation of email without description" do
        expect(email_description_empty).to be_valid
      end
      it "does not allow creation of email without received or description" do
        expect(email_received_description_empty).not_to be_valid
      end
    end

    context "tonality" do
      let(:email_tonality_empty) { create :email, :tonality_empty }
      let(:email_tonality_business) { build_stubbed :email, :tonality_business }
      it "defaults to 'casual'" do
        expect(email_tonality_empty.tonality).to eq("casual")
      end
      it "can be set to 'business'" do
        expect(email_tonality_business.tonality).to eq("business")
      end
    end
  end

  describe "email response" do
      let(:email) { create(:email) }
      let(:fake_service) { instance_double(EmailGenerator) }

      it "can get generated email from OpenAi" do # uses a test double for EmailGenerator
        allow(EmailGenerator).to receive(:new).with(email).and_return(fake_service)
        allow(fake_service).to receive(:email_message).and_return("fake_email")
        expect(email.response).to eq("fake_email")
        expect(fake_service).to have_received(:email_message)
        expect(EmailGenerator).to have_received(:new)
      end
  end
end
