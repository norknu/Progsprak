functor
import
	Application(exit:Exit)
	System
define

fun {Take List Count}
    if Count == 0 then
	 nil
    else
	 case List of Head|Tail then
	    Head|{Take Tail Count-1}
		else
	    	nil
	 end
    end	 
end	      
   
   {System.show {Take [1 2 3] 2}}

   fun {Drop List Count}
      if Count > {Length List} then
	 nil
      else
	 if Count > 0 then
       
	    case List of Head|Tail then
	       {Drop Tail Count-1}
	    else
	       nil
	    end
	 else
	    List
	 end
      end    
   end

   {System.show{Drop [1 2 3] 1}



fun {Take List Count}
      if Count == 0 then
	 nil
      else
	 case List of Head|Tail then
	    Head|{Take Tail Count-1}
	 else
	    nil
	 end
      end	 
   end	      
   {System.show {Take [1 2 3] 2}}

fun {Drop List Count}
      if Count > {Length List} then
	 	nil
     elseif Count > 0 then
	    case List of Head|Tail then
	       {Drop Tail Count-1}
	    else
	       nil
	    end
	 else
	    List
	 end
   end    
 

   {System.show{Drop [1 2 3] 1}}

	fun{Append List1 List2}
   		if {Length List1} > 0 then
   			case List1 of Head|Tail then
   				Head|{Append Tail List2}
   			end
   		elseif {Length List2} > 0 then
   			case List2 of Head|Tail then
   				List2
   			end
   		else
   			nil
   		end
   	end

   	{System.show{Append [1 2 3 4] [1 2]}}

 	(Exit 0)
end 
