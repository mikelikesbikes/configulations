require "spec_helper"
require "magic_hash"

describe(MagicHash) do
  describe("what makes it magical...") do
    it "gives dot syntax to Hash." do
      options = MagicHash.new({:foo => "bar", :baz => false})

      options.foo.should == "bar"
      options.baz.should == false
    end

    it "is a hash when asked." do
      options = MagicHash.new({:foo => "bar"})

      options.kind_of?(Hash).should == true
      options.is_a?(Hash).should == true
    end

    it "lets you add keys that don't exist." do
      options = MagicHash.new({:foo => "bar"})

      options.foo.should == "bar"
      options.baz = "leon"
      options.baz.should == "leon"
    end

    it "makes new Hash assignments, magic." do
      options = MagicHash.new({:foo => "bar"})

      options.foo.should == "bar"
      options.org_chart = {"employees" => [{"name"=>"Leon"},{"name"=>"Jerry"}]}
      options.org_chart.employees.first.name.should == "Leon"
    end
  end
end
