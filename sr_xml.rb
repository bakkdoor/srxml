module SRXML

  class BlankSlate
    instance_methods.each { |m| undef_method m unless m =~ /^(__|instance_eval)/ }
  end


  class XML < BlankSlate
      
    def method_missing(method_name, *args)
      @output ||= "<?xml version=\"1.0\" encoding=\"UTF-8\"?>[sep]"
      @output << "<#{method_name}"
    
      attributes = []
      value = ""
    
      args.each do |a|
      
        if a.class != Hash
          value = a 
        else
          a.keys.each do |key|
            attributes << " #{key}=\"#{a[key]}\""
          end
        end
      end
    
      attributes.each do |a|
        @output << a
      end
    
      @output << ">#{value}"
    
      if block_given?
        @output << "[sep]"
        yield
      end
    
      @output << "</#{method_name}>"
      @output << "[sep]"
    end
    
    def to_s(option = :non_formatted)
      if option == :formatted
        # format here with newline etc.
        indentation = 0
        @output.gsub("[sep]", "\n")
      else
        @output.gsub("[sep]", "")
      end
    end
  
  end
  
end