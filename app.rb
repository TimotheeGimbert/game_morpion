require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib/', __FILE__)
require 'app/player'
require 'app/board'
require 'views/game'

system 'clear'
game = Game.new.perform