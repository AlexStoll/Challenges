# 

class Poker
  def initialize(hands)
    @hands = hands.map { |hand| Hand.new(hand) }
  end

  def best_hand
    [@hands.min_by {|hand| hand.rank[0]}.hand]
  end
end

class Hand
  attr_reader :rank, :hand
  VALUES = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
              '7' => 7, '8' => 8, '9' => 9, 'T' => 10, 'J' => 11,
              'Q' => 12, 'K' => 13, 'A' => 14 }

  def initialize(hand)
    @hand = hand
    @values = hand.map { |card| card[0] }
    @suits = hand.map { |card| card[1] }
    @point_values = @values.map { |card| VALUES[card] }
    @rank = self.rank_hand
  end

  def rank_hand
    @rank = 9
    @rank = 8 if self.two_of_a_kind?
    @rank = 7 if self.two_pairs?
    @rank = 6 if self.three_of_a_kind?
    @rank = 5 if self.straight?
    @rank = 4 if self.flush?
    @rank = 3 if self.full_house?
    @rank = 2 if self.four_of_a_kind?
    @rank = 1 if self.straight_flush?
    @rank = [@rank, high_card_value]
  end

  protected

  def high_card_value
    @point_values.max
  end

  def n_of_a_kind?(n)
    counts = Hash.new(0)
    @values.each { |value| counts[value] += 1 }
    counts.has_value?(n)
  end

  def two_of_a_kind?
    n_of_a_kind?(2)
  end

  def two_pairs?
    counts = Hash.new(0)
    @values.each { |value| counts[value] += 1 }
    counts.values.count(2) == 2
  end

  def three_of_a_kind?
    n_of_a_kind?(3)
  end

  def four_of_a_kind?
    n_of_a_kind?(4)
  end

  def straight?
    return true if @point_values.sort == [2, 3, 4, 5, 14] # ;)
    (@point_values.min..@point_values.max).to_a == @point_values.sort
  end

  def flush?
    @suits.all?(@suits[0])
  end

  def straight_flush?
    self.flush? && self.straight?
  end

  def full_house?
    self.two_of_a_kind? && self.three_of_a_kind?
  end

  def <=>(other_hand)
    self.rank[0] <=> other_hand.rank[0]
  end
end
two_of_a_kind = ["AS", "2H", "2S", "4S", "5D"]
other_two_of_a_kind = ["3S", "7H", "4D", "4S", "2S"]
Poker.new([two_of_a_kind, other_two_of_a_kind]).best_hand