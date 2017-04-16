functor
import
   Application(exit:Exit)
   System
define
   fun{Length List}
      case List of Head|Tail then
	 1 + {Length Tail}
      else
	 0
      end

   end


   {System.showInfo {Length [1 2 3 4 4 6 7]}}

   fun{Take List Count}
      if Count > {Length List} then
	 List
      elseif {Length List} > 0 then
	 case List of Head|Tail then
	    Head|{Take Tail Count-1}
	 end
	 
      else
	 nil
      end
   end

   {System.show {Take[1 2 3 4 5] 3}}
	      

    {Exit 0}

end
   