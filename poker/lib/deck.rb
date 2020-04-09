require_relative 'card'

class Deck
    attr_reader :cards
    def initialize
        @cards = generate_cards
    end

    def deal(num)
        hand = []
        num.times { hand << @cards.pop }
        hand
    end

    def shuffle
        @cards = @cards.shuffle
    end

    private
    VALUES = (2..14).to_a.map(&:to_s)
    SUITS = ["h", "d", "s", "c"]

    def generate_cards
        cards = []
        VALUES.each do |value|
            SUITS.each do |suit|
                cards << Card.new(value + suit)                
            end
        end
        cards
    end
end