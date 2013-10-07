require_relative './spec_helper'
require_relative '../lib/wizard'

describe Wizard do
  it 'should have a name' do
    wizard = Wizard.new
    wizard.name = "Bigby"
    wizard.name.should eq("Bigby")
  end

  it 'should have an age' do
    wizard = Wizard.new
    wizard.age = 120
    wizard.age.should eq(120)
  end

  it 'should have some spells' do
    wizard = Wizard.new
    wizard.spells = ["Lightning Bolt", "Teleport"]
    wizard.spells.should eq(["Lightning Bolt", "Teleport"])
  end

  it 'should be alive' do
    wizard = Wizard.new
    wizard.is_alive?
  end
end

describe Wizard,'#health' do
  it 'should have a numerical health value' do
    wizard = Wizard.new
    wizard.age = 45
    wizard.health.should eq(45)

    wizard.health = "Forty-Five"
    wizard.health.should eq(45)
  end

  it 'should default its health equal to its age' do
    wizard = Wizard.new
    wizard.age = 120
    wizard.health.should eq(120)
  end

  it 'should never have health higher than its age' do
    wizard = Wizard.new
    wizard.age = 120
    wizard.health += 5
    wizard.health.should eq(120)
  end

  it 'should lose health when attacked' do
    wizard = Wizard.new
    wizard.age = 45
    wizard.attacked(12)
    wizard.health.should eq(33)
  end

  it 'should die if the health is less than zero' do
    wizard = Wizard.new
    wizard.age = 45
    wizard.attacked(20)
    wizard.is_alive?
    wizard.attacked(37)
    !wizard.is_alive?
  end
end

describe Wizard,'#fighting' do
  it 'should be able to use a spell on another target'

  it 'should be able to use a spell on itself'
end