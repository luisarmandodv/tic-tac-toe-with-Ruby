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

puts "Welcome to my Tic Tac Toe game!"
puts "Here is a map of my tic tac toe game, just type the square number to start playing! :D"

print_example_table

puts "Player 1 starts, please type a number from 1 to 9"
puts "If you want to quit the game, just tye 'q'"
puts "If you want to print the first table again, just type 'r'"

print_game_table

while true
  user_choice = gets.chomp.downcase
  $game_table.each do |choice, square|
    if user_choice.to_i == choice.to_i
      #puts "Winner Winner Chicken Dinner"
      if square == " "
        puts "You have selected position #{user_choice}"
        square.sub!(" ", "X")
        print_game_table
      else
        puts "Not this one, take another one"
      end
    elsif user_choice == "q"
      puts "Oh no... What have you done!!! you selected #{user_choice}!!"
      exit
    elsif user_choice == "r"
      puts "You have selected position #{user_choice}"
      print_example_table
      break
    else
      puts "What are you doing? type a right number!"
      break
    end
  end
end
