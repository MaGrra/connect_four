# frozen_string_literal: true

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(6) { Array.new(7, ' ') }
  end

  def display
    puts
    puts " #{(1..7).to_a.join('   ')}"
    puts '----------------------------'
    6.times { |i| puts grid[i].join(' |') }
  end

  def place_token(number, symbol)
    column = number - 1
    row = find_available_row(column)
    return 'This row is full, try another' if row.nil?

    grid[row][column] = symbol
  end

  def find_available_row(row = 5, column)
    return row if grid[row][column] != '⚫' && grid[row][column] != '⚪'
    return if row.negative?

    find_available_row(row - 1, column)
  end
end
