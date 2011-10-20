class Model < ActiveRecord::Base
  validates_xml :xml
  validates :xml_helper, :xml_format => true if ActiveRecord::VERSION::MAJOR > 2
end
