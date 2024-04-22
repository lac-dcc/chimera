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

library IEEE;
use			IEEE.NUMERIC_STD.all;
use			IEEE.STD_LOGIC_1164.all;
use			IEEE.STD_LOGIC_TEXTIO.all;

library	PoC;
use			PoC.config.all;
use			PoC.utils.all;
use			PoC.vectors.all;
use			PoC.strings.all;


package pb is

	constant PB_VERBOSE				: BOOLEAN			:= FALSE;	-- POC_VERBOSE;
	constant PB_REPORT				: BOOLEAN			:= FALSE;

	subtype T_PB_ADDRESS			is STD_LOGIC_VECTOR(11 downto 0);
	subtype T_PB_INSTRUCTION	is STD_LOGIC_VECTOR(17 downto 0);

	-- PicoBlaze I/O bus
	type T_PB_IOBUS_PB_DEV is record
		PortID					: T_SLV_8;
		Data						: T_SLV_8;
		WriteStrobe			: STD_LOGIC;
		WriteStrobe_K		: STD_LOGIC;
		ReadStrobe			: STD_LOGIC;
		Interrupt_Ack		: STD_LOGIC;
	end record;

	type T_PB_IOBUS_DEV_PB is record
		Data						: T_SLV_8;
		Interrupt				: STD_LOGIC;
		Message					: T_SLV_8;
	end record;

	type T_PB_IOBUS_PB_DEV_VECTOR	is array(NATURAL range <>) of T_PB_IOBUS_PB_DEV;
	type T_PB_IOBUS_DEV_PB_VECTOR	is array(NATURAL range <>) of T_PB_IOBUS_DEV_PB;
	
	constant T_PB_IOBUS_PB_DEV_Z : T_PB_IOBUS_PB_DEV := ((others => 'Z'), (others => 'Z'), others => 'Z');
	constant T_PB_IOBUS_DEV_PB_Z : T_PB_IOBUS_DEV_PB := ((others => 'Z'), 'Z', (others => 'Z'));

	-- private functions (must be declared public to be useable in public constants)
	-- ===========================================================================
--	constant C_PB_MAX_LONGNAME_LENGTH			: POSITIVE				:= 64;
	constant C_PB_MAX_SHORTNAME_LENGTH		: POSITIVE				:= 32;

--	subtype T_PB_LONGNAME					is STRING(1 to C_PB_MAX_LONGNAME_LENGTH);
	subtype T_PB_SHORTNAME				is STRING(1 to C_PB_MAX_SHORTNAME_LENGTH);
	type		T_PB_SHORTNAME_VECTOR	is array(NATURAL range <>) of T_PB_SHORTNAME;
	
--	constant C_PB_LONGNAME_EMPTY	: T_PB_LONGNAME		:= (others => C_POC_NUL);
	constant C_PB_SHORTNAME_EMPTY	: T_PB_SHORTNAME	:= (others => C_POC_NUL);
	
--	function pb_LongName(name : string)		return T_PB_LONGNAME ;
	function pb_ShortName(name : string)	return T_PB_SHORTNAME;
	
	-- PicoBlaze device description
	constant C_PB_MAX_REGISTER_FIELDS					: POSITIVE				:= 32;
	constant C_PB_MAX_REGISTERS								: POSITIVE				:= 32;
	constant C_PB_MAX_REGISTER_FIELD_MAPPINGS	: POSITIVE				:= 32;
	constant C_PB_MAX_MAPPINGS								: POSITIVE				:= 32;
	constant C_PB_MAX_DEVICES									: POSITIVE				:= 32;
	constant C_PB_MAX_BUSSES									: POSITIVE				:= 12;
	
	subtype T_PB_REGISTER_FIELD_INDEX					is NATURAL range 0 to (C_PB_MAX_REGISTER_FIELDS - 1);
	subtype T_PB_REGISTER_INDEX								is NATURAL range 0 to (C_PB_MAX_REGISTERS - 1);
	subtype T_PB_REGISTER_FIELD_MAPPING_INDEX	is NATURAL range 0 to (C_PB_MAX_REGISTER_FIELD_MAPPINGS - 1);
	subtype T_PB_PORTNUMBER_MAPPING_INDEX			is NATURAL range 0 to (C_PB_MAX_MAPPINGS - 1);
	subtype T_PB_DEVICE_INSTANCE_INDEX				is NATURAL range 0 to (C_PB_MAX_DEVICES - 1);
	subtype T_PB_BUS_INDEX										is NATURAL range 0 to (C_PB_MAX_BUSSES - 1);


	type T_PB_REGISTER_FIELD_KIND is (PB_REGISTER_FIELD_KIND_READ, PB_REGISTER_FIELD_KIND_WRITE, PB_REGISTER_FIELD_KIND_READWRITE);
	
	type T_PB_REGISTER_FIELD is record
		FieldID				: T_UINT_8;
--		FieldName			: T_PB_LONGNAME;
		FieldShort		: T_PB_SHORTNAME;
		Length				: T_UINT_8;
		AutoClear			: BOOLEAN;
		FieldKind			: T_PB_REGISTER_FIELD_KIND;
		Encoding			: STRING(1 to 256);
	end record;
	
	constant C_PB_REGISTER_FIELD_EMPTY : T_PB_REGISTER_FIELD := (
		FieldID =>		0,
--		FieldName =>	C_PB_LONGNAME_EMPTY,
		FieldShort =>	C_PB_SHORTNAME_EMPTY,
		Length =>			0,
		AutoClear =>	FALSE,
		FieldKind =>	PB_REGISTER_FIELD_KIND_READ,
		Encoding =>		(others => C_POC_NUL)
	);
	
	type T_PB_REGISTER_FIELD_VECTOR is array(NATURAL range <>) of T_PB_REGISTER_FIELD;
	type T_PB_REGISTER_FIELD_MAPPING_KIND		is (PB_REGISTER_FIELD_MAPPING_KIND_READ, PB_REGISTER_FIELD_MAPPING_KIND_WRITE, PB_REGISTER_FIELD_MAPPING_KIND_WRITEK);
	
	type T_PB_REGISTER_FIELD_GROUP is record
		FieldShort	: T_PB_SHORTNAME;
		Offset			: T_UINT_8;
		MappingKind	: T_PB_REGISTER_FIELD_MAPPING_KIND;
	end record;
	
	type T_PB_REGISTER_FIELD_GROUP_VECTOR is array(NATURAL range <>) of T_PB_REGISTER_FIELD_GROUP;
	
	type T_PB_REGISTER_FIELD_MAPPING is record
		FieldID			: T_UINT_8;
		Start				: T_UINT_8;
		Length			: T_UINT_8;
		MappingKind	: T_PB_REGISTER_FIELD_MAPPING_KIND;
	end record;
	
	type T_PB_REGISTER_FIELD_MAPPING_VECTOR is array(NATURAL range <>) of T_PB_REGISTER_FIELD_MAPPING;
	
	constant C_PB_REGISTER_FIELD_MAPPING_EMPTY : T_PB_REGISTER_FIELD_MAPPING := (
		FieldID =>			255,
		Start =>				0,
		Length =>				0,
		MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_READ
	);
	
	type T_PB_REGISTER_KIND is (PB_REGISTER_KIND_READ, PB_REGISTER_KIND_WRITE, PB_REGISTER_KIND_READWRITE, PB_REGISTER_KIND_WRITEK);
	
	type T_PB_REGISTER is record
--		RegisterName			: T_PB_LONGNAME;
		RegisterShort			: T_PB_SHORTNAME;
		RegisterNumber		: T_UINT_8;
		RegisterKind			: T_PB_REGISTER_KIND;
		FieldMappings			: T_PB_REGISTER_FIELD_MAPPING_VECTOR(T_PB_REGISTER_FIELD_MAPPING_INDEX);
		FieldMappingCount	: T_UINT_8;
	end record;
	
	constant C_PB_REGISTER_EMPTY : T_PB_REGISTER := (
--		RegisterName =>				C_PB_LONGNAME_EMPTY,
		RegisterShort =>			C_PB_SHORTNAME_EMPTY,
		RegisterNumber => 		255,
		RegisterKind =>				PB_REGISTER_KIND_READ,
		FieldMappings =>			(others => C_PB_REGISTER_FIELD_MAPPING_EMPTY),
		FieldMappingCount =>	0
	);
	
	type T_PB_REGISTER_VECTOR is array(NATURAL range <>) of T_PB_REGISTER;
	
	type T_PB_DEVICE is record
--		DeviceName					: T_PB_LONGNAME;
		DeviceShort					: T_PB_SHORTNAME;
		Registers						: T_PB_REGISTER_VECTOR(T_PB_REGISTER_INDEX);
		RegisterCount				: T_UINT_8;
		RegisterFields			: T_PB_REGISTER_FIELD_VECTOR(T_PB_REGISTER_FIELD_INDEX);
		RegisterFieldCount	: T_UINT_8;
		CreatesInterrupt		: BOOLEAN;
	end record;
	
	type T_PB_DEVICE_VECTOR is array (NATURAL range <>) of T_PB_DEVICE;
	
	constant C_PB_DEVICE_EMPTY : T_PB_DEVICE := (
--		DeviceName =>					C_PB_LONGNAME_EMPTY,
		DeviceShort =>				C_PB_SHORTNAME_EMPTY,
		Registers =>					(others => C_PB_REGISTER_EMPTY),
		RegisterCount =>			0,
		RegisterFields =>			(others => C_PB_REGISTER_FIELD_EMPTY),
		RegisterFieldCount =>	0,
		CreatesInterrupt =>		FALSE
	);
	
	type T_PB_MAPPING_KIND is (PB_MAPPING_KIND_EMPTY, PB_MAPPING_KIND_WRITE, PB_MAPPING_KIND_WRITEK, PB_MAPPING_KIND_READ);

	type T_PB_PORTNUMBER_MAPPING is record
		PortNumber	: T_UINT_8;
		RegID				: T_PB_REGISTER_INDEX;
		RegNumber		: T_UINT_8;
		MappingKind	: T_PB_MAPPING_KIND;
	end record;
	
	type T_PB_PORTNUMBER_MAPPING_VECTOR		is array(NATURAL range <>) of T_PB_PORTNUMBER_MAPPING;

	constant C_PB_PORTNUMBER_MAPPING_EMPTY : T_PB_PORTNUMBER_MAPPING := (
		PortNumber =>		0,
		RegID =>				0,
		RegNumber =>		0,
		MappingKind =>	PB_MAPPING_KIND_EMPTY
	);

	type T_PB_DEVICE_INSTANCE is record
--		DeviceName				: T_PB_LONGNAME;
		DeviceShort				: T_PB_SHORTNAME;
		Device						: T_PB_DEVICE;
		BusShort					: T_PB_SHORTNAME;
		MappingCount			: T_PB_PORTNUMBER_MAPPING_INDEX;
		Mappings					: T_PB_PORTNUMBER_MAPPING_VECTOR(T_PB_PORTNUMBER_MAPPING_INDEX);
	end record;
	
	type T_PB_DEVICE_DESCRIPTION is record
		DeviceShort					: T_PB_SHORTNAME;
		BusShort						: T_PB_SHORTNAME;
		ReadMappings				: T_PB_PORTNUMBER_MAPPING_VECTOR(T_PB_PORTNUMBER_MAPPING_INDEX);
		ReadMappingCount		: T_PB_PORTNUMBER_MAPPING_INDEX;
		WriteMappings				: T_PB_PORTNUMBER_MAPPING_VECTOR(T_PB_PORTNUMBER_MAPPING_INDEX);
		WriteMappingCount		: T_PB_PORTNUMBER_MAPPING_INDEX;
		WriteKMappings			: T_PB_PORTNUMBER_MAPPING_VECTOR(T_PB_PORTNUMBER_MAPPING_INDEX);
		WriteKMappingCount	: T_PB_PORTNUMBER_MAPPING_INDEX;
	end record;

	type T_PB_DEVICE_INSTANCE_VECTOR	is array (NATURAL range <>) of T_PB_DEVICE_INSTANCE;

	constant C_PB_DEVICE_INSTANCE_EMPTY : T_PB_DEVICE_INSTANCE := (
--		DeviceName =>		C_PB_LONGNAME_EMPTY,
		DeviceShort =>	C_PB_SHORTNAME_EMPTY,
		Device =>				C_PB_DEVICE_EMPTY,
		BusShort =>			C_PB_SHORTNAME_EMPTY,
		MappingCount =>	0,
		Mappings =>			(others => C_PB_PORTNUMBER_MAPPING_EMPTY)
	);

	function pb_CreateReadonlyField(NameLong : STRING; NameShort : STRING; Length : T_UINT_8; Encoding : STRING := ""; AutoClear : BOOLEAN := FALSE) return T_PB_REGISTER_FIELD;
	function pb_CreateWriteonlyField(NameLong : STRING; NameShort : STRING; Length : T_UINT_8; Encoding : STRING := ""; AutoClear : BOOLEAN := FALSE) return T_PB_REGISTER_FIELD;
	function pb_CreateRegisterField(NameLong : STRING; NameShort : STRING; Length : T_UINT_8; Encoding : STRING := ""; AutoClear : BOOLEAN := FALSE) return T_PB_REGISTER_FIELD;
	function pb_EnumerateRegisterFields(RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR) return T_PB_REGISTER_FIELD_VECTOR;
	function pb_GetRegisterFieldID(RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; NameShort : STRING) return T_UINT_8;
	function pb_GetRegisterField(RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; NameShort : STRING) return T_PB_REGISTER_FIELD;
	
	function pb_CreateRegisterRO(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER;
	function pb_CreateRegisterRW(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER_VECTOR;
	function pb_CreateRegisterWO(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER;
	function pb_CreateRegisterKO(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER;
	function pb_CreateRegisterWK(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER_VECTOR;
	function pb_CreateRegisterRWK(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER_VECTOR;
	function pb_CreateCombinedRegister(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterFields : T_PB_REGISTER_FIELD_GROUP_VECTOR) return T_PB_REGISTER;
	function pb_CreateDevice(DeviceName : STRING; DeviceShort : STRING; Registers : T_PB_REGISTER_VECTOR; RegisterFields : T_PB_REGISTER_FIELD_VECTOR; CreatesInterrupt : BOOLEAN := FALSE) return T_PB_DEVICE;
	function pb_CreateDeviceAlias(Device : T_PB_DEVICE; AliasName : STRING) return T_PB_DEVICE;
	function pb_CreateDeviceInstance(Device : T_PB_DEVICE;																				BusShort : STRING; MappingStart : T_UINT_8; KMappingStart : T_UINT_8 := T_UINT_8'high) return T_PB_DEVICE_INSTANCE;
	function pb_CreateDeviceInstance(Device : T_PB_DEVICE; InstanceNumber : T_UINT_8;							BusShort : STRING; MappingStart : T_UINT_8; KMappingStart : T_UINT_8 := T_UINT_8'high) return T_PB_DEVICE_INSTANCE;
	function pb_CreateDeviceInstance(Device : T_PB_DEVICE; NameLong : STRING; NameShort : STRING;	BusShort : STRING; MappingStart : T_UINT_8; KMappingStart : T_UINT_8 := T_UINT_8'high) return T_PB_DEVICE_INSTANCE;
	function pb_GetDeviceInstance(DeviceInstances : T_PB_DEVICE_INSTANCE_VECTOR; NameShort : STRING) return T_PB_DEVICE_INSTANCE;

	subtype T_PB_BUSID				is NATURAL range 0 to 31;
	subtype T_PB_DEVICEID			is NATURAL range 0 to 127;
	type T_PB_BUSID_VECTOR		is array (NATURAL range <>) of T_PB_BUSID;
	type T_PB_DEVICEID_VECTOR	is array (NATURAL range <>) of T_PB_DEVICEID;

	type T_PB_BUS is record
--		BusName						: T_PB_LONGNAME;
		BusShort					: T_PB_SHORTNAME;
		SuperBusShort			: T_PB_SHORTNAME;
		SuperBusID				: T_PB_BUSID;
		SubBusses					:	T_PB_BUSID_VECTOR(0 to 7);
		SubBusCount				: NATURAL range 0 to 8;
		Devices						: T_PB_DEVICEID_VECTOR(0 to 31);
		DeviceCount				: NATURAL range 0 to 32;
		TotalDeviceCount	: T_UINT_8;
	end record;
	
	type T_PB_BUS_VECTOR is array (NATURAL range <>) of T_PB_BUS;

	constant C_PB_BUS_EMPTY : T_PB_BUS := (
--		BusName =>					C_PB_LONGNAME_EMPTY,
		BusShort =>					C_PB_SHORTNAME_EMPTY,
		SuperBusShort =>		C_PB_SHORTNAME_EMPTY,
		SuperBusID =>				0,
		SubBusses =>				(others => 0),
		SubBusCount =>			0,
		Devices =>					(others => 0),
		DeviceCount =>			0,
		TotalDeviceCount =>	0
	);

	function pb_CreateBus(BusName : STRING; BusShort : STRING; SuperBusShort : STRING) return T_PB_BUS;
	function pb_ConnectBusses(Busses : T_PB_BUS_VECTOR) return T_PB_BUS_VECTOR;

	type T_PB_SYSTEM is record
--		SystemName					: T_PB_LONGNAME;
		SystemShort					: T_PB_SHORTNAME;
		DeviceInstanceCount	: T_PB_DEVICE_INSTANCE_INDEX;
		DeviceInstances			: T_PB_DEVICE_INSTANCE_VECTOR(T_PB_DEVICE_INSTANCE_INDEX);
		BusCount						: T_PB_BUS_INDEX;
		Busses							: T_PB_BUS_VECTOR(T_PB_BUS_INDEX);
	end record;

	function pb_CreateSystem(SystemName : STRING; SystemShort : STRING; Busses : T_PB_BUS_VECTOR; DeviceInstances : T_PB_DEVICE_INSTANCE_VECTOR) return T_PB_SYSTEM;
	function pb_GetDeviceInstance(System : T_PB_SYSTEM; NameShort : STRING) return T_PB_DEVICE_INSTANCE;
	function pb_GetDeviceDescription(System : T_PB_SYSTEM; NameShort : STRING) return T_PB_DEVICE_DESCRIPTION;


	function pb_Resize(RegisterMapping : T_PB_REGISTER_FIELD_MAPPING; Size : NATURAL := 0) return T_PB_REGISTER_FIELD_MAPPING_VECTOR;
	function pb_Resize(RegisterField : T_PB_REGISTER_FIELD; Size : NATURAL := 0) return T_PB_REGISTER_FIELD_VECTOR;
	function pb_Resize(Reg : T_PB_REGISTER; Size : NATURAL := 0) return T_PB_REGISTER_VECTOR;
	
	function pb_ResizeVec(RegisterMappings : T_PB_REGISTER_FIELD_MAPPING_VECTOR; Size : NATURAL := 0) return T_PB_REGISTER_FIELD_MAPPING_VECTOR;
	function pb_ResizeVec(RegisterFields : T_PB_REGISTER_FIELD_VECTOR; Size : NATURAL := 0) return T_PB_REGISTER_FIELD_VECTOR;
	function pb_ResizeVec(Registers : T_PB_REGISTER_VECTOR; Size : NATURAL := 0) return T_PB_REGISTER_VECTOR;
	function pb_ResizeVec(Busses : T_PB_BUS_VECTOR; Size : NATURAL := 0) return T_PB_BUS_VECTOR;
	function pb_ResizeVec(Mappings : T_PB_PORTNUMBER_MAPPING_VECTOR; Size : NATURAL := 0) return T_PB_PORTNUMBER_MAPPING_VECTOR;
	function pb_ResizeVec(DeviceInstances : T_PB_DEVICE_INSTANCE_VECTOR; Size : NATURAL := 0) return T_PB_DEVICE_INSTANCE_VECTOR;
	
	-- PicoBlaze interrupt functions
	function pb_GetInterruptCount(System : T_PB_SYSTEM) return NATURAL;
	function pb_GetInterruptPortIndex(System : T_PB_SYSTEM; DeviceShort : STRING) return NATURAL;
	function pb_GetInterruptVector(PicoBlazeBus : T_PB_IOBUS_DEV_PB_VECTOR; System : T_PB_SYSTEM) return STD_LOGIC_VECTOR;
	function pb_GetInterruptMessages(PicoBlazeBus : T_PB_IOBUS_DEV_PB_VECTOR; System : T_PB_SYSTEM) return T_SLVV_8;
	procedure pb_AssignInterruptAck(signal Output : inout T_PB_IOBUS_PB_DEV_VECTOR; Input : STD_LOGIC_VECTOR; System : T_PB_SYSTEM);
	
	-- PicoBlaze AddressDecoder functions
	function pb_FilterMappings(DeviceInstance : T_PB_DEVICE_INSTANCE; MappingKind : T_PB_MAPPING_KIND) return T_PB_PORTNUMBER_MAPPING_VECTOR;
	
	-- PicoBlaze bus functions
	function pb_GetBusIndex(System : T_PB_SYSTEM; DeviceShort : STRING) return NATURAL;
	function pb_GetBusWidth(System : T_PB_SYSTEM; BusShort : STRING) return NATURAL;
	function pb_GetSubOrdinateBus(Input : T_PB_IOBUS_PB_DEV_VECTOR; System : T_PB_SYSTEM; BusShort : STRING) return T_PB_IOBUS_PB_DEV_VECTOR;
	procedure pb_AssignSubOrdinateBus(signal Output : inout T_PB_IOBUS_DEV_PB_VECTOR; Input : T_PB_IOBUS_DEV_PB_VECTOR; System : T_PB_SYSTEM; BusShort : STRING);
	
	impure function pb_PrintAddressMapping(System : T_PB_SYSTEM) return BOOLEAN;
	impure function pb_PrintBusses(System : T_PB_SYSTEM) return BOOLEAN;
	impure function pb_ExportAddressMappingAsAssemblerConstants(System : T_PB_SYSTEM; psmFileName : STRING) return BOOLEAN;
	impure function pb_ExportAddressMappingAsAssemblerInterruptVector(System : T_PB_SYSTEM; psmFileName : STRING; TableRows : POSITIVE) return BOOLEAN;
	impure function pb_ExportAddressMappingAsChipScopeTokens(System : T_PB_SYSTEM; tokenFileName : STRING) return BOOLEAN;
end package;


package body pb is
	-- private functions (must be declared before public functions)
	-- ===========================================================================
--	function pb_LongName(name : STRING) return T_PB_LONGNAME is
--	begin
--		return resize(name, C_PB_MAX_LONGNAME_LENGTH);
--	end function;
	
	function pb_ShortName(name : STRING) return T_PB_SHORTNAME is
	begin
		return resize(name, C_PB_MAX_SHORTNAME_LENGTH);
	end function;

	-- public functions
	-- ===========================================================================
	function pb_CreateReadonlyField(NameLong : STRING; NameShort : STRING; Length : T_UINT_8; Encoding : STRING := ""; AutoClear : BOOLEAN := FALSE) return T_PB_REGISTER_FIELD is
		variable Result : T_PB_REGISTER_FIELD;
	begin
--		Result.FieldName	:= pb_LongName(NameLong);
		Result.FieldShort	:= pb_ShortName(NameShort);
		Result.Length			:= Length;
		Result.FieldKind	:= PB_REGISTER_FIELD_KIND_READ;
		Result.AutoClear	:= AutoClear;
		Result.Encoding		:= resize(Encoding, Result.Encoding'length);
		return Result;
	end function;
	
	function pb_CreateWriteonlyField(NameLong : STRING; NameShort : STRING; Length : T_UINT_8; Encoding : STRING := ""; AutoClear : BOOLEAN := FALSE) return T_PB_REGISTER_FIELD is
		variable Result : T_PB_REGISTER_FIELD;
	begin
--		Result.FieldName	:= pb_LongName(NameLong);
		Result.FieldShort	:= pb_ShortName(NameShort);
		Result.Length			:= Length;
		Result.FieldKind	:= PB_REGISTER_FIELD_KIND_WRITE;
		Result.AutoClear	:= AutoClear;
		Result.Encoding		:= resize(Encoding, Result.Encoding'length);
		return Result;
	end function;
	
	function pb_CreateRegisterField(NameLong : STRING; NameShort : STRING; Length : T_UINT_8; Encoding : STRING := ""; AutoClear : BOOLEAN := FALSE) return T_PB_REGISTER_FIELD is
		variable Result : T_PB_REGISTER_FIELD;
	begin
--		Result.FieldName	:= pb_LongName(NameLong);
		Result.FieldShort	:= pb_ShortName(NameShort);
		Result.Length			:= Length;
		Result.FieldKind	:= PB_REGISTER_FIELD_KIND_READWRITE;
		Result.AutoClear	:= AutoClear;
		Result.Encoding		:= resize(Encoding, Result.Encoding'length);
		return Result;
	end function;
	
	function pb_EnumerateRegisterFields(RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR) return T_PB_REGISTER_FIELD_VECTOR is
		variable Result		: T_PB_REGISTER_FIELD_VECTOR(RegisterFieldList'range);
	begin
		for i in RegisterFieldList'range loop
			Result(i)					:= RegisterFieldList(i);
			Result(i).FieldID	:= i;
		end loop;
		return Result;
	end function;
	
	function pb_GetRegisterFieldID(RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; NameShort : STRING) return T_UINT_8 is
	begin
		for i in RegisterFieldList'range loop
			next when (not str_match(RegisterFieldList(i).FieldShort, NameShort));
			return i;
		end loop;
		report "RegisterField '" & str_trim(NameShort) & "' does not exist!" severity FAILURE;
	end function;

	function pb_GetRegisterField(RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; NameShort : STRING) return T_PB_REGISTER_FIELD is
	begin
		return RegisterFieldList(pb_GetRegisterFieldID(RegisterFieldList, NameShort));
	end function;
	
	function pb_CreateRegisterRO(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER is
		constant RegisterFields		: T_PB_REGISTER_FIELD_VECTOR	:= pb_EnumerateRegisterFields(RegisterFieldList);
		constant RegisterField 		: T_PB_REGISTER_FIELD 				:= pb_GetRegisterField(RegisterFields, RegisterNameShort);
		variable Result 					: T_PB_REGISTER;
		
		constant REPORT_PREFIX		: STRING											:= ite((PB_REPORT and not PB_VERBOSE), "pb_CreateRegisterRO: ", "  ");
	begin
		if (RegisterField.FieldKind /= PB_REGISTER_FIELD_KIND_READ) then
			report "pb_CreateRegisterRO: Given RegisterField '" & str_trim(RegisterNameShort) & "' is not RO, but should be translated into a READ register." severity FAILURE;
		end if;
		
		if (PB_VERBOSE = TRUE) then
			report "pb_CreateRegisterRO:" severity NOTE;
			report "  RegisterFieldList: Count=" & INTEGER'image(RegisterFieldList'length) severity NOTE;
				for i in RegisterFields'range loop
				report "    " & INTEGER'image(i) & ": " & str_trim(RegisterFields(i).FieldShort) severity NOTE;
			end loop;
		end if;
		
		if (PB_REPORT = TRUE) then
			report REPORT_PREFIX & "Creating register '" & str_trim(NameShort) & "' @RegNum " & INTEGER'image(RegisterNumber) & " from field: '" & str_trim(RegisterField.FieldShort) & "'" severity NOTE;			
		end if;
		
--		Result.RegisterName			:= pb_LongName(NameShort);
		Result.RegisterShort		:= pb_ShortName(NameShort);
		Result.RegisterNumber		:= RegisterNumber;
		Result.RegisterKind			:= PB_REGISTER_KIND_READ;
		Result.FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_READ));
	
		return Result;
	end function;
	
	function pb_CreateRegisterRW(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER_VECTOR is
		constant RegisterFields		: T_PB_REGISTER_FIELD_VECTOR	:= pb_EnumerateRegisterFields(RegisterFieldList);
		constant RegisterField 		: T_PB_REGISTER_FIELD 				:= pb_GetRegisterField(RegisterFields, RegisterNameShort);
		variable Result 					: T_PB_REGISTER_VECTOR(0 to 1);
	begin
		if (RegisterField.FieldKind /= PB_REGISTER_FIELD_KIND_READWRITE) then
			report "pb_CreateRegisterRW: Given RegisterField '" & str_trim(RegisterNameShort) & "' is not RW, but should be translated into a READ and a WRITE register." severity FAILURE;
		end if;
	
		if ((PB_VERBOSE or PB_REPORT) = TRUE) then
			report "pb_CreateRegisterRW: Creating register '" & str_trim(NameShort) & "' @RegNum " & INTEGER'image(RegisterNumber) & " from field: '" & str_trim(RegisterField.FieldShort) & "'" severity NOTE;
		end if;
	
--		Result(0).RegisterName		:= pb_LongName(NameShort);
		Result(0).RegisterShort		:= pb_ShortName(NameShort);
		Result(0).RegisterNumber	:= RegisterNumber;
		Result(0).RegisterKind		:= PB_REGISTER_KIND_READ;
		Result(0).FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_READ));
				
--		Result(1).RegisterName		:= pb_LongName(NameShort);
		Result(1).RegisterShort		:= pb_ShortName(NameShort);
		Result(1).RegisterNumber	:= RegisterNumber;
		Result(1).RegisterKind		:= PB_REGISTER_KIND_WRITE;
		Result(1).FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_WRITE));
		
		return Result;
	end function;
	
	function pb_CreateRegisterWO(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER is
		constant RegisterFields	: T_PB_REGISTER_FIELD_VECTOR	:= pb_EnumerateRegisterFields(RegisterFieldList);
		constant RegisterField 	: T_PB_REGISTER_FIELD 				:= pb_GetRegisterField(RegisterFields, RegisterNameShort);
		variable Result					: T_PB_REGISTER;
	begin
		if (RegisterField.FieldKind /= PB_REGISTER_FIELD_KIND_WRITE) then
			report "pb_CreateRegisterRO: Given RegisterField '" & str_trim(RegisterNameShort) & "' is not WO, but shall be translated into a WRITE register." severity FAILURE;
		end if;
	
		if ((PB_VERBOSE or PB_REPORT) = TRUE) then
			report "pb_CreateRegisterWO: Creating register '" & str_trim(NameShort) & "' @RegNum " & INTEGER'image(RegisterNumber) & " from field: '" & str_trim(RegisterField.FieldShort) & "'" severity NOTE;
		end if;
	
--		Result.RegisterName			:= pb_LongName(NameShort);
		Result.RegisterShort		:= pb_ShortName(NameShort);
		Result.RegisterNumber		:= RegisterNumber;
		Result.RegisterKind			:= PB_REGISTER_KIND_WRITE;
		Result.FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_READ));
		
		return Result;
	end function;
	
	function pb_CreateRegisterKO(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER is
		constant RegisterFields	: T_PB_REGISTER_FIELD_VECTOR	:= pb_EnumerateRegisterFields(RegisterFieldList);
		constant RegisterField 	: T_PB_REGISTER_FIELD 				:= pb_GetRegisterField(RegisterFields, RegisterNameShort);
		variable Result					: T_PB_REGISTER;
	begin
		if (RegisterField.FieldKind = PB_REGISTER_FIELD_KIND_READ) then
			report "pb_CreateRegisterK: Given RegisterField '" & str_trim(RegisterNameShort) & "' is not WO or RW, but should be translated into a WRITE register." severity FAILURE;
		end if;
	
		if ((PB_VERBOSE or PB_REPORT) = TRUE) then
			report "pb_CreateRegisterKO: Creating register '" & str_trim(NameShort) & "' @RegNum " & INTEGER'image(RegisterNumber) & " from field: '" & str_trim(RegisterField.FieldShort) & "'" severity NOTE;
		end if;
	
--		Result.RegisterName			:= pb_LongName(NameShort);
		Result.RegisterShort		:= pb_ShortName(NameShort);
		Result.RegisterNumber		:= RegisterNumber;
		Result.RegisterKind			:= PB_REGISTER_KIND_WRITEK;
		Result.FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_WRITEK));

		return Result;
	end function;

	function pb_CreateRegisterWK(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER_VECTOR is
		constant RegisterFields		: T_PB_REGISTER_FIELD_VECTOR	:= pb_EnumerateRegisterFields(RegisterFieldList);
		constant RegisterField 		: T_PB_REGISTER_FIELD 				:= pb_GetRegisterField(RegisterFields, RegisterNameShort);
		variable Result 					: T_PB_REGISTER_VECTOR(0 to 1);
	begin
		if (RegisterField.FieldKind = PB_REGISTER_FIELD_KIND_READ) then
			report "pb_CreateRegisterRW: Given RegisterField '" & str_trim(RegisterNameShort) & "' is not WO, but should be translated into a WRITE register." severity FAILURE;
		end if;
	
		if ((PB_VERBOSE or PB_REPORT) = TRUE) then
			report "pb_CreateRegisterWK: Creating register '" & str_trim(NameShort) & "' @RegNum " & INTEGER'image(RegisterNumber) & " from field: '" & str_trim(RegisterField.FieldShort) & "'" severity NOTE;
		end if;
	
--		Result(0).RegisterName		:= pb_LongName(NameShort);
		Result(0).RegisterShort		:= pb_ShortName(NameShort);
		Result(0).RegisterNumber	:= RegisterNumber;
		Result(0).RegisterKind		:= PB_REGISTER_KIND_WRITE;
		Result(0).FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_WRITE));
				
--		Result(1).RegisterName		:= pb_LongName(NameShort);
		Result(1).RegisterShort		:= pb_ShortName(NameShort);
		Result(1).RegisterNumber	:= RegisterNumber;
		Result(1).RegisterKind		:= PB_REGISTER_KIND_WRITEK;
		Result(1).FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_WRITEK));
		
		return Result;
	end function;

	function pb_CreateRegisterRWK(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterNameShort : STRING; Offset : T_UINT_8 := 0) return T_PB_REGISTER_VECTOR is
		constant RegisterFields		: T_PB_REGISTER_FIELD_VECTOR	:= pb_EnumerateRegisterFields(RegisterFieldList);
		constant RegisterField 		: T_PB_REGISTER_FIELD 				:= pb_GetRegisterField(RegisterFields, RegisterNameShort);
		variable Result 					: T_PB_REGISTER_VECTOR(0 to 2);
	begin
		if ((PB_VERBOSE or PB_REPORT) = TRUE) then
			report "pb_CreateRegisterRWK: Creating register '" & str_trim(NameShort) & "' @RegNum " & INTEGER'image(RegisterNumber) & " from field: '" & str_trim(RegisterField.FieldShort) & "'" severity NOTE;
		end if;
	
--		Result(0).RegisterName		:= pb_LongName(NameShort);
		Result(0).RegisterShort		:= pb_ShortName(NameShort);
		Result(0).RegisterNumber	:= RegisterNumber;
		Result(0).RegisterKind		:= PB_REGISTER_KIND_READ;
		Result(0).FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_READ));

--		Result(1).RegisterName		:= pb_LongName(NameShort);
		Result(1).RegisterShort		:= pb_ShortName(NameShort);
		Result(1).RegisterNumber	:= RegisterNumber;
		Result(1).RegisterKind		:= PB_REGISTER_KIND_WRITE;
		Result(1).FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_WRITE));
				
--		Result(2).RegisterName		:= pb_LongName(NameShort);
		Result(2).RegisterShort		:= pb_ShortName(NameShort);
		Result(2).RegisterNumber	:= RegisterNumber;
		Result(2).RegisterKind		:= PB_REGISTER_KIND_WRITEK;
		Result(2).FieldMappings		:= pb_Resize((
			FieldID =>			RegisterField.FieldID,
			Start =>				Offset,
			Length =>				RegisterField.Length,
			MappingKind =>	PB_REGISTER_FIELD_MAPPING_KIND_WRITEK));
		
		return Result;
	end function;

	function pb_CreateCombinedRegister(NameShort : STRING; RegisterNumber : T_UINT_8; RegisterFieldList : T_PB_REGISTER_FIELD_VECTOR; RegisterFields : T_PB_REGISTER_FIELD_GROUP_VECTOR) return T_PB_REGISTER is
		variable Result					: T_PB_REGISTER;
		variable RegisterField 	: T_PB_REGISTER_FIELD;
	begin
--		Result.RegisterName			:= pb_LongName(NameShort);
		Result.RegisterShort		:= pb_ShortName(NameShort);
		Result.RegisterNumber		:= RegisterNumber;
		
		for i in RegisterFields'range loop
			RegisterField 		:= pb_GetRegisterField(RegisterFieldList, RegisterFields(i).FieldShort);

			Result.FieldMappings(i)	:= (
				FieldID =>			pb_GetRegisterFieldID(RegisterFieldList, RegisterField.FieldShort),
				Start =>				RegisterFields(i).Offset,
				Length =>				RegisterField.Length,
				MappingKind =>	RegisterFields(i).MappingKind);
			Result.FieldMappingCount := RegisterFields'length;
				
			if (Result.RegisterKind = PB_REGISTER_KIND_READ) then
				if (RegisterFields(i).MappingKind = PB_REGISTER_FIELD_MAPPING_KIND_WRITE) then
					Result.RegisterKind := PB_REGISTER_KIND_READWRITE;
				elsif (RegisterFields(i).MappingKind = PB_REGISTER_FIELD_MAPPING_KIND_WRITEK) then
					Result.RegisterKind := PB_REGISTER_KIND_READWRITE;
				end if;
			elsif (Result.RegisterKind = PB_REGISTER_KIND_WRITE) then
				if (RegisterFields(i).MappingKind = PB_REGISTER_FIELD_MAPPING_KIND_READ) then
					Result.RegisterKind := PB_REGISTER_KIND_READWRITE;
				end if;
			elsif (Result.RegisterKind = PB_REGISTER_KIND_WRITEK) then
				if (RegisterFields(i).MappingKind = PB_REGISTER_FIELD_MAPPING_KIND_READ) then
					Result.RegisterKind := PB_REGISTER_KIND_READWRITE;
				end if;
			end if;
		end loop;
		
		return Result;
	end function;

	-- private function
	function pb_CreateMapping(Device : T_PB_DEVICE; MappingStart : T_UINT_8; KMappingStart : T_UINT_8 := T_UINT_8'high) return T_PB_PORTNUMBER_MAPPING_VECTOR is
		variable Result					: T_PB_PORTNUMBER_MAPPING_VECTOR(T_PB_PORTNUMBER_MAPPING_INDEX);
		variable Reg						: T_PB_REGISTER;
		variable j							: T_UINT_8;
	begin
		Result := (others => C_PB_PORTNUMBER_MAPPING_EMPTY);
		if ((PB_VERBOSE or PB_REPORT) = TRUE) then
			report "Creating PortNumber mapping for device " & str_trim(Device.DeviceShort) & " with " & INTEGER'image(Device.RegisterCount) & " registers:" severity NOTE;
		end if;
	
		j := 0;
		for i in 0 to Device.RegisterCount - 1 loop
			Reg := Device.Registers(i);
			
			case Reg.RegisterKind is
				when PB_REGISTER_KIND_READ =>
					if ((PB_VERBOSE or PB_REPORT) = TRUE) then
						report "  Mapping PortNumber " & INTEGER'image(MappingStart + Reg.RegisterNumber) & " to register " & INTEGER'image(Reg.RegisterNumber) & " (" & str_trim(Reg.RegisterShort) & ") as readable" severity NOTE;
					end if;
					Result(j)			:= (
						PortNumber =>		MappingStart + Reg.RegisterNumber,
						RegID =>				i,
						RegNumber =>		Reg.RegisterNumber,
						MappingKind =>	PB_MAPPING_KIND_READ
					);
					j := j + 1;
					
				when PB_REGISTER_KIND_READWRITE =>
					if ((PB_VERBOSE or PB_REPORT) = TRUE) then
						report "  Mapping PortNumber " & INTEGER'image(MappingStart + Reg.RegisterNumber) & " to register " & INTEGER'image(Reg.RegisterNumber) & " (" & str_trim(Reg.RegisterShort) & ") as read/writeable" severity NOTE;
					end if;
					Result(j)			:= (
						PortNumber =>		MappingStart + Reg.RegisterNumber,
						RegID =>				i,
						RegNumber =>		Reg.RegisterNumber,
						MappingKind =>	PB_MAPPING_KIND_READ
					);
					Result(j + 1)	:= (
						PortNumber =>		MappingStart + Reg.RegisterNumber,
						RegID =>				i,
						RegNumber =>		Reg.RegisterNumber,
						MappingKind =>	PB_MAPPING_KIND_WRITE
					);
					j := j + 2;
					
				when PB_REGISTER_KIND_WRITE =>
					if ((PB_VERBOSE or PB_REPORT) = TRUE) then
						report "  Mapping PortNumber " & INTEGER'image(MappingStart + Reg.RegisterNumber) & " to register " & INTEGER'image(Reg.RegisterNumber) & " (" & str_trim(Reg.RegisterShort) & ") as writeable" severity NOTE;
					end if;
					Result(j)			:= (
						PortNumber =>		MappingStart + Reg.RegisterNumber,
						RegID =>				i,
						RegNumber =>		Reg.RegisterNumber,
						MappingKind =>	PB_MAPPING_KIND_WRITE
					);
					j := j + 1;
				
				when PB_REGISTER_KIND_WRITEK =>
					if ((PB_VERBOSE or PB_REPORT) = TRUE) then
						report "  Mapping PortNumber " & INTEGER'image(KMappingStart + Reg.RegisterNumber) & " to register " & INTEGER'image(Reg.RegisterNumber) & " (" & str_trim(Reg.RegisterShort) & ") as K-writeable" severity NOTE;
					end if;
					Result(j)			:= (
						PortNumber =>		KMappingStart + Reg.RegisterNumber,
						RegID =>				i,
						RegNumber =>		Reg.RegisterNumber,
						MappingKind =>	PB_MAPPING_KIND_WRITEK
					);
					j := j + 1;
				
				if (j > C_PB_MAX_MAPPINGS) then
					report "pb_CreateMapping: Too many mappings created." severity FAILURE;
				end if;
			end case;
		end loop;

		return Result(0 to j - 1);
	end function;
	
	function pb_CreateDevice(DeviceName : STRING; DeviceShort : STRING; Registers : T_PB_REGISTER_VECTOR; RegisterFields : T_PB_REGISTER_FIELD_VECTOR; CreatesInterrupt : BOOLEAN := FALSE) return T_PB_DEVICE is
		variable Result						: T_PB_DEVICE;
	begin
--		Result.DeviceName					:= pb_LongName(DeviceName);
		Result.DeviceShort				:= pb_ShortName(DeviceShort);
		Result.Registers					:= pb_ResizeVec(Registers);
		Result.RegisterCount			:= Registers'length;
		Result.RegisterFields			:= pb_ResizeVec(RegisterFields);
		Result.RegisterFieldCount	:= RegisterFields'length;
		Result.CreatesInterrupt		:= CreatesInterrupt;
		return Result;
	end function;
	
	function pb_CreateDeviceAlias(Device : T_PB_DEVICE; AliasName : STRING) return T_PB_DEVICE is
		variable Result			: T_PB_DEVICE;
	begin
		Result							:= Device;
		Result.DeviceShort	:= pb_ShortName(AliasName);
		return Result;
	end function;
	
	function pb_CreateDeviceInstance(Device : T_PB_DEVICE; BusShort : STRING; MappingStart : T_UINT_8; KMappingStart : T_UINT_8 := T_UINT_8'high) return T_PB_DEVICE_INSTANCE is
		constant Mappings		: T_PB_PORTNUMBER_MAPPING_VECTOR		:= pb_CreateMapping(Device, MappingStart, KMappingStart);
		variable Result			: T_PB_DEVICE_INSTANCE;
	begin
--		Result.DeviceName		:= Device.DeviceName;
		Result.DeviceShort	:= Device.DeviceShort;
		Result.Device				:= Device;
		Result.BusShort			:= pb_ShortName(BusShort);
		Result.MappingCount	:= Mappings'length;
		Result.Mappings			:= pb_ResizeVec(Mappings);
		return Result;
	end function;
	
	function pb_CreateDeviceInstance(Device : T_PB_DEVICE; InstanceNumber : T_UINT_8; BusShort : STRING; MappingStart : T_UINT_8; KMappingStart : T_UINT_8 := T_UINT_8'high) return T_PB_DEVICE_INSTANCE is
		constant Mappings		: T_PB_PORTNUMBER_MAPPING_VECTOR		:= pb_CreateMapping(Device, MappingStart, KMappingStart);
		variable Result			: T_PB_DEVICE_INSTANCE;
	begin
--		Result.DeviceName		:= pb_LongName(str_trim(Device.DeviceName) & INTEGER'image(InstanceNumber));
		Result.DeviceShort	:= pb_ShortName(str_trim(Device.DeviceShort) & INTEGER'image(InstanceNumber));
		Result.Device				:= Device;
		Result.BusShort			:= pb_ShortName(BusShort);
		Result.MappingCount	:= Mappings'length;
		Result.Mappings			:= pb_ResizeVec(Mappings);
		return Result;
	end function;
	
	function pb_CreateDeviceInstance(Device : T_PB_DEVICE; NameLong : STRING; NameShort : STRING; BusShort : STRING; MappingStart : T_UINT_8; KMappingStart : T_UINT_8 := T_UINT_8'high) return T_PB_DEVICE_INSTANCE is
		constant Mappings		: T_PB_PORTNUMBER_MAPPING_VECTOR		:= pb_CreateMapping(Device, MappingStart, KMappingStart);
		variable Result			: T_PB_DEVICE_INSTANCE;
	begin
--		Result.DeviceName		:= pb_LongName(NameLong);
		Result.DeviceShort	:= pb_ShortName(NameShort);
		Result.Device				:= Device;
		Result.BusShort			:= pb_ShortName(BusShort);
		Result.MappingCount	:= Mappings'length;
		Result.Mappings			:= pb_ResizeVec(Mappings);
		return Result;
	end function;

	function pb_GetDeviceInstanceID(DeviceInstances : T_PB_DEVICE_INSTANCE_VECTOR; NameShort : STRING) return T_PB_DEVICE_INSTANCE_INDEX is
	begin
		for i in DeviceInstances'range loop
			next when (not str_match(DeviceInstances(i).DeviceShort, NameShort));
			return i;
		end loop;
		report "Device '" & str_trim(NameShort) & "' does not exist!" severity FAILURE;
	end function;
	
	function pb_GetDeviceInstanceID(System : T_PB_SYSTEM; NameShort : STRING) return T_PB_DEVICE_INSTANCE_INDEX is
	begin
		for i in 0 to System.DeviceInstanceCount - 1 loop
			next when (not str_match(System.DeviceInstances(i).DeviceShort, NameShort));
			return i;
		end loop;
		report "Device '" & str_trim(NameShort) & "' does not exist!" severity FAILURE;
	end function;

	function pb_GetDeviceInstance(DeviceInstances : T_PB_DEVICE_INSTANCE_VECTOR; NameShort : STRING) return T_PB_DEVICE_INSTANCE is
	begin
		return DeviceInstances(pb_GetDeviceInstanceID(DeviceInstances, NameShort));
	end function;
	
	function pb_GetDeviceInstance(System : T_PB_SYSTEM; NameShort : STRING) return T_PB_DEVICE_INSTANCE is
	begin
		return System.DeviceInstances(pb_GetDeviceInstanceID(System, NameShort));
	end function;
	
	function pb_GetDeviceDescription(System : T_PB_SYSTEM; NameShort : STRING) return T_PB_DEVICE_DESCRIPTION is
		constant DeviceInstance		: T_PB_DEVICE_INSTANCE						:= System.DeviceInstances(pb_GetDeviceInstanceID(System, NameShort));
		constant ReadMappings			: T_PB_PORTNUMBER_MAPPING_VECTOR	:= pb_FilterMappings(DeviceInstance, PB_MAPPING_KIND_READ);
		constant WriteMappings		: T_PB_PORTNUMBER_MAPPING_VECTOR	:= pb_FilterMappings(DeviceInstance, PB_MAPPING_KIND_WRITE);
		constant WriteKMappings		: T_PB_PORTNUMBER_MAPPING_VECTOR	:= pb_FilterMappings(DeviceInstance, PB_MAPPING_KIND_WRITEK);
		variable Result						: T_PB_DEVICE_DESCRIPTION;
	begin
		Result.DeviceShort				:= DeviceInstance.DeviceShort;
		Result.BusShort						:= DeviceInstance.BusShort;
		Result.ReadMappings				:= pb_ResizeVec(ReadMappings);
		Result.ReadMappingCount		:= ReadMappings'length;
		Result.WriteMappings			:= pb_ResizeVec(ReadMappings);
		Result.WriteMappingCount	:= WriteMappings'length;
		Result.WriteKMappings			:= pb_ResizeVec(WriteKMappings);
		Result.WriteKMappingCount	:= WriteKMappings'length;
		return Result;
	end function;
	
	function pb_CreateBus(BusName : STRING; BusShort : STRING; SuperBusShort : STRING) return T_PB_BUS is
		variable Result					: T_PB_BUS;
	begin
--		Result.BusName					:= pb_LongName(BusName);
		Result.BusShort					:= pb_ShortName(BusShort);
		Result.SuperBusShort		:= pb_ShortName(SuperBusShort);
		Result.SuperBusID				:= 0;
		Result.SubBusses				:= (others => 0);
		Result.SubBusCount			:= 0;
		Result.Devices					:= (others => 0);
		Result.DeviceCount			:= 0;
		Result.TotalDeviceCount	:= 0;
		return Result;
	end function;
	
	function pb_GetBusID(Busses : T_PB_BUS_VECTOR; BusShort : T_PB_SHORTNAME) return NATURAL is
	begin
		for i in Busses'range loop
			next when (Busses(i).BusShort /= BusShort);
			return i;
		end loop;
		report "Unknown bus name '" & str_trim(BusShort) & "'" severity failure;
	end function;

	function pb_GetBusID(System : T_PB_SYSTEM; BusShort : T_PB_SHORTNAME) return NATURAL is
	begin
		return pb_GetBusID(System.Busses(0 to System.BusCount - 1), BusShort);
	end function;
	
	function pb_ConnectBusses(Busses : T_PB_BUS_VECTOR) return T_PB_BUS_VECTOR is
		variable Result			: T_PB_BUS_VECTOR(Busses'range);
		variable SuperBusID	: T_PB_BUSID;
		variable j					: T_UINT_8;
	begin
		for i in Busses'range loop
			if (PB_VERBOSE = TRUE) then
				report "pb_ConnectBusses: Connecting bus '" & str_trim(Busses(i).BusShort) & "' to '" & str_trim(Busses(i).SuperBusShort) & "'" severity NOTE;
			end if;
			
			if (str_length(Busses(i).SuperBusShort) /= 0) then
				SuperBusID	:= pb_GetBusID(Busses, Busses(i).SuperBusShort);
			else
				SuperBusID	:= T_PB_BUSID'high;
			end if;
		
--			Result(i).BusName				:= Busses(i).BusName;
			Result(i).BusShort			:= Busses(i).BusShort;
			Result(i).SuperBusShort	:= Busses(i).SuperBusShort;
			Result(i).SuperBusID		:= SuperBusID;
			
			if (SuperBusID /= T_PB_BUSID'high) then
				j																:= Result(SuperBusID).SubBusCount;
				Result(SuperBusID).SubBusses(j)	:= i;
				Result(SuperBusID).SubBusCount	:= j + 1;
			end if;
		end loop;
		return Result;
	end function;

	function pb_GetTotalDeviceCount(Busses : T_PB_BUS_VECTOR; BusID : T_PB_BUSID) return T_UINT_8 is
		variable Result : T_UINT_8;
	begin
		Result := 0;
--		report "pb_GetTotalDeviceCount: BusID=" & INTEGER'image(BusID) severity NOTE;
		for i in 0 to Busses(BusID).SubBusCount - 1 loop
			Result := Result + pb_GetTotalDeviceCount(Busses, Busses(BusID).SubBusses(i));
		end loop;
		return Result + Busses(BusID).DeviceCount;
	end function;
	
	function pb_CreateSystem(SystemName : STRING; SystemShort : STRING; Busses : T_PB_BUS_VECTOR; DeviceInstances : T_PB_DEVICE_INSTANCE_VECTOR) return T_PB_SYSTEM is
		variable Result : T_PB_SYSTEM;
		variable BusID	: T_PB_BUSID;
		variable j			: T_UINT_8;
	begin
--		Result.SystemName						:= pb_LongName(SystemName);
		Result.SystemShort					:= pb_ShortName(SystemShort);
		Result.DeviceInstances			:= pb_ResizeVec(DeviceInstances);
		Result.DeviceInstanceCount	:= DeviceInstances'length;
		Result.Busses								:= pb_ResizeVec(Busses);
		Result.BusCount							:= Busses'length;
	
		-- connect devices to busses
		for i in DeviceInstances'range loop
			BusID															:= pb_GetBusID(Busses, DeviceInstances(i).BusShort);
			j																	:= Result.Busses(BusID).DeviceCount;
			Result.Busses(BusID).Devices(j)		:= i;
			Result.Busses(BusID).DeviceCount	:= j + 1;
		end loop;
		-- count devices on a bus
		-- TODO: rewrite recursion to local loops
		for i in 0 to Result.BusCount - 1 loop
			Result.Busses(i).TotalDeviceCount := pb_GetTotalDeviceCount(Result.Busses(0 to Result.BusCount - 1), i);
		end loop;

		return Result;
	end function;
	
	function pb_Resize(RegisterMapping : T_PB_REGISTER_FIELD_MAPPING; Size : NATURAL := 0) return T_PB_REGISTER_FIELD_MAPPING_VECTOR is
		constant high : T_UINT_8 := ite(Size /= 0, (Size - 1), T_PB_REGISTER_FIELD_MAPPING_INDEX'high);
	begin
		return RegisterMapping & T_PB_REGISTER_FIELD_MAPPING_VECTOR'(1 to high => C_PB_REGISTER_FIELD_MAPPING_EMPTY);
	end function;
	
	function pb_Resize(RegisterField : T_PB_REGISTER_FIELD; Size : NATURAL := 0) return T_PB_REGISTER_FIELD_VECTOR is
		constant high : T_UINT_8 := ite(Size /= 0, (Size - 1), T_PB_REGISTER_FIELD_INDEX'high);
	begin
		return RegisterField & T_PB_REGISTER_FIELD_VECTOR'(1 to high => C_PB_REGISTER_FIELD_EMPTY);
	end function;
	
	function pb_Resize(Reg : T_PB_REGISTER; Size : NATURAL := 0) return T_PB_REGISTER_VECTOR is
		constant high : T_UINT_8 := ite(Size /= 0, (Size - 1), T_PB_REGISTER_INDEX'high);
	begin
		return Reg & T_PB_REGISTER_VECTOR'(1 to high => C_PB_REGISTER_EMPTY);
	end function;
	
	function pb_ResizeVec(RegisterMappings : T_PB_REGISTER_FIELD_MAPPING_VECTOR; Size : NATURAL := 0) return T_PB_REGISTER_FIELD_MAPPING_VECTOR is
		constant high : T_UINT_8 := ite(Size /= 0, (Size - 1), T_PB_REGISTER_FIELD_MAPPING_INDEX'high);
	begin
		return RegisterMappings & T_PB_REGISTER_FIELD_MAPPING_VECTOR'(RegisterMappings'length to high => C_PB_REGISTER_FIELD_MAPPING_EMPTY);
	end function;
	
	function pb_ResizeVec(RegisterFields : T_PB_REGISTER_FIELD_VECTOR; Size : NATURAL := 0) return T_PB_REGISTER_FIELD_VECTOR is
		constant high : T_UINT_8 := ite(Size /= 0, (Size - 1), T_PB_REGISTER_FIELD_INDEX'high);
	begin
		return RegisterFields & T_PB_REGISTER_FIELD_VECTOR'(RegisterFields'length to high => C_PB_REGISTER_FIELD_EMPTY);
	end function;
	
	function pb_ResizeVec(Registers : T_PB_REGISTER_VECTOR; Size : NATURAL := 0) return T_PB_REGISTER_VECTOR is
		constant high : T_UINT_8 := ite(Size /= 0, (Size - 1), T_PB_REGISTER_INDEX'high);
	begin
		return Registers & T_PB_REGISTER_VECTOR'(Registers'length to high => C_PB_REGISTER_EMPTY);
	end function;

	function pb_ResizeVec(Busses : T_PB_BUS_VECTOR; Size : NATURAL := 0) return T_PB_BUS_VECTOR is
		constant high : T_UINT_8 := ite(Size /= 0, (Size - 1), T_PB_BUS_INDEX'high);
	begin
		return Busses & T_PB_BUS_VECTOR'(Busses'length to high => C_PB_BUS_EMPTY);
	end function;
	
	function pb_ResizeVec(Mappings : T_PB_PORTNUMBER_MAPPING_VECTOR; Size : NATURAL := 0) return T_PB_PORTNUMBER_MAPPING_VECTOR is
		constant high : T_UINT_8 := ite(Size /= 0, (Size - 1), T_PB_PORTNUMBER_MAPPING_INDEX'high);
	begin
		return Mappings & T_PB_PORTNUMBER_MAPPING_VECTOR'(Mappings'length to high => C_PB_PORTNUMBER_MAPPING_EMPTY);
	end function;
	
	function pb_ResizeVec(DeviceInstances : T_PB_DEVICE_INSTANCE_VECTOR; Size : NATURAL := 0) return T_PB_DEVICE_INSTANCE_VECTOR is
		constant high : T_UINT_8 := ite(Size /= 0, (Size - 1), T_PB_DEVICE_INSTANCE_INDEX'high);
	begin
		return DeviceInstances & T_PB_DEVICE_INSTANCE_VECTOR'(DeviceInstances'length to high => C_PB_DEVICE_INSTANCE_EMPTY);
	end function;
	
	-- PicoBlaze interrupt functions
	function pb_GetInterruptCount(System : T_PB_SYSTEM) return NATURAL is
		variable Result : NATURAL;
	begin
		Result := 0;
		for i in 0 to System.DeviceInstanceCount - 1 loop
			if (System.DeviceInstances(i).Device.CreatesInterrupt = TRUE) then
				Result := Result + 1;
			end if;
		end loop;
		return Result;
	end function;
	
	function pb_GetInterruptPortIndex(System : T_PB_SYSTEM; DeviceShort : STRING) return NATURAL is
		variable Result : NATURAL;
	begin
		Result := 0;
		for i in 0 to System.DeviceInstanceCount - 1 loop
			exit when str_match(System.DeviceInstances(i).DeviceShort, DeviceShort);
			Result := Result + 1;
		end loop;
		return Result;
	end function;
	
	function pb_GetInterruptVector(PicoBlazeBus : T_PB_IOBUS_DEV_PB_VECTOR; System : T_PB_SYSTEM) return STD_LOGIC_VECTOR is
		variable Result						: STD_LOGIC_VECTOR(System.DeviceInstanceCount - 1 downto 0);
		variable DeviceInstance		: T_PB_DEVICE_INSTANCE;
		variable BusIndex					: T_PB_BUSID;
		variable InterruptPortID	: T_UINT_8;
	begin
		InterruptPortID		:= 0;
		for i in 0 to System.DeviceInstanceCount - 1 loop
			DeviceInstance	:= System.DeviceInstances(i);
			BusIndex				:= pb_GetBusIndex(System, DeviceInstance.DeviceShort);
			
			if (DeviceInstance.Device.CreatesInterrupt = TRUE) then
				Result(InterruptPortID)	:= PicoBlazeBus(BusIndex).Interrupt;
				InterruptPortID					:= InterruptPortID + 1;
			end if;
		end loop;
		return Result(InterruptPortID - 1 downto 0);
	end function;

	function pb_GetInterruptMessages(PicoBlazeBus : T_PB_IOBUS_DEV_PB_VECTOR; System : T_PB_SYSTEM) return T_SLVV_8 is
		variable Result						: T_SLVV_8(System.DeviceInstanceCount - 1 downto 0);
		variable DeviceInstance		: T_PB_DEVICE_INSTANCE;
		variable BusIndex					: T_PB_BUSID;
		variable InterruptPortID	: T_UINT_8;
	begin
		InterruptPortID		:= 0;
		for i in 0 to System.DeviceInstanceCount - 1 loop
			DeviceInstance	:= System.DeviceInstances(i);
			BusIndex				:= pb_GetBusIndex(System, DeviceInstance.DeviceShort);
			
			if (DeviceInstance.Device.CreatesInterrupt = TRUE) then
				Result(InterruptPortID)	:= PicoBlazeBus(BusIndex).Message;
				InterruptPortID					:= InterruptPortID + 1;
			end if;
		end loop;
		return Result(InterruptPortID - 1 downto 0);
	end function;

	procedure pb_AssignInterruptAck(signal Output : inout T_PB_IOBUS_PB_DEV_VECTOR; Input : STD_LOGIC_VECTOR; System : T_PB_SYSTEM) is
		variable DeviceInstance		: T_PB_DEVICE_INSTANCE;
		variable BusIndex					: T_PB_BUSID;
		variable InterruptPortID	: NATURAL;
	begin
		InterruptPortID		:= 0;
		for i in 0 to System.DeviceInstanceCount - 1 loop
			DeviceInstance	:= System.DeviceInstances(i);
			BusIndex				:= pb_GetBusIndex(System, DeviceInstance.DeviceShort);

			if (DeviceInstance.Device.CreatesInterrupt = TRUE) then
				Output(i).Interrupt_Ack	<= Input(InterruptPortID);
				InterruptPortID					:= InterruptPortID + 1;
			else
				Output(i).Interrupt_Ack	<= '0';
			end if;
		end loop;
	end procedure;
	
	-- PicoBlaze AddressDecoder functions
	function pb_FilterMappings(DeviceInstance : T_PB_DEVICE_INSTANCE; MappingKind : T_PB_MAPPING_KIND) return T_PB_PORTNUMBER_MAPPING_VECTOR is
		variable Result				: T_PB_PORTNUMBER_MAPPING_VECTOR(0 to DeviceInstance.MappingCount - 1);
		variable ResultCount	: NATURAL;
	begin
		Result			:= (others => C_PB_PORTNUMBER_MAPPING_EMPTY);
		ResultCount	:= 0;
		for i in 0 to DeviceInstance.MappingCount - 1 loop
			if (DeviceInstance.Mappings(i).MappingKind = MappingKind) then
				Result(ResultCount)	:= DeviceInstance.Mappings(i);
				ResultCount					:= ResultCount + 1;
			end if;
		end loop;
		return Result(0 to ResultCount - 1);
	end function;
	
	-- PicoBlaze bus functions
	function pb_GetBusWidth(System : T_PB_SYSTEM; BusShort : STRING) return NATURAL is
		constant BUSID			: T_PB_BUSID	:= pb_GetBusID(System, pb_ShortName(BusShort));
	begin
		return System.Busses(BUSID).TotalDeviceCount;
	end function;
	
	function pb_GetBusIndex(System : T_PB_SYSTEM; DeviceShort : STRING) return NATURAL is
		constant DeviceInstance		: T_PB_DEVICE_INSTANCE				:= pb_GetDeviceInstance(System, DeviceShort);
		constant DeviceInstanceID : T_PB_DEVICE_INSTANCE_INDEX	:= pb_GetDeviceInstanceID(System, DeviceShort);
		constant BusID						: T_PB_BUSID									:= pb_GetBusID(System, DeviceInstance.BusShort);
		constant MyBus						: T_PB_BUS										:= System.Busses(BusID);
		variable Result						: NATURAL;
	begin
--		report "pb_GetBusIndex: DevInstID=" & INTEGER'image(DeviceInstanceID) severity NOTE;
	
		Result :=  MyBus.TotalDeviceCount -  MyBus.DeviceCount;
		for i in 0 to  MyBus.DeviceCount - 1 loop
--			report "pb_GetBusIndex: Devices(i)=" & INTEGER'image(MyBus.Devices(i)) severity NOTE;
			exit when (MyBus.Devices(i) = DeviceInstanceID);
			Result := Result + 1;
		end loop;
		return Result;
	end function;
	
	function pb_GetSubBusOffset(System : T_PB_SYSTEM; BusShort : T_PB_SHORTNAME) return NATURAL is
		constant BusID			: T_PB_BUSID	:= pb_GetBusID(System, BusShort);
		constant SuperBusID	: T_PB_BUSID	:= System.Busses(BusID).SuperBusID;
		variable Result			: NATURAL;
	begin
		Result := 0;
		for i in 0 to System.Busses(SuperBusID).SubBusCount - 1 loop
			if (System.Busses(SuperBusID).SubBusses(i) = BusID) then
				return Result;
			else
				Result := Result + System.Busses(System.Busses(SuperBusID).SubBusses(i)).TotalDeviceCount;
			end if;
		end loop;
		-- report error
	end function;
	
	function pb_GetSubOrdinateBus(Input : T_PB_IOBUS_PB_DEV_VECTOR; System : T_PB_SYSTEM; BusShort : STRING) return T_PB_IOBUS_PB_DEV_VECTOR is
		constant BusWidth	: NATURAL																					:= pb_GetBusWidth(System, BusShort);
		constant Offset		: NATURAL																					:= pb_GetSubBusOffset(System, pb_ShortName(BusShort));
		variable Result		: T_PB_IOBUS_PB_DEV_VECTOR(BusWidth - 1 downto 0);
	begin
		for i in Result'range loop
			Result(i)	:= Input(Offset + i);
		end loop;
		return Result;
	end function;
	
	procedure pb_AssignSubOrdinateBus(signal Output : inout T_PB_IOBUS_DEV_PB_VECTOR; Input : T_PB_IOBUS_DEV_PB_VECTOR; System : T_PB_SYSTEM; BusShort : STRING) is
		constant Offset		: NATURAL		:= pb_GetSubBusOffset(System, pb_ShortName(BusShort));
	begin
		for i in Input'range loop
			Output(Offset + i)	<= Input(i);
		end loop;
	end procedure;

	impure function pb_PrintAddressMapping(System : T_PB_SYSTEM) return BOOLEAN is
		variable DeviceInstance	: T_PB_DEVICE_INSTANCE;
		variable Device					: T_PB_DEVICE;
		variable Reg						: T_PB_REGISTER;
		variable Field					: T_PB_REGISTER_FIELD_MAPPING;
	begin
		if (not (PB_VERBOSE or PB_REPORT)) then
			return FALSE;
		end if;

		report "Printing PicoBlaze address mappings..." severity NOTE;

		for i in 0 to System.DeviceInstanceCount - 1 loop
			DeviceInstance	:= System.DeviceInstances(i);
			Device					:= DeviceInstance.Device;
			
			report "DeviceInstance " & INTEGER'image(i) & ":" severity NOTE;
			report "  DeviceInstance: " & str_trim(DeviceInstance.DeviceShort) severity NOTE;
			report "    Device: " & str_trim(Device.DeviceShort) severity NOTE;
			report "      Registers: " severity NOTE;
			for j in 0 to Device.RegisterCount - 1 loop
				Reg := Device.Registers(j);
				report "        " & INTEGER'image(j) & ": " & str_trim(Reg.RegisterShort) & " Reg#=" & INTEGER'image(Reg.RegisterNumber) & " " &
						ite((Reg.RegisterKind = PB_REGISTER_KIND_READ),				"RD",
						ite((Reg.RegisterKind = PB_REGISTER_KIND_READWRITE),	"RW",
						ite((Reg.RegisterKind = PB_REGISTER_KIND_WRITE),			"WR", "K ")))
					severity NOTE;
				for k in 0 to Reg.FieldMappingCount - 1 loop
					Field	:= Reg.FieldMappings(k);
					report "          " & INTEGER'image(k) & ": FieldID=" & INTEGER'image(Field.FieldID) & " (" & str_trim(Device.RegisterFields(Field.FieldID).FieldShort) & ")"
						severity NOTE;
				end loop;
			end loop;
		end loop;
		
		return TRUE;
	end function;

	impure function pb_PrintBusses(System : T_PB_SYSTEM) return BOOLEAN is
		variable CurBus		: T_PB_BUS;
	begin
		if (not (PB_VERBOSE or PB_REPORT)) then
			return FALSE;
		end if;
		
		report "pb_PrintBusses: Count=" & INTEGER'image(System.BusCount) severity NOTE;
		for i in 0 to System.BusCount - 1 loop
			CurBus	:= System.Busses(i);
		
			report "BusID " & INTEGER'image(i) & "(" & str_trim(CurBus.BusShort) & ")" severity NOTE;
			report "  SuperBusID " & INTEGER'image(CurBus.SuperBusID) & "(" & ite((CurBus.SuperBusID /= T_PB_BUSID'high), str_trim(System.Busses(System.Busses(imax(i, T_PB_BUS_INDEX'high)).SuperBusID).BusShort), "----") & ")" severity NOTE;
			report "  SubBusCount " & INTEGER'image(CurBus.SubBusCount) severity NOTE;
			for j in 0 to CurBus.SubBusCount - 1 loop
				report "    SubBusID " & INTEGER'image(CurBus.SubBusses(j)) & "(" & str_trim(System.Busses(CurBus.SubBusses(j)).BusShort) & ")" severity NOTE;
			end loop;
			report "  DeviceCount " & INTEGER'image(CurBus.DeviceCount) severity NOTE;
			for j in 0 to CurBus.DeviceCount - 1 loop
				report "    DeviceID " & INTEGER'image(CurBus.Devices(j)) & "(" & str_trim(System.DeviceInstances(CurBus.Devices(j)).DeviceShort) & ")" severity NOTE;
			end loop;
		end loop;
		
		return TRUE;
	end function;
	
	impure function pb_ExportAddressMappingAsAssemblerConstants(System : T_PB_SYSTEM; psmFileName : STRING) return BOOLEAN is
		file psmFile						: TEXT open WRITE_MODE is psmFileName;

		variable psmLine				: LINE;
		variable DeviceInstance	: T_PB_DEVICE_INSTANCE;
		variable Mapping				: T_PB_PORTNUMBER_MAPPING;

		type T_USAGE_TRACKING is record
			DeviceInstanceID	: T_UINT_8;
			MappingID					: T_UINT_8;
		end record;
		
		type T_ERROR_DETECT is array (NATURAL range <>) of T_USAGE_TRACKING;
		variable AddressMapRead		: T_ERROR_DETECT(0 to 255);
		variable AddressMapWrite	: T_ERROR_DETECT(0 to 255);
		variable AddressMapWriteK	: T_ERROR_DETECT(0 to 15);

		variable MappingID				: T_UINT_8;
		variable DeviceInstanceID	: T_UINT_8;
		variable RegID						: T_UINT_8;
		variable Reg							: T_PB_REGISTER;

	begin
		AddressMapRead		:= (others => (0, 255));
		AddressMapWrite		:= (others => (0, 255));
		AddressMapWriteK	:= (others => (0, 255));
	
		report "Exporting PicoBlaze address mappings as psm-file to '" & psmFileName & "' ..." severity note;
		
		-- psm-file: write file header
		write(psmLine, STRING'("; Generate by synthesis for '" & str_trim(System.SystemShort) & "'"));					writeline(psmFile, psmLine);
		write(psmLine, STRING'(";"));																																						writeline(psmFile, psmLine);
		write(psmLine, STRING'("; This file contains the PicoBlaze PortNumber to DeviceRegister mappings."));		writeline(psmFile, psmLine);
		write(psmLine, STRING'("; ======================================================================="));		writeline(psmFile, psmLine);

		-- write per device entires
		for i in 0 to System.DeviceInstanceCount - 1 loop
			DeviceInstance	:= System.DeviceInstances(i);
		
			write(psmLine, STRING'(";"));																						writeline(psmFile, psmLine);
			write(psmLine, STRING'("; ") & str_trim(DeviceInstance.DeviceShort));		writeline(psmFile, psmLine);

			for j in 0 to DeviceInstance.MappingCount - 1 loop
				Mapping	:= DeviceInstance.Mappings(j);

				if (Mapping.MappingKind /= PB_MAPPING_KIND_EMPTY) then
					if (PB_VERBOSE = TRUE) then
						report "  Map PortNumber " & INTEGER'image(Mapping.PortNumber) &
									 " to device " & INTEGER'image(i) &
									 " (" & str_trim(DeviceInstance.DeviceShort) &
									 ") register " & INTEGER'image(DeviceInstance.Device.Registers(Mapping.RegID).RegisterNumber) &
									 " (" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & ")."
						severity NOTE;
					end if;
				end if;

				-- tokenFile content for INPUT address space
				if (Mapping.MappingKind = PB_MAPPING_KIND_READ) then
					if (AddressMapRead(Mapping.PortNumber).MappingID = 255) then
						AddressMapRead(Mapping.PortNumber)	:= (DeviceInstanceID => i, MappingID => j);					-- save used MappingID for a PortNumber
						
						write(psmLine, "CONSTANT " & resize(
															"IPORT_" & str_toUpper(str_trim(DeviceInstance.DeviceShort)) &
															"_" & str_toUpper(str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort)) &
															", ", 40, ' ') &
														ite((Mapping.PortNumber < 10), " ", "") &
														ite((Mapping.PortNumber < 100), " ", "") &
														INTEGER'image(Mapping.PortNumber) & "'d    ; " &
														str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & "(");
						write(psmLine, STRING'("dummy[3:0]"));
						for k in 1 to 1 loop
							write(psmLine, STRING'(",dummy[7:4]"));
						end loop;
						write(psmLine, STRING'(")"));
						writeline(psmFile, psmLine);
					else
						DeviceInstanceID	:= AddressMapRead(Mapping.PortNumber).DeviceInstanceID;
						MappingID					:= AddressMapRead(Mapping.PortNumber).MappingID;
						RegID							:= System.DeviceInstances(DeviceInstanceID).Mappings(MappingID).RegID;
						Reg								:= System.DeviceInstances(DeviceInstanceID).Device.Registers(RegID);
						
						report "pb_ExportAddressMappingAsAssemblerConstants:" & LF & "PortNumber " & INTEGER'image(Mapping.PortNumber) &
									 " is already used by " & str_trim(System.DeviceInstances(DeviceInstanceID).DeviceShort) &
									 " register " & INTEGER'image(Reg.RegisterNumber) &
									 " (" & str_trim(Reg.RegisterShort) & ")." & LF &
									 "This overlaps with device " & str_trim(DeviceInstance.DeviceShort) &
									 " register " & INTEGER'image(DeviceInstance.Device.Registers(Mapping.RegID).RegisterNumber) &
									 " (" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & ")."
							severity FAILURE;
					end if;
				
				-- tokenFile content for OUTPUT address space
				elsif (Mapping.MappingKind = PB_MAPPING_KIND_WRITE) then
					if (AddressMapWrite(Mapping.PortNumber).MappingID = 255) then
						AddressMapWrite(Mapping.PortNumber)	:= (DeviceInstanceID => i, MappingID => j);
						
						write(psmLine, "CONSTANT " & resize(
															"OPORT_" & str_toUpper(str_trim(DeviceInstance.DeviceShort)) &
															"_" & str_toUpper(str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort)) &
															", ", 40, ' ') &
														ite((Mapping.PortNumber < 10), " ", "") &
														ite((Mapping.PortNumber < 100), " ", "") &
														INTEGER'image(Mapping.PortNumber) & "'d    ; " &
														str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort));
						writeline(psmFile, psmLine);
					else
						DeviceInstanceID	:= AddressMapWrite(Mapping.PortNumber).DeviceInstanceID;
						MappingID					:= AddressMapWrite(Mapping.PortNumber).MappingID;
						RegID							:= System.DeviceInstances(DeviceInstanceID).Mappings(MappingID).RegID;
						Reg								:= System.DeviceInstances(DeviceInstanceID).Device.Registers(RegID);
						
						report "pb_ExportAddressMappingAsAssemblerConstants:" & LF & "PortNumber " & INTEGER'image(Mapping.PortNumber) &
									 " is already used by " & str_trim(System.DeviceInstances(DeviceInstanceID).DeviceShort) &
									 " register " & INTEGER'image(Reg.RegisterNumber) &
									 " (" & str_trim(Reg.RegisterShort) & ")." & LF &
									 "This overlaps with device " & str_trim(DeviceInstance.DeviceShort) &
									 " register " & INTEGER'image(DeviceInstance.Device.Registers(Mapping.RegID).RegisterNumber) &
									 " (" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & ")."
							severity FAILURE;
					end if;
				
				-- tokenFile content for OUTPUTK address space
				elsif (Mapping.MappingKind = PB_MAPPING_KIND_WRITEK) then
					if (AddressMapWriteK(Mapping.PortNumber).MappingID = 255) then
						AddressMapWriteK(Mapping.PortNumber)	:= (DeviceInstanceID => i, MappingID => j);
						
						write(psmLine, "CONSTANT " & resize(
															"KPORT_" & str_toUpper(str_trim(DeviceInstance.DeviceShort)) &
															"_" & str_toUpper(str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort)) &
															", ", 40, ' ') &
														ite((Mapping.PortNumber < 10), " ", "") &
														ite((Mapping.PortNumber < 100), " ", "") &
														INTEGER'image(Mapping.PortNumber) & "'d    ; " &
														str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort));
						writeline(psmFile, psmLine);
					else
						DeviceInstanceID	:= AddressMapWriteK(Mapping.PortNumber).DeviceInstanceID;
						MappingID					:= AddressMapWriteK(Mapping.PortNumber).MappingID;
						RegID							:= System.DeviceInstances(DeviceInstanceID).Mappings(MappingID).RegID;
						Reg								:= System.DeviceInstances(DeviceInstanceID).Device.Registers(RegID);
						
						report "pb_ExportAddressMappingAsAssemblerConstants:" & LF & "K PortNumber " & INTEGER'image(Mapping.PortNumber) &
									 " is already used by " & str_trim(System.DeviceInstances(DeviceInstanceID).DeviceShort) &
									 " register " & INTEGER'image(Reg.RegisterNumber) &
									 " (" & str_trim(Reg.RegisterShort) & ")." & LF &
									 "This overlaps with device " & str_trim(DeviceInstance.DeviceShort) &
									 " register " & INTEGER'image(DeviceInstance.Device.Registers(Mapping.RegID).RegisterNumber) &
									 " (" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & ")."
							severity FAILURE;
					end if;
				end if;
			end loop;
		end loop;

		file_close(psmFile);
		
		return true;
	end function;
	
	impure function pb_ExportAddressMappingAsAssemblerInterruptVector(System : T_PB_SYSTEM; psmFileName : STRING; TableRows : POSITIVE) return BOOLEAN is
		file psmFile						: TEXT open WRITE_MODE is psmFileName;
		variable psmLine				: LINE;
		variable DeviceInstance	: T_PB_DEVICE_INSTANCE;

		variable j							: NATURAL := 0;

	begin
		report "Exporting PicoBlaze interrupt vector table as psm-file to '" & psmFileName & "' ..." severity note;
		
		-- psm-file: write file header
		write(psmLine, STRING'("; Generate by synthesis for '" & str_trim(System.SystemShort) & "'"));	writeline(psmFile, psmLine);
		write(psmLine, STRING'(";"));																																		writeline(psmFile, psmLine);
		write(psmLine, STRING'("; This file contains the PicoBlaze InterruptVector table."));						writeline(psmFile, psmLine);
		write(psmLine, STRING'("; ======================================================="));						writeline(psmFile, psmLine);

		-- write per device entires
		for i in 0 to System.DeviceInstanceCount - 1 loop
			DeviceInstance	:= System.DeviceInstances(i);

			-- tokenFile content for existing interrupt
			if (DeviceInstance.Device.CreatesInterrupt = TRUE) then
				write(psmLine, STRING'("JUMP __ISR_") & resize(str_trim(DeviceInstance.DeviceShort), 16, ' ') &
											 STRING'("; ") & ite((j < 10), STRING'(" "), "") & INTEGER'image(j) &
											 STRING'(": ") & str_trim(DeviceInstance.DeviceShort));
				writeline(psmFile, psmLine);
				
				j := j + 1;
			end if;
--				assert not PB_VERBOSE report "pb_ExportAddressMapping: Map PortNumber " & INTEGER'image(Mapping.PortNumber) &
--								 " to device " & INTEGER'image(-1) &
--								 " (" & str_trim(DeviceInstance.DeviceShort) &
--								 ") register " & INTEGER'image(DeviceInstance.Device.Registers(Mapping.RegID).RegisterNumber) &
--								 " (" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & ")."
--						severity NOTE;
		end loop;

		write(psmLine, STRING'(";"));																writeline(psmFile, psmLine);
		write(psmLine, STRING'("; catch undefined ISR routines"));	writeline(psmFile, psmLine);

		for i in j to TableRows - 1 loop
			write(psmLine, STRING'("JUMP __ISR_Error           ; ") & INTEGER'image(i) & STRING'(": "));
			writeline(psmFile, psmLine);
		end loop;

		file_close(psmFile);
		
		return true;
	end function;

	impure function pb_ExportAddressMappingAsChipScopeTokens(System : T_PB_SYSTEM; tokenFileName : STRING) return BOOLEAN is
		file tokenFile					: TEXT open WRITE_MODE is tokenFileName;

		variable tokenLine			: LINE;
		variable DeviceInstance	: T_PB_DEVICE_INSTANCE;
		variable Device					: T_PB_DEVICE;
		variable Mapping				: T_PB_PORTNUMBER_MAPPING;
		
		variable PortNumber_slv	: T_SLV_8;

		type T_USAGE_TRACKING is record
			DeviceInstanceID	: T_UINT_8;
			MappingID					: T_UINT_8;
		end record;
		
		type T_ERROR_DETECT is array (NATURAL range <>) of T_USAGE_TRACKING;
		variable AddressMapRead		: T_ERROR_DETECT(0 to 255);
		variable AddressMapWrite	: T_ERROR_DETECT(0 to 255);
		variable AddressMapWriteK	: T_ERROR_DETECT(0 to 15);

		variable MappingID				: T_UINT_8;
		variable DeviceInstanceID	: T_UINT_8;
		variable RegID						: T_UINT_8;
		variable Reg							: T_PB_REGISTER;
		
	begin
		AddressMapRead		:= (others => (0, 255));
		AddressMapWrite		:= (others => (0, 255));
		AddressMapWriteK	:= (others => (0, 255));
	
		report "Exporting PicoBlaze address mappings as token-file to '" & tokenFileName & "'..." severity note;
		
		-- token-file: write file header
		write(tokenLine, STRING'("# " & str_trim(System.SystemShort) & " - PortNumbers"));	writeline(tokenFile, tokenLine);
		write(tokenLine, STRING'("#"));																											writeline(tokenFile, tokenLine);
		write(tokenLine, STRING'("#"));																											writeline(tokenFile, tokenLine);
		write(tokenLine, STRING'("# ChipScope Token File Version"));												writeline(tokenFile, tokenLine);
		write(tokenLine, STRING'("@FILE_VERSION=1.0.0"));																		writeline(tokenFile, tokenLine);
		write(tokenLine, STRING'("#"));																											writeline(tokenFile, tokenLine);
		write(tokenLine, STRING'("# Default token value"));																	writeline(tokenFile, tokenLine);
		write(tokenLine, STRING'("@DEFAULT_TOKEN="));																				writeline(tokenFile, tokenLine);
	
		-- write per device entires
		for i in 0 to System.DeviceInstanceCount - 1 loop
			DeviceInstance	:= System.DeviceInstances(i);
		
			write(tokenLine, STRING'("#"));																					writeline(tokenFile, tokenLine);
			write(tokenLine, STRING'("# ") & str_trim(DeviceInstance.DeviceShort));	writeline(tokenFile, tokenLine);
		
			for j in 0 to DeviceInstance.MappingCount - 1 loop
				Mapping	:= DeviceInstance.Mappings(j);

				if (PB_VERBOSE = TRUE) then
					report "  Map PortNumber " & INTEGER'image(Mapping.PortNumber) &
								 " to device " & INTEGER'image(i) &
								 " (" & str_trim(DeviceInstance.DeviceShort) &
								 ") register " & INTEGER'image(DeviceInstance.Device.Registers(Mapping.RegID).RegisterNumber) &
								 " (" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & ")."
					severity NOTE;
				end if;

				-- tokenFile content for INPUT address space
				if (Mapping.MappingKind = PB_MAPPING_KIND_READ) then
					if (AddressMapRead(Mapping.PortNumber).MappingID = 255) then
						PortNumber_slv	:= to_slv(Mapping.PortNumber, 8);
						AddressMapRead(Mapping.PortNumber)	:= (DeviceInstanceID => i, MappingID => j);					-- save used MappingID for a PortNumber
						
						write(tokenLine, "RD_" & str_trim(DeviceInstance.DeviceShort) & "_" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & "=2" & to_string(PortNumber_slv, 'h', 2));
						writeline(tokenFile, tokenLine);
					else
						DeviceInstanceID	:= AddressMapRead(Mapping.PortNumber).DeviceInstanceID;
						MappingID					:= AddressMapRead(Mapping.PortNumber).MappingID;
						RegID							:= System.DeviceInstances(DeviceInstanceID).Mappings(MappingID).RegID;
						Reg								:= System.DeviceInstances(DeviceInstanceID).Device.Registers(RegID);
						
						report "pb_ExportAddressMappingAsChipScopeTokens:" & LF & "PortNumber " & INTEGER'image(Mapping.PortNumber) &
									 " is already used by " & str_trim(System.DeviceInstances(DeviceInstanceID).DeviceShort) &
									 " register " & INTEGER'image(Reg.RegisterNumber) &
									 " (" & str_trim(Reg.RegisterShort) & ")." & LF &
									 "This overlaps with device " & str_trim(DeviceInstance.DeviceShort) &
									 " register " & INTEGER'image(DeviceInstance.Device.Registers(Mapping.RegID).RegisterNumber) &
									 " (" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & ")."
							severity FAILURE;
					end if;
				
				-- tokenFile content for OUTPUT address space
				elsif (Mapping.MappingKind = PB_MAPPING_KIND_WRITE) then
					PortNumber_slv	:= to_slv(Mapping.PortNumber, 8);
					if (AddressMapWrite(Mapping.PortNumber).MappingID = 255) then
						AddressMapWrite(Mapping.PortNumber)	:= (DeviceInstanceID => i, MappingID => j);
						
						write(tokenLine, "WR_" & str_trim(DeviceInstance.DeviceShort) & "_" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & "=1" & to_string(PortNumber_slv, 'h', 2));
						writeline(tokenFile, tokenLine);
					else
						DeviceInstanceID	:= AddressMapWrite(Mapping.PortNumber).DeviceInstanceID;
						MappingID					:= AddressMapWrite(Mapping.PortNumber).MappingID;
						RegID							:= System.DeviceInstances(DeviceInstanceID).Mappings(MappingID).RegID;
						Reg								:= System.DeviceInstances(DeviceInstanceID).Device.Registers(RegID);
						
						report "pb_ExportAddressMappingAsChipScopeTokens:" & LF & "PortNumber " & INTEGER'image(Mapping.PortNumber) &
									 " is already used by " & str_trim(System.DeviceInstances(DeviceInstanceID).DeviceShort) &
									 " register " & INTEGER'image(Reg.RegisterNumber) &
									 " (" & str_trim(Reg.RegisterShort) & ")." & LF &
									 "This overlaps with device " & str_trim(DeviceInstance.DeviceShort) &
									 " register " & INTEGER'image(DeviceInstance.Device.Registers(Mapping.RegID).RegisterNumber) &
									 " (" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & ")."
							severity FAILURE;
					end if;
				
				-- tokenFile content for OUTPUTK address space
				elsif (Mapping.MappingKind = PB_MAPPING_KIND_WRITEK) then
					if (AddressMapWriteK(Mapping.PortNumber).MappingID = 255) then
						AddressMapWriteK(Mapping.PortNumber)	:= (DeviceInstanceID => i, MappingID => j);
						
						for k in 0 to 15 loop
							PortNumber_slv	:= to_slv(k, 4) & to_slv(Mapping.PortNumber, 4);
							write(tokenLine, STRING'("WK_" & str_trim(DeviceInstance.DeviceShort) & "_" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & "=4" & to_string(PortNumber_slv, 'h', 2)));
							writeline(tokenFile, tokenLine);
						end loop;
					else
						DeviceInstanceID	:= AddressMapWriteK(Mapping.PortNumber).DeviceInstanceID;
						MappingID					:= AddressMapWriteK(Mapping.PortNumber).MappingID;
						RegID							:= System.DeviceInstances(DeviceInstanceID).Mappings(MappingID).RegID;
						Reg								:= System.DeviceInstances(DeviceInstanceID).Device.Registers(RegID);
						
						report "pb_ExportAddressMappingAsChipScopeTokens:" & LF & "PortNumber " & INTEGER'image(Mapping.PortNumber) &
									 " is already used by " & str_trim(System.DeviceInstances(DeviceInstanceID).DeviceShort) &
									 " register " & INTEGER'image(Reg.RegisterNumber) &
									 " (" & str_trim(Reg.RegisterShort) & ")." & LF &
									 "This overlaps with device " & str_trim(DeviceInstance.DeviceShort) &
									 " register " & INTEGER'image(DeviceInstance.Device.Registers(Mapping.RegID).RegisterNumber) &
									 " (" & str_trim(DeviceInstance.Device.Registers(Mapping.RegID).RegisterShort) & ")."
							severity FAILURE;
					end if;
				end if;
			end loop;
		end loop;

		-- write tokens for unused PortNumbers
		write(tokenLine, STRING'("#"));											writeline(tokenFile, tokenLine);
		write(tokenLine, STRING'("# unused PortNumbers"));	writeline(tokenFile, tokenLine);
		for i in AddressMapWrite'range loop
			PortNumber_slv	:= to_slv(i, 8);
			if (AddressMapWrite(i).MappingID = 255) then
				write(tokenLine, "WR_ERR" & "=1" & to_string(PortNumber_slv, 'h', 2));
				writeline(tokenFile, tokenLine);
			end if;
		end loop;
		for i in AddressMapRead'range loop
			PortNumber_slv	:= to_slv(i, 8);
			if (AddressMapRead(i).MappingID = 255) then
				write(tokenLine, "RD_ERR" & "=2" & to_string(PortNumber_slv, 'h', 2));
				writeline(tokenFile, tokenLine);
			end if;
		end loop;
		for i in AddressMapWriteK'range loop
			if (AddressMapWriteK(i).MappingID = 255) then
				for k in 0 to 15 loop
					PortNumber_slv	:= to_slv(k, 4) & to_slv(i, 4);
					write(tokenLine, "WK_ERR" & "=4" & to_string(PortNumber_slv, 'h', 2));
					writeline(tokenFile, tokenLine);
				end loop;
			end if;
		end loop;
		
		file_close(tokenFile);
		
		return true;
	end function;	
end package body;
