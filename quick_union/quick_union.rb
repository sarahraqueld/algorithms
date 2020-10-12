class QuickUnion
    def initialize(nodes_count)
        @nodes = []
        for i in 0..nodes_count-1
            @nodes << i
        end
    end

    def nodes
        @nodes
    end

    def union(first, second)
        first_root = root(first)
        second_root = root(second)
        @nodes[first_root] = second_root
    end

    def connected?(first, second)
        root(first) == root(second)
    end

    def root(node)
        while @nodes[node] != node
            node = @nodes[node] 
        end
        return node
    end
end