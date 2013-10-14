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
      if cmd == ""
        print scene.prompt
        next
      end

      cmd_parts = cmd.split(' ')

      if scene.commands.include?(cmd_parts[0].to_sym)
        if scene.respond_to?("#{cmd_parts[0].to_sym}=")
          output(scene.send("#{cmd_parts[0].to_sym}=", self, cmd_parts[1..-1]))
        else
          output(scene.send(cmd_parts[0].to_sym, self, cmd_parts[1..-1]))
        end
      else
        output(scene.help.unshift "I don't believe I understand")
      end
    print scene.prompt
    end
  end

  def output(msgs)
    return if !msgs.is_a?(Array)

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