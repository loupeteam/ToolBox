(*
 * File: WithinPercent.st
 * Copyright (c) 2023 Loupe
 * https://loupe.team
 * 
 * This file is part of ToolBox, licensed under the MIT License.
 *
 *)
 
(* simplify IF statements: if value is within a percentage window *)
FUNCTION WithinPercent
	IF SetValue <> 0 THEN
		WithinPercent := (ABS(SetValue - InputValue)/ABS(SetValue)) <= (PercentWindow/100.0);
	ELSE
		WithinPercent := InputValue = SetValue;
	END_IF;
END_FUNCTION
