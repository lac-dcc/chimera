-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- =============================================================================
--	 ____  _           ____  _                 _     _ _                          
--	|  _ \(_) ___ ___ | __ )| | __ _ _______  | |   (_) |__  _ __ __ _ _ __ _   _ 
--	| |_) | |/ __/ _ \|  _ \| |/ _` |_  / _ \ | |   | | '_ \| '__/ _` | '__| | | |
--	|  __/| | (_| (_) | |_) | | (_| |/ /  __/ | |___| | |_) | | | (_| | |  | |_| |
--	|_|   |_|\___\___/|____/|_|\__,_/___\___| |_____|_|_.__/|_|  \__,_|_|   \__, |
--	                                                                        |___/ 
-- =============================================================================
-- Authors:					Patrick Lehmann
-- 
-- Package:					VHDL package for component declarations, types and
--									functions associated to the L_PicoBlaze namespace
--
-- Description:
-- ------------------------------------
--		For detailed documentation see below.
--
-- License:
-- ============================================================================
-- Copyright 2007-2015 Patrick Lehmann - Dresden, Germany
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--		http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- ============================================================================


use			STD.TextIO.all;

library	IEEE;
use			IEEE.NUMERIC_STD.all;
use			IEEE.STD_LOGIC_1164.all;
use			IEEE.STD_LOGIC_TEXTIO.all;

library	PoC;
use			PoC.utils.all;
use			PoC.vectors.all;
use			PoC.strings.all;

library	L_PicoBlaze;
use			L_PicoBlaze.pb.all;


package pb_Devices is

	-- ===========================================================================
	-- PicoBlaze bus descriptions
	-- ===========================================================================
	
	constant C_PB_BUSSES : T_PB_BUS_VECTOR := (
		0 => pb_CreateBus("Any",		"Any",		""),
		1 => pb_CreateBus("Intern",	"Intern",	"Any"),
		2 => pb_CreateBus("Extern",	"Extern",	"Any")
	);

	-- ===========================================================================
	-- PicoBlaze device descriptions
	-- ===========================================================================
	constant PB_DEV_RESET							: T_PB_DEVICE;
	constant PB_DEV_ROM								: T_PB_DEVICE;
	constant PB_DEV_INTERRUPT					: T_PB_DEVICE;
	constant PB_DEV_INTERRUPT8				: T_PB_DEVICE;
	constant PB_DEV_INTERRUPT16				: T_PB_DEVICE;
	constant PB_DEV_TIMER							: T_PB_DEVICE;
	constant PB_DEV_MULTIPLIER				: T_PB_DEVICE;
	constant PB_DEV_MULTIPLIER8				: T_PB_DEVICE;
	constant PB_DEV_MULTIPLIER16			: T_PB_DEVICE;
	constant PB_DEV_MULTIPLIER24			: T_PB_DEVICE;
	constant PB_DEV_MULTIPLIER32			: T_PB_DEVICE;
	constant PB_DEV_ACCUMULATOR16			: T_PB_DEVICE;
	constant PB_DEV_DIVIDER						: T_PB_DEVICE;
	constant PB_DEV_DIVIDER8					: T_PB_DEVICE;
	constant PB_DEV_DIVIDER16					: T_PB_DEVICE;
	constant PB_DEV_DIVIDER24					: T_PB_DEVICE;
	constant PB_DEV_DIVIDER32					: T_PB_DEVICE;
--	constant PB_DEV_SCALER16					: T_PB_DEVICE;
--	constant PB_DEV_SCALER32					: T_PB_DEVICE;
	constant PB_DEV_SCALER40					: T_PB_DEVICE;
	constant PB_DEV_CONVERTER_BCD			: T_PB_DEVICE;
	constant PB_DEV_CONVERTER_BCD24		: T_PB_DEVICE;
	constant PB_DEV_GPIO							: T_PB_DEVICE;
	constant PB_DEV_BIT_BANGING_IO		: T_PB_DEVICE;
	constant PB_DEV_BIT_BANGING_IO8		: T_PB_DEVICE;
	constant PB_DEV_BIT_BANGING_IO16	: T_PB_DEVICE;
	constant PB_DEV_LCDISPLAY					: T_PB_DEVICE;
	constant PB_DEV_UART							: T_PB_DEVICE;
--	constant PB_DEV_UARTSTREAM				: T_PB_DEVICE;
	constant PB_DEV_IICCONTROLLER			: T_PB_DEVICE;
--	constant PB_DEV_MDIOCONTROLLER		: T_PB_DEVICE;
	constant PB_DEV_DRP								: T_PB_DEVICE;
	constant PB_DEV_FREQM							: T_PB_DEVICE;
	constant PB_DEV_BCDCOUNTER				: T_PB_DEVICE;

end package;


package body pb_Devices is
	-- ===========================================================================
	-- PicoBlaze device descriptions
	-- ===========================================================================
	-- Reset Circuit
	-- ---------------------------------------------------------------------------
	constant PB_DEV_RESET_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		0 =>	pb_CreateRegisterField("Reset", "Reset", 8)
	);
	
	constant PB_DEV_RESET : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Reset Circuit",
		DeviceShort =>				"Reset",
		Registers =>					(
			pb_CreateRegisterWK("Reset", 0, PB_DEV_RESET_FIELDS, "Reset", 0)),
		RegisterFields =>			PB_DEV_RESET_FIELDS
	);

	-- Instruction ROM
	-- ---------------------------------------------------------------------------
	constant PB_DEV_ROM_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		0 =>	pb_CreateRegisterField("PageNumber", "PageNumber", 3)
	);
	
	constant PB_DEV_ROM : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Instruction ROM",
		DeviceShort =>				"InstROM",
		Registers =>					(
			pb_CreateRegisterRWK("PageNumber", 0, PB_DEV_ROM_FIELDS, "PageNumber", 5)),
		RegisterFields =>			PB_DEV_ROM_FIELDS
	);
	
	-- InterruptController
	-- ---------------------------------------------------------------------------
	constant PB_DEV_INTERRUPT8_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Interrupt Enable",			"IntEnable",	8) &
		pb_CreateWriteOnlyField("Interrupt Disable",		"IntDisable", 8) &
		pb_CreateReadOnlyField("Interrupt Enable Mask",	"IntMask", 		8) &
		pb_CreateReadOnlyField("Interrupt Source",			"IntSource",	 8)
	);
	constant PB_DEV_INTERRUPT16_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Interrupt Enable",			"IntEnable",	16) &
		pb_CreateWriteOnlyField("Interrupt Disable",		"IntDisable", 16) &
		pb_CreateReadOnlyField("Interrupt Enable Mask",	"IntMask", 		16) &
		pb_CreateReadOnlyField("Interrupt Source",			"IntSource",	 8)
	);
	
	constant PB_DEV_INTERRUPT8 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Interrupt Controller (8 ports)",
		DeviceShort =>				"IntC8",
		Registers =>					(
			pb_CreateRegisterWK("IntEnable0",		0, PB_DEV_INTERRUPT8_FIELDS, "IntEnable",	0) &
			pb_CreateRegisterWK("IntDisable0",	1, PB_DEV_INTERRUPT8_FIELDS, "IntDisable",	0) &
			pb_CreateRegisterRO("IntMask0",			0, PB_DEV_INTERRUPT8_FIELDS, "IntMask",		0) &
			pb_CreateRegisterRO("IntSource",		1, PB_DEV_INTERRUPT8_FIELDS, "IntSource",	0)),
		RegisterFields =>			PB_DEV_INTERRUPT8_FIELDS
	);
	constant PB_DEV_INTERRUPT16 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Interrupt Controller (16 ports)",
		DeviceShort =>				"IntC16",
		Registers =>					(
			pb_CreateRegisterWK("IntEnable0",		0, PB_DEV_INTERRUPT16_FIELDS, "IntEnable",	0) &
			pb_CreateRegisterWK("IntEnable1",		1, PB_DEV_INTERRUPT16_FIELDS, "IntEnable",	8) &
			pb_CreateRegisterWK("IntDisable0",	2, PB_DEV_INTERRUPT16_FIELDS, "IntDisable",	0) &
			pb_CreateRegisterWK("IntDisable1",	3, PB_DEV_INTERRUPT16_FIELDS, "IntDisable",	8) &
			pb_CreateRegisterRO("IntMask0",			0, PB_DEV_INTERRUPT16_FIELDS, "IntMask",		0) &
			pb_CreateRegisterRO("IntMask1",			1, PB_DEV_INTERRUPT16_FIELDS, "IntMask",		8) &
			pb_CreateRegisterRO("IntSource",		2, PB_DEV_INTERRUPT16_FIELDS, "IntSource",	0)),
		RegisterFields =>			PB_DEV_INTERRUPT16_FIELDS
	);

	-- Timer
	-- ---------------------------------------------------------------------------
	constant PB_DEV_TIMER_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Control",			"Control",	 8) &
		pb_CreateWriteOnlyField("Max Value",		"MaxValue",	16) &
		pb_CreateReadOnlyField("Current Value",	"CurValue",	16)
	);

	constant PB_DEV_TIMER : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Timer",
		DeviceShort =>				"Timer",
		Registers =>					(
			pb_CreateRegisterWK("Control",		0, PB_DEV_TIMER_FIELDS, "Control",	0) &
			pb_CreateRegisterWO("MaxValue0",	2, PB_DEV_TIMER_FIELDS, "MaxValue",	0) &
			pb_CreateRegisterWO("MaxValue1",	3, PB_DEV_TIMER_FIELDS, "MaxValue",	8) &
			pb_CreateRegisterRO("CurValue0",	2, PB_DEV_TIMER_FIELDS, "CurValue",	0) &
			pb_CreateRegisterRO("CurValue1",	3, PB_DEV_TIMER_FIELDS, "CurValue",	8)),
		RegisterFields =>			PB_DEV_TIMER_FIELDS,
		CreatesInterrupt =>		TRUE
	);

	-- Multiplier (8/16/24/32 bit)
	-- ---------------------------------------------------------------------------
	constant PB_DEV_MULTIPLIER8_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand A",	"OperandA",	8) &
		pb_CreateWriteOnlyField("Operand B",	"OperandB",	8) &
		pb_CreateReadOnlyField("Result R",		"Result",		16)
	);
	constant PB_DEV_MULTIPLIER16_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand A",	"OperandA",	16) &
		pb_CreateWriteOnlyField("Operand B",	"OperandB",	16) &
		pb_CreateReadOnlyField("Result R",		"Result",		32)
	);
	constant PB_DEV_MULTIPLIER24_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand A",	"OperandA",	24) &
		pb_CreateWriteOnlyField("Operand B",	"OperandB",	24) &
		pb_CreateReadOnlyField("Result R",		"Result",		48)
	);
	constant PB_DEV_MULTIPLIER32_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand A",	"OperandA",	32) &
		pb_CreateWriteOnlyField("Operand B",	"OperandB",	32) &
		pb_CreateReadOnlyField("Result R",		"Result",		64)
	);
	
	constant PB_DEV_MULTIPLIER8 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Multiplier (8 bit)",
		DeviceShort =>				"Mult8",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_MULTIPLIER8_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandB0",	2, PB_DEV_MULTIPLIER8_FIELDS, "OperandB",	 0) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_MULTIPLIER8_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_MULTIPLIER8_FIELDS, "Result",		 8)),
		RegisterFields =>			PB_DEV_MULTIPLIER8_FIELDS
	);
	constant PB_DEV_MULTIPLIER16 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Multiplier (16 bit)",
		DeviceShort =>				"Mult16",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_MULTIPLIER16_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandA1",	1, PB_DEV_MULTIPLIER16_FIELDS, "OperandA",	 8) &
			pb_CreateRegisterWO("OperandB0",	2, PB_DEV_MULTIPLIER16_FIELDS, "OperandB",	 0) &
			pb_CreateRegisterWO("OperandB1",	3, PB_DEV_MULTIPLIER16_FIELDS, "OperandB",	 8) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_MULTIPLIER16_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_MULTIPLIER16_FIELDS, "Result",		 8) &
			pb_CreateRegisterRO("Result2",		2, PB_DEV_MULTIPLIER16_FIELDS, "Result",		16) &
			pb_CreateRegisterRO("Result3",		3, PB_DEV_MULTIPLIER16_FIELDS, "Result",		24)),
		RegisterFields =>			PB_DEV_MULTIPLIER16_FIELDS
	);
	constant PB_DEV_MULTIPLIER24 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Multiplier (24 bit)",
		DeviceShort =>				"Mult24",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_MULTIPLIER24_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandA1",	1, PB_DEV_MULTIPLIER24_FIELDS, "OperandA",	 8) &
			pb_CreateRegisterWO("OperandA2",	2, PB_DEV_MULTIPLIER24_FIELDS, "OperandA",	16) &
			pb_CreateRegisterWO("OperandB0",	3, PB_DEV_MULTIPLIER24_FIELDS, "OperandB",	 0) &
			pb_CreateRegisterWO("OperandB1",	4, PB_DEV_MULTIPLIER24_FIELDS, "OperandB",	 8) &
			pb_CreateRegisterWO("OperandB2",	5, PB_DEV_MULTIPLIER24_FIELDS, "OperandB",	16) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_MULTIPLIER24_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_MULTIPLIER24_FIELDS, "Result",		 8) &
			pb_CreateRegisterRO("Result2",		2, PB_DEV_MULTIPLIER24_FIELDS, "Result",		16) &
			pb_CreateRegisterRO("Result3",		3, PB_DEV_MULTIPLIER24_FIELDS, "Result",		24) &
			pb_CreateRegisterRO("Result4",		4, PB_DEV_MULTIPLIER24_FIELDS, "Result",		32) &
			pb_CreateRegisterRO("Result5",		5, PB_DEV_MULTIPLIER24_FIELDS, "Result",		40)),
		RegisterFields =>			PB_DEV_MULTIPLIER24_FIELDS
	);
	constant PB_DEV_MULTIPLIER32 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Multiplier (32 bit)",
		DeviceShort =>				"Mult32",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_MULTIPLIER32_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandA1",	1, PB_DEV_MULTIPLIER32_FIELDS, "OperandA",	 8) &
			pb_CreateRegisterWO("OperandA2",	2, PB_DEV_MULTIPLIER32_FIELDS, "OperandA",	16) &
			pb_CreateRegisterWO("OperandA3",	3, PB_DEV_MULTIPLIER32_FIELDS, "OperandA",	24) &
			pb_CreateRegisterWO("OperandB0",	4, PB_DEV_MULTIPLIER32_FIELDS, "OperandB",	 0) &
			pb_CreateRegisterWO("OperandB1",	5, PB_DEV_MULTIPLIER32_FIELDS, "OperandB",	 8) &
			pb_CreateRegisterWO("OperandB2",	6, PB_DEV_MULTIPLIER32_FIELDS, "OperandB",	16) &
			pb_CreateRegisterWO("OperandB3",	7, PB_DEV_MULTIPLIER32_FIELDS, "OperandB",	24) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_MULTIPLIER32_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_MULTIPLIER32_FIELDS, "Result",		 8) &
			pb_CreateRegisterRO("Result2",		2, PB_DEV_MULTIPLIER32_FIELDS, "Result",		16) &
			pb_CreateRegisterRO("Result3",		3, PB_DEV_MULTIPLIER32_FIELDS, "Result",		24) &
			pb_CreateRegisterRO("Result4",		4, PB_DEV_MULTIPLIER32_FIELDS, "Result",		32) &
			pb_CreateRegisterRO("Result5",		5, PB_DEV_MULTIPLIER32_FIELDS, "Result",		40) &
			pb_CreateRegisterRO("Result6",		6, PB_DEV_MULTIPLIER32_FIELDS, "Result",		48) &
			pb_CreateRegisterRO("Result7",		7, PB_DEV_MULTIPLIER32_FIELDS, "Result",		56)),
		RegisterFields =>			PB_DEV_MULTIPLIER32_FIELDS
	);

	-- Accumulator (16 bit)
	-- ---------------------------------------------------------------------------
	constant PB_DEV_ACCUMULATOR16_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operation",	"Operation",	8) &
		pb_CreateWriteOnlyField("Operand A",	"OperandA",		16) &
		pb_CreateWriteOnlyField("Operand B",	"OperandB",		16) &
		pb_CreateWriteOnlyField("Operand C",	"OperandC",		16) &
		pb_CreateReadOnlyField("Result R",		"Result",			16)
	);
	
	constant PB_DEV_ACCUMULATOR16 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Accumulator (16 bit)",
		DeviceShort =>				"Accu16",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_ACCUMULATOR16_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandA1",	1, PB_DEV_ACCUMULATOR16_FIELDS, "OperandA",	 8) &
			pb_CreateRegisterWO("OperandB0",	2, PB_DEV_ACCUMULATOR16_FIELDS, "OperandB",	 0) &
			pb_CreateRegisterWO("OperandB1",	3, PB_DEV_ACCUMULATOR16_FIELDS, "OperandB",	 8) &
			pb_CreateRegisterWO("OperandC0",	2, PB_DEV_ACCUMULATOR16_FIELDS, "OperandC",	 0) &
			pb_CreateRegisterWO("OperandC1",	3, PB_DEV_ACCUMULATOR16_FIELDS, "OperandC",	 8) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_ACCUMULATOR16_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_ACCUMULATOR16_FIELDS, "Result",		 8)),
		RegisterFields =>			PB_DEV_ACCUMULATOR16_FIELDS
	);

	-- Divider (8/16/24/32 bit)
	-- ---------------------------------------------------------------------------
	constant PB_DEV_DIVIDER8_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand A",	"OperandA",	 8) &
		pb_CreateWriteOnlyField("Operand B",	"OperandB",	 8) &
		pb_CreateReadOnlyField("Result R",		"Result",		 8) &
		pb_CreateReadOnlyField("Status",			"Status",		 8)
	);
	constant PB_DEV_DIVIDER16_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand A",	"OperandA",	16) &
		pb_CreateWriteOnlyField("Operand B",	"OperandB",	16) &
		pb_CreateReadOnlyField("Result R",		"Result",		16) &
		pb_CreateReadOnlyField("Status",			"Status",		 8)
	);
	constant PB_DEV_DIVIDER24_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand A",	"OperandA",	24) &
		pb_CreateWriteOnlyField("Operand B",	"OperandB",	24) &
		pb_CreateReadOnlyField("Result R",		"Result",		24) &
		pb_CreateReadOnlyField("Status",			"Status",		 8)
	);
	constant PB_DEV_DIVIDER32_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand A",	"OperandA",	32) &
		pb_CreateWriteOnlyField("Operand B",	"OperandB",	32) &
		pb_CreateReadOnlyField("Result R",		"Result",		32) &
		pb_CreateReadOnlyField("Status",			"Status",		 8)
	);

	constant PB_DEV_DIVIDER8 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Divider (8 bit)",
		DeviceShort =>				"Div8",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_DIVIDER8_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandB0",	2, PB_DEV_DIVIDER8_FIELDS, "OperandB",	 0) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_DIVIDER8_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Status",			3, PB_DEV_DIVIDER8_FIELDS, "Status",		 0)),
		RegisterFields =>			PB_DEV_DIVIDER8_FIELDS,
		CreatesInterrupt =>		TRUE
	);
	constant PB_DEV_DIVIDER16 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Divider (16 bit)",
		DeviceShort =>				"Div16",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_DIVIDER16_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandA1",	1, PB_DEV_DIVIDER16_FIELDS, "OperandA",  8) &
			pb_CreateRegisterWO("OperandB0",	2, PB_DEV_DIVIDER16_FIELDS, "OperandB",	 0) &
			pb_CreateRegisterWO("OperandB1",	3, PB_DEV_DIVIDER16_FIELDS, "OperandB",	 8) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_DIVIDER16_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_DIVIDER16_FIELDS, "Result",		 8) &
			pb_CreateRegisterRO("Status",			3, PB_DEV_DIVIDER16_FIELDS, "Status",		 0)),
		RegisterFields =>			PB_DEV_DIVIDER16_FIELDS,
		CreatesInterrupt =>		TRUE
	);
	constant PB_DEV_DIVIDER24 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Divider (24 bit)",
		DeviceShort =>				"Div24",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_DIVIDER24_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandA1",	1, PB_DEV_DIVIDER24_FIELDS, "OperandA",  8) &
			pb_CreateRegisterWO("OperandA2",	2, PB_DEV_DIVIDER24_FIELDS, "OperandA", 16) &
			pb_CreateRegisterWO("OperandB0",	3, PB_DEV_DIVIDER24_FIELDS, "OperandB",	 0) &
			pb_CreateRegisterWO("OperandB1",	4, PB_DEV_DIVIDER24_FIELDS, "OperandB",	 8) &
			pb_CreateRegisterWO("OperandB2",	5, PB_DEV_DIVIDER24_FIELDS, "OperandB",	16) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_DIVIDER24_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_DIVIDER24_FIELDS, "Result",		 8) &
			pb_CreateRegisterRO("Result2",		2, PB_DEV_DIVIDER24_FIELDS, "Result",		16) &
			pb_CreateRegisterRO("Status",			5, PB_DEV_DIVIDER24_FIELDS, "Status",		 0)),
		RegisterFields =>			PB_DEV_DIVIDER24_FIELDS,
		CreatesInterrupt =>		TRUE
	);
	constant PB_DEV_DIVIDER32 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Divider (32 bit)",
		DeviceShort =>				"Div32",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_DIVIDER32_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandA1",	1, PB_DEV_DIVIDER32_FIELDS, "OperandA",  8) &
			pb_CreateRegisterWO("OperandA2",	2, PB_DEV_DIVIDER32_FIELDS, "OperandA",	16) &
			pb_CreateRegisterWO("OperandA3",	3, PB_DEV_DIVIDER32_FIELDS, "OperandA",	24) &
			pb_CreateRegisterWO("OperandB0",	4, PB_DEV_DIVIDER32_FIELDS, "OperandB",	 0) &
			pb_CreateRegisterWO("OperandB1",	5, PB_DEV_DIVIDER32_FIELDS, "OperandB",	 8) &
			pb_CreateRegisterWO("OperandB2",	6, PB_DEV_DIVIDER32_FIELDS, "OperandB",	16) &
			pb_CreateRegisterWO("OperandB3",	7, PB_DEV_DIVIDER32_FIELDS, "OperandB",	24) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_DIVIDER32_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_DIVIDER32_FIELDS, "Result",		 8) &
			pb_CreateRegisterRO("Result2",		2, PB_DEV_DIVIDER32_FIELDS, "Result",		16) &
			pb_CreateRegisterRO("Result3",		3, PB_DEV_DIVIDER32_FIELDS, "Result",		24) &
			pb_CreateRegisterRO("Status",			7, PB_DEV_DIVIDER32_FIELDS, "Status",		 0)),
		RegisterFields =>			PB_DEV_DIVIDER32_FIELDS,
		CreatesInterrupt =>		TRUE
	);

	-- Scaler (40 bit)
	-- ---------------------------------------------------------------------------
	constant PB_DEV_SCALER40_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand A",			"OperandA", 40) &
		pb_CreateWriteOnlyField("Multiplicator",	"Mult",			 8) &
		pb_CreateWriteOnlyField("Divisor",				"Div",			 8) &
		pb_CreateWriteOnlyField("Command",				"Command",	 8) &
		pb_CreateReadOnlyField("Result R",				"Result",		40) &
		pb_CreateReadOnlyField("Status",					"Status",		 8)
	);

	constant PB_DEV_SCALER40 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Scaler (40 bit)",
		DeviceShort =>				"Scaler40",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_SCALER40_FIELDS, "OperandA",	0) &
			pb_CreateRegisterWO("OperandA1",	1, PB_DEV_SCALER40_FIELDS, "OperandA",	8) &
			pb_CreateRegisterWO("OperandA2",	2, PB_DEV_SCALER40_FIELDS, "OperandA",	16) &
			pb_CreateRegisterWO("OperandA3",	3, PB_DEV_SCALER40_FIELDS, "OperandA",	24) &
			pb_CreateRegisterWO("OperandA4",	4, PB_DEV_SCALER40_FIELDS, "OperandA",	32) &
			pb_CreateRegisterWO("Mult",				5, PB_DEV_SCALER40_FIELDS, "Mult",			0) &
			pb_CreateRegisterWO("Div",				6, PB_DEV_SCALER40_FIELDS, "Div",				0) &
			pb_CreateRegisterWO("Command",		7, PB_DEV_SCALER40_FIELDS, "Command",		0) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_SCALER40_FIELDS, "Result",		0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_SCALER40_FIELDS, "Result",		8) &
			pb_CreateRegisterRO("Result2",		2, PB_DEV_SCALER40_FIELDS, "Result",		16) &
			pb_CreateRegisterRO("Result3",		3, PB_DEV_SCALER40_FIELDS, "Result",		24) &
			pb_CreateRegisterRO("Result4",		4, PB_DEV_SCALER40_FIELDS, "Result",		32) &
			pb_CreateRegisterRO("Status",			7, PB_DEV_SCALER40_FIELDS, "Status",		0)),
		RegisterFields =>			PB_DEV_SCALER40_FIELDS,
		CreatesInterrupt =>		TRUE
	);
	
	-- Converter Bin2BCD (24 bit)
	-- ---------------------------------------------------------------------------
	constant PB_DEV_CONVERTER_BCD24_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Operand",	"OperandA",	24) &
		pb_CreateReadOnlyField("Result",		"Result",		28) &
		pb_CreateReadOnlyField("Status",		"Status",		 4)
	);

	constant PB_DEV_CONVERTER_BCD24 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Converter Bin2BCD (24 bit)",
		DeviceShort =>				"ConvBCD24",
		Registers =>					(
			pb_CreateRegisterWO("OperandA0",	0, PB_DEV_CONVERTER_BCD24_FIELDS, "OperandA",	 0) &
			pb_CreateRegisterWO("OperandA1",	1, PB_DEV_CONVERTER_BCD24_FIELDS, "OperandA",  8) &
			pb_CreateRegisterWO("OperandA2",	2, PB_DEV_CONVERTER_BCD24_FIELDS, "OperandA",	16) &
			pb_CreateRegisterRO("Result0",		0, PB_DEV_CONVERTER_BCD24_FIELDS, "Result",		 0) &
			pb_CreateRegisterRO("Result1",		1, PB_DEV_CONVERTER_BCD24_FIELDS, "Result",		 8) &
			pb_CreateRegisterRO("Result2",		2, PB_DEV_CONVERTER_BCD24_FIELDS, "Result",		16) &
--			pb_CreateRegisterRO("Result3",		3, PB_DEV_CONVERTER_BCD24_FIELDS, "Result",		24) &
			pb_CreateRegisterRO("Status",			3, PB_DEV_CONVERTER_BCD24_FIELDS, "Status",		 0)),
		RegisterFields =>			PB_DEV_CONVERTER_BCD24_FIELDS,
		CreatesInterrupt =>		TRUE
	);
	
	-- General Purpose I/O
	-- ---------------------------------------------------------------------------
	constant PB_DEV_GPIO_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateRegisterField("GPIO DataOut",			"DataOut",		8) &
		pb_CreateReadOnlyField("GPIO DataIn",				"DataIn",			8) &
		pb_CreateWriteOnlyField("Interrupt Enable",	"IntEnable",	8)
	);

	constant PB_DEV_GPIO : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"General Purpose I/O",
		DeviceShort =>				"GPIO",
		Registers =>					(
			pb_CreateRegisterRWK("DataOut",		0, PB_DEV_GPIO_FIELDS, "DataOut",		0) &
			pb_CreateRegisterRO("DataIn",			1, PB_DEV_GPIO_FIELDS, "DataIn",		0) &
			pb_CreateRegisterWO("IntEnable",	1, PB_DEV_GPIO_FIELDS, "IntEnable",	0)),
		RegisterFields =>			PB_DEV_GPIO_FIELDS,
		CreatesInterrupt =>		TRUE
	);

	-- Bit Banging I/O (8 bit)
	-- ---------------------------------------------------------------------------
	constant PB_DEV_BIT_BANGING_IO8_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("BBIO Set",			"Set",			8) &
		pb_CreateWriteOnlyField("BBIO Clear",		"Clear",		8) &
		pb_CreateReadOnlyField("BBIO DataOut",	"DataOut",	8) &
		pb_CreateReadOnlyField("BBIO DataIn",		"DataIn",		8)
	);

	constant PB_DEV_BIT_BANGING_IO8 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Bit Banging I/O",
		DeviceShort =>				"BBIO8",
		Registers =>					(
			pb_CreateRegisterWK("Set",			0, PB_DEV_BIT_BANGING_IO8_FIELDS, "Set",			0) &
			pb_CreateRegisterWK("Clear",		1, PB_DEV_BIT_BANGING_IO8_FIELDS, "Clear",		0) &
			pb_CreateRegisterRO("DataOut",	0, PB_DEV_BIT_BANGING_IO8_FIELDS, "DataOut",	0) &
			pb_CreateRegisterRO("DataIn",		1, PB_DEV_BIT_BANGING_IO8_FIELDS, "DataIn",		0)),
		RegisterFields =>			PB_DEV_BIT_BANGING_IO8_FIELDS
	);

	-- Bit Banging I/O (16 bit)
	-- ---------------------------------------------------------------------------
	constant PB_DEV_BIT_BANGING_IO16_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("BBIO Set",			"Set",			16) &
		pb_CreateWriteOnlyField("BBIO Clear",		"Clear",		16) &
		pb_CreateReadOnlyField("BBIO DataOut",	"DataOut",	16) &
		pb_CreateReadOnlyField("BBIO DataIn",		"DataIn",		16)
	);

	constant PB_DEV_BIT_BANGING_IO16 : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"Bit Banging I/O",
		DeviceShort =>				"BBIO16",
		Registers =>					(
			pb_CreateRegisterWK("Set0",			0, PB_DEV_BIT_BANGING_IO16_FIELDS, "Set",			0) &
			pb_CreateRegisterWK("Set1",			1, PB_DEV_BIT_BANGING_IO16_FIELDS, "Set",			8) &
			pb_CreateRegisterWK("Clear0",		2, PB_DEV_BIT_BANGING_IO16_FIELDS, "Clear",		0) &
			pb_CreateRegisterWK("Clear1",		3, PB_DEV_BIT_BANGING_IO16_FIELDS, "Clear",		8) &
			pb_CreateRegisterRO("DataOut0",	0, PB_DEV_BIT_BANGING_IO16_FIELDS, "DataOut",	0) &
			pb_CreateRegisterRO("DataOut1",	1, PB_DEV_BIT_BANGING_IO16_FIELDS, "DataOut",	8) &
			pb_CreateRegisterRO("DataIn0",	2, PB_DEV_BIT_BANGING_IO16_FIELDS, "DataIn",	0) &
			pb_CreateRegisterRO("DataIn1",	3, PB_DEV_BIT_BANGING_IO16_FIELDS, "DataIn",	8)),
		RegisterFields =>			PB_DEV_BIT_BANGING_IO16_FIELDS
	);

	-- LC-Display
	-- ---------------------------------------------------------------------------
	constant PB_DEV_LCDISPLAY_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Command",	"Command",	8) &
		pb_CreateWriteOnlyField("Data",			"Data",			8)
	);

	constant PB_DEV_LCDISPLAY : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"LC Display Controller",
		DeviceShort =>				"LCD",
		Registers =>					(
			pb_CreateRegisterWO("Command",	0, PB_DEV_LCDISPLAY_FIELDS, "Command",	0) &
			pb_CreateRegisterWO("DataOut",	1, PB_DEV_LCDISPLAY_FIELDS, "Data",			0) &
			pb_CreateRegisterKO("DataOut",	1, PB_DEV_LCDISPLAY_FIELDS, "Data",			0)),
		RegisterFields =>			PB_DEV_LCDISPLAY_FIELDS
	);

	-- UART
	-- ---------------------------------------------------------------------------
	constant PB_DEV_UART_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Command",			"Command",	8) &
		pb_CreateReadOnlyField("Status",				"Status",		8) &
		pb_CreateWriteOnlyField("FIFO DataOut",	"DataOut",	8) &
		pb_CreateReadOnlyField("FIFO DataIn",		"DataIn",		8)
	);

	constant PB_DEV_UART : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"UART",
		DeviceShort =>				"UART",
		Registers =>					(
			pb_CreateRegisterWO("Command",	0, PB_DEV_UART_FIELDS, "Command",	0) &
			pb_CreateRegisterRO("Status",		0, PB_DEV_UART_FIELDS, "Status",	0) &
			pb_CreateRegisterWO("DataOut",	1, PB_DEV_UART_FIELDS, "DataOut",	0) &
			pb_CreateRegisterKO("DataOut",	1, PB_DEV_UART_FIELDS, "DataOut",	0) &
			pb_CreateRegisterRO("DataIn",		1, PB_DEV_UART_FIELDS, "DataIn",	0)),
		RegisterFields =>			PB_DEV_UART_FIELDS,
		CreatesInterrupt =>		TRUE
	);

	-- UARTStream
	-- ---------------------------------------------------------------------------
	constant PB_DEV_UARTSTREAM_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		0 => pb_CreateRegisterField("Dummy",			"Dummy",	8)
	);

--	constant PB_DEV_UARTSTREAM : T_PB_DEVICE := pb_CreateDevice(
--		DeviceName =>					"UARTStream",
--		DeviceShort =>				"UARTStream",
--		Registers =>					((
--				0 => pb_CreateRegister("Dummy",		0, PB_DEV_UARTSTREAM_FIELDS, "Dummy",	0))
--			),
--		RegisterFields =>			PB_DEV_UARTSTREAM_FIELDS,
--		CreatesInterrupt =>		TRUE
--	);

	-- I2C Controller
	-- ---------------------------------------------------------------------------
	constant PB_DEV_IICCONTROLLER_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Command",							"Command",				8) &
		pb_CreateReadOnlyField("Status",								"Status",					8) &
		pb_CreateRegisterField("Device Address [7:1]",	"DeviceAddress",	8) &
		pb_CreateRegisterField("RX Length [3:0]",				"RXLength",				8) &
		pb_CreateWriteOnlyField("TX_FIFO",							"TX_FIFO",				8) &
		pb_CreateReadOnlyField("RX_FIFO",								"RX_FIFO",				8)
	);

	constant PB_DEV_IICCONTROLLER : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"I2C Controller",
		DeviceShort =>				"IICCtrl",
		Registers =>					(
			pb_CreateRegisterWO("Command",				0, PB_DEV_IICCONTROLLER_FIELDS, "Command",				0) &
			pb_CreateRegisterRO("Status",					0, PB_DEV_IICCONTROLLER_FIELDS, "Status",					0) &
			pb_CreateRegisterRW("DeviceAddress",	1, PB_DEV_IICCONTROLLER_FIELDS, "DeviceAddress",	0) &
			pb_CreateRegisterRW("Length",					2, PB_DEV_IICCONTROLLER_FIELDS, "RXLength",				0) &
			pb_CreateRegisterWO("TX_FIFO",				3, PB_DEV_IICCONTROLLER_FIELDS, "TX_FIFO",				0) &
			pb_CreateRegisterRO("RX_FIFO",				3, PB_DEV_IICCONTROLLER_FIELDS, "RX_FIFO",				0)),
		RegisterFields =>			PB_DEV_IICCONTROLLER_FIELDS,
		CreatesInterrupt =>		TRUE
	);

	-- MDIO Controller
	-- ---------------------------------------------------------------------------
	constant PB_DEV_MDIOCONTROLLER_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		0 => pb_CreateRegisterField("Dummy",			"Dummy",	8)
	);

--	constant PB_DEV_MDIOCONTROLLER : T_PB_DEVICE := pb_CreateDevice(
--		DeviceName =>					"MDIO Controller",
--		DeviceShort =>				"MDIOCtrl",
--		Registers =>					((
--				0 => pb_CreateRegister("Dummy",		0, PB_DEV_MDIOCONTROLLER_FIELDS, "Dummy",	0))
--			),
--		RegisterFields =>			PB_DEV_MDIOCONTROLLER_FIELDS,
--		CreatesInterrupt =>		FALSE
--	);

	-- Dynamic Reconfiguration Port
	-- ---------------------------------------------------------------------------
	constant PB_DEV_DRP_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Command",							"Command",		 8) &
		pb_CreateReadOnlyField("Status",								"Status",			 8) &
		pb_CreateRegisterField("Address",								"Address",		 8) &
		pb_CreateRegisterField("Data",									"Data",				16) &
		pb_CreateWriteOnlyField("Mask Register Set",		"MaskRegSet",	16) &
		pb_CreateWriteOnlyField("Mask Register Clear",	"MaskRegClr",	16)
	);

	constant PB_DEV_DRP : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"PicoBlaze to DRP Adapter",
		DeviceShort =>				"DRP",
		Registers =>					(
			pb_CreateRegisterWO("Command",			0, PB_DEV_DRP_FIELDS, "Command",		0) &
			pb_CreateRegisterRO("Status",				0, PB_DEV_DRP_FIELDS, "Status",			0) &
			pb_CreateRegisterRW("Address",			1, PB_DEV_DRP_FIELDS, "Address",		0) &
			pb_CreateRegisterRW("Data0",				2, PB_DEV_DRP_FIELDS, "Data",				0) &
			pb_CreateRegisterRW("Data1",				3, PB_DEV_DRP_FIELDS, "Data",				0) &
			pb_CreateRegisterWO("MaskRegSet0",	4, PB_DEV_DRP_FIELDS, "MaskRegSet",	0) &
			pb_CreateRegisterWO("MaskRegSet1",	5, PB_DEV_DRP_FIELDS, "MaskRegSet",	0) &
			pb_CreateRegisterWO("MaskRegClr0",	6, PB_DEV_DRP_FIELDS, "MaskRegClr",	0) &
			pb_CreateRegisterWO("MaskRegClr1",	7, PB_DEV_DRP_FIELDS, "MaskRegClr",	0)),
		RegisterFields =>			PB_DEV_DRP_FIELDS
	);

	-- Frequency Measurement
	-- ---------------------------------------------------------------------------
	constant PB_DEV_FREQM_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Command",					"Command",			 8) &
		pb_CreateReadOnlyField("Frequency Counter",	"FreqCntValue",	24) &
		pb_CreateReadOnlyField("Status",						"Status",				 8)
	);

	constant PB_DEV_FREQM : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"FrequencyMeasurement",
		DeviceShort =>				"FreqM",
		Registers =>					(
			pb_CreateRegisterWO("Command",				0, PB_DEV_FREQM_FIELDS, "Command",			0) &
			pb_CreateRegisterRO("FreqCntValue0",	0, PB_DEV_FREQM_FIELDS, "FreqCntValue",	0) &
			pb_CreateRegisterRO("FreqCntValue1",	1, PB_DEV_FREQM_FIELDS, "FreqCntValue",	0) &
			pb_CreateRegisterRO("FreqCntValue2",	2, PB_DEV_FREQM_FIELDS, "FreqCntValue",	0) &
			pb_CreateRegisterRO("Status",					3, PB_DEV_FREQM_FIELDS, "Status",				0)),
		RegisterFields =>			PB_DEV_FREQM_FIELDS
	);

	-- BCD Counter
	-- ---------------------------------------------------------------------------
	constant PB_DEV_BCDCOUNTER_FIELDS : T_PB_REGISTER_FIELD_VECTOR := (
		pb_CreateWriteOnlyField("Command",	"Command",	 8) &
		pb_CreateReadOnlyField("Value",			"Value",		32)
	);

	constant PB_DEV_BCDCOUNTER : T_PB_DEVICE := pb_CreateDevice(
		DeviceName =>					"BCD Counter",
		DeviceShort =>				"BCDCnt",
		Registers =>					(
			pb_CreateRegisterWO("Command",	0, PB_DEV_BCDCOUNTER_FIELDS, "Command",	0) &
			pb_CreateRegisterRO("Value0",		0, PB_DEV_BCDCOUNTER_FIELDS, "Value",	0) &
			pb_CreateRegisterRO("Value1",		1, PB_DEV_BCDCOUNTER_FIELDS, "Value",	8) &
			pb_CreateRegisterRO("Value2",		2, PB_DEV_BCDCOUNTER_FIELDS, "Value",	16) &
			pb_CreateRegisterRO("Value3",		3, PB_DEV_BCDCOUNTER_FIELDS, "Value",	24)),
		RegisterFields =>			PB_DEV_BCDCOUNTER_FIELDS
	);
	
	-- define aliases
	constant PB_DEV_INTERRUPT				: T_PB_DEVICE		:= pb_CreateDeviceAlias(PB_DEV_INTERRUPT16,			"IntC");
	constant PB_DEV_MULTIPLIER			: T_PB_DEVICE		:= pb_CreateDeviceAlias(PB_DEV_MULTIPLIER32,		"Mult");
	constant PB_DEV_DIVIDER					: T_PB_DEVICE		:= pb_CreateDeviceAlias(PB_DEV_DIVIDER32,				"Div");
	constant PB_DEV_CONVERTER_BCD		: T_PB_DEVICE		:= pb_CreateDeviceAlias(PB_DEV_CONVERTER_BCD24,	"ConvBCD");
	constant PB_DEV_BIT_BANGING_IO	: T_PB_DEVICE		:= pb_CreateDeviceAlias(PB_DEV_BIT_BANGING_IO8,	"BBIO");
end package body;
