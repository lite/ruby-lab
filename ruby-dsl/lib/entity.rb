require 'forwardable'

class Entity
  extend Forwardable
 
  attr_reader :name
 
  def initialize(name)
    @name = name
    @collections = []
    @properties = []
    @references = []
  end
   
  def add_collection(collection)
    @collections << collection
  end
   
  def add_property(property)
    @properties << property
  end
   
  def add_reference(reference)
    @references << reference
  end
   
  def identifier
    @properties.detect { |property| property.is_identifier? }
  end
 
  def_delegator :@collections, :each, :each_collection
  def_delegator :@properties, :each, :each_property
  def_delegator :@references, :each, :each_reference 
end
