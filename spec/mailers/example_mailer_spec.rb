require 'rails_helper'

RSpec.describe ExampleMailer, type: :mailer do
  describe 'send_email' do
    let(:user) { create :user }
    let(:mail) { described_class.sample_email(user).deliver }

    it 'renders the subject' do
      expect(mail.subject).to eq('Sample Email')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['n0dix1234@gmail.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.name)
    end
  end
end
