#!/usr/bin/env ruby
require 'game_tile'
require 'minesweeper_game'
require 'game_board'

puts "Welcome to the game of minesweeper!"
puts "-----------------------------------"
puts "Please enter the amount of rows that you would like to play with, anything more than 20 will be truncated."
rows = gets.chomp

while /^(\d){1,2}\z/.match(rows) == nil do
  puts "Please enter the amount of rows that you would like to play with, anything more than 20 will be truncated."
  rows = gets.chomp
end

rows = rows.to_i

puts "Please enter the amount of cols that you would like to play with, anything more than 20 will be truncated."
cols = gets.chomp

while /^(\d){1,2}\z/.match(cols) == nil do
  puts "Please enter the amount of cols that you would like to play with, anything more than 20 will be truncated."
  cols = gets.chomp
end

cols = cols.to_i

puts "Please enter the % chance you want for a bomb to occur"
bomb_chance = gets.chomp.to_f

while !bomb_chance.is_a?(Float) do
  puts "Please enter the % chance you want for a bomb to occur"
  bomb_chance = gets.chomp.to_f
end

# Create the board
board = GameBoard.new(rows, cols, bomb_chance)


# Use the MinesweeperGame class to play the game
game = MinesweeperGame.new(board, rows, cols)

game.print_the_board
while !game.game_over? && !game.win? do
 game.play_the_game
end

if game.game_over?
  puts "Oops! You selected a bomb. Please play again!"
elsif game.win?
  puts "Congrats you won the game!"
end

