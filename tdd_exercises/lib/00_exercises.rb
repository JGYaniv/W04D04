require 'byebug'
class Array
    def my_uniq 
        uniqs = []
        self.each do |ele|
            uniqs << ele unless uniqs.include?(ele)
        end 
        uniqs
    end 

    def two_sum 
        indices = []
        (0...self.length).each do |idx1|
            (idx1+1...self.length).each do |idx2|
                indices << [idx1, idx2] if self[idx1] + self[idx2] == 0
            end
        end
        indices
    end 

    def my_transpose
        self.transpose
    end

    def stock_picker # [1,2,3,4,0,5]
        max_indices = [0,1]
        (0...self.length).each do |idx1|
            (idx1+1...self.length).each do |idx2|
                max =  self[max_indices.first] - self[max_indices.last]
                if self[idx1] - self[idx2] > max
                    max_indices[0], max_indices[1] = idx1, idx2
                end
            end
        end
        max_indices
    end


end 