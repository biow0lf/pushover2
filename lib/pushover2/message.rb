# frozen_string_literal: true

module Pushover2
  class Message
    MESSAGE_PATH = "/1/messages.json"

    # Instance of Pushover2::Client
    attr_reader :client

    # Application Token (how is sending message)
    attr_reader :token

    # User Token (how is receiving message)
    attr_reader :user

    # String to send
    attr_reader :message

    attr_reader :attachment
    attr_reader :attachment_base64
    attr_reader :attachment_type
    attr_reader :device
    attr_reader :html
    attr_reader :priority
    attr_reader :sound
    attr_reader :timestamp
    attr_reader :title
    attr_reader :ttl
    attr_reader :url
    attr_reader :url_title

    # @param token [String] Application Token (how is sending message). Required.
    # @param user [String] User Token (how is receiving message). Required.
    # @param message [String] String to send. Required.
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
    # @param url [] Optional.
    # @param url_title [] Optional.
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
      ttl: nil,
      url: nil,
      url_title: nil
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
      @url = url
      @url_title = url_title
    end

    def push
      client.post(MESSAGE_PATH, body: payload)
    end

    private

    def payload
      body = {
        token: token,
        user: user,
        message: message,
        attachment: attachment,
        attachment_base64: attachment_base64,
        attachment_type: attachment_type,
        device: device,
        html: html,
        priority: priority,
        sound: sound,
        timestamp: timestamp,
        title: title,
        ttl: ttl,
        url: url,
        url_title: url_title
      }.compact

      if body[:token].nil?
        raise "Missing required :token field"
      end

      if body[:user].nil?
        raise "Missing required :user field"
      end

      if body[:message].nil?
        raise "Missing required :message field"
      end

      body
    end
  end
end
