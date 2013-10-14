require_relative '../env.rb'

class CLI
  attr_accessor :scene

  def call
    @scene = Game.new
    command
  end

  def command
    output scene.help
    print scene.prompt

    while ((cmd = gets.strip.downcase) != 'exit') do
      cmd_parts = cmd.split(' ')
      if cmd_parts.count == 1
        if scene.one_commands.include?(cmd_parts[0].to_sym)
          output(scene.send(cmd_parts[0].to_sym))
        else
          output(scene.help.unshift "I don't believe I understand")
        end
      elsif cmd_parts.count == 2
        if scene.two_commands.include?(cmd_parts[0].to_sym)
          output(scene.send("#{cmd_parts[0]}=".to_sym, cmd_parts[1]))
        else
          output(scene.help.unshift "I don't believe I understand")
        end
      else
        output(scene.help.unshift "I don't believe I understand")
      end
    print scene.prompt
    end
  end

  def output(msgs)
    msgs.map! do |msg|
      msg = scene.icon + msg
      msg.chars.each do |w|
        print w
        sleep(0.01)
      end
      sleep(0.1)
      puts
      msg
    end
    msgs
  end
end