(*
 * File: ToolBox.fun
 * Copyright (c) 2023 Loupe
 * https://loupe.team
 * 
 * This file is part of ToolBox, licensed under the MIT License.
 *
 *)

FUNCTION_BLOCK ProcessTimer
	VAR_INPUT
		Enable : BOOL;
		Reset : BOOL;
		Count : UDINT;
	END_VAR
	VAR_OUTPUT
		AverageTime : TIME;
		FilteredTime : TIME;
	END_VAR
	VAR
		internal : Process_Timer_Internal;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK TON_Pause (*TON functionality with pausing and an output percentage*) (*$GROUP=User,$CAT=User,$GROUPICON=LD_TimerCounter.png,$CATICON=User.png*)
	VAR_INPUT
		IN : BOOL;
		Pause : BOOL;
		PT : TIME;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
		ET : TIME;
		PercentCompleted : REAL;
		TimeLeftRunning : TIME;
	END_VAR
	VAR
		Internal : TON_w_Pause_Internal;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION WithinPercent : BOOL (*simplify IF statement if value is within a percentage window*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		InputValue : REAL; (*Value check*)
		SetValue : REAL; (*value to come close to*)
		PercentWindow : REAL; (*percentage window of SetInput that Input needs to be within [%]*)
	END_VAR
END_FUNCTION
