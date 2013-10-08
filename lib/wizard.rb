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
    [' trips on ', ' cloak and misses!'],
    [' trips on ', ' staff and falls over while casting!'],
    [' gets ', ' hair tangled while casting!'],
    [' forgets ', ' spell incantation words!'],
    [' drops ', ' staff during casting!'],
    [' stumbles over ', ' robes!'],
    [' gets ', ' hair caught in ', ' face!'],
    [' accidentally casts the wrong spell!'],
    [' forgot ', ' spellbook at home!']
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
    puts FAIL_MSGS.sample
    target.targeted(spell)
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