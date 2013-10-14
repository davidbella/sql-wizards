require_relative '../env.rb'

class Game
  attr_accessor :player, :opponent, :icon, :prompt, :one_commands, :two_commands

  def initialize
    @icon = "📖  "
    @prompt = "⤼  "
    @one_commands = [:wizards, :battle, :help]
    @two_commands = [:player, :opponent]

    sql_connect = SqlConnect.new
    @wizards = sql_connect.wizards
  end

  def help
    help_msg = []
    help_msg << "‼ ⟼   Player set to wizard #{self.player.name}!" if player
    help_msg << "‼ ⟼   Opponent set to wizard #{self.opponent.name}!" if opponent
    help_msg << "⁈ ⟼   Commands are 'wizards', 'player #', 'opponent #', 'battle', 'help', and 'exit'"
    help_msg
  end

  def wizards
    @wizards.collect.with_index do |wizard, i|
      "#{i + 1} #{wizard}"
    end
  end

  def player=(number)
    if number.to_i.between?(0, @wizards.count)
      @player = @wizards[number.to_i - 1]
      ["Player set to #{player.name}!"]
    else
      ["No such wizard!"]
    end
  end

  def opponent=(number)
    if number.to_i.between?(0, @wizards.count)
      @opponent = @wizards[number.to_i - 1]
      ["Opponent set to #{opponent.name}!"]
    else
      ["No such wizard!"]
    end
  end

  def battle
    if self.player == nil || self.opponent == nil
      self.help.unshift "You must set a player and opponent before you can battle!"
    else
      # How to change this to set the CLI scene to battle?
    end
  end
end