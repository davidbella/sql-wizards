class Game
  attr_accessor :wizards, :player, :opponent, :battle

  def output(msgs)
    msgs.map! do |msg|
      msg = "📖  " + msg
      puts msg
      msg
    end
    msgs
  end

  def help
    help_msg = []
    help_msg << "‼ ⟼   Player set to wizard #{self.player.name}!\n" if self.player
    help_msg << "⁈ ⟼   Commands are 'player', 'opponent', 'battle', and 'exit'"
    output(help_msg)
  end

  def start_battle
    if self.player == nil || self.opponent == nil
      output(["You must set a player and opponent before you can battle!"])
    else
      self.battle = Battle.new(player, opponent)
    end
  end
end