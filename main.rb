# frozen_string_literal: true

require_relative './lib/game'

puts 'Welcome to a game of "Connect four"'
puts 'So far this is a multiplayer game only, random player starts!'

the_game = Game.new
the_game.play_game