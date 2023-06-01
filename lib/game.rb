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
    
    until board.game_over?(current_player.symbol)
      @current_player = switch_players
      play_round
    end
    finish_info
  end

  def finish_info
    if board.game_won?(current_player.symbol)
      puts "#{current_player.name} won"
    else
      puts "No winners"
    end
  end

  def setup
    board.display
    starting_player
  end

  def play_round
    board.place_token(promt_input, current_player.symbol)
    board.display
  end
  
  def starting_player 
    @current_player = [@player1, @player2].sample
  end

  def promt_input
    puts "\n#{@current_player.name} make your move!"
    location = valid_input
  end

  def valid_input
    num = gets.chomp.to_i
    if num.between?(1,7)
      return num
    else
      puts "Enter a number between 1-7"
      num = gets.chomp.to_i
    end
  end

  def switch_players
    @current_player == @player1 ? @player2 : @player1
  end


  

end
