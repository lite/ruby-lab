require 'forwardable'

class Property
  attr_reader :name
  attr_reader :required
  attr_reader :type
   
  def self.new_identifier(name, type)
    self.new(name, type, false, true)
  end
   
  def initialize(name, type, required=false, is_identifier=false)
    @name = name
    @type = type
    @required = required
    @is_identifier = is_identifier
  end
   
  def is_identifier?
    @is_identifier
  end
end
