require 'rspec'
require_relative 'connect_main'

RSpec.describe Game do
  describe '#intitialize' do
    subject(:game_initialize) { described_class.new }

    it 'Creates a new board' do 
      board = subject.instance_variable_get(:@board)
      expect(board).not_to be_empty
    end
    it 'Create a player 1' do 
      player_one = subject.instance_variable_get(:@player_one)
      expect(player_one).not_to be_nil
    end
    it 'Create a player 2' do 
      player_two = subject.instance_variable_get(:@player_two)
      expect(player_two).not_to be_nil
    end
  end
  describe '#print_board' do
   subject(:game_print) { described_class.new }

   it 'Displays board to screen' do
     expect(subject).to receive(:print).with(" O ").exactly(42).times
     expect(subject).to receive(:puts).with("").exactly(6).times
     subject.print_board
   end
  end

  describe '#update_board_positon' do 
    subject(:game_board_update) { described_class.new }
     
    it 'Changes value of one of the board positions' do 
      is_empty = true
      subject.update_board_positon(1,'A')
      subject.board.each do |row|
        row.each do |key, value|
          if  value != 'O'
            is_empty = false 
          end
         end  
      end
      expect(is_empty).to be_falsey
    end
  end
 
  describe '#round_over?' do
    subject(:game_round_over) { described_class.new }
        
    context 'when player has won horizontally on first row' do
      it 'returns true' do 
        subject.update_board_positon(1,'A')
        subject.update_board_positon(1,'B')
        subject.update_board_positon(2,'A')
        subject.update_board_positon(2,'B')
        subject.update_board_positon(3,'A')
        subject.update_board_positon(3,'B')
        subject.update_board_positon(4,'A')
        expect(subject.round_over?).to be_truthy
      end
    end
    context 'when player has won horizontally on second row' do 
      it 'returns true' do 
        subject.update_board_positon(7,'A')
        subject.update_board_positon(7,'B')
        subject.update_board_positon(6,'A')
        subject.update_board_positon(6,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(1,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(1,'A')
        subject.update_board_positon(4,'B')
        expect(subject.round_over?).to be_truthy
      end
    end 
    context 'when player has won vertically on first row' do
      it 'returns true' do 
        subject.update_board_positon(4,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(4,'A')
        expect(subject.round_over?).to be_truthy
      end
    end
    context 'when player has won vertically on second row' do
      it 'returns true' do 
        subject.update_board_positon(5,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(4,'A')
        expect(subject.round_over?).to be_truthy
      end
    end 
    context 'when player has won on right diagonal and on first row' do
       it 'returns true ' do 
          subject.update_board_positon(1,'A')
          subject.update_board_positon(2,'B')
          subject.update_board_positon(2,'A')
          subject.update_board_positon(3,'B')
          subject.update_board_positon(3,'A')
          subject.update_board_positon(1,'B')
          subject.update_board_positon(3,'A')
          subject.update_board_positon(2,'B')
          subject.update_board_positon(4,'A')
          subject.update_board_positon(4,'B')
          subject.update_board_positon(4,'A')
          subject.update_board_positon(2,'B')
          subject.update_board_positon(4,'A')
          expect(subject.round_over?).to be_truthy
         end
    end
    context 'when player has won on right diagonal and on second row' do
      it 'returns true' do 
        subject.update_board_positon(2,'A')
        subject.update_board_positon(1,'B')
        subject.update_board_positon(3,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(1,'A')
        subject.update_board_positon(2,'B')
        subject.update_board_positon(2,'A')
        subject.update_board_positon(3,'B')
        subject.update_board_positon(3,'A')
        subject.update_board_positon(1,'B')
        subject.update_board_positon(3,'A')
        subject.update_board_positon(2,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(2,'B')
        subject.update_board_positon(4,'A')
        expect(subject.round_over?).to be_truthy
      end
    end 
    context 'when player has won on left diagonal and on first row' do
      it 'returns true' do 
        subject.update_board_positon(7,'A')
        subject.update_board_positon(6,'B')
        subject.update_board_positon(6,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(7,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(4,'A')
        expect(subject.round_over?).to be_truthy
      end
    end
    context 'when player has won on left diagonal and on first row' do
      it 'returns true' do 
        subject.update_board_positon(6,'A')
        subject.update_board_positon(7,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(7,'A')
        subject.update_board_positon(6,'B')
        subject.update_board_positon(6,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(7,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(4,'A')
        expect(subject.round_over?).to be_truthy
      end
    end
    context 'when there is a draw'
      it 'returns true' do 
        subject.update_board_positon(1,'A')
        subject.update_board_positon(2,'B')
        subject.update_board_positon(3,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(6,'B')
        subject.update_board_positon(7,'A')
        subject.update_board_positon(1,'B')
        subject.update_board_positon(2,'A')
        subject.update_board_positon(3,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(6,'A')
        subject.update_board_positon(7,'B')
        subject.update_board_positon(2,'A')
        subject.update_board_positon(1,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(3,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(6,'B')
        subject.update_board_positon(7,'A')
        subject.update_board_positon(2,'B')
        subject.update_board_positon(1,'A')
        subject.update_board_positon(3,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(4,'B')
        subject.update_board_positon(7,'A')
        subject.update_board_positon(6,'B')
        subject.update_board_positon(1,'A')
        subject.update_board_positon(2,'B')
        subject.update_board_positon(3,'A')
        subject.update_board_positon(6,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(7,'B')
        subject.update_board_positon(5,'A')
        subject.update_board_positon(1,'B')
        subject.update_board_positon(2,'A')
        subject.update_board_positon(3,'B')
        subject.update_board_positon(4,'A')
        subject.update_board_positon(5,'B')
        subject.update_board_positon(6,'A')
        subject.update_board_positon(7,'B')                   
        expect(subject.round_over?).to be_truthy
      end
    end
  describe '#get_answer' do
    subject(:answer_selection) { described_class.new } 

    context 'when answer selection is "Y"' do
      before do 
        answer_choice = "Y"
        allow(subject).to receive(:gets).and_return(answer_choice)
      end 
      it 'Prompts player to input and saves answer' do
        answer = subject.get_answer
        expect(answer).to eq("Y")
      end
    end
    context 'when answer selection is "N"' do
      before do 
        answer_choice = "N"
        allow(subject).to receive(:gets).and_return(answer_choice)
      end 
      it 'Prompts player to input and saves answer' do
        answer = subject.get_answer
        expect(answer).to eq("N")
      end
    end
    context 'when answer selection is not "Y" or "N' do
      before do 
        invalid_input = "9"
        invalid_input_2 = "a"
        valid_input = "Y"
        allow(subject).to receive(:gets).and_return(invalid_input, invalid_input_2 ,valid_input)
      end 
      it 'calls error message' do
        expect(subject).to receive(:error_message).twice
        subject.get_answer       
      end
    end   
  end
#End of RSpec describe Game
end

RSpec.describe Player do 

  describe '#intitialize' do
    subject(:player_initialize) { described_class.new }

    it 'Create a player score' do 
      score = subject.instance_variable_get(:@score)
      expect(score).to eq(0) 
     end
  end

  describe '#get_column' do
    subject(:column_selection_2) { described_class.new } 

    context 'when column selection is betwwen 1 and 7' do
      before do 
        column_choice = "5"
        allow(subject).to receive(:gets).and_return(column_choice)
      end 
      it 'Prompts player to select column and saves answer' do
        column = subject.get_column
        expect(column).to be_between("1", "7" ).inclusive
      end
    end
    context 'when colunm selection is not between 1 and 7' do
      before do 
        invalid_input = "9"
        invalid_input_2 = "a"
        valid_input = "5"
        allow(subject).to receive(:gets).and_return(invalid_input, invalid_input_2 ,valid_input)
      end 
      it 'calls error message' do
        expect(subject).to receive(:error_message).twice
        subject.get_column        
       end
    end
  end
#End of RSpec player class
end