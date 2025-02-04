require 'pry'
class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
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
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
      input.to_i - 1 
    end 
    
    def move(index, player = "X")
      @board[index] = player
    end 
    
    def position_taken?(index)
      @board[index] != " "
    end
    
    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end
    
    def turn_count
      @board.count{|player| player == "X" || player == "O"}
    end
    
    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end
    
    def turn
      puts "Please enter 1-9."
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end
    
    def won?
      WIN_COMBINATIONS.each do |combination|
        win_index_1 = combination[0]
        win_index_2 = combination[1]
        win_index_3 = combination[2]
        
        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
        
        if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
          return combination
        end
      end
      false 
    end 
    
    def full?
      if @board.any? {|index| index == nil || index == " "}
        return false
      else
        return true
      end
    end
    
    def draw?
      if full? && !won?
        true
      else
        false
      end
    end
    
    def over?
      if won? || draw?
        true
      else
        false
      end
    end 
    
    def winner
      if won?
        return @board[won?[0]]
      end
    end 
    
    def play
      until over?
        turn 
      end
      if won?
        winner == "X" || winner == "O"
        puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
      end
    end
      
        
    
  
end