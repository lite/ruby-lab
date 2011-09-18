require 'forwardable'
 
class Model
  extend Forwardable
   
  def initialize
    @entities = []
  end
 
  def add_entity(entity)
    @entities << entity
  end
   
  def entity_for(name)
    @entities.detect { |entity| entity.name == name }
  end
 
  def_delegator :@entities, :each, :each_entity 
end
