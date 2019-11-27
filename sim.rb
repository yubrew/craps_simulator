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

def mean(arr)
  arr.sum.fdiv(arr.size)
end

def median(array, already_sorted=false)
  return nil if array.empty?
  array = array.sort unless already_sorted
  m_pos = array.size / 2
  return array.size % 2 == 1 ? array[m_pos] : mean(array[m_pos-1..m_pos])
end

def modes(array, find_all=true)
  histogram = array.inject(Hash.new(0)) { |h, n| h[n] += 1; h }
  modes = nil
  histogram.each_pair do |item, times|
    modes << item if modes && times == modes[0] and find_all
    modes = [times, item] if (!modes && times>1) or (modes && times>modes[0])
  end
  return modes ? modes[1...modes.size] : modes
end

s = Sim.new
1000.times.each do
  s.run
end
p "outcomes: #{s.outcomes.join(',')}"
p "median: #{median(s.outcomes)}"
p "mean: #{mean(s.outcomes)}"
p "mode: #{modes(s.outcomes)}"
