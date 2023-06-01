# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :player1, :player2
  attr_accessor :current_player, :multiplayer

  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', '⚫')
    @player2 = Player.new('Player 2', '⚪')
    @single_player = false
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
    puts "Press 1 to play against a human"
    puts "Press 2 to play against computer"
    answer = gets.chomp.to_i
    if answer == 1
      board.display
      starting_player
    elsif answer == 2
      @single_player = true
      board.display
      starting_player
      puts "\nPlayer 1 is Human. Player 2 is AI".bold
    else
      puts "Please chose 1 OR 2"
      answer = gets.chomp.to_i
    end
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
    if @single_player == true && @current_player.name == 'Player 2'
      sleep(1)
      computer_input
    else human_input
    end
  end

  def computer_input
    rand(1..7)
  end

  def human_input
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
