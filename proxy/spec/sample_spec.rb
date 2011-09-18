require 'sample'

describe 'Proxy' do
  
  before do
    @proxy = Proxy.new
  end
  
  it "call create_apple" do
    @proxy.create_apple.should == "apple"
  end

  it "call create_tiger" do
    @proxy.create_tiger.should == "tiger"
  end

  it "call create_leopard" do
    @proxy.create_leopard.should == "leopard"
  end
  
end 
