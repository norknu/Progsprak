functor
import
   Application(exit:Exit)
   System
define
   
   fun{Lex Input}
      case Input of Head|Tail then
	 {String.tokens Input & }
      end
      
   end

   /*fun {Member List Element}
     case List of Head|Tail then
	 if Head == Element then
	    true
	 else
	    {Member Tail Element}
	 end
      else
	 false
      end
   end*/

   fun{Tokenize Lexemes}
      case Lexemes of Head|Tail then
	 if Head == "+" then
	    operator(type:plus)|{Tokenize Tail}
	 elseif Head == "-" then
	    operator(type:minus)|{Tokenize Tail}
	 elseif Head == "/" then
	    operator(type:divide)|{Tokenize Tail}
	 elseif Head == "*" then
	    operator(type:multiply)|{Tokenize Tail}
	 else
	    number(Head)|{Tokenize Tail}
	 end
      else
	 nil
      end
   end

   fun{Interpret Tokens}
      {InternalInterpret Tokens nil} 	 
   end

   fun{InternalInterpret Tokens List}
      case Tokens of Head|TTail then
	 case Head of operator(type:plus) then
	    case List of number(N1)|number(N2)|LTail then
	       {InternalInterpret TTail number(N1+N2)|LTail}
	    else
	       nil
	    end

	 []operator(type:minus) then
	    case List of numbet(N1)|number(N2)|LTail then
	       {InternalInterpret TTail number(N1-N2)|LTail}
	    else
	       nil
	    end

	 []operator(type:divide) then
	    case List of number(N1)|number(N2)|LTail then
	       {InternalInterpret TTail number(N1/N2)|LTail}
	    else
	       nil
	    end

	 []operator(type:multiply) then
	    case List of number(N1)|number(N2)|LTail then
	       {InternalInterpret TTail number(N1*N2)|LTail}
	    else
	       nil
	    end
	 []number(N) then
	    {InternalInterpret TTail number(N)|LTail}

	 [] command(print) then
             case List of Head|LTail then
               local A in
               A = {Reverse Head|LTail}
               {Show A}
            end
            {InternalInterpret TTail List}
         end
        [] command(duplicate) then
            case List of Head|Tail then
               Head|Head|Tail
            end
        [] command(negation) then
            case List of Head|LTail then
              case Head of number(N) then
               number({Number.'~' N})|LTail
              end
            end
        [] command(inverse) then
            case List of Head|LTail then
              case Head of number(N) then
               number({Float.'/' 1.0 {Int.toFloat N}})|LTail
              end
            end

	 else
	    nil
	 end
      else
	 {Reverse Tokens}
      end
	    
   end

   fun {Reverse List}
      case List of Head|Tail then
	 {Append {Reverse Tail} Head|nil} %kopier inn append fun fra opg1
      else
	 nil
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

   {System.show{Lex "1 2 + 3 *"}}
   {System.show{Tokenize ["1" "2" "+" "3" "*"]}}
   {System.show{Interpret [number(1) number(2) operator(type:plus)]}}

   {Exit 0}
end

