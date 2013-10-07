require 'sqlite3'

class SqlConnect
  attr_accessor :wizards

  def initialize
    @db = SQLite3::Database.new('db/wizards.db')
  end

  def sql_get_wizards
    @db.execute(
      'SELECT * FROM wizards;'
    )
  end

  def sql_get_wizard_spells(wizard_id)
    @db.execute(
      "SELECT * FROM spells
       WHERE spells.wizard_id = #{wizard_id}"
    )
  end

  def wizards
    sql_get_wizards.collect do |wizard|
      spells = self.sql_get_wizard_spells(wizard[0])

      Wizard.new(wizard[1], wizard[2], spells)
    end
  end
end