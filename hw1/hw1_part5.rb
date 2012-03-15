class Class 
 def attr_accessor_with_history(attr_name) 
   attr_name = attr_name.to_s   # make sure it's a string 
   
   #attr_reader attr_name
   #attr_reader attr_name+"_history"
   
 
   class_eval %Q{          
        
        @#{attr_name}_history = Array.new
        @#{attr_name}_history << nil
        @#{attr_name} = nil

        def #{attr_name}_history
          return @#{attr_name}_history
        end

        def #{attr_name}_history= (new_history)
                
                @#{attr_name}_history << new_history
        end
        
        def #{attr_name}       
            return @#{attr_name}
        end

        def #{attr_name}= (new_val)
                @#{attr_name} = new_val
                @#{attr_name}_history << @#{attr_name}
        end
 
   } #"your code here, use %Q for multiline strings" 
 end 
end 

class Foo
  attr_accessor_with_history :bar
  attr_accessor_with_history :baz
end

#=begin 
f = Foo.new

#puts f.methods.inspect
#puts f.instance_variables.inspect

f.bar = 1
f.bar = 2
puts f.bar_history.inspect
f = Foo.new
f.bar = 5
f.bar = 6
puts f.bar_history.inspect
puts f.bar.inspect
#=end
