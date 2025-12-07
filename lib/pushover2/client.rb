# frozen_string_literal: true

require "uri"
require "net/http"
require "json"

module Pushover2
  class Client
    BASE_URI = "https://api.pushover.net"

    # @param path [String]
    def post(path, query: {}, body: {})
      make_request(path, body: body)
    end

    def make_request(path, body: {})
      uri = URI("#{BASE_URI}#{path}")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Post.new(uri.request_uri, {
        "Content-Type": "application/x-www-form-urlencoded"
      })
      request.set_form_data(body)

      response = http.request(request)

      puts JSON.parse(response.body)
    end
  end
end
