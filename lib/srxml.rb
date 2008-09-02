module SRXML
  
=begin rdoc
  BlankSlate class. Has nearly no methods, except for anything among the regex
  (__*, instance_eval, inspect).
  Is used by the XML class, since we want to use method_missing to create the xml-output.
  Having fewer methods predefined is good, since we want as few nameclashes as possible.
=end
  class BlankSlate
    instance_methods.each { |m| undef_method m unless m =~ /^(__|instance_eval|inspect)/ }
  end

  
=begin rdoc
  Main class. Use it to create the xml-output.
    For example:
      xml = SRXML::XML.new :xml => false
      xml.people{
        xml.person{
          xml.name "Todd"
        }
        xml.person{
          xml.name "Mary"
        }
      }
      
      puts xml.to_s :formatted
      
    Will give you:
      <people>
      <person>
      <name>Todd</name>
      </person>
      <person>
      <name>Mary</name>
      </person
      </people>
=end
  class XML < BlankSlate
    
    attr_accessor :singles  # defines tags, which don't have a closing-tag (e.g. <br/>)
    attr_reader   :xml_tag  # indicates, if xml-tag is used (should be false for html-mode, for example) 
    attr_reader   :sep      # holds a seperator-string, indicating, where a newline (for formatted-output) should be placed
                            # if not specified, its default value is '<>'
    
=begin rdoc
  Constructor. Takes a options-hash.
  Valid options are:
    :xml => true/false  # indicates if xml-tag should be used at top of xml-output
    :sep => "<>"        # custom specified seperator-string; '<>' if not set
    :singles => []      # custom specified list of single-tags (no closing tag), e.g. '<br/>' in html
=end
    def initialize(options = {})
      @xml_tag = options[:xml].nil? ? true : options[:xml]
      @sep = options[:sep] || "<>"
      
      @singles = options[:singles] || [] # if not specified, there are no single-tags
      
      if @xml_tag
        @output = ["<?xml version=\"1.0\" encoding=\"UTF-8\"?>#{@sep}"]
      else
        @output = []
      end
    end
    
    
=begin rdoc
  This method is used to create the xml-ouput based on the called methods on the XML-object.
=end
    def method_missing(method_name, *args)
      @output << "<#{method_name}"
    
      attributes = []
      value = ""
    
      args.each do |a|
        if a.class != Hash
          value = a 
        else
          # shove all key-value-pairs in as attributes to the xml-tag
          a.keys.sort_by{|k| k.to_s}.each do |key|
            attributes << " #{key}=\"#{a[key]}\""
          end
        end
      end
    
      attributes.each do |a|
        @output << a
      end
      @output << ">"
      @output << "#{value}" unless @singles.include?(method_name)
    
      if block_given?
        @output << @sep
        @output << yield
      end
      
      unless @singles.include?(method_name)
        @output << "</#{method_name}>"
        @output << @sep
      end
    end
    
    
=begin rdoc
  Returns the xml-output string created by using the xml-object.
  Default-output is non_formatted. Optional output-styles are:
    :formatted    # will put newlines in the correct places
    :keep_sep     # will leave seperator-string in place (probably non-valid xml then - mainly for debug purposes)
=end
    def to_s(option = :non_formatted)
      @output = @output.select{|x| x.class == String}
      if option == :formatted
        # format here with newline etc.
        @output.join("").gsub(@sep, "\n")
      elsif option == :keep_sep
        @output.join("")
      else
        @output.join("").gsub(@sep, "")
      end
    end
  
  end
  
end