module SRXML

  class BlankSlate
    instance_methods.each { |m| undef_method m unless m =~ /^(__|instance_eval|inspect)/ }
  end


  class XML < BlankSlate
    
    attr_reader :xml_tag, :sep
    
    def initialize(options = {})
      @xml_tag = options[:xml_tag].nil? ? true : options[:xml_tag]
      @sep = options[:sep] || "<>"
      
      if @xml_tag
        @output = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>#{@sep}"
      else
        @output = ""
      end
    end
    
      
    def method_missing(method_name, *args)
      @output << "<#{method_name}"
    
      attributes = []
      value = ""
    
      args.each do |a|
        if a.class != Hash
          value = a 
        else
          a.keys.sort_by{|k| k.to_s}.each do |key|
            attributes << " #{key}=\"#{a[key]}\""
          end
        end
      end
    
      attributes.each do |a|
        @output << a
      end
    
      @output << ">#{value}"
    
      if block_given?
        @output << @sep
        yield
      end
    
      @output << "</#{method_name}>"
      @output << @sep
      
      return self
    end
    
    def to_s(option = :non_formatted)
      if option == :formatted
        # format here with newline etc.
        @output.gsub(@sep, "\n")
      elsif option == :keep_sep
        @output
      else
        @output.gsub(@sep, "")
      end
    end
  
  end
  
end