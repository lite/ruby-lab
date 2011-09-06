require 'sample'

describe 'Sample Class' do
  before do
    p "before..."
    @object = Sample.new()
  end

  after do
    p "...after"
  end

  it "should return one" do
    p "testing... return one"
    @object.return_one().should == 1
  end
end 
