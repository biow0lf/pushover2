# frozen_string_literal: true

RSpec.describe Pushover2 do
  let(:token) { "app-token-123" }
  let(:user) { "user-token-123" }

  it "is expected to send simple message" do
    message = "Aloha!"

    m = Pushover2::Message.new(token: token, user: user, message: message)

    VCR.use_cassette("simple") do
      expect { m.push }.not_to raise_error
    end
  end

  it "is expected to send message" do
  end
end
