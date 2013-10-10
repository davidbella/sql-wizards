require 'guard/notifier'
require 'simplecov'
SimpleCov.start do
  SimpleCov.at_exit do
    SimpleCov.result.format!

    result = SimpleCov.result
    percentage = (result.covered_lines / Float(result.total_lines) * 100).to_i
    new_result = __FILE__.split('/').last
    new_result += "\n" + result.covered_lines.to_s
    new_result += " / " + result.total_lines.to_s
    new_result += " lines - " + percentage.to_s + "%"

    Guard::Notifier.notify(
      new_result,
      :title => "SimpleCov",
      :image => percentage < 100 ? :failed : :success
    )
  end
end

require 'json'
require_relative './spec_helper'
require_relative '../lib/battle'

describe Battle,"#new" do
  it 'should be instantiated with 2 wizards' 
end

describe "Save" do
  it 'should save the battle record to the database!'
end