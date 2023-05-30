# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  subject(:game) { described_class.new }

  describe '#switch_players' do
    context 'when its Player 2 move' do
      before do
        @current_player = @player1
      end
      it 'Switch to player 2' do
        game.switch_players
        expect(game.current_player).to eq(@player2)
      end
    end
  end
end
