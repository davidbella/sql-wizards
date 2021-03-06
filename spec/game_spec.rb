require 'guard/notifier'
require 'simplecov'
SimpleCov.start do
  SimpleCov.at_exit do
    SimpleCov.result.format!

    result = SimpleCov.result
    percentage = (result.covered_lines / Float(result.total_lines) * 100).to_i
    new_result = __FILE__.split('/').last
    new_result += "\n" + result.covered_lines.to_s
    new_result += " / " + result.total_lines.to_s
    new_result += " lines - " + percentage.to_s + "%"

    Guard::Notifier.notify(
      new_result,
      :title => "SimpleCov",
      :image => percentage < 90 ? :failed : :success
    )
  end
end

require 'json'
require_relative './spec_helper'
require_relative '../lib/game'
require_relative '../lib/wizard'
require_relative '../lib/battle'

describe Game,'#new' do
  let(:game) {Game.new}
  it 'should not have any wizards set yet' do
    game.wizards.should eq(nil)
  end

  it 'should not have a player or opponent set yet' do
    game.player.should eq(nil)
    game.opponent.should eq(nil)
  end

  it 'should not have a battle set yet' do
    game.battle.should eq(nil)
  end
end

describe Game,"#wizards" do
  let(:game) {Game.new}
  it 'should allow you to pass in an array of wizards' do
    wizard_set = [Wizard.new, Wizard.new]
    game.wizards = wizard_set
    game.wizards.should be_a_kind_of(Array)
    game.wizards.first.should be_a_kind_of(Wizard)
  end
end

describe Game,"#help" do
  let(:game) {Game.new.tap {|w| w.player = Wizard.new}}
  it 'should provide a help message'
end

describe Game,"#player" do
  let(:game) {Game.new}
  it 'should allow you to set a player' do
    game.player = Wizard.new
    game.player.should be_a_kind_of(Wizard)
  end
end

describe Game,"#opponent" do
  let (:game) {Game.new}
  it 'should allow you to set an opponent' do
    game.opponent = Wizard.new
    game.opponent.should be_a_kind_of(Wizard)
  end
end

describe Game,"#battle" do
  let (:game) {Game.new}
  it 'should not allow you to create a new battle' do
    result = game.start_battle
    game.battle.should eq(nil)
  end

  it 'should allow you to create a new battle only if wizards are made' do
    game.player = Wizard.new
    game.opponent = Wizard.new
    game.start_battle.should be_a_kind_of(Battle)
  end
end