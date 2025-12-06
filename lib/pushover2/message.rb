# frozen_string_literal: true

module Pushover2
  class Message
    MESSAGE_PATH = "/1/messages.json"

    # Where:
    #   client is Pushover2::Client instance
    #   token is APP Token
    #   user is User Token
    #   message is string to send
    attr_reader :client, :token, :user, :message

    # @param token [String] Application Token (how is sending message). Required.
    # @param user [String] User Token (how is receiving message). Required.
    # @param message [String] Message to send. Required.
    def initialize(token:, user:, message:)
      @client = Client.new
      @token = token
      @user = user
      @message = message
    end

    def push
      client.post(MESSAGE_PATH, body: {token: token, user: user, message: message})
    end
  end
end
