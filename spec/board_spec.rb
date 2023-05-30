# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#place_token' do
    context 'when column is empty' do
      it 'places a token in the bottom slot' do
        board.place_token(1, '⚫')
        expect(board.grid[5][0]).to eq('⚫')
      end
    end
    context 'when column has one thing in it' do
      before do
        board.place_token(1, '⚫')
      end
      it 'place a token in the second slot' do
        board.place_token(1, '⚫')
        expect(board.grid[4][0]).to eq('⚫')
      end
    end
    context 'when the row is full return error message' do
      before do
        6.times do
          board.place_token(1, '⚫')
        end
      end
      it 'returns error message' do
        board.place_token(1, '⚫')
        expect(board.place_token(1, '⚫')).to eq('This row is full, try another')
      end
    end
  end
end
