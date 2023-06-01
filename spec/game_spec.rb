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

  describe '#staring_player' do
    context 'decide which player starts' do
      it 'Chose one player' do
        game.starting_player
        expect(game.starting_player.name).to eq('Player 1').or(eq('Player 2'))
      end
    end
  end

  describe '#valid_input' do
    context 'returns a valid input' do
      before do
        num = 6
        allow(game).to receive(:gets).and_return("#{num}\n") # Simulate user input
      end

      it 'returns a valid number' do
        expect(game.valid_input).to eq(6)
      end
    end

    context 'return error' do
      it 'prompts the user to enter a number between 1-7 when an invalid input is provided' do
        allow(game).to receive(:gets).and_return('10') # Stub user input: '10' is invalid, '6' is valid
        expect { game.valid_input }.to output("Enter a number between 1-7\n").to_stdout
      end
    end
  end
end