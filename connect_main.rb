class Game 
  attr_accessor :board, :player_one
  
  def initialize
    @board = create_board
    @player_one = Player.new
    @player_two = Player.new
  end

  def create_board 
    [{col1: 'O', col2: 'O', col3: 'O', col4: 'O', col5: 'O', col6: 'O', col7: 'O'},
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

  def game_loop
    game_over = false
    count = 0 
    loop do
      if count == 0
       self.print_board
      end
      game_over = self.player_turn(@player_one, 1, 'A')
      puts "Game over!" if game_over
      return  if game_over
      game_over = self.player_turn(@player_two, 2, 'B')
      puts "Game over!" if game_over
      return  if game_over
      count += 1
    end

  end 
  def player_turn(player, num, letter)
    print "Player #{num} "
    column_selection = player.get_column
    self.update_board_positon(column_selection, letter)
    self.print_board
    return self.game_over?
  end

  def game_over? 
    return true if check_horizontal
    return true if check_vertical
    return true if check_right_diagonal
    return true if check_left_diagonal
    return false
    
  end
  def check_horizontal
    has_won = false
    horizontal_count_player1 = 0
    horizontal_count_player2 = 0
    @board.each do |row|
        row.each {|key, value|
            if value == 'A'
              horizontal_count_player1 += 1
              if horizontal_count_player1 == 4 
                puts "Player 1 has won"
                has_won = true
                return has_won
              end
            elsif value != 'A'
              horizontal_count_player1 = 0 
            end

            if value == 'B'
                horizontal_count_player2 += 1
                if horizontal_count_player2 == 4 
                    puts "Player 2 has won"
                    has_won = true
                    return has_won
                  end
                elsif value != 'B'
                horizontal_count_player2 = 0 
              end

             } 
      end
      return has_won
  end
  
  def check_vertical
    has_won = false
    vertical_count_player1 = 0
    vertical_count_player2 = 0
    for col_num in 1..7 do
        column = :"col#{col_num}"
        @board.each do |row|
          if row[column] == 'A'
            vertical_count_player1 += 1
            if vertical_count_player1 == 4 
                puts "Player 1 has won"
                has_won = true
                return has_won
            end
            elsif row[column]  != 'A'  
                vertical_count_player1 = 0 
          end
          if row[column] == 'B'
            vertical_count_player2 += 1
            if vertical_count_player2 == 4 
                puts "Player 2 has won"
                has_won = true
                return has_won
            end
            elsif row[column]  != 'B'  
                vertical_count_player2 = 0 
          end
        end 
    end
    return has_won
  end

  def check_right_diagonal
    has_won = false
    diagonal_count_player1 = 0
    diagonal_count_player2 = 0 
    for column_traversal in 1..4 do 
      for traversal_count in 0..2
        row_num = 5 - traversal_count
        for i in 1..4 do
          col_num = column_traversal 
          while row_num >= 0 do     
            column = :"col#{col_num}"
            current_row = @board[row_num]  
            value = current_row[column]
    
            if col_num < 8 && value == 'A'
              diagonal_count_player1 += 1        
              if diagonal_count_player1 == 4 
                puts "Player 1 has won"
                has_won = true
                return has_won
             end
            elsif col_num < 8 && value != 'A'
              diagonal_count_player1 = 0
            end
            if col_num < 8 && value == 'B'
              diagonal_count_player2 += 1            
              if diagonal_count_player2 == 4 
                puts "Player 2 has won"
                has_won = true
                return has_won
              end
            elsif col_num < 8 && value != 'B'
              diagonal_count_player2 = 0
            end
            row_num -= 1
            col_num += 1
          end
        end
      end
    end
    return has_won
  end

  def check_left_diagonal
    has_won = false
    diagonal_count_player1 = 0
    diagonal_count_player2 = 0
    column_traversal = 7
    while  column_traversal >= 4 do
      for traversal_count in 0..2
        row_num = 5 - traversal_count
        for i in 1..4 do
          col_num = column_traversal 

          while row_num >= 0 do 
            column = :"col#{col_num}"
            current_row = @board[row_num]  
            value = current_row[column]
          
            if col_num > 0 && value == 'A'
              diagonal_count_player1 += 1  
                    
              if diagonal_count_player1 == 4 
                puts "Player 1 has won"
                has_won = true
                return has_won
              end
            elsif col_num > 0 && value != 'A'
              diagonal_count_player1 = 0
            end
            if col_num > 0 && value == 'B'
              diagonal_count_player2 += 1            
              if diagonal_count_player2 == 4 
                puts "Player 2 has won"
                has_won = true
                return has_won
              end
            elsif col_num > 0 && value != 'B'
              diagonal_count_player2 = 0
            end
            row_num -= 1
            col_num -= 1
          end
        end
      end
      column_traversal -= 1
    end
    return has_won
  end


#end of game class 
end

  


class Player

    def initialize
        @score = 0
    end
    def get_column
        is_verified = false
        until is_verified do 
          puts 'Choose a column between 1 and 7'
          column_selection = gets.chomp
          is_verified = verify_column_selection(column_selection)
          return column_selection if is_verified
          puts "Input error! Please enter a number between 1 and 7"
       end
    end
 
private 
    def verify_column_selection(column_selection)
      if column_selection.to_i >= 1 && column_selection.to_i <= 7
        return true 
      end
      false
    end
  

   #end of player class 

end
#=begin
new_game = Game.new
new_game.game_loop

#=end

