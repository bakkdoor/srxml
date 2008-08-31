require "sr_xml"

xml = SRXML::XML.new

xml.projects{
  xml.project "okidoki"
}

puts xml.to_s(:formatted)