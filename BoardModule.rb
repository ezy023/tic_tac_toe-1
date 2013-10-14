module BoardModule
  def init_board
    board = {}
    ('a'..'c').each_with_index do |letter, index|
      (1..3).each do |number|
        board["#{letter}#{number}"] = {
          :x => index,
          :y => (number - 1),
          :val => ' '
        }
      end
    end
    board
  end

  # Could this information be better held in a constant?
  def possible_wins
    [
      ['a1','a2','a3'],
      ['b1','b2','b3'],
      ['c1','c2','c3'],
      ['a1','b1','c1'],
      ['a2','b2','c2'],
      ['a3','b3','c3'],
      ['a1','b2','c3'],
      ['c1','b2','a3']
    ]
  end

   def print_board
    clear_screen!
    move_top_left
    reputs( "  1 2 3" )
    ('a'..'c').each do |row|
      string = (1..3).map { |col| @board["#{row}#{col}"][:val] }.join(' ')
      reputs( "#{row} #{string}" )
    end
  end

  def reputs(str = '')
    puts "\e[0K" + str
  end

  def clear_screen!
    print "\e[2J"
  end

  def move_top_left
    print "\e[H"
  end

  def intro
    clear_screen!
    move_top_left
    puts "Welcome to Tic Tac Toe"
    sleep(1)
    puts "I flipped a coin to see who will go first"
    sleep(2)
    if @turn == 1
      puts "I will go first"
    else
      puts "You will go first"
    end
    sleep(2)
  end
end
