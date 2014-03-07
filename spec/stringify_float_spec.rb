describe StringifyFloat do

  class ModuleTest
    attr_accessor :cost1
    attr_accessor :cost2

    include StringifyFloat

    stringify_float :cost1
    stringify_float :cost2, precision: 4
  end

  before do
    @module = ModuleTest.new
  end

  describe 'Precision 2' do
    it 'responds to getCost1' do
      @module.should.respond_to :stringifiedCost1
    end

    it 'responds to getCost1=' do
      @module.should.respond_to :stringifiedCost1=
    end

    it 'converts from int to string properly' do
      @module.cost1 = 123456
      @module.stringifiedCost1.should == "1234.56"
    end

    it 'converts from string to int properly' do
      @module.stringifiedCost1 = "1234.56"
      @module.cost1.should == 123456
    end
  end

  describe 'Precision 4' do
    it 'responds to getCost2' do
      @module.should.respond_to :stringifiedCost2
    end

    it 'responds to getCost2=' do
      @module.should.respond_to :stringifiedCost2=
    end

    it 'converts from int to string properly' do
      @module.cost2 = 123456
      @module.stringifiedCost2.should == "12.3456"
    end

    it 'converts from string to int properly' do
      @module.stringifiedCost2 = "12.3456"
      @module.cost2.should == 123456
    end

    it 'pads strings' do
      @module.stringifiedCost2 = "12.3"
      @module.cost2.should == 123000
    end

    it 'pads strings which have no period' do
      @module.stringifiedCost2 = "12"
      @module.cost2.should == 120000
    end

    @results = [
      [ "12.0001", 120001 ],
      [ "12.0010", 120010 ],
      [ "12.0100", 120100 ],
      [ "12.1000", 121000 ],
    ]

    it 'table: string -> int' do
      @results.each do |s, i|
        @module.stringifiedCost2 = s
        @module.cost2.should == i
      end
    end
  end
end
