require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:brownie) { Dessert.new('brownie', 50, chef)}
  let(:chef) { double("chef", name: 'Bake Master') }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('brownie','alot', chef).to raise_error('Must be a number') }
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to_not include('coco powder')
      brownie.add_ingredient('coco powder')
      expect(brownie.ingredients).to include('coco powder')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["coco powder", "eggs", "flour", "baking soda"]

      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end

      expect(brownie.ingredients).to eq(ingredients)
      brownie.mix!
      expect(brownie.ingredients).to_not eq(ingredients)
      expect(brownie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.quantity).to eq(50)
      brownie.eat(5)
      expect(brownie.quantity).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Bake Master the Great Baker')
      expect(brownie.serve).to eq('Chef Bake Master the Great Baker has made 50 brownies!')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
