class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],[0,4,8],
    [2,4,6], [0,3,6],[1,4,7], [2,5,8]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts "#{@board[0]}"'|'"#{@board[1]}"'|'"#{@board[2]}" "\n" +
         "#{@board[3]}"'|'"#{@board[4]}"'|'"#{@board[5]}" "\n" +
         "#{@board[6]}"'|'"#{@board[7]}"'|'"#{@board[8]}"
  end

  def update_board(input, symbol)
    @board[input - 1] = symbol
  end
end

game = TicTacToe.new
