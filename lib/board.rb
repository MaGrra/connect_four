require 'colorize'

# frozen_string_literal: true

class Board
  attr_reader :grid
  attr_accessor :diagonals

  def initialize
    @grid = Array.new(6) { Array.new(7, '  ') }
  end

  def display
    puts
    puts ' ' + (1..7).to_a.join('   ')
    puts '----------------------------'
    6.times { |i| puts grid[i].join('| ') }
  end

  def get_diagonals
    result = []
    padding = [*0..(grid.length - 1)].map { |i| [nil] * i }
    result += padding.zip(grid).zip(padding.reverse).map(&:flatten)
    result += padding.reverse.zip(grid).zip(padding).map(&:flatten)
    result.transpose.map(&:compact).select { |diagonal| diagonal.length > 3 }
  end


  def game_over?(symbol)
    game_won?(symbol) || full?
  end

  def full?
    grid.all? do |row|
      row.all? { |slot| slot == '⚫' || slot == '⚪' }
    end
  end

  def game_won?(symbol)
    horizontal_win(symbol) || vertical_win(symbol) || diagonal_win(symbol)
  end

  def diagonal_win(symbol)
    get_diagonals.any? do |diagonal|
      diagonal.join('').include?(symbol * 4)
    end
  end

  def horizontal_win(symbol)
    grid.any? do |row|
      row.join('').include?(symbol * 4)
    end
  end

  def vertical_win(symbol, column = 0, rows = [0, 1, 2, 3])
    return false if column == 7
    return true if rows.all? { |row| grid[row][column] == symbol}

    rows.map! { |row| row += 1}

    if rows == [3, 4, 5, 6]
      vertical_win(symbol,column + 1)
    else
      vertical_win(symbol, column, rows)
    end
  end


  def place_token(number, symbol)
    column = number - 1
    row = find_available_row(column)
    if row.nil?
      puts "This row is full, try another"
      return 'This row is full, try another'
    end

    grid[row][column] = symbol
  end

  def find_available_row(row = 5, column)
    return row if grid[row][column] != '⚫' && grid[row][column] != '⚪'
    return if row.negative?

    find_available_row(row - 1, column)
  end
end
