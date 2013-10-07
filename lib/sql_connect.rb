require 'sqlite3'

class SqlConnect
  attr_accessor :wizards, :spells

  def sql_get_wizards
    db = SQLite3::Database.new('db/wizards.db')
    db.execute('SELECT * FROM wizards;')
  end

  def query_wizards
    @wizards ||= sql_get_wizards
  end

  def sql_get_spells
    db = SQLite3::Database.new('db/wizards.db')
    db.execute('SELECT * FROM spells;')
  end

  def query_spells
    @spells ||= sql_get_spells
  end
end