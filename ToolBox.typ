(*
 * File: ToolBox.typ
 * Copyright (c) 2023 Loupe
 * https://loupe.team
 * 
 * This file is part of ToolBox, licensed under the MIT License.
 *
 *)

TYPE
	Process_Timer_Internal : 	STRUCT 
		Timer : TON;
		NumberCounted : UDINT;
		StartCount : UDINT;
		CurrentCount : UDINT;
		CountTime : TIME;
		FilteredTime : TIME;
	END_STRUCT;
	TON_w_Pause_Internal : 	STRUCT 
		PT : TIME;
		TimeLeft : TIME;
		TimerPaused : BOOL;
		ExecuteOnce : BOOL;
		TON_ : TON;
		TempET : TIME;
		Reset : BOOL;
	END_STRUCT;
END_TYPE
