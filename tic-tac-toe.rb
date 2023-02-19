class TicTacToe
# Board things 
  attr_reader :board, :symbol, :first_symbol, :second_symbol, :first_player, :second_player, :current_player, :number
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
  private
  def update_board(input, symbol)
    board[input - 1] = symbol
  end
  public
  def valid_move?(input)
    board[input - 1] == input
  end
  
  def full_board?
    board.all? { |element| element == first_symbol || element == second_symbol}
  end
  
# Game things

  def turn
    puts "#{current_player}, choose from 1-9"
    @number = gets.chomp.to_i 
  
    if valid_move?(number)
      update_board(number, symbol)
      display_board
    else
      puts "-----Invalid move!-----"
      display_board
      until valid_move?(number)
        puts "Please #{current_player}, only from 1-9"
        @number = gets.chomp.to_i
      end
      update_board(number, symbol)
      display_board
    end
  end
  
  def winner?
    if WIN_COMBINATIONS.any? do |comb|
      [board[comb[0]], board[comb[1]], board[comb[2]]].uniq == [first_symbol]
      end
      true
    elsif WIN_COMBINATIONS.any? do |comb|
      [board[comb[0]], board[comb[1]], board[comb[2]]].uniq == [second_symbol]
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

  def get_symbol
    input = gets.chomp
    is_it = input.to_i != 0 || input[1].is_a?(String) || input.empty?
    if is_it
      until is_it == false
        puts "-----Invalid input!-----"
        puts "Try 1 Letter or Symbol"
        input = gets.chomp
        is_it = input.to_i != 0 || input[1].is_a?(String) || input.empty?
      end
      input
    else
      input
    end
  end
  
  def play
    puts "Welcome to Tic-Tac-Toe CLI-Game"
    puts "Player 1, What's your name?"
    @first_player = gets.chomp
    puts "Heyy #{first_player}, choose 1 Letter or Symbol"
    @first_symbol = get_symbol

    puts "Player 2, What's your name?"
    @second_player = gets.chomp
    puts "Hello #{second_player}, choose 1 Letter or Symbol except \"#{first_symbol}\""
    @second_symbol = get_symbol
    until second_symbol != first_symbol
      puts "#{first_player} already chose #{first_symbol}!"
      @second_symbol = get_symbol
      if second_symbol != first_symbol
        puts "You play #{second_symbol}"
      end
    end
    
    display_board
    until over?
      @symbol = @first_symbol
      @current_player = @first_player
      turn
      if symbol == first_symbol && winner? == nil && draw? == false
        @symbol = second_symbol
        @current_player = second_player
        turn
      end
    end
    case winner?
    when true
      puts "#{first_player} wins."
    when false
      puts "#{second_player} wins."
    end
    if draw?
      puts "Game Over! it's a draw."
    end
  end
end
game = TicTacToe.new
game.play