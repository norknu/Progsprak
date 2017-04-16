class OzInterpreter

   attr Debug

   meth init()
      Debug := false
   end

   meth setDebug()
      Debug := true
   end
   meth unsetDebug()
      Debug := false
   end

   meth debug(Message)
      if @Debug then
         {System.printInfo 'I | '}
         {System.show Message}
      end
   end

   meth process(Program)
      proc {Process Stack Store}
         fun {FindIndex Id Store}
            case Stack of (I#V)|T then
               if Id == I then
                  V
               else
                  {FindIndex Id T}
               end
            else
               0
            end
         end

      case Stack of
         nil then skip
      [] (S#E)|Stack then
         {self debug(pop(stat:S env:E))}
         case S of
            noop then
            {self debug(pass)}
            {Process Stack Store}
         [] seq(S1 S2) then
            {self debug(push(stat:S2 env:E))}
            {self debug(push(stat:S1 env:E))}
            {Process (S1#E)|(S2#E)|Stack Store}
         [] loc(id:I stat:S) then
            V = {List.length Store} + 1
            NE = (I#V)|E in
            {self debug(map(id:I var:V))}
            {self debug(push(stat:S env:NE))}
            {Process (S#NE)|Stack {List.append Store [_]}}
         [] ifer(id:I stat1:S1 stat2:S2) then
            if{List.nth Store {FindIndex I E}} == 0 then
               {self debug(push(stat2:S2 env:E))}
               {Process (S2#E)|Stack Store}
            else
               {self debug(push(stat1:S1 env:E))}
               {Process (S1#E)|Stack Store}
         [] binding(id:I boolean:A) then
            {self debug(store(Store))}
            {List.nth Store {FindIndex I E}} = A
            {self debug(store(Store))}
            {Process Stack Store}
            end
         end
      else
         {System.showInfo 'error'}
      end
   end
in
   {Process [Program#nil] nil}
end

end