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
  # https://www.chrisjmendez.com/2018/10/14/mean-median-mode-standard-deviation/
  histogram = array.inject(Hash.new(0)) { |h, n| h[n] += 1; h }
  return histogram.sort_by{|k, v| -v}
end

s = Sim.new
1000000.times.each do
  s.run
end
p "outcomes: #{s.outcomes.join(',')}"
p "median: #{median(s.outcomes)}"
p "mean: #{mean(s.outcomes)}"
modes = modes(s.outcomes)
p "modes:"
p "-----------"
modes.each do |value, count|
  p "#{value}: #{count}"
end
