require 'rails_helper'

RSpec.describe Email, type: :model do

  describe "creation" do
    let(:email_received_empty) { build :email, :received_empty }
    let(:email_description_empty) { build :email, :description_empty }
    let(:email_empty) { build :empty }

    it "allows creation of email without received email" do
      expect(email_received_empty).to be_valid
    end

    it "allows creation of email without description" do
      expect(email_description_empty).to be_valid
    end

    it "does not allow creation of email without received or description" do
      expect(email_empty).not_to be_valid
    end
  end
end
