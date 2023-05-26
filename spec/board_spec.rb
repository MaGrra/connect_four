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
  end
end
