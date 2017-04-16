functor
import
   Application(exit:Exit)
   System
define
   fun {Length List}
      case List of Head|Tail then
	 1 + {Length Tail}
      else
	 0
      end
   end
   

  

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

   

   fun {Append List1 List2}
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

   

   fun {Member List Element}

      case List of Head|Tail then
	 if Head == Element then
	    true
	 else
	    {Member Tail Element}
	 end
      else
	 false
      end
   end

   fun {Position List Element}
      case List of Head|Tail then
	 if Head == Element then
	    1
	 else
	    1 + {Position List Element}
	 end
      end
   end	 

   {System.showInfo {Length [1 2 4 6 7]}}
   {System.show {Take [1 2 3] 2}}
   {System.show{Drop [1 2 3] 1}}
   {System.show{Append [1 2 3] [1 2]}}
   {System.show{Member [1 2 3] 4}}
   {System.show{Position [1 2 5 4 7] 5}}   
   {Exit 0}
end