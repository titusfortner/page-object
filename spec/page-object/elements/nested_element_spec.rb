require 'spec_helper'
require 'page-object/elements'


describe "Element with nested elements" do
  context "in Watir" do
    before(:each) do
      @watir_browser = Watir::Element.new(nil, {})
      @watir_element = PageObject::Elements::Element.new(@watir_browser, :platform => :watir_webdriver)
      allow(@watir_browser).to receive(:exists?).and_return(true)
      allow(@watir_browser).to receive(:to_subtype).and_return(@watir_browser)
    end
    
    it "should find nested links" do
      expect(@watir_browser).to receive(:link).with(:id => 'blah').and_return(@watir_browser)
      @watir_element.link_element(:id => 'blah')
    end

    it "should find nested buttons" do
      expect(@watir_browser).to receive(:button).with(:id => 'blah').and_return(@watir_browser)
      @watir_element.button_element(:id => 'blah')
    end
    
    it "should find nested text fields" do
      expect(@watir_browser).to receive(:text_field).with(:id => 'blah').and_return(@watir_browser)
      @watir_element.text_field_element(:id => 'blah')
    end

    it "should find nested hidden fields" do
      expect(@watir_browser).to receive(:hidden).and_return(@watir_browser)
      @watir_element.hidden_field_element
    end

    it "should find nested text areas" do
      expect(@watir_browser).to receive(:textarea).and_return(@watir_browser)
      @watir_element.text_area_element
    end

    it "should find a nested select list" do
      expect(@watir_browser).to receive(:select_list).and_return(@watir_browser)
      @watir_element.select_list_element
    end

    it "should find a nested checkbox" do
      expect(@watir_browser).to receive(:checkbox).and_return(@watir_browser)
      @watir_element.checkbox_element
    end
    
    it "should find a nested radio button" do
      expect(@watir_browser).to receive(:radio).and_return(@watir_browser)
      @watir_element.radio_button_element
    end
    
    it "should find a nested div" do
      expect(@watir_browser).to receive(:div).and_return(@watir_browser)
      @watir_element.div_element
    end
    
    it "should find a nested span" do
      expect(@watir_browser).to receive(:span).and_return(@watir_browser)
      @watir_element.span_element
    end
    
    it "should find a nested table" do
      expect(@watir_browser).to receive(:table).and_return(@watir_browser)
      @watir_element.table_element
    end

    it "should find a nested cell" do
      expect(@watir_browser).to receive(:td).and_return(@watir_browser)
      @watir_element.cell_element
    end
    
    it "should find a nested image" do
      expect(@watir_browser).to receive(:image).and_return(@watir_browser)
      @watir_element.image_element
    end
    
    it "should find a nested form" do
      expect(@watir_browser).to receive(:form).and_return(@watir_browser)
      @watir_element.form_element
    end
    
    it "should find a nested ordered list" do
      expect(@watir_browser).to receive(:ol).and_return(@watir_browser)
      @watir_element.ordered_list_element
    end
    
    it "should find a nested unordered list" do
      expect(@watir_browser).to receive(:ul).and_return(@watir_browser)
      @watir_element.unordered_list_element
    end
    
    it "should find a nested list item" do
      expect(@watir_browser).to receive(:li).and_return(@watir_browser)
      @watir_element.list_item_element
    end
    
    it "should find a nested h1" do
      expect(@watir_browser).to receive(:h1).and_return(@watir_browser)
      @watir_element.h1_element
    end

    it "should find a nested h2" do
      expect(@watir_browser).to receive(:h2).and_return(@watir_browser)
      @watir_element.h2_element
    end

    it "should find a nested h3" do
      expect(@watir_browser).to receive(:h3).and_return(@watir_browser)
      @watir_element.h3_element
    end

    it "should find a nested h4" do
      expect(@watir_browser).to receive(:h4).and_return(@watir_browser)
      @watir_element.h4_element
    end

    it "should find a nested h5" do
      expect(@watir_browser).to receive(:h5).and_return(@watir_browser)
      @watir_element.h5_element
    end

    it "should find a nested h6" do
      expect(@watir_browser).to receive(:h6).and_return(@watir_browser)
      @watir_element.h6_element
    end
  end

  context "in watir" do
    before(:each) do
      @watir_browser = double('watir')
      @watir_element = PageObject::Elements::Element.new(@watir_browser, :platform => :watir_webdriver)
      allow(@watir_browser).to receive(:exists?).and_return(true)
      allow(@watir_browser).to receive(:to_subtype).and_return(@watir_browser)
    end

    it "should find nested links" do
      expect(@watir_browser).to receive(:link).with(:id => 'blah').and_return(@watir_browser)
      @watir_element.link_element(:id => 'blah')
    end

    it "should find nested buttons" do
      expect(@watir_browser).to receive(:button).with(:id => 'blah').and_return(@watir_browser)
      @watir_element.button_element(:id => 'blah')
    end

    it "should find nested text fields" do
      expect(@watir_browser).to receive(:text_field).with(:id => 'blah').and_return(@watir_browser)
      @watir_element.text_field_element(:id => 'blah')
    end

    it "should find nested hidden fields" do
      expect(@watir_browser).to receive(:hidden).and_return(@watir_browser)
      @watir_element.hidden_field_element
    end

    it "should find nested text areas" do
      expect(@watir_browser).to receive(:textarea).and_return(@watir_browser)
      @watir_element.text_area_element
    end

    it "should find a nested select list" do
      expect(@watir_browser).to receive(:select_list).and_return(@watir_browser)
      @watir_element.select_list_element
    end

    it "should find a nested checkbox" do
      expect(@watir_browser).to receive(:checkbox).and_return(@watir_browser)
      @watir_element.checkbox_element
    end

    it "should find a nested radio button" do
      expect(@watir_browser).to receive(:radio).and_return(@watir_browser)
      @watir_element.radio_button_element
    end

    it "should find a nested div" do
      expect(@watir_browser).to receive(:div).and_return(@watir_browser)
      @watir_element.div_element
    end

    it "should find a nested span" do
      expect(@watir_browser).to receive(:span).and_return(@watir_browser)
      @watir_element.span_element
    end

    it "should find a nested table" do
      expect(@watir_browser).to receive(:table).and_return(@watir_browser)
      @watir_element.table_element
    end

    it "should find a nested cell" do
      expect(@watir_browser).to receive(:td).and_return(@watir_browser)
      @watir_element.cell_element
    end

    it "should find a nested image" do
      expect(@watir_browser).to receive(:image).and_return(@watir_browser)
      @watir_element.image_element
    end

    it "should find a nested form" do
      expect(@watir_browser).to receive(:form).and_return(@watir_browser)
      @watir_element.form_element
    end

    it "should find an ordered list" do
      expect(@watir_browser).to receive(:ol).and_return(@watir_browser)
      @watir_element.ordered_list_element
    end

    it "should find an unordered list" do
      expect(@watir_browser).to receive(:ul).and_return(@watir_browser)
      @watir_element.unordered_list_element
    end

    it "should find a nested list item" do
      expect(@watir_browser).to receive(:li).and_return(@watir_browser)
      @watir_element.list_item_element
    end

    it "should find a nested h1" do
      expect(@watir_browser).to receive(:h1).and_return(@watir_browser)
      @watir_element.h1_element
    end

    it "should find a nested h2" do
      expect(@watir_browser).to receive(:h2).and_return(@watir_browser)
      @watir_element.h2_element
    end

    it "should find a nested h3" do
      expect(@watir_browser).to receive(:h3).and_return(@watir_browser)
      @watir_element.h3_element
    end

    it "should find a nested h4" do
      expect(@watir_browser).to receive(:h4).and_return(@watir_browser)
      @watir_element.h4_element
    end

    it "should find a nested h5" do
      expect(@watir_browser).to receive(:h5).and_return(@watir_browser)
      @watir_element.h5_element
    end

    it "should find a nested h6" do
      expect(@watir_browser).to receive(:h6).and_return(@watir_browser)
      @watir_element.h6_element
    end

    it "should find a nested paragraph" do
      expect(@watir_browser).to receive(:p).and_return(@watir_browser)
      @watir_element.paragraph_element
    end
  end
end
