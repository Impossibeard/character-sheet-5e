class Dice
  def self.from_string(string, random_number_generator: nil)
  end

  def initialize(random_number_generator: nil)
    @random_number_generator = random_number_generator || method(:random_number_generator)
  end

  def random_number_generator(n)
    rand(n) + 1
  end

  def roll(number, d: 1)
    @roll_result = []
    number.times do
      @roll_result << @random_number_generator.call(d)
    end
    self
  end

  def plus(number)
    @total = 0
    @roll_result.each do |t|
      @total += t
    end
    @total += number
    self
  end

  def double_dice
  end

  def total
    total = 0
    @roll_result.each do |t|
      total += t
    end
    return total
  end

  def lowest(n=1)
  end

  def highest(n=1)
  end
end
