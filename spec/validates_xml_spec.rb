require 'spec_helper'

describe "validates_xml" do
  it "validation should pass the correct XML (with helper)" do
    @model = Model.new(:xml => "<xml>hello</xml>")
    @model.xml_helper = "<xml>hello</xml>"
    @model.should be_valid
  end

  it "validation should not pass the incorrect XML (with helper)" do
    @model = Model.new(:xml => "<xml>hello<.xml>")
    @model.xml_helper = "<xml>hello<.xml>"
    @model.should_not be_valid
  end

  rails3 do
    it "validation should pass correct XML" do
      @model = Model.new(:xml_helper => "<xml>hello</xml>")
      @model.should be_valid
    end

    it "validation should not pass incorrect XML" do
      @model = Model.new(:xml_helper => "<xml>hello<.xml>")
      @model.should_not be_valid
    end
  end
end
