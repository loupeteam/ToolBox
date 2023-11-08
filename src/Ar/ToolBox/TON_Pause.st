(*
 * File: TON_Pause.st
 * Copyright (c) 2023 Loupe
 * https://loupe.team
 * 
 * This file is part of ToolBox, licensed under the MIT License.
 *
 *)
 
(* TON functionality with pausing and an output percentage *)
FUNCTION_BLOCK TON_Pause
	IF(IN) THEN
		IF (Internal.Reset) THEN
			Internal.Reset := 0;
			PercentCompleted := 0;
			Internal.TempET := 0;
		END_IF;
		
		IF(NOT Internal.ExecuteOnce) THEN
			Internal.PT :=	PT;
			Internal.TON_.PT := PT;
			Internal.TON_.IN := 1;
			Internal.ExecuteOnce := 1;
		END_IF;
	
		IF(Pause AND NOT Internal.TimerPaused)THEN
			IF (Q = 0)THEN
				Internal.TimeLeft :=    (Internal.TON_.PT - Internal.TON_.ET);				
			ELSE
				Internal.TimeLeft := 0;
			END_IF;
			Internal.TempET := Internal.TempET + Internal.TON_.ET;			
			Internal.TON_.IN := 0;
			Internal.TimerPaused := 1;			
		END_IF;//end OF IF Pause

		Internal.TON_();
		
		IF ((Internal.TON_.Q = 0) AND (Internal.TON_.IN = 1))THEN
			ET := Internal.TempET + Internal.TON_.ET;
		END_IF;
		IF(NOT Pause AND Internal.TimerPaused)THEN
			Internal.TimerPaused := 0;
			Internal.TON_.PT := Internal.TimeLeft;
			Internal.TON_.IN := 1;
		END_IF;

		IF(Internal.TON_.Q)THEN
			Q := 1;
			Internal.TimeLeft := 0;
			Internal.TON_.IN := 0;
		END_IF;
		IF Q THEN
			TimeLeftRunning := 	0;
			PercentCompleted := 100;
			ET := Internal.PT;
		ELSE
			TimeLeftRunning := 	Internal.PT - ET;
			IF (Internal.PT <> 0)THEN
				PercentCompleted := ((TIME_TO_REAL(ET) * 100.0) / (TIME_TO_REAL(Internal.PT) * 100.0)) * 100.0;
			END_IF;
		END_IF;

		
	//End IF enabled
	ELSE
		Internal.Reset :=				1;
		Internal.PT :=	0;
		Internal.ExecuteOnce := 0;
		Internal.TimeLeft := 0;
		TimeLeftRunning := 0;
		Q := 0;
		Pause := 0;
		Internal.TON_.IN := 0;
		Internal.TimeLeft := 0;
		Internal.TimerPaused := 0;
		PercentCompleted := 0;	
		ET :=	0;
		//FUB call to reset clock
		Internal.TON_();
	END_IF



END_FUNCTION_BLOCK
