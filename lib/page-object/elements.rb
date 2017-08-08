module PageObject
  module Elements
    class << self

      #
      # method to return the collection of tag_name to class mappings
      #
      def tag_to_class
        @tag_to_class ||= {}
      end

      def type_to_class
        @type_to_class ||= {}
      end

      #
      # method to return the element for a tag_name
      #
      def element_class_for(tag_name, type=nil)
        return type_to_class[type.to_sym] if type
        tag_to_class[tag_name.to_sym] || ::PageObject::Elements::Element
      end

    end
  end
end

require 'page-object/elements/element'
require 'page-object/elements/media'
require 'page-object/elements/select_list'
require 'page-object/elements/table'
require 'page-object/elements/table_row'
require 'page-object/elements/unordered_list'
require 'page-object/elements/ordered_list'
require 'page-object/elements/elements'
