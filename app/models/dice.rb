class Dice
  def self.from_string(string, random_number_generator: nil)
  end

  def initialize(random_number_generator: nil)
    @random_number_generator = random_number_generator || method(:random_number_generator)
  end

  def random_number_generator(n)
    rand(n) + 1
  end

  def roll(number, d: nil)
  end

  def plus(number)
  end

  def double_dice
  end

  def total
  end

  def lowest(n=1)
  end

  def highest(n=1)
  end
end