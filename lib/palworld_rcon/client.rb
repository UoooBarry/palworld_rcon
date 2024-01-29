# frozen_string_literal: true

require "rcon"

module PalworldRcon
  # Client
  class Client
    def initialize(host:, port:, password:)
      @rcon_client = Rcon::Client.new(host: host, port: port, password: password)
      @rcon_client.authenticate!(ignore_first_packet: false)
    end

    def broadcast(message)
      cmd = "Broadcast #{message}"
      rcon_client.execute(cmd)
    end

    def kick_player(player_id)
      cmd = "KickPlayer #{player_id}"
      rcon_client.execute(cmd)
    end

    def ban_player(player_id)
      cmd = "BanPlayer #{player_id}"
      rcon_client.execute(cmd)
    end

    def show_players
      rcon_client.execute("ShowPlayers")
    end

    private

    attr_reader :rcon_client
  end
end
