class Game 

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
end

class Player

    def initialize
        @score = 0
    end
end

new_game = Game.new

new_game.print_board