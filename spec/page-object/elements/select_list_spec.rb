require 'spec_helper'
require 'page-object/elements'

describe PageObject::Elements::SelectList do
  let(:selectlist) { PageObject::Elements::SelectList }

  describe "when mapping how to find an element" do
    it "should map watir types to same" do
      [:class, :id, :index, :name, :text, :value, :xpath].each do |t|
        identifier = selectlist.watir_identifier_for t => 'value'
        expect(identifier.keys.first).to eql t
      end
    end

    it "should map selenium types to same" do
      [:class, :id, :name, :xpath, :index].each do |t|
        key, value = selectlist.selenium_identifier_for t => 'value'
        expect(key).to eql t
      end
    end
  end

  describe "interface" do
    let(:sel_list) { double('select_list') }
    let(:opts) { [sel_list, sel_list] }

    before(:each) do
      allow(sel_list).to receive(:find_elements).and_return(sel_list)
      allow(sel_list).to receive(:each)
      allow(sel_list).to receive(:wd).and_return(sel_list)
      allow(sel_list).to receive(:map).and_return(opts)
      allow(sel_list).to receive(:any?)
      allow(sel_list).to receive(:include?)
      allow(sel_list).to receive(:select).and_return(opts)
      allow(sel_list).to receive(:text).and_return('blah')
    end

    it "should register with tag_name :select" do
      expect(::PageObject::Elements.element_class_for(:select)).to eql ::PageObject::Elements::SelectList
    end

    context "for watir" do
      let(:watir_sel_list) { PageObject::Elements::SelectList.new(sel_list, :platform => :watir_webdriver) }

      it "should return an option when indexed" do
        expect(sel_list).to receive(:options).with(no_args).and_return(opts)
        expect(watir_sel_list[0]).to be_instance_of PageObject::Elements::Option
      end

      it "should return an array of options" do
        expect(sel_list).to receive(:options).with(no_args).and_return(opts)
        expect(watir_sel_list.options.size).to eql 2
      end

      it "should return an array of selected options" do
        allow(sel_list).to receive(:selected_options).and_return(opts)
        allow(sel_list).to receive(:text).and_return(sel_list)
        expect(watir_sel_list.selected_options).to eql opts
      end

      it "should know if it includes some value" do
        allow(sel_list).to receive(:include?).with('blah').and_return(true)
        watir_sel_list.include?('blah')
      end

      it "should know if an option is selected" do
        allow(sel_list).to receive(:selected?).with('blah').and_return(true)
        watir_sel_list.selected?('blah')
      end

      it "should be able to get the value for the selected options" do
        allow(sel_list).to receive(:selected_options).and_return(opts)
        allow(sel_list).to receive(:value).and_return(sel_list)
        expect(watir_sel_list.selected_values).to eql opts
      end
    end

    context "for watir"  do
      let(:watir_sel_list) { PageObject::Elements::SelectList.new(sel_list, :platform => :watir_webdriver) }

      it "should return an option when indexed" do
        allow(sel_list).to receive(:options).and_return(opts)
        expect(watir_sel_list[1]).to be_instance_of PageObject::Elements::Option
      end

      it "should return an array of options" do
        allow(sel_list).to receive(:options).and_return(opts)
        expect(watir_sel_list.options.size).to eql 2
      end

      it "should select an element" do
        expect(sel_list).to receive(:select).and_return('something')
        watir_sel_list.select 'something'
      end

      it "should return an array of selected options" do
        expect(opts[0]).to receive(:selected?).and_return(true)
        expect(opts[0]).to receive(:text).and_return('test1')
        expect(opts[1]).to receive(:selected?).and_return(false)
        expect(sel_list).to receive(:selected_options).and_return(opts.select!(&:selected?))
        expect(opts).to receive(:map).and_return(opts.map(&:text))
        selected = watir_sel_list.selected_options
        expect(selected.size).to eql 1
        expect(selected[0]).to eql 'test1'
      end

      it "should know if it includes some value" do
        expect(sel_list).to receive(:options).and_return(opts)
        expect(opts[0]).to receive(:text).and_return('blah')
        expect(watir_sel_list.options.map(&:text)).to include 'blah'
      end
    end
  end
end
