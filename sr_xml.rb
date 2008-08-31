module SRXML

  class BlankSlate
    instance_methods.each { |m| undef_method m unless m =~ /^(__|instance_eval)/ }
  end


  class XML < BlankSlate
    attr_accessor :name, :value, :children, :attributes
    def initialize(name, value = "", attributes = {})
      @name = name
      @value = value
      @children = []
      @attributes = attributes
    end
      
    def method_missing(method_name, *args)
      @output ||= ""
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
        @output << "[<<sep>>]"
        yield
        @output << "[<<sep>>]"
      end
    
      @output << "</#{method_name}>"
    end
    
    def method_missing(method_name, *args)
      
      node = XML.new(method_name)

      args.each do |a|
      
        if a.class != Hash
          node.value = a 
        else
          node.attributes = a
        end
      end
    
      if block_given?
        yield node
      end
    
      @children << node
    end
    
    def to_s(option = false)
      if option == :formatted
        # format here with newline etc.
        
      else
        
      end
    end
    
    private
    
    def output
      
    end
  
  end
  
end