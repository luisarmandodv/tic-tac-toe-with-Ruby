$example_table = {
  1 => "1",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9"
}

$game_table = {
  1 => " ",
  2 => " ",
  3 => " ",
  4 => " ",
  5 => " ",
  6 => " ",
  7 => " ",
  8 => " ",
  9 => " "
}

$combinations_to_win =
  [[$game_table[1], $game_table[2], $game_table[3]],
  [$game_table[4], $game_table[5], $game_table[9]],
  [$game_table[1], $game_table[4], $game_table[7]],
  [$game_table[4], $game_table[5], $game_table[6]],
  [$game_table[7], $game_table[8], $game_table[9]],
  [$game_table[7], $game_table[5], $game_table[3]],
  [$game_table[2], $game_table[5], $game_table[8]],
  [$game_table[3], $game_table[6], $game_table[9]]]


$changeRole = true

def print_game_table
  puts " "
  puts " #{$game_table[1]} | #{$game_table[2]} | #{$game_table[3]} "
  puts "---|---|---"
  puts " #{$game_table[4]} | #{$game_table[5]} | #{$game_table[6]} "
  puts "---|---|---"
  puts " #{$game_table[7]} | #{$game_table[8]} | #{$game_table[9]} "
  puts "---|---|---"
  puts " "
end

def print_example_table
  puts " "
  puts " #{$example_table[1]} | #{$example_table[2]} | #{$example_table[3]} "
  puts "---|---|---"
  puts " #{$example_table[4]} | #{$example_table[5]} | #{$example_table[6]} "
  puts "---|---|---"
  puts " #{$example_table[7]} | #{$example_table[8]} | #{$example_table[9]} "
  puts "---|---|---"
  puts " "
end

def any_winner?
  $combinations_to_win.each do |combination|
    if combination[0] == "O" && combination[1] == "O" && combination[2] == "O"
      puts "FATALLITY, PLAYER TWO WINS"
      exit
    elsif combination[0] == "X" && combination[1] == "X" && combination[2] == "X"
      puts "FATALLITY, PLAYER ONE WINS"
      exit
    end
  end
end

puts "Welcome to my Tic Tac Toe game!"
puts "Here is a map of my tic tac toe game, just type the square number to start playing! :D"

print_example_table

puts "Player 1 starts, please type a number from 1 to 9"
puts "If you want to quit the game, just tye 'q'"
puts "If you want to print the first table again, just type 'r'"

puts "PLAYER ONE:"
print_game_table

while true
  user_choice = gets.chomp.downcase
  $game_table.each do |choice, square|
    if user_choice.to_i == choice.to_i
      if square == " "
        puts "You have selected position #{user_choice}"

        if($changeRole == true)
          puts "PLAYER TWO:"
          square.sub!(" ", "X")
          $changeRole = false
        else
          puts "PLAYER ONE:"
          square.sub!(" ", "O")
          $changeRole = true
        end

        print_game_table
        any_winner?
      else
        puts "Not this one, take another one"
      end
    elsif user_choice == "q"
      puts "Oh no... What have you done!!! you selected #{user_choice}!!"
      exit
    elsif user_choice == "r"
      puts "Here is the table again: "
      print_example_table
      break
    end
  end
end
