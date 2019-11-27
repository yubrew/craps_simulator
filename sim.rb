require './game.rb'
class Sim
  attr_accessor :outcomes

  def initialize
    @outcomes = []
  end

  def run
    g = Game.new
    g.run
    g.outcomes.each do |outcome|
      @outcomes << outcome
    end
  end
end

s = Sim.new
100.times.each do
  s.run
end
p "outcomes: #{s.outcomes.join(',')}"
