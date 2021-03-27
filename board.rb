require './text'

include TextFunctions

class Board
  
  @@squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  @@free_squares = 9

  def self.print_board

    puts "Player 1: #{Game.get_player_marker(1)}"
    puts "Player 2: #{Game.get_player_marker(2)}"
    puts
    puts " #{@@squares[0]} | #{@@squares[1]} | #{@@squares[2]} "
    puts "---+---+---"
    puts " #{@@squares[3]} | #{@@squares[4]} | #{@@squares[5]} "
    puts "---+---+---"
    puts " #{@@squares[6]} | #{@@squares[7]} | #{@@squares[8]} "
    puts

  end

  def self.place_marker (square)
    @@squares[square - 1] = Game.get_current_marker
    @@free_squares -= 1
  end

  def self.tie?
    @@free_squares == 0 and !win?
  end

  def self.win?

    m = Game.get_current_marker

    win_str = m + m + m

    @@squares[0].to_s + @@squares[1].to_s + @@squares[2].to_s == win_str or
    @@squares[3].to_s + @@squares[4].to_s + @@squares[5].to_s == win_str or
    @@squares[6].to_s + @@squares[7].to_s + @@squares[8].to_s == win_str or
    @@squares[0].to_s + @@squares[3].to_s + @@squares[6].to_s == win_str or
    @@squares[1].to_s + @@squares[4].to_s + @@squares[7].to_s == win_str or
    @@squares[2].to_s + @@squares[5].to_s + @@squares[8].to_s == win_str or
    @@squares[0].to_s + @@squares[4].to_s + @@squares[8].to_s == win_str or
    @@squares[2].to_s + @@squares[4].to_s + @@squares[6].to_s == win_str

  end

end