require_relative '../lib/app/case.rb'

new_case = Case.new('A1')

describe 'initialize' do
  it 'content of a new case should be a single point' do
    expect(new_case.content).to be == '.'
  end
end