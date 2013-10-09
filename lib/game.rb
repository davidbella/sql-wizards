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
    help_msg << "⁈ ⟼  "
    output(help_msg)
  end
end