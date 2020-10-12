class UnionFind
    def initialize(nodes_count)
        @nodes = []
        for i in 0..nodes_count-1
            @nodes << i
        end
    end

    def union(first, second)
        first_value = @nodes[first]
        second_value = @nodes[second]
        @nodes.each_with_index do |node, index|
            if node == first_value
                @nodes[index] = second_value
            end 
        end
    end

    def is_connected?(first, second)
        @nodes[first] == @nodes[second]
    end

    def nodes
        @nodes
    end
end
