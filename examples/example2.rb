require "srxml"

@projects = []

@projects << {:name => "Project 1", :id => 1, :description => "This is a first test project!"}
@projects << {:name => "Project 2", :id => 2, :description => "This is a second test project!"}
@projects << {:name => "Project 3", :id => 3, :description => "This is a third test project!"}

xml = SRXML::XML.new

puts xml.projects{
  @projects.each do |project|
    xml.project "some value in the project-node", :id => project[:id], :name => project[:name], :description => project[:description]
  end
}.to_s