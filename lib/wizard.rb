class Wizard
  attr_accessor :name, :age, :spells, :health, :alive

  DEFAULT_SPELLS = {
    :spell0 => {
      :name => "Lightning",
      :amount => 13,
      :effect => "damage"
    }
  }

  def initialize(name = "Bigby", age = 45, spells = DEFAULT_SPELLS)
    self.name = name
    self.age = age
    self.spells = spells
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