class Battle
  attr_accessor :battling, :icon, :prompt, :commands

  def initialize(player, opponent)
    @player = player
    @opponent = opponent
    @icon = "🔨  "
    @prompt = "⤼  "
    @commands = [:help, :attack, :status]
    @battling = true
  end

  def battling?
    self.battling
  end

  def help(caller = nil, args = nil)
    help_msgs = []
    help_msgs << "Cast your spells! Destroy your opponent!"
    help_msgs << "Commands are 'attack'"
    help_msgs
  end

  def status(caller = nil, args = nil)
    sts_msgs = []
    sts_msgs << "Player #{@player.name} (#{@player.health}/#{@player.age})"
    sts_msgs << "Opponent #{@opponent.name} (#{@opponent.health}/#{@opponent.age})"
    sts_msgs
  end

  def attack(caller = nil, args = nil)
    @player.cast(@player.spells[:spell0], @opponent)
  end
end