require 'rspec'
require 'hand'

describe Hand do 
    describe "#initialize" do 
        subject(:hand) { Hand.new([1,2,3,4,5]) }
        
        it "should accept cards" do 
            expect(hand.cards).to eq([1,2,3,4,5])
        end 
    end 

    describe "#score" do 
        it "royal flush returns 960"  do 
            rf_hand = Hand.new(["10h", "11h", "12h", "13h", "14h"])
            expect(rf_hand.score).to eq(960)
        end 

        it "straight flush returns 800 + sum of hand"  do 
            sf_hand = Hand.new(["10h", "11h", "12h", "13h", "9h"])
            expect(sf_hand.score).to eq(855)
        end 

        it "four of a kind returns 700 + sum of the repeating cards"  do 
            four_hand = Hand.new(["10h", "10d", "10s", "10c", "14h"])
            expect(four_hand.score).to eq(740)
        end 
        
        it "full house returns 600 + sum of hand" do 
            full_house_hand = Hand.new(["10h", "10c", "10s", "13h", "13s"])
            expect(full_house_hand.score).to eq(656)
        end 
        
        it "flush returns 500 + sum of hand"  do 
            flush_hand = Hand.new(["2h", "5h", "10h", "13h", "14h"])
            expect(flush_hand.score).to eq(544)
        end 

        it "straight returns 400 + sum of hand"  do 
            s_hand = Hand.new(["10s", "11h", "12h", "13h", "14h"])
            expect(s_hand.score).to eq(460)
        end 

        it "three in a row returns 300  + sum of the repeating cards"  do 
            three_hand = Hand.new(["10s", "10h", "10c", "13h", "14h"])
            expect(three_hand.score).to eq(330)
        end 

        it "two pairs returns 200  + sum of the repeating cards"  do 
            two_pairs_hand = Hand.new(["10s", "10h", "11c", "11h", "14h"])
            expect(two_pairs_hand.score).to eq(242)
        end 

        it "pair returns 100  + sum of the repeating cards"  do 
            pair_hand = Hand.new(["10s", "10h", "12c", "11h", "14h"])
            expect(pair_hand.score).to eq(120)
        end 

        it "no pair returns val of max card"  do 
            no_pair_hand = Hand.new(["10s", "9h", "12c", "11h", "14h"])
            expect(no_pair_hand.score).to eq(14)
        end 

    end 

    describe "#royal_flush?" do 
        it "royal flush? returns true if royal flush" do 
            hand = Hand.new(["10h", "11h", "12h", "13h", "14h"])
            expect(hand.royal_flush?).to eq(true)
        end
        it "royal flush? returns false if no royal flush" do 
            hand = Hand.new(["10h", "11h", "12h", "13h", "2h"])
            expect(hand.royal_flush?).to eq(false)
        end
    end 

    describe "#straight_flush?" do
        it "return true if straight flush" do 
            straight = Hand.new(["10h", "11h", "12h", "13h", "9h"])
            expect(straight.straight_flush?).to eq(true)
        end
        it "return true if straight flush" do 
            straight = Hand.new(["10h", "11h", "12h", "2c", "9h"])
            expect(straight.straight_flush?).to eq(false)
        end
    end 
        
    describe "#four_hand?" do 
        it "return true if hand contains four of a kind" do 
            four_hand = Hand.new(["10h", "10d", "10s", "10c", "14h"])
            expect(four_hand.four_hand?).to eq(true)
        end 
        it "return false if hand contains four of a kind" do 
            four_hand = Hand.new(["10h", "10d", "5s", "10c", "14h"])
            expect(four_hand.four_hand?).to eq(false)
        end 
    end
        
    describe "#full_house?" do         
        it "return true if full house" do 
            full_house_hand = Hand.new(["10h", "10c", "10s", "13h", "13s"])
            expect(full_house_hand.full_house?).to eq(true)
        end 
        it "return false if full house" do 
            full_house_hand = Hand.new(["10h", "4c", "10s", "13h", "13s"])
            expect(full_house_hand.full_house?).to eq(false)
        end 
    end
        
    describe "#flush?" do         
        it "flush? returns true if flush"  do 
            flush_hand = Hand.new(["2h", "5h", "10h", "13h", "14h"])
            expect(flush_hand.flush?).to eq(true)
        end 

        it "flush? returns false if no flush"  do 
            flush_hand = Hand.new(["2h", "5h", "10h", "13c", "14h"])
            expect(flush_hand.flush?).to eq(false)
        end 
    end
        
    describe "#straight?" do 
        it "straight? returns true if straight"  do 
            s_hand = Hand.new(["10s", "11h", "12h", "13h", "14h"])
            expect(s_hand.straight?).to eq(true)
        end 

        it "straight? returns false if no straight"  do 
            s_hand = Hand.new(["10s", "5h", "12h", "13h", "14h"])
            expect(s_hand.straight?).to eq(false)
        end 
    end
        
    describe "#three_hand?" do 
        it "three_hand? returns true if three of a kind in hand"  do 
            three_hand = Hand.new(["10s", "10h", "10c", "13h", "14h"])
            expect(three_hand.three_hand?).to eq(true)
        end 

        it "three_hand? returns false no three of a kind in hand"  do 
            three_hand = Hand.new(["10s", "10h", "5c", "13h", "14h"])
            expect(three_hand.three_hand?).to eq(false)
        end 
    end
        
    describe "#two pairs?" do 
        it "two pairs returns true if two pairs"  do 
            two_pairs_hand = Hand.new(["10s", "10h", "11c", "11h", "14h"])
            expect(two_pairs_hand.two_pairs?).to eq(true)
        end 
        
        it "two pairs returns false if no two pairs"  do 
            two_pairs_hand = Hand.new(["10s", "10h", "8c", "11h", "14h"])
            expect(two_pairs_hand.two_pairs?).to eq(false)
        end 
    end
        
    describe "#pair?" do 
        it "pair returns true if hand has pair"  do 
            pair_hand = Hand.new(["10s", "10h", "12c", "11h", "14h"])
            expect(pair_hand.pair?).to eq(true)
        end 

        it "pair returns false if has no pair"  do 
            pair_hand = Hand.new(["10s", "2h", "12c", "11h", "14h"])
            expect(pair_hand.pair?).to eq(false)
        end 
    end
        
    describe "#no_pair?" do 
        it "no pair returns true if no pair"  do 
            no_pair_hand = Hand.new(["10s", "9h", "12c", "11h", "14h"])
            expect(no_pair_hand.no_pair?).to eq(true)
        end 
        
        it "no pair returns false if pair"  do 
            no_pair_hand = Hand.new(["10s", "10h", "12c", "11h", "14h"])
            expect(no_pair_hand.no_pair?).to eq(false)
        end 
    end
end
