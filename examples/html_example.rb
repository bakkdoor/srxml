require "srxml"

xml = SRXML::XML.new :xml_tag => false

xml.html{
  xml.head{
    xml.title "test-title"
  }
  xml.body{
    xml.div(:style => "padding:10em"){
      xml.p "okidoki"
    }
  }
}

puts xml.to_s(:formatted)