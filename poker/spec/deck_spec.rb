require 'rspec'
require 'deck'

describe Deck do
    describe "#initialize" do
        subject(:deck){Deck.new}
        it "sets cards to be an array of 52 cards" do
            expect(deck.cards.count).to eq(52)
        end
    end

    describe "#deal" do
        subject(:deck){Deck.new}
        it "return first 5 cards of the deck" do
            expect(deck.deal(5).count).to eq(5)
        end

        it "removes first 5 cards of the deck" do
            deck.deal(5)
            expect(deck.cards.count).to eq(47)
        end
    end

    describe "#shuffle" do
        subject(:deck){Deck.new}
        it "shuffles the deck" do
            original_deck = deck.cards.dup
            deck.shuffle
            expect(original_deck).to_not eq(deck.cards)
        end
    end
end