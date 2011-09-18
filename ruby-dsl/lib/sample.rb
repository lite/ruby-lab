require_relative 'application.rb'
require_relative 'entity.rb'
require_relative 'collection.rb'
require_relative 'property.rb'
require_relative 'reference.rb'
 
@model = Model.new
 
def entity(name)
  entity = Entity.new(name)
  @model.add_entity entity
  @current_entity = entity
end
 
def identified_by(name, type)
  @current_entity.add_property Property.new_identifier(name, type)
end
 
def must_have(name, type)
  has name, type, true
end
 
def can_have(name, type)
  has name, type, false
end
 
def must_reference(entity_name, name=nil)
  references entity_name, true, name
end
 
def can_reference(entity_name, name=nil)
  references entity_name, false, name
end
 
def contains(name, entity_name)
  referred_entity = @model.entity_for entity_name
  @current_entity.add_collection Collection.new(name, referred_entity)
end
 
def has(name, type, required=false)
  @current_entity.add_property Property.new(name, type, required)
end
 
def references(entity_name, is_required=false, name=nil)
  referred_entity = @model.entity_for entity_name
  name = entity_name if name.nil?
  @current_entity.add_reference Reference.new(name, entity_name, is_required)
end

Dir.glob('*_dsl.rb').each do |file|
  @current_entity = nil
  load file
end
 
@model.each_entity do |entity|
  puts entity.name
  print_name = Proc.new { |item| puts "\t\t#{item.name}"}
  puts "\t has the following properties:"
  entity.each_property &print_name
  puts "\t has the following references:"
  entity.each_reference &print_name
  puts "\t has the following collections:"
  entity.each_collection &print_name
end
