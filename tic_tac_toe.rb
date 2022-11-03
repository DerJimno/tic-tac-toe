class TicTacToe
# Board things 
  attr_reader :board
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,4,8],
    [2,4,6], [0,3,6], [1,4,7], [2,5,8]
  ]

  def initialize
    @board = [*1..9]
  end

  def display_board
    puts <<-MULTI

      #{board[0]}|#{board[1]}|#{board[2]}
      #{board[3]}|#{board[4]}|#{board[5]}
      #{board[6]}|#{board[7]}|#{board[8]}

    MULTI
  end

  def update_board(input, symbol = "O")
    board[input - 1] = symbol
  end

  def valid_move?(input)
    board[input - 1] == input
  end

  def full_board?
    board.all? { |element| element == "X" || element == "O"}
  end

# Game things

  def turn
    puts "Please, choose a number from 1-9"
    number = gets.chomp.to_i 
  
    if valid_move?(number)
      update_board(number)
      display_board
    else
      puts "Invalid!"
    end
  end

  def winner?
    if WIN_COMBINATIONS.any? do |comb|
      [board[comb[0]], board[comb[1]], board[comb[2]]].uniq == ["X"]
      end
      true
    elsif WIN_COMBINATIONS.any? do |comb|
      [board[comb[0]], board[comb[1]], board[comb[2]]].uniq == ["O"]
      end
      false
    else 
      nil
    end
  end

  def draw?
    full_board? == true && winner? == nil
  end

  def over?
    draw? == true || winner? == true || winner? == false
  end

end

game = TicTacToe.new

