class Towers
    attr_reader :piles 

    def initialize 
        @piles = [[3,2,1],[],[]]
    end 

    def move(indices)
        i_1, i_2 = indices

        if @piles[i_2].last.nil?  
            disk = @piles[i_1].pop
            @piles[i_2] << disk
        elsif @piles[i_2].last > @piles[i_1].last
            disk = @piles[i_1].pop
            @piles[i_2] << disk
        else 
            return false
        end 
        @piles
    end 

    def win?
        @piles[2] == [3, 2, 1]
    end 
end