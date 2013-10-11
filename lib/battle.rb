class Battle
  attr_accessor :battling, :player, :opponent

  def initialize(player, opponent)
    @player = player
    @opponent = opponent
    @battling = true
  end

  def battling?
    self.battling
  end

  def output(msgs)
    msgs.map do |msg|
      puts "🔨  " + msg
    end
  end

  def get_command
    while (battling?)
      output(["You are in a fight!"])
      cmd = gets.strip.downcase
      self.send(cmd)
    end
  end

  def attack
    player.cast(player.spells[:spell0], opponent)
    p opponent
  end
end