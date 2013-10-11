require 'sqlite3'
require_relative './wizard'

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

      spell_hash = {}

      spells.each_with_index do |spell, i|
        spell_hash["spell#{i}".to_sym] = {
          :name => spell[1],
          :amount => spell[2],
          :effect => spell[3]
        }
      end

      Wizard.new(wizard[1], wizard[2], spell_hash)
    end
  end
end