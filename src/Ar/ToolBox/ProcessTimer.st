(*
 * File: ProcessTimer.st
 * Copyright (c) 2023 Loupe
 * https://loupe.team
 * 
 * This file is part of ToolBox, licensed under the MIT License.
 *
 *)

(*  *)
FUNCTION_BLOCK ProcessTimer
	
	IF Reset THEN
				
		internal.Timer.IN:=0;
		internal.StartCount:=Count+1;
		internal.CurrentCount:=Count;
		internal.NumberCounted:=0;
		internal.CountTime:=0;
		internal.FilteredTime:=0;	

	ELSIF Enable THEN
		
		IF internal.CurrentCount > Count THEN
			internal.CurrentCount:=Count;
			internal.StartCount:=Count+1;
		END_IF
		
		IF internal.StartCount < Count THEN
		
			internal.StartCount:=Count;			
			internal.NumberCounted:=internal.NumberCounted+1;
			internal.CountTime:=internal.Timer.ET+internal.CountTime;
			
			IF internal.FilteredTime = 0 THEN
			
				internal.FilteredTime:= internal.Timer.ET;				
			
			ELSE
			
				internal.FilteredTime:= (internal.FilteredTime*9+internal.Timer.ET)/10;
			
			END_IF
			
			internal.Timer.IN:=0;
			internal.Timer();
			internal.Timer.IN:=1;			

		ELSIF internal.StartCount = Count THEN

			internal.Timer.IN:=1;

		END_IF
				
	ELSE

		internal.Timer.IN:=0;		
		internal.StartCount:=Count+1;		
		internal.CurrentCount:=Count;				
	END_IF

	internal.Timer.PT:=1000000000;
	internal.Timer();
	
	FilteredTime:=internal.FilteredTime;
	
	IF internal.NumberCounted > 1 THEN
		AverageTime:=internal.CountTime/UDINT_TO_DINT(internal.NumberCounted);
	ELSE
		AverageTime:=0;		
	END_IF
	
END_FUNCTION_BLOCK