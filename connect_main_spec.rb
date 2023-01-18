require 'rspec'
require_relative 'connect_main'

RSpec.describe Game do

    describe '#intitialize' do
        subject(:game_initialize) { described_class.new }
        it 'Creates a new board' do 
            board = game_initialize.instance_variable_get(:@board)
            expect(board).not_to be_empty
        end
    
    end

end