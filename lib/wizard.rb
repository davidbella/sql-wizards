class Wizard
  attr_accessor :name, :age, :spells, :health, :gender, :alive

  DEFAULT_SPELLS = {
    :spell0 => {
      :name => "Lightning",
      :amount => 13,
      :effect => "damage"
    }
  }

  FAIL_MSGS = [
    [' gets ', ' hair tangled while casting!'],
    [' stumbles over ', ' robes!'],
    [' gets ', ' hair caught in ', ' face!'],
    [' was off by one!']
  ]

  MISS_MSGS = [
    [' trips on ', ' cloak and misses!'],
    [' trips on ', ' staff and misses!'],
    [' drops ', ' staff during casting and misses!'],
    [' falls over while casting and misses!'],
    [' falls over and misses!'],
    [' gets distracted by an esoteric problem and misses!'],
    [' couldn\'t debug ', ' spell in time and misses!']
  ]

  WRONG_MSGS = [
    [' accidentally casts the wrong spell!'],
    [' forgot ', ' spellbook at home!'],
    [' forgets ', ' spell incantation words!'],
    [' had ', ' staff pointing the wrong direction!'],
    [' didn\'t implement ', ' her spell according to the spec!']
  ]

  def initialize(name = "Bigby", age = 45, spells = DEFAULT_SPELLS)
    self.name = name
    self.age = age
    self.spells = spells
    self.gender = ["her", "his"].sample
    self.alive = true
  end

  def age=(age)
    @age = age
    self.health = age
  end

  def health=(health)
    if health.is_a?(Integer) && health <= self.age
      @health = health
    end

    self.alive = false if self.health <= 0
  end

  def cast(spell, target)
    new_spell = spell.clone

    

    target.targeted(spell)

    "Cast a spell: #{new_spell[:name]}"
  end

  def targeted(spell)
    case spell[:effect]
    when "damage"
      self.health -= spell[:amount]
    when "heal"
      self.health += spell[:amount]
    end
  end

  def is_alive?
    self.alive
  end
end