require_relative '../lib/app/player.rb'

player = Player.new('Test', 'x')

describe 'increase_score method' do
  it 'should return an integer' do
    expect(player.increase_score).to be_a(Integer)
  end
end