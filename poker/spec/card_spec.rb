require 'rspec'
require 'card'

describe Card do
    describe "#initialize" do
        subject(:card){Card.new("12h")}
        it "sets the symbol" do
            expect(card.value).to eq("12h")
        end
        #
        # add method to check for valid value
        #
        # it "sets the color" do
        #     expect(card.color).to eq(:red)
        # end
        # it "sets the suit" do
        #     expect(card.suit).to eq(:heart)
        # end
    end
end