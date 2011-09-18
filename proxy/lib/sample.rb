require 'forwardable'

class Proxy
  extend Forwardable
  
  def_delegators :@fruit, :create_apple
  def_delegators :@animal, :create_tiger, :create_leopard

  def initialize
    @fruit = FruitFactory.new
    @animal = AnimalFactory.new
  end
end

class FruitFactory
  
  def create_apple
    "apple"
  end
  
end

class AnimalFactory

  def create_tiger
    "tiger"
  end

  def create_leopard
    "leopard"
  end
  
end