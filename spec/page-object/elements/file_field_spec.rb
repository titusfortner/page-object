require 'spec_helper'
require 'page-object/elements'

describe PageObject::Elements::FileField do

  describe "when mapping how to find an element" do
    let(:filefield) { PageObject::Elements::FileField }

    it "should map watir types to same" do
      [:class, :id, :index, :name, :xpath, :title].each do |t|
        identifier = filefield.watir_identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end

    it "should map selenium types to same" do
      [:class, :id, :index, :name, :xpath, :title].each do |t|
        key, value = filefield.selenium_identifier_for t => 'value'
        expect(key).to eql t
      end
    end
  end

  describe "interface" do
    let(:filefield) { double('file_field') }

    it "should register as type :file" do
      expect(::PageObject::Elements.element_class_for(:input, :file)).to eql ::PageObject::Elements::FileField
    end

    context "for watir" do
      it "should set its' value" do
        watir_file_field = PageObject::Elements::FileField.new(filefield, :platform => :watir_webdriver)
        expect(filefield).to receive(:set).with('a file')
        watir_file_field.value = 'a file'
      end
    end
  end
end
