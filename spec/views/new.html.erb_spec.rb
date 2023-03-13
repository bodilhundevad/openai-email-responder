require 'rails_helper'

RSpec.describe 'emails/new', type: :view do
  describe "new email form" do
    before(:each) do
      @email = Email.new
      render
    end
    it "renders a received textarea input" do
      expect(rendered).to have_selector("textarea[name='email[received]']")
    end
    it "renders a description textarea input" do
      expect(rendered).to have_selector("textarea[name='email[description]']")
    end
    it "renders tonality radio buttons" do
      expect(rendered).to have_selector("input[type='radio'][name='email[tonality]'][value='business']")
      expect(rendered).to have_selector("input[type='radio'][name='email[tonality]'][value='business-casual']")
      expect(rendered).to have_selector("input[type='radio'][name='email[tonality]'][value='casual']")
    end
    it "renders a submit button" do
      expect(rendered).to have_selector("input[type='submit'][value='Create Email']")
    end
  end
end
