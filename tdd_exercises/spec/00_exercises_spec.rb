require '00_exercises.rb'
require 'rspec'

describe Array do 
    describe "#my_uniq" do 
        it "returns unique" do 
            arr = [1, 2, 1, 3, 3] 
            expect(arr.my_uniq).to eq([1, 2, 3])
        end 

        it "returns empty array" do 
            arr = [] 
            expect(arr.my_uniq).to be_empty
        end 
    end 

    describe "#two_sum" do 
        subject(:arr) { [-1, 0, 2, -2, 1] }

        it "return pairs of indices that sum to 0" do 
            expect(arr.two_sum.sort).to eq([[0, 4], [2, 3]].sort)
        end 

        it "smaller first els come first" do 
            expect(arr.two_sum).to eq([[0,4],[2,3]])
        end
        
        it "smaller second els come first" do 
            arr2 = [-1, 1, 1, -2, 5]
            expect(arr2.two_sum).to eq([[0,1],[0,2]])
        end
    end 

    describe "#my_transpose" do
        let(:transposed_arr) {[[0, 3, 6],[1, 4, 7],[2, 5, 8]]}
        subject(:arr) {[[0, 1, 2],[3, 4, 5],[6, 7, 8]]}
        it "transposes our matrix" do
            expect(arr.my_transpose).to eq(transposed_arr)
        end
    end

    describe "#stock_picker" do
        it "returns pair with greatest difference" do
            arr = [500, 300, 200, 100, 0, 50]
            expect(arr.stock_picker).to eq([0,4])
        end
    end
end 

