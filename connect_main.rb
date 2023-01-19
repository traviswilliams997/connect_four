class Game 
  attr_accessor :board
  
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
  
end

class Player

    def initialize
        @score = 0
    end
end

#new_game = Game.new
#new_game.print_board
#new_game.update_board_positon(5,'B')
#puts ""
#new_game.print_board
