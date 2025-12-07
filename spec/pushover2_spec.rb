# frozen_string_literal: true

RSpec.describe Pushover2 do
  let(:token) { "app-token-123" }
  let(:user) { "user-token-123" }
  let(:message) { "Aloha!" }

  it "is expected to send simple message" do
    m = Pushover2::Message.new(token: token, user: user, message: message)

    VCR.use_cassette("simple") do
      expect { m.push }.not_to raise_error
    end
  end

  it "is expected to send message to device" do
    device = "iphone"

    m = Pushover2::Message.new(token: token, user: user, message: message, device: device)

    VCR.use_cassette("device") do
      expect { m.push }.not_to raise_error
    end
  end

  it "is expected to send html message" do
    message = "<b>Hello</b>, <i>World!</i>. " \
      "<u>Underlined words</u>. " \
      "<font color=\"#0000ff\">word</font>. " \
      "<a href=\"https://evemonk.com/\">EveMonk link.</a>"

    m = Pushover2::Message.new(token: token, user: user, message: message, html: 1)

    VCR.use_cassette("html") do
      expect { m.push }.not_to raise_error
    end
  end
end
