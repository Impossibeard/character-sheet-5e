class Dice
attr_accessor :all_rolls, :all_bonuses

  def self.from_string(string, random_number_generator: nil)
    dice = self.new(random_number_generator: random_number_generator)
    string = string.gsub('-', '+-')
    split_string = string.split("+").each do |segment|
      if segment =~ /d/
        dice_amount, dice_faces = segment.split("d")
        dice.roll(dice_amount.to_i, d: dice_faces.to_i)
      else
        dice.plus(segment.to_i)
      end
    end

    return dice
  end

  def initialize(random_number_generator: nil)
    @random_number_generator = random_number_generator || method(:random_number_generator)
    @all_rolls = []
    @all_bonuses = []
    @dice_multiplier = 1
  end

  def random_number_generator(n)
    rand(n) + 1
  end

  def roll(number, d: 1)
    number.times do
      all_rolls << @random_number_generator.call(d)
    end
    self
  end

  def plus(number)
    all_bonuses << number.to_i
    self
  end

  def double_dice
    @dice_multiplier = 2
    self
  end

  def total
    (all_rolls.inject(&:+).to_i * @dice_multiplier) + all_bonuses.inject(&:+).to_i
  end

  def lowest(n=1)
    @all_rolls.sort![0..(n-1)]
  end

  def highest(n=1)
    @all_rolls.sort!.reverse[0..(n-1)]
  end
end
