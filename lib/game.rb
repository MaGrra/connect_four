# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :player1, :player2

  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', '⚫')
    @player2 = Player.new('Player 2', '⚪')
  end

  def setup
    board.display
  end
end
