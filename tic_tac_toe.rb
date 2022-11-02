class TicTacToe
  attr_reader :board
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],[0,4,8],
    [2,4,6], [0,3,6],[1,4,7], [2,5,8]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts <<-MULTI
      #{@board[0]}|#{@board[1]}|#{@board[2]}
      #{@board[3]}|#{@board[4]}|#{@board[5]}
      #{@board[6]}|#{@board[7]}|#{@board[8]}
    MULTI
  end

  def update_board(input, symbol = "X")
    @board[input - 1] = symbol
  end

  def valid_move?(input)
    @board[input - 1] == " "
  end
end

game = TicTacToe.new
