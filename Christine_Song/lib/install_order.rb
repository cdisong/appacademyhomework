# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to
require_relative "topological_sort"
require_relative "graph"



def install_order(arr)
    hash = {}
    maximum = arr.flatten.max 
    (1..maximum).each do |i|
        hash[i] = Vertex.new(i) 
    end 
    arr.each do |node| 
        Edge.new(hash[node[1]], hash[node[0]])
    end 
    topological_sort(hash.values).map(&:value)
end

