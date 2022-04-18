# frozen_string_literal: true

# Extended default form builder.
class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::FormTagHelper

  attr_accessor :output_buffer

  def error(attribute)
    @template.tag.p(@object.errors[attribute].first, class: 'error')
  end

  def field(attribute, **options, &block)
    options[:class] = options[:class] ? Array(options[:class]) : []
    options[:class] << 'field'
    options[:class] << 'invalid' if @object.errors.include?(attribute)
    @template.tag.div(**options, &block)
  end

  def label_or_error(attribute, label = nil, message_or_messages = nil)
    if @object.errors.include?(attribute)
      if message_or_messages.respond_to?(:key?)
        detected = @object.errors.details[attribute].detect do |details|
          message_or_messages.key?(details[:error])
        end
        message = message_or_messages[detected[:error]] % detected unless detected.nil?
      elsif message_or_messages
        message = message_or_messages
      else
        message = @object.errors[attribute].first
      end
    end
    message.nil? ? label : message
  end

  def label_with_error(attribute, label = nil, message_or_messages = nil, &block)
    label(attribute, label_or_error(attribute, label, message_or_messages), &block)
  end
end
