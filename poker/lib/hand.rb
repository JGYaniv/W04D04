class Hand 
    def initialize(cards=[])
        @cards = cards 
    end 

    def score 

    end 

    def royal_flush?
        flush? && straight? && royal?
    end 

    def royal?
        values = @cards.map { |ele| to_touple(ele)[0] }.sort

        values.all? {|num| num >= 10}
    end 

    def straight_flush?
        flush? && straight? 
    end 

    def flush?
        suits = @cards.map { |ele| to_touple(ele)[1] }

        suits.all? { |suit| suit == suits[0] }
    end 

    def straight?
        values = @cards.map { |ele| to_touple(ele)[0] }.sort

        (0...values.length-1).each do |i|
            return false unless values[i] == values[i+1] - 1
        end 
        true
    end 

    def to_touple(str)
        [str[0...-1].to_i, str[-1]]
    end 

end 




# scores
# 0 = no pair
# 100 + couple.sum = 1 pair (2 instances of same num)
# 200 + couple.sum = 2 pair (ex 5, 5, 6, 6, 10)
# 300 + throuple.sum = throuple 
# 400 + hand.sum = straight (consecutive cards)
# 500 + hand.sum = flush (5 cards of the same suit)
# 600 + hand.sum = full house (thruple, couple)
# 700 + dsjknda = QUARTET
# 800 + hand.sum = straight flush (consecutive, same suit)
# 900 + hand.sum = royal flush (10 - 14, same suit)