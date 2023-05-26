# frozen_string_literal: true

require_relative './lib/game'

puts 'Welcome to a game of "Connect four"'
puts 'So far this is a multiplayer game only, so Player one starts'

the_game = Game.new
the_game.setup
