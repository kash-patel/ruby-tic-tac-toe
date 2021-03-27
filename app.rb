require './text'
require './board'
require './game'

include TextFunctions


def main

  puts "Enter marker used by Player 1:"
  Game.set_player_marker(1, get_marker)

  puts "Enter marker used by Player 2:"
  Game.set_player_marker(2, get_marker)

  Game.start

end


def get_marker

  marker = gets.chomp

  until marker.length == 1 and marker != Game.get_player_marker(1)

    warn(marker.length != 1 ? "Marker must be a single character!" : "Can't have the same marker as Player 1!")
    puts "Enter marker:"

    marker = gets.chomp

  end

  return marker

end


main