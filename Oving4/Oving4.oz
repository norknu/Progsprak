
functor 
import 
	Application(exit:Exit) 
	System 
define

%Oppgave1
	fun lazy {StreamMap S F}
		case S of H|T then
			{F H}|{StreamMap T F}
		else
			nil
		end
	end

	local A = 2|3|4|A X in
		X = {StreamMap A fun {$ X} X*X end}
		if {Nth X 10} > 0 then skip 
		end

		{System.show X}
	end

%Oppgave2

	fun lazy {StreamZip S1 S2 F}
		case S1 of H|T then
			case S2 of H1|T1 then
				{F H H1}|{StreamZip T T1 F}
			else
				nil
			end
		else
			nil
		end
	end

	local A = 2|3|4|A B = 9|~3|B X in
		X = {StreamZip A B fun {$ X Y} X*Y end}
		if {Nth X 10} > 0 then skip 
		end

		{System.show X}
	end

%Oppgave3

	fun lazy {StreamScale S Factor}
		case S of H|T then
			Factor*H|{StreamScale T Factor}
		else
			nil
		end
		%{StreamMap S fun {$ X} X*Factor end}
	end

	local A = 2|3|4|A X in
		X = {StreamScale A 5}
		if {Nth X 10} > 0 then skip 
		end
		{System.show X}
	end


%Oppgave4
	
	fun lazy {StreamAdd S1 S2}
		case S1 of H|T then
			case S2 of H1|T1 then
				H+H1|{StreamAdd T T1}
			else
				nil
			end
		else
			nil
		end
	end

	local A = 2|3|4|A B = 9|~3|B X in
		X = {StreamAdd A B}
		if {Nth X 10} > 0 then skip 
		end
		{System.show X}
	end


%Oppgave5

	fun lazy {StreamIntegrate Init S Dt}
		{SumIntegrate Init 0.0|S Dt}
	end

	fun lazy{SumIntegrate Init S Dt}
		case S of H|T then
			local X = Init+H*Dt in
				X|{SumIntegrate X T Dt}
			end
		else
			nil
		end
	end

	local A = 1.0|0.0|A X in
		X = {StreamIntegrate 5.0 A 1.0}
		if {Nth X 10} > 0.0 then skip 
		end
		{System.show X}
	end

	local A = 5.0|6.0|7.0|A X in
		X = {StreamIntegrate 2.0 A 3.0}
		if {Nth X 10} > 0.0 then skip
		end
		{System.show X}
	end

%Oppgave6

	fun {MakeRC R C Dt}
		fun lazy {$ S V0}
			{StreamAdd {StreamScale S R} {StreamIntegrate V0 {StreamScale S (1.0/C)} Dt}}
		end
	end

	local
		Ones = 1.0|Ones
		RC = {MakeRC 5.0 1.0 0.2}
		V = {RC Ones 2.0}
	in
		if {Nth V 5} > 0.0 then skip end {System.show V}
	end

  {Exit 0}

end

%Oppgave 7

a) Forksjellen på en stream og en liste er at en liste har en gitt lengde, men en stream er en liste som refererer til seg selv og er evigvarende. 

b) 