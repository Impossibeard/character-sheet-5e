class Dice
  def self.from_string(string, random_number_generator: nil)
    split_string = string.split("d")
    dice_amount = split_string[0].to_i
    dice_faces = split_string[1].to_i
    plusser = split_string[1].split("+").pop.to_i
    @dice = Dice.new(random_number_generator: random_number_generator).roll(dice_amount, d: dice_faces).plus(plusser)
    return @dice
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
    @roll_total = 0
    @roll_result.each do |t|
      @roll_total += t
    end
    @total = @roll_total
    self
  end

  def plus(number)
    @total += number
    self
  end

  def double_dice
    @total += @roll_total
    self
  end

  def total
    return @total
  end

  def lowest(n=1)
    @roll_result.sort!
    @lowest_roll = []
    n.times do |i|
      @lowest_roll << @roll_result[i]
    end
    return @lowest_roll
  end

  def highest(n=1)
    @roll_result.sort! {|x, y| y <=> x}
    @highest_roll = []
    n.times do |i|
      @highest_roll << @roll_result[i]
    end
    return @highest_roll
  end
end
