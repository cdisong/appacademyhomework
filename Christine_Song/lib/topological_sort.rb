require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms


def topological_sort(vertices)
    arr = []
    next_v = []
  
    vertices.each do |v|
      if v.in_edges.empty?
        next_v.push(v) 
      end 
    end
    while next_v.length > 0
      current = next_v.shift
      arr.push(current)
  
      while current.out_edges.length > 0
        edge = current.out_edges.pop
        if edge.to_vertex.in_edges.length == 1
            next_v.push(edge.to_vertex) 
        end 
        edge.destroy!
      end
    end
  
    arr.length == vertices.length ? arr : []
  end