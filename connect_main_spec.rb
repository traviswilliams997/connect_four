require 'rspec'
require_relative 'connect_main'

RSpec.describe Game do

    describe '#intitialize' do
        subject(:game_initialize) { described_class.new }

        xit 'Creates a new board' do 
            board = game_initialize.instance_variable_get(:@board)
            expect(board).not_to be_empty
        end
        xit 'Create a player 1' do 
            player_one = game_initialize.instance_variable_get(:@player_one)
            expect(player_one).not_to be_nil
        end
        
        xit 'Create a player 2' do 
            player_two = game_initialize.instance_variable_get(:@player_two)
            expect(player_two).not_to be_nil
        end
    end

    describe '#print_board' do
        subject(:game_print) { described_class.new }

        xit 'Displays board to screen' do
            expect(game_print).to receive(:print).with(" O ").exactly(42).times
            expect(game_print).to receive(:puts).with("").exactly(6).times
            game_print.print_board
        end
    end

    describe '#update_board_positon' do 
        subject(:game_board_update) { Game.new }
     
        it 'Changes value of one of the board positions' do 
          is_empty = true
          game_board_update.update_board_positon(1,'A')
          game_board_update.board.each do |row|
            row.each do |key, value|
                if  value != 'O'
                    is_empty = false 
                end
              end  
          end
          expect(is_empty).to be_falsey
      end
    end


end

RSpec.describe Player do 

  describe '#intitialize' do
    subject(:player_initialize) { described_class.new }

    xit 'Create a player score' do 
      score = player_initialize.instance_variable_get(:@score)
      expect(score).to eq(0) 
     end
   
  end
=begin  
  describe '#select_position' do
    let(:player_selection_game) { instance_double(Game) }
    subject(:player_selection) { player_selection_game.new }
   

    
    it 'Changes value of one the board positions' do 
        board = :player_selection.instance_variable_get(:@board)
        puts board
        p board.instance_of? Array
        #board.is_expected.to all( be_a(String).and include(" O ")) 

        board.to match_array([{col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
            {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
            {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
            {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
            {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
            {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'}])
=end
    #end
  
  #end
end

#Start new game
#Create players
#Create board
#Display board
#Display explantion of game
#Prompt player one to select a column 
#Player one selects a column 
#Check if column is full
#Fill last empty row in that column with player one coin 
#Display board
#Prompt Player two to select a column 
#Player two selects a column 
#Check if column is full
#Fill last empty row in that column with player two coin 


#Loop seletions untill four consecutive positions vertically, horizontally or diagonally
#are filled with the same player's coin  
  

#If four consecutive positons are filled update player scores

#If four consecutive positons are filled Display winner message

#Asked if they would like to play again




