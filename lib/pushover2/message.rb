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
    # @param attachment [] Optional.
    # @param attachment_base64 [] Optional.
    # @param attachment_type [] Optional.
    # @param device [] Optional.
    # @param html [] Optional.
    # @param priority [] Optional.
    # @param sound [] Optional.
    # @param timestamp [] Optional.
    # @param title [] Optional.
    # @param ttl [] Optional.
    def initialize(token:, user:, message:,
      attachment: nil,
      attachment_base64: nil,
      attachment_type: nil,
      device: nil,
      html: nil,
      priority: nil,
      sound: nil,
      timestamp: nil,
      title: nil,
      ttl: nil
    )
      @client = Client.new
      @token = token
      @user = user
      @message = message
      @attachment = attachment
      @attachment_base64 = attachment_base64
      @attachment_type = attachment_type
      @device = device
      @html = html
      @priority = priority
      @sound = sound
      @timestamp = timestamp
      @title = title
      @ttl = ttl
    end

    def push
      client.post(MESSAGE_PATH, body: {token: token, user: user, message: message})
    end
  end
end
