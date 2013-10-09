require 'simplecov'
SimpleCov.start
require 'json'
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

  it 'should be a male or female wizard' do
    wizard.gender.should be_a_kind_of(String)
    expect(["his", "her"]).to include(wizard.gender)
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
    spell = wizard.spells[:spell0]

    wizard.targeted(spell)
    wizard.health.should eq(32)
  end

  it 'should gain health when healed' do
    spell = {
      :name => "Rejuvenate",
      :amount => 6,
      :effect => "heal"
    }

    wizard.health = 10
    wizard.targeted(spell)
    wizard.health.should eq(16)
  end

  it 'should die if the health is less than zero' do
    spell = wizard.spells[:spell0]

    wizard.is_alive?

    4.times do
      wizard.targeted(spell)
    end

    !wizard.is_alive?
    wizard.health.should be <= 0
  end
end

describe Wizard,'#spells' do
  let(:wizard) {Wizard.new}
  it 'should have the default spells at the start' do
    wizard.spells.should eq(Wizard::DEFAULT_SPELLS)
  end

  it 'should have a hash of a spell if it has a spell' do
    wizard.spells[:spell0].should be_a_kind_of(Hash)
  end
end

describe Wizard,'#fight' do
  let(:wizard) {Wizard.new}
  it 'should be able to use a spell on another target' do
    target = Wizard.new
    spell = wizard.spells[:spell0]

    wizard.cast(spell, target)

    target.health.should eq(32)
  end

  it 'should be able to use a spell on itself' do
    target = wizard
    spell = wizard.spells[:spell0]

    wizard.cast(spell, target)

    wizard.health.should eq(32)
  end
end

