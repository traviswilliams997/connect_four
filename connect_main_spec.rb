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

    describe '#update_board_positon' do 
        subject(:game_board_update) { Game.new }
     
        xit 'Changes value of one of the board positions' do 
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

    describe '#player_has_won' do
      subject(:game_has_won) { Game.new }


      xit 'Checks if player has won' do 

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

  describe '#get_column' do
    subject(:column_selection) { described_class.new }  
    before do 
        column_choice = "5"
        allow(column_selection).to receive(:gets).and_return(column_choice)
    end 
         
    it 'Prompts player to select column and saves answer' do
        column = column_selection.get_column
        expect(column).to be_between("1", "7" ).inclusive
    end
  end
  describe '#get_letter' do
    subject(:letter_selection) { described_class.new }  
    before do 
        letter_choice = "A"
        allow(letter_selection).to receive(:gets).and_return(letter_choice)
    end 
         
    it 'Prompts player to select letter and saves answer' do
        letter = letter_selection.get_letter
        expect(letter).to be_between("A", "B" ).inclusive
    end
  end

  describe '#verify_column_selection' do
    subject(:column_verfication) {described_class.new}

    context  'when colunm selection is not between 1 and 7' do
      xit 'returns false' do
        column_choice = "9" 
        expect(column_verfication.verify_column_selection(column_choice)).to be_falsey
      end
    end

    context  'when colunm selection is  between 1 and 7' do
        xit 'returns true' do
          column_choice = "7" 
        expect(column_verfication.verify_column_selection(column_choice)).to be_truthy
        end
      end
  end
  describe '#verify_letter_selection' do
    subject(:letter_verfication) {described_class.new}

    context  'when letter selection is not "A" or "B"' do
      xit 'returns false' do
        letter_choice = "Z" 
        expect(letter_verfication.verify_letter_selection(letter_choice)).to be_falsey
      end
    end

    context  'when letter selection is not "A" or "B"' do
        xit 'returns true' do
            letter_choice = "A" 
        expect(letter_verfication.verify_letter_selection(letter_choice)).to be_truthy
        end
      end
  end
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




