require_relative './spec_helper'
require_relative '../lib/wizard'

describe Wizard do
  let(:wizard) {Wizard.new}
  it 'should have a name' do
    wizard.name.should eq("Bigby")
  end

  it 'should have an age' do
    wizard.age.should eq(45)
  end

  it 'should be alive' do
    wizard.is_alive?
  end
end

describe Wizard,'#health' do
  let(:wizard) {Wizard.new}
  it 'should have a numerical health value' do
    wizard.health.should eq(45)

    wizard.health = "Forty-Five"
    wizard.health.should eq(45)
  end

  it 'should default its health equal to its age' do
    wizard.health.should eq(45)
  end

  it 'should never have health higher than its age' do
    wizard.health += 5
    wizard.health.should eq(45)
  end

  it 'should lose health when attacked' do
    wizard.attacked(12)
    wizard.health.should eq(33)
  end

  it 'should die if the health is less than zero' do
    wizard.attacked(20)
    wizard.is_alive?
    wizard.attacked(37)
    !wizard.is_alive?
    wizard.health.should be <= 0
  end
end

describe Wizard,'#spells' do
  let(:wizard) {Wizard.new}
  it 'should not have any spells at the start' do
    wizard.spells.should eq({})
  end

  it 'should have a hash of a spell if it has a spell' do
    wizard.spells = {
      :spell1 => {
        :name => "Lightning",
        :amount => 13,
        :effect => "damage"
      }
    }

    wizard.spells[:spell1].should be_a_kind_of(Hash)
  end
end

describe Wizard,'#fight' do
  it 'should be able to use a spell on another target'

  it 'should be able to use a spell on itself'
end

