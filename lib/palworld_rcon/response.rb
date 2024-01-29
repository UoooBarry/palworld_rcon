# frozen_string_literal: true

module PalworldRcon
  # RCRON response
  class Response
    def initialize(rcon_response)
      @rcon_response = rcon_response
    end

    def body
      rcon_response
    end

    private

    attr_reader :rcon_response
  end
end
