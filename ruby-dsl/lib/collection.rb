require 'forwardable'

class Collection
  attr_reader :name
  attr_reader :entity
 
  def initialize(name, entity)
    @name = name
    @entity = entity
  end
end