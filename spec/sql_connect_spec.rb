require_relative './spec_helper'
require_relative '../lib/sql_connect'

describe SqlConnect do
  it 'should return a list of Wizard objects' do
    sql_connect = SqlConnect.new
    wizards = sql_connect.wizards
    wizards.should be_a_kind_of(Array)
    wizards.first.should be_a_kind_of(Wizard)
  end

  it 'should create a Wizard object for each row in wizard table' do
    sql_connect = SqlConnect.new
    p wizards = sql_connect.wizards
    wizards.count.should eq(4)
  end
end
