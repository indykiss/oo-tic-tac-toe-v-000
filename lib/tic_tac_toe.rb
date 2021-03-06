
class TicTacToe
  
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
   @board = board
  end
  
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [3,4,5],
  [6,7,8]]
  
  def display_board 
      @board = @board
	    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	    puts "-----------"
	    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	    puts "-----------"
	    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	  end
	  
	def input_to_index(user_input)
    converted_input = user_input.to_i - 1 
  end 


  def move (index, token)
    @index = index
    @token = token
    @board[index] = token
  end
  
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
    return true
      elsif  @board[index] ==  " " || @board[index] == "" || @board[index] == nil
         return false
      end
  end


  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
        return true
        else  
          return false
    end
  end


  def current_player
    if turn_count(@board) % 2 == 0
      return "X"
    else
      return "O"
    end
  end


  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    converted_input = input_to_index (user_input)

      if valid_move?(converted_input) 
      move(converted_input, current_player)
      display_board
        else
          turn
      end
  end
 
  def turn_count
  counter = 0
  @board.each do |board_position|
    if board_position == "X" || board_position == "O"
    counter += 1 
    end
  end
  return counter
end


  def current_player
    if turn_count % 2 == 0 
      return "X"
    else  
      return "O"
    end
  end


  def won?
    WIN_COMBINATIONS.each do |win_combination|
  
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
  
    position_1 = @board[win_index_1] 
    position_2 = @board[win_index_2] 
    position_3 = @board[win_index_3] 
 
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination 
        elsif position_1 == "O" && position_2 == "O" && position_3  == "O"
      return win_combination
    end
  end
  else
      false
  end
 
 
 def full?
  if @board.include?(' ') || @board.include?('')
      return false
    else
      return true
    end
  end


  def draw?
    if !won? && full?
      return true
    end
  end
  

  def over?
    if full? || draw?
      return true
        elsif won?
          return true
    else  
      return false
    end
  end


  def winner
  winning_combo = won?
     if winning_combo
    return @board[winning_combo[0]]
      end
  end


  def play
    while !over?
      turn
    end 
  
    if draw?
      puts "Cat's Game!"
      
       elsif won?
        puts "Congratulations #{winner}!"
    end
  end
  
end
  