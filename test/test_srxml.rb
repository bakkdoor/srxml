require "test/unit"
require "srxml"

class TestSRXML < Test::Unit::TestCase
  
  include TestHelper
  
  def setup
    @projects = []
    @projects << {:name => "Project 1", :id => 1, :description => "This is a first test project!"}
    @projects << {:name => "Project 2", :id => 2, :description => "This is a second test project!"}
    @projects << {:name => "Project 3", :id => 3, :description => "This is a third test project!"}
    
    @friends = []
    @friends << {:name => "Thomas", :age => 20}
    @friends << {:name => "Jessie", :age => 21}
    @friends << {:name => "Joe", :age => 22}
    @friends << {:name => "Sandra", :age => 19}
    @friends << {:name => "Chris", :age => 25}
  end
  
  def test_xml_output_with_attributes
    xml = SRXML::XML.new
    
    xml.projects{
      @projects.each do |project|
        xml.project "some value in the project-node", :id => project[:id], :name => project[:name], :description => project[:description]
      end
    }
    
    assert_equal(fixture(:projects), xml.to_s(:non_formatted))
    assert_equal(fixture(:projects_formatted), xml.to_s(:formatted))
  end
  
  def test_xml_output_with_inner_tags
    xml = SRXML::XML.new
    
    xml.friends{
      @friends.each do |friend|
        xml.friend{
          xml.name friend[:name]
          xml.age friend[:age]
        }
      end
    }
    
    assert_equal(fixture(:friends), xml.to_s)
    assert_equal(fixture(:friends_formatted), xml.to_s(:formatted))
  end
  
  def test_inner_string_output_and_no_xml_tag
    xml = SRXML::XML.new :xml => false
    
    xml.html{
      xml.head{
        xml.title "Title"
      }
      xml.body{
        xml.div{
          "OkiDoki"
        }
      }
    }
    
    assert_equal(fixture("inner_string.html"), xml.to_s)
  end
  
  def test_html_singles
    html = SRXML::XML.new :xml => false, :html => true
    assert_equal(SRXML::XML.html_singles, html.singles)
  end
  
  
  def test_html_output
    html = SRXML::XML.new :xml => false, :html => true
    
    html.html{
      html.head{
        html.title "hello, world!"
        html.link :rel => "bla", :href => "http://localhost/whatever", :title => "something here!"
      }
      html.body{
        html.div(:style => "padding: 10em; font-size: 150%"){
          html.p "hey, whats up"
          html.br
          html.p{
            "nothing much, i guess!"
          }
        }
      }
    }
    
    assert_equal(fixture("test_html_output.html", :xml => false), html.to_s)
  end
  
end