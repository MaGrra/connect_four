# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :player1, :player2
  attr_accessor :current_player

  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', '⚫')
    @player2 = Player.new('Player 2', '⚪')
  end

  def play_game
    setup

    until board.game_over?
      play_round
    end
    finish_info
  end

  def setup
    board.display
    starting_player
  end

  def play_round
    promt_input
    @current_player = switch_players
  end
  
  def starting_player 
    @current_player = [@player1, @player2].sample
  end

  def promt_input
    puts "\n#{@current_player.name} make your move!"
    location = gets.chomp.to_i
    board.place_token(location, current_player.symbol)
    board.display
  end

  def switch_players
    @current_player == @player1 ? @player2 : @player1
  end


  

end
