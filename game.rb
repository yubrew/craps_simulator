# Runs 1 session until loss

class Game
  DIE = [*1..6]
  attr_accessor :rolls, :outcomes

  def initialize
    @rolls = []
    @outcomes = []
  end

  def run(toss_count = 0)
    x = DIE.sample + DIE.sample
    p "toss: #{x}"
    rolls << x
    toss_count += 1
    # if x is 7 or 11, instant win
    if [7, 11].include?(x)
      outcome = 1
    elsif [2, 3, 12].include?(x)
      outcome = 0
    else
      toss = DIE.sample + DIE.sample
      p "toss: #{toss}"
      rolls << toss
      toss_count += 1
      while ![x, 7].include?(toss)
        # otherwise player repeatedly rolls two dice until sum is either x or 7
        toss = DIE.sample + DIE.sample
        p "toss: #{toss}"
        rolls << toss
        toss_count += 1
      end
      # if sum is x then win
      # if sum is 7 then lose
      outcome = toss == x ? 1 : 0
    end
    p "outcome: #{outcome} toss: #{x} toss_count: #{toss_count}"

    if outcome != 0
      run(toss_count)
    else
      outcomes << toss_count
      p "rolls: #{rolls.join(',')}"
      p "toss count: #{outcomes.join(',')}"
    end
  end
end
