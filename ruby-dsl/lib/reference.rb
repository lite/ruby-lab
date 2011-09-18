require 'forwardable'

class Reference
  attr_reader :name
  attr_reader :entity
  attr_reader :is_required
   
  def initialize(name, entity, is_required)
    @name = name
    @entity = entity
    @is_required = is_required
  end
end
