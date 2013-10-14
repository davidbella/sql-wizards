require_relative './sql_connect'
require_relative './battle.rb'

class Game
  attr_accessor :wizards, :player, :opponent, :current_battle

  def output(msgs)
    if self.current_battle
      current_battle.output(msgs)
    else
      msgs.map! do |msg|
        msg = "📖  " + msg
        msg.chars.each do |w|
          print w
          sleep(0.02)
        end
        sleep(0.2)
        puts
        msg
      end
      msgs
    end
  end

  def help
    help_msg = []
    help_msg << "‼ ⟼   Player set to wizard #{self.player.name}!" if self.player
    help_msg << "‼ ⟼   Opponent set to wizard #{self.opponent.name}!" if self.opponent
    help_msg << "⁈ ⟼   Commands are 'wizards', 'player', 'opponent', 'battle', 'help', and 'exit'"
    output(help_msg)
  end

  def wizards
    @wizards.each_with_index do |wizard, i|
      output(["#{i + 1} #{wizard}"])
    end
  end

  def player=(number)
    @player = @wizards[number.to_i - 1]
  end

  def opponent=(number)
    @opponent = @wizards[number.to_i - 1]
  end

  def battle
    if self.player == nil || self.opponent == nil
      output(["You must set a player and opponent before you can battle!"])
    else
      self.current_battle = Battle.new(player, opponent)
      self.current_battle.get_command
    end
  end

  def get_command
    while ((cmd = gets.strip.downcase) != 'exit')
      cmd_parts = cmd.split(' ')
      if cmd_parts.count == 1
        self.send(cmd_parts[0])
      elsif cmd_parts.count == 2
        self.send("#{cmd_parts[0]}=", cmd_parts[1])
      else
        output(["That's way off, try again"])
        help
      end
      print "⤼  "
    end
  end

  def call
    db = SqlConnect.new
    self.wizards = db.wizards
    output(["Welcome to the game of Wizard Battles!"])
    help
    print "⤼  "
    get_command
  end
end