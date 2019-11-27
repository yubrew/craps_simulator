require './game.rb'
class Sim
  def self.run
    g = Game.new
    g.run
  end
end

Sim.run
