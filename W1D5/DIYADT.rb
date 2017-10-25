class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end

end

class Map
  def initialize
    @map = Array.new { Array.new(2) }
  end

  def assign(key,value)
    keycopy = []
    @map.each { |arr| keycopy << @map[1] if arr[0] == key }
    @map.push([key,value]) if keycopy.nil?
  end

  def lookup(key)
    @map.each { |arr| return arr[1] if arr[0] == key}
  end

  def remove(key)
    @map.reject! { |arr| arr[0] == key }
  end

  def show
    deep_dup(@map)
  end
    private
    def deep_dup
      result = []
      arr.each do |el|
        if el.is_a?(Array)
          result << el.deep_dup
        else
          result << el
        end
      end
      result
    end

end
