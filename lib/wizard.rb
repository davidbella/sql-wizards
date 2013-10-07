class Wizard
  attr_accessor :name, :age, :spells, :health, :alive

  def initialize(name = "Bigby", age = 45, spells = {})
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
  end

  def attacked(amount)
    self.health -= amount

    if self.health <= 0
      self.alive = false
    end
  end

  def is_alive?
    self.alive
  end
end