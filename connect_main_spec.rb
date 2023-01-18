require 'rspec'
require_relative 'connect_main'

RSpec.describe Game do

    describe '#intitialize' do
        subject(:game_initialize) { described_class.new }

        it 'Creates a new board' do 
            board = game_initialize.instance_variable_get(:@board)
            expect(board).not_to be_empty
        end
        it 'Create a player 1' do 
            player_one = game_initialize.instance_variable_get(:@player_one)
            expect(player_one).not_to be_nil
        end
        
        it 'Create a player 2' do 
            player_two = game_initialize.instance_variable_get(:@player_two)
            expect(player_two).not_to be_nil
        end
    end

    describe '#print_board' do
        subject(:game_print) { described_class.new }

        it 'Displays board to screen' do
            expect(game_print).to receive(:print).with(" O ").exactly(42).times
            expect(game_print).to receive(:puts).with("").exactly(6).times
            game_print.print_board
        end
    end


end

RSpec.describe Player do 

  describe '#intitialize' do
    subject(:player_initialize) { described_class.new }

    it 'Create a player score' do 
      score = player_initialize.instance_variable_get(:@score)
      expect(score).to eq(0) 
     end
   
  end
  describe 'select position' do 
     
  end
  
end