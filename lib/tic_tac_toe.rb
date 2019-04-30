require 'pry'

class TicTacToe 
  
  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def initialize
    @board = Array.new(9, " ")  
  end
  
  def display_board
    board = self.board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, player_token)
    self.board[index] = player_token
  end
  
  def position_taken?(index)
    self.board[index] == "X" || self.board[index] == "O" ? true : false
  end
  
  def valid_move?(index)
    index.between?(0,8) && !self.position_taken?(index) ? true : false 
  end
  
  def turn_count
    self.board.count{ |space| space === "X" || space === "O" }
  end
  
  def current_player
    self.turn_count % 2 === 0 ? "X" : "O"
  end
  
  def turn 
    puts "Enter a move from 1-9"
    input = gets.chomp.to_i
    index = self.input_to_index(input)
    if self.valid_move?(index) 
      self.move(index, self.current_player)
      self.display_board
    else
      self.turn
    end
  end
end