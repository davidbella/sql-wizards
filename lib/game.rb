require_relative '../env.rb'

class Game
  attr_accessor :player, :opponent, :icon, :prompt, :commands

  def initialize
    @icon = "📖  "
    @prompt = "⤼  "
    @commands = [:wizards, :battle, :help, :player, :opponent]

    sql_connect = SqlConnect.new
    @wizards = sql_connect.wizards
  end

  def help(caller = nil, args = nil)
    help_msg = []
    help_msg << "‼ ⟼   Player set to wizard #{self.player.name}!" if player
    help_msg << "‼ ⟼   Opponent set to wizard #{self.opponent.name}!" if opponent
    help_msg << "⁈ ⟼   Commands are 'wizards', 'player #', 'opponent #', 'battle', 'help', and 'exit'"
    help_msg
  end

  def wizards(caller = nil, args = nil)
    @wizards.collect.with_index do |wizard, i|
      "#{i + 1} #{wizard}"
    end
  end

  def player=(caller = nil, args = nil)
    return (["Please provide an argument of the wizard's number"]) if args == nil
    
    number = args[0]
    if number.to_i.between?(0, @wizards.count)
      @player = @wizards[number.to_i - 1]
      ["Player set to #{player.name}!"]
    else
      ["No such wizard!"]
    end
  end

  def opponent=(caller = nil, args = nil)
    return (["Please provide an argument of the wizard's number"]) if args == nil

    number = args[0]
    if number.to_i.between?(0, @wizards.count)
      @opponent = @wizards[number.to_i - 1]
      ["Opponent set to #{opponent.name}!"]
    else
      ["No such wizard!"]
    end
  end

  def battle(caller, args = nil)
    if self.player == nil || self.opponent == nil
      self.help.unshift "You must set a player and opponent before you can battle!"
    else
      caller.scene = Battle.new(player, opponent)
      ["Entering a new battle between #{player.name} and #{opponent.name}"]
    end
  end
end