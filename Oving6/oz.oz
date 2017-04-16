\switch +gump
%\switch +gumpparseroutputsimplified
%\switch +gumpparserverbose

functor

import
   System
   Application
   GumpScanner
   GumpParser

define

   \insert scanner.ozg
   \insert parser.ozg
   \insert interpreter.oz

   proc {Interpret File}
      Scanner = {New OzScanner init()}
      {Scanner setDebug()}
      Parser = {New OzParser init(Scanner)}
      {Parser setDebug()}
      Interpreter = {New OzInterpreter init()}
      {Interpreter setDebug()}
      Program Status
   in
      {Scanner scanFile(File)}
      Program = {Parser parse(program($) Status)}
      {Scanner close()}
      if Status then
         {Interpreter process(Program)}
      else
         {System.show 'parse error'}
         {Application.exit 2}
      end
   end

   Args
   try
      Args = {Application.getArgs list()}
   catch Exception then
      {System.show "oz: "#Exception.1.2}
      {Application.exit 1}
   end
   {ForAll Args Interpret}
   {Application.exit 0}

end
