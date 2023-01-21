class Game 
  attr_accessor :board

  def initialize
    @board = create_board
    @player_one = Player.new
    @player_two = Player.new
  end

  def create_board 
    [
      {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
      {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
      {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
      {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
      {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
      {col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'}
      ]
  end

  def print_board
    @board.each do |row|
      row.each {|key, value| print " #{value} " } 
      puts ""
    end
  end
  def update_board_positon(column, letter)  
    @board.reverse_each {|row|     
        if row[:"col#{column}"] == 'O'
            row[:"col#{column}"] = letter
            return 
        end
    }
  end

  def round_loop
    round_over = false
    count = 0 
    loop do
      if count == 0
       self.print_board
      end
      round_over = self.player_turn(@player_one, 1, 'A')
      puts "Round over!" if round_over
      return  if round_over
      round_over = self.player_turn(@player_two, 2, 'B')
      puts "Round over!" if round_over
      return  if round_over
      count += 1
  end

  end 
  def player_turn(player, num, letter)
    print "Player #{num} "
    column_selection = player.get_column
    self.update_board_positon(column_selection, letter)
    self.print_board
    return self.round_over?
  end
  
  def round_over? 
  
    return true if check_horizontal
    return true if check_vertical
    return true if check_right_diagonal
    return true if check_left_diagonal
    return true if check_draw
    return false
  end
  def game_loop
    run = true
    count = 0
    while run do 
        if count == 0
            puts "Welcome to Connect Four!"
            puts "To win connect four pieces either horizonatally, vertically or diagonally"
            puts ""
            self.round_loop
            puts "Player 1 score is #{@player_one.score}"
            puts "Player 2 score is #{@player_two.score}"

            count += 1
        else
          answer = self.get_answer
         
          if answer == 'N'
            run = false
          elsif answer == 'Y'
            self.reset_round
            self.round_loop
            puts "Player 1 score is #{@player_one.score}"
            puts "Player 2 score is #{@player_two.score}"
            count += 1
          end
        end
    end

  end
  def reset_round
    @board = create_board
  end
  def get_answer
    is_verified = false
    until is_verified do 
      puts "Would you like to play again?"
      puts "Enter 'Y' for yes or 'N' for no"
      answer_selection = gets.chomp.upcase
      is_verified = verify_answer_selection(answer_selection)
      return answer_selection if is_verified
      puts "Input error! Please enter a 'Y or 'N'"
    end
  end

  
private
def verify_answer_selection(answer_selection)
    if answer_selection == 'Y' || answer_selection == 'N'
      return true 
    end
      false
  end
def is_full?
    is_full = true

    @board.each do |row|
        row.each {|key, value| 
        if value == 'O' 
            is_full = false
        end
    } 
      end
   return is_full
  end 
  def check_draw 
    if self.is_full?
      puts "Round is a draw!"
      return true
    end
    return false
  end
  def check_horizontal
    has_won = [false]
    count = {player1: 0, player2: 0}
    @board.each do |row|
        row.each {|key, value| check_count(value, count, has_won) 
        } 
    end
    return has_won[0]
  end
  
  def check_vertical
    has_won = [false]
    count = {player1: 0, player2: 0}
    for col_num in 1..7 do
      column = :"col#{col_num}"
      @board.each do |row|
        value = row[column]
        check_count(value, count, has_won)
      end 
    end
    return has_won[0]
  end

  def check_right_diagonal
    has_won = [false]
    count = {player1: 0, player2: 0}
    #Offsets starting column
    for column_traversal in 1..4 do 
      #Offsets starting row 
      for row_traversal in 0..2
        row_num = 5 - row_traversal
        #For each row it shifts to next column on the right
        for i in 1..4 do
          col_num = column_traversal 
          #Goes through each row from bottom to top
          while row_num >= 0 do     
            column = :"col#{col_num}"
            current_row = @board[row_num]  
            value = current_row[column]
            if col_num < 8 
                check_count(value, count, has_won)
            end         
            row_num -= 1
            col_num += 1
          end
        end
        count[:player1] = 0
        count[:player2] = 0
      end
    end
    return has_won[0]
  end

  def check_left_diagonal
    has_won = [false]
    count = {player1: 0, player2: 0}
    column_traversal = 7
    #Offsets starting column
    while  column_traversal >= 4 do
      #Offsets starting row 
      for row_traversal in 0..2
        row_num = 5 - row_traversal
        #For each row it shifts to next column on the right
        for i in 1..4 do
          col_num = column_traversal 
          #Goes through each row from bottom to top
          while row_num >= 0 do 
            column = :"col#{col_num}"
            current_row = @board[row_num]  
            value = current_row[column]
            if col_num > 0
             check_count(value, count, has_won)
            end 
            row_num -= 1
            col_num -= 1
          end
        end
        count[:player1] = 0
        count[:player2] = 0
      end
      column_traversal -= 1
    end
    return has_won[0]
  end
  def check_count(value, count, has_won)
    if value == 'A'
      count[:player1] += 1
      if count[:player1] == 4 
        puts "Player 1 has won this round"
        @player_one.score += 1
        has_won[0] = true
        return has_won[0]
      end
    elsif value != 'A'
      count[:player1] = 0 
    end

    if value == 'B'
      count[:player2] += 1
      if count[:player2] == 4 
        puts "Player 2 has won this round"
        @player_two.score += 1
        has_won[0] = true
        return has_won[0]
      end
    elsif value != 'B'
      count[:player2] = 0 
    end
  end
#end of game class 
end

  

class Player
    attr_accessor :score
  def initialize
    @score = 0
  end
  def get_column
    is_verified = false
    until is_verified do 
      puts 'choose a column between 1 and 7'
      column_selection = gets.chomp
      is_verified = verify_column_selection(column_selection)
      return column_selection if is_verified
      puts "Input error! Please enter a number between 1 and 7"
    end
  end


private 
  def verify_column_selection(column_selection)
      if column_selection == '1' || column_selection == '2' || column_selection == '3' || column_selection == '4' || column_selection == '5' || column_selection == '6' || column_selection == '7' 
        return true 
      end
      
      false
  end
#end of player class 
end
=begin
new_game = Game.new
new_game.game_loop

=end

