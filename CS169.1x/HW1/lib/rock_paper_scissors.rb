class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end
  
  # Validate move
  def self.valid_move?(move)
    /(r|p|s)/i =~ move.downcase
  end
  
  # win
  def self.win?(player, opponent)
    player.upcase!
    opponent.upcase!
    
    (player == opponent) or
    (player == 'R' and opponent == 'S') or
    (player == 'S' and opponent == 'P') or
    (player == 'P' and opponent == 'R')
  end
  
  def self.game_winner(game)
    player1,player2 = game.first,game.last
    #raise WrongNumberOfPlayerError game.length == 2
    return winner(player1, player2)
  end
  
  
  def self.winner(player1, player2)
    # YOUR CODE HERE
    player,opponent = player1.last,player2.last
    #puts "#{player} : #{opponent}"
    raise NoSuchStrategyError, 'Strategy must be one of R,P,S' unless valid_move?(player) and valid_move?(opponent)
    return player1 if win?(player,opponent)
    return player2
  end

  def self.tournament_winner(tournament)
    # YOUR CODE HERE
    if tournament.first.first.is_a?(String)
    	#puts tournament
    	game_winner(tournament)
    else
    	winner_left = tournament_winner(tournament.first)
    	winner_right = tournament_winner(tournament.last)
    	tournament_winner([winner_left,winner_right])
    end
  end

end
