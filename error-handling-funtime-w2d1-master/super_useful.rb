# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError
    puts "Invalid input, please try again"
  ensure
    num ||= nil
  end
  num
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    puts "No thanks, try again."
  end
end

class FruitError < StandardError
  def message
    puts "You suck."
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else
    raise FruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue FruitError => e #rescues specific errors thrown in reaction
    e.message #e message defined when we made fruit error and coffee errors subclasses of StandardError
  rescue CoffeeError => e
    e.message
    retry
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("please input name") if name.empty?
    raise ArgumentError.new("please input positive value of yrs_known") if yrs_known.to_i < 1
    raise ArgumentError.new("we can't be best friends if we've only been friends for #{yrs_known}!") if yrs_known.to_i < 5
    raise ArgumentError.new("must input fav_pastime") if fav_pastime.empty?
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
