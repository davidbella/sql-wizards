require_relative './spec_helper'
require_relative '../lib/sql_connect'

describe SqlConnect do
  it 'should get some wizards from the database' do
    sql_connect = SqlConnect.new
    sql_connect.query_wizards.should_not eq(nil)
  end

  it 'should get some spells from the database' do
    sql_connect = SqlConnect.new
    sql_connect.query_spells.should_not eq(nil)
  end
end
