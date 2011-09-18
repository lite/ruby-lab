class Sample
  def call_i_am_public
    p "will_call_i_am_public"
    Sample::i_am_public
    [1, 2]
  end
  
  def call_i_am_private
    Sample::i_am_private
  end
  
  def error_occur
    raise "throw this error" 
  end
  
  class << self
    def i_am_public
      p "i am public"
      i_am_private
    end
    
    alias alias_i_am_public i_am_public
    
    private 
    def i_am_private
      p "I am private"
      0
    end
  end
end

class SampleA < Sample
  class << self
    def call_i_am_private
      p "call_i_am_private"
      i_am_private
      "abc@email.com"
    end
  end
end