require 'sample'

# http://rspec.rubyforge.org/rspec/1.2.9/classes/Spec/Matchers.html#M000176

describe 'Sample' do
  before do
    @object = Sample.new()
  end
  
  it "should be a instance method" do
    @object.call_i_am_public.should include(1)
  end

  it "should be a class method" do
    Sample::i_am_public.should_not == 1
  end
  
  it "should be a alias public method" do
    Sample::alias_i_am_public.should == 0
  end
  
  it "should be private method" do
    lambda { @object.call_i_am_pirvate }.should raise_error NoMethodError
  end
  
  it "should call private method from sub class" do
    SampleA::call_i_am_private.should match('\w+@\w+.com')
  end
  
  it "should be raise error" do
    lambda { @object.error_occur }.should raise_error(RuntimeError,"throw this error")
  end
  
end 
