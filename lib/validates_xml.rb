module ValidatesXML
  def self.validates_xml(xml, options={})
    begin
        REXML::Document.new("<base>#{xml}</base>")
      rescue REXML::ParseException => ex
        return "is not valid xml"
    end

    return nil
  end

  module Validations
    def validates_xml(*attr_names)
      configuration = { :message => I18n.translate('activerecord.errors.messages')[:invalid],
                        :on => :save,
                        :with => nil }
      configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
      validates_each(attr_names, configuration) do |record, attr_name, value|
        begin
          REXML::Document.new("<base>#{value}</base>")
        rescue REXML::ParseException => ex
          record.errors.add(attr_name,
                            "is not valid xml")
        end
      end
    end
  end
end

if defined?(ActiveModel)
  class XmlFormatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      err = ValidatesXML::validates_xml(value, options)
      record.errors[attribute] << err unless err.nil?
      record.errors[attribute].flatten!
    end
  end

  module ActiveModel::Validations::HelperMethods
    def validates_xml(*attr_names)
      validates_with XmlFormatValidator, _merge_attributes(attr_names)
    end
  end
else
  class ActiveRecord::Base
    extend ValidatesXML::Validations
  end
end
