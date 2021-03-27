require "rainbow"
require './board'
require './text'

using Rainbow

include TextFunctions


class Game

  @@current_player = 1
  @@player1_marker = nil
  @@player2_marker = nil

  @@game_over = false

  
  def self.start
    
    puts
    alert("Game started!")
    puts

    game_loop
  end

  
  def self.game_loop
    
    Board.print_board

    until @@game_over

      Board.place_marker(get_square)
      Board.print_board

      if tie? or win?
        @@game_over = true
      else
        toggle_player
      end
    end

    show_end_message
  end


  def self.show_end_message

    if tie?
      puts "TIE!".green
    else
      puts " PLAYER #{@@current_player} WINS! "
    end
  end

  
  def self.toggle_player
    @@current_player = @@current_player == 1 ? 2 : 1
  end

  def self.win?
    Board.win?
  end

  def self.tie?
    Board.tie?
  end

  def self.get_square

    puts " Player #{@@current_player}! ".bg(:skyblue).black
    puts "Which square do you want to place your marker in? [1-9]"
    square = gets.to_i rescue nil

    until square != nil and square > 0 and square < 10
      warn("Please enter a number from 1-9.")
      square = gets.to_i rescue nil
    end

    return square
  end

  
  def self.set_player_marker (player, marker)

    if player == 1
      @@player1_marker = marker
    else
      @@player2_marker = marker
    end
  end

  def self.get_player_marker (player)
    return player == 1 ? @@player1_marker : @@player2_marker
  end

  def self.get_current_player
    @@current_player
  end

  def self.get_current_marker
    @@current_player == 1 ? @@player1_marker : @@player2_marker
  end
end