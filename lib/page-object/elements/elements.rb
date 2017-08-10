require 'page-object/nested_elements'
require 'watir/extensions/select_text'

module PageObject
  module Elements

    %w(Area Bold Button Canvas CheckBox Div FileField Form Heading HiddenField Image Italic
Label Link ListItem Option Paragraph RadioButton Span TableCell TextArea TextField).each do |klass|
      PageObject::Elements.const_set(klass, Class.new(Element))
    end

    Audio = Class.new(Media)
    Video = Class.new(Media)


    ::PageObject::Elements.type_to_class[:area] = ::PageObject::Elements::Area
    ::PageObject::Elements.type_to_class[:audio] = ::PageObject::Elements::Audio
    ::PageObject::Elements.tag_to_class[:b] = ::PageObject::Elements::Bold
    ::PageObject::Elements.type_to_class[:submit] = ::PageObject::Elements::Button
    ::PageObject::Elements.type_to_class[:image] = ::PageObject::Elements::Button
    ::PageObject::Elements.type_to_class[:button] = ::PageObject::Elements::Button
    ::PageObject::Elements.type_to_class[:reset] = ::PageObject::Elements::Button
    ::PageObject::Elements.type_to_class[:canvas] = ::PageObject::Elements::Canvas
    ::PageObject::Elements.type_to_class[:checkbox] = ::PageObject::Elements::CheckBox
    ::PageObject::Elements.tag_to_class[:div] = ::PageObject::Elements::Div
    ::PageObject::Elements.type_to_class[:file] = ::PageObject::Elements::FileField
    ::PageObject::Elements.tag_to_class[:form] = ::PageObject::Elements::Form
    ::PageObject::Elements.tag_to_class[:h1] = ::PageObject::Elements::Heading
    ::PageObject::Elements.tag_to_class[:h2] = ::PageObject::Elements::Heading
    ::PageObject::Elements.tag_to_class[:h3] = ::PageObject::Elements::Heading
    ::PageObject::Elements.tag_to_class[:h4] = ::PageObject::Elements::Heading
    ::PageObject::Elements.tag_to_class[:h5] = ::PageObject::Elements::Heading
    ::PageObject::Elements.tag_to_class[:h6] = ::PageObject::Elements::Heading
    ::PageObject::Elements.type_to_class[:hidden] = ::PageObject::Elements::HiddenField
    ::PageObject::Elements.tag_to_class[:img] = ::PageObject::Elements::Image
    ::PageObject::Elements.tag_to_class[:i] = ::PageObject::Elements::Italic
    ::PageObject::Elements.tag_to_class[:label] = ::PageObject::Elements::Label
    ::PageObject::Elements.tag_to_class[:a] = ::PageObject::Elements::Link
    ::PageObject::Elements.tag_to_class[:li] = ::PageObject::Elements::ListItem
    ::PageObject::Elements.tag_to_class[:option] = ::PageObject::Elements::Option
    ::PageObject::Elements.tag_to_class[:p] = ::PageObject::Elements::Paragraph
    ::PageObject::Elements.type_to_class[:radio] = ::PageObject::Elements::RadioButton
    ::PageObject::Elements.tag_to_class[:span] = ::PageObject::Elements::Span
    ::PageObject::Elements.tag_to_class[:td] = ::PageObject::Elements::TableCell
    ::PageObject::Elements.tag_to_class[:th] = ::PageObject::Elements::TableCell
    ::PageObject::Elements.tag_to_class[:textarea] = ::PageObject::Elements::TextArea
    ::PageObject::Elements.type_to_class[:text] = ::PageObject::Elements::TextField
    ::PageObject::Elements.type_to_class[:password] = ::PageObject::Elements::TextField
    ::PageObject::Elements.type_to_class[:video] = ::PageObject::Elements::Video

  end
end
