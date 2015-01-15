#doubt who to write more 1 custome exception
#if using row and col without initialize giving error
class InvalidInputError < StandardError ; end

class Sudo_game
  def initialize
    @sudo_matrix= [[0,2,0,0,0,0,0,0,0], [4,5,6,0,0,0,0,0,1], [7,0,0,0,0,3,5,6,0],
                   [0,0,0,3,0,0,0,0,0], [5,6,0,0,0,0,0,0,0], [2,0,0,0,0,7,9,0,8],
                   [0,0,0,0,0,0,1,0,9], [0,0,8,0,0,0,0,0,0], [9,0,0,0,0,0,0,8,6]]
  end
  def display_matrix
    @sudo_matrix.each{|row| puts row.join}
  end
  def sub_matrix?
    row = (@row/3)*3
    col = (@col/3)*3
    (row..row+2).each{|row|
      (col..col+2).each{|col| return false if(matrix[@row][@col] == @value)}}
    return true
  end
  def row_col_check?
    if( @sudo_matrix[@row].include?(@value) || @sudo_matrix.transpose[@col].include?(@value))
      return false
    end
    return sub_matrix?
  end
  def valid_input?
    @arr= [[0,1], [0,4], [1,0], [1,1], [1,2], [1,8], [2,0], [2,5], [2,6],
           [2,7], [3,3], [4,0], [4,1], [5,0], [5,5], [5,6], [5,8], [6,7],
           [6,8], [7,2], [8,0], [8,7], [8,8]]
    (row..row+8).each{|row| return false if(@arr[row][0] == @row && @arr[row][1] == @col)}}
    return true
  end
  def play_game
    begin
      raise(InvalidIinputError "invalid input") unless(row_col_check?) 
      sudoku_matrix[@row-1][@col-1]=@value
    rescue 
      print "invalid "
    end
  end
  def user_input
    begin
      print "Enter the row between (1-9): "
      @row= gets.chomp.to_i
      raise(InvalidInputError, "Invalid row ,please re-enter") unless(@row.between?(1,9))
      print "Enter the column between (1-9): "
      @col= gets.chomp.to_i
      raise(InvalidInputError, "Invalid column,please re-enter ") unless(@column.between?(1,9))
      print "Enter the value between (1-9): "
      @value= gets.chomp.to_i
      raise(InvalidInputError, "Invalid value, please re-enter") unless(@value.between?(1,9))
    rescue InvalidInputError
      p "Invalid input , please re-enter"
      retry 
    end
  end
end

obj= Sudo_game.new
obj.display_matrix
obj.user_input
obj.play_game
