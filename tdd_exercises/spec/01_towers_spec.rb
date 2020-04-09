require 'rspec'
require '01_towers'

describe Towers do
    subject(:tower){Towers.new}

    describe "#initialize" do
        it "sets piles to an array representing discs" do
            expect(tower.piles).to eq([[3,2,1],[],[]])
        end
    end

    describe "#move" do
        it "moves pieces" do
            expect(tower.move([0,1])).to eq([[3,2],[1],[]])
        end

        it "does not move pieces if move is invalid" do
            tower.move([0,1])
            expect(tower.move([0,1])).to eq(false)
            expect(tower.piles).to eq([[3,2],[1],[]])
        end
    end

    describe "#win?" do 
        it "should return true if game is over" do 
            tower.move([0,2])
            tower.move([0,1])
            tower.move([2,1])
            tower.move([0,2])
            tower.move([1,0])
            tower.move([1,2])
            tower.move([0,2])
            expect(tower.win?).to eq(true)
        end 

        it "should return false if game is not over" do 
            expect(tower.win?).to eq(false)
        end 
    end 
end

