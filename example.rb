require "sr_xml"

xml = SRXML::XML.new

xml.projects{
  xml.project "okidoki"
  xml.project("jajaja", :name => "wasgehtn", :id => "yo"){
    xml.name "yo!"
  }
}

puts xml.to_s()