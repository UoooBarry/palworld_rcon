# frozen_string_literal: true

require "rcon"
require_relative "response"

module PalworldRcon
  # Client
  class Client
    def initialize(host:, port:, password:)
      @rcon_client = Rcon::Client.new(host: host, port: port, password: password)
      @rcon_client.authenticate!(ignore_first_packet: false)
    end

    def broadcast(message)
      cmd = "Broadcast #{process_message(message)}"
      execute_command(cmd)
    end

    def kick_player(player_id)
      cmd = "KickPlayer #{player_id}"
      execute_command(cmd)
    end

    def ban_player(player_id)
      cmd = "BanPlayer #{player_id}"
      execute_command(cmd)
    end

    def show_players
      execute_command("ShowPlayers")
    end

    def shutdown(count_down, message)
      execute_command("Shutdown #{count_down} #{process_message(message)}")
    end

    def save
      execute_command("Save")
    end

    def server_info
      execute_command("Info")
    end

    def do_exit
      execute_command("DoExit")
    end

    private

    def execute_command(cmd)
      Response.new(rcon_client.execute(cmd))
    rescue StandardError => e
      raise ExectueCommandError, e.message
    end

    def process_message(message)
      message.gsub(" ", "_")
    end

    attr_reader :rcon_client
  end
end
