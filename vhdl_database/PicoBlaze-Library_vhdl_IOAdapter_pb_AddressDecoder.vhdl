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
-- Module:					PicoBlaze Generic AddressDecoder Unit
-- 
-- Description:
-- ------------------------------------
--		TODO
--		
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

library IEEE;
use			IEEE.STD_LOGIC_1164.all;
use			IEEE.NUMERIC_STD.all;

library PoC;
use			PoC.utils.all;
use			PoC.strings.all;
use			PoC.vectors.all;
use			PoC.io.all;

library	L_PicoBlaze;
use			L_PicoBlaze.pb.all;


entity PicoBlaze_AddressDecoder is
	generic (
		DEVICE_NAME						: STRING;
		BUS_NAME							: STRING;
		READ_MAPPINGS					: T_PB_PORTNUMBER_MAPPING_VECTOR;
		WRITE_MAPPINGS				: T_PB_PORTNUMBER_MAPPING_VECTOR;
		WRITEK_MAPPINGS				: T_PB_PORTNUMBER_MAPPING_VECTOR
	);
	port (
		Clock									: in	STD_LOGIC;
		Reset									: in	STD_LOGIC;

		-- PicoBlaze interface
		In_WriteStrobe				: in	STD_LOGIC;
		In_WriteStrobe_K			: in	STD_LOGIC;
		In_ReadStrobe					: in	STD_LOGIC;
		In_Address						: in	T_SLV_8;
		In_Data								: in	T_SLV_8;
		Out_WriteStrobe				: out	STD_LOGIC;
		Out_ReadStrobe				: out	STD_LOGIC;
		Out_WriteAddress			: out	T_SLV_8;
		Out_ReadAddress				: out	T_SLV_8;
		Out_Data							: out	T_SLV_8
	);
end entity;


architecture rtl of PicoBlaze_AddressDecoder is
	attribute KEEP								: BOOLEAN;

	signal WriteAddress				: T_SLV_8;
	signal WriteAddress_K			: T_SLV_8;
	signal ReadAddress				: T_SLV_8;
	signal WriteHit						: STD_LOGIC;
	signal WriteHit_K					: STD_LOGIC;
	signal ReadHit						: STD_LOGIC;

	signal Out_WriteStrobe_i	: STD_LOGIC			:= '0';
	signal Out_ReadStrobe_i		: STD_LOGIC;
	signal Out_WriteAddress_i	: T_SLV_8				:= (others => '0');
	signal Out_ReadAddress_i	: T_SLV_8;
	signal Out_Data_i					: T_SLV_8				:= (others => '0');
begin

	process(In_Address, In_WriteStrobe, In_WriteStrobe_K, In_ReadStrobe)
	begin
		WriteAddress		<= (others => '0');
		WriteAddress_K	<= (others => '0');
		ReadAddress			<= (others => '0');
		WriteHit				<= '0';
		WriteHit_K			<= '0';
		ReadHit					<= '0';

		assert PB_VERBOSE
			report "PicoBlaze_AddressDecoder: Report PortNumber mappings for device " & str_trim(DEVICE_NAME) &
						 " on bus " & str_trim(BUS_NAME)
			severity NOTE;
		
		for i in WRITEK_MAPPINGS'range loop
			assert PB_VERBOSE
				report "  Map PortNumber " & INTEGER'image(WRITEK_MAPPINGS(i).PortNumber) &
							 " to register number " & INTEGER'image(WRITEK_MAPPINGS(i).RegNumber) &
							 " as K-writeable"
				severity NOTE;
			
			if (In_Address(3 downto 0) = to_slv(WRITEK_MAPPINGS(i).PortNumber, 4)) then
				WriteAddress_K	<= to_slv(WRITEK_MAPPINGS(i).RegNumber, WriteAddress_K'length);
				WriteHit_K			<= In_WriteStrobe_K;
			end if;
		end loop;
		for i in WRITE_MAPPINGS'range loop
			assert PB_VERBOSE
				report "  Map PortNumber " & INTEGER'image(WRITE_MAPPINGS(i).PortNumber) &
							 " to register number " & INTEGER'image(WRITE_MAPPINGS(i).RegNumber) &
							 " as writeable"
				severity NOTE;
			
			if (In_Address = to_slv(WRITE_MAPPINGS(i).PortNumber, In_Address'length)) then
				WriteAddress		<= to_slv(WRITE_MAPPINGS(i).RegNumber, WriteAddress'length);
				WriteHit				<= In_WriteStrobe;
			end if;
		end loop;
		for i in READ_MAPPINGS'range loop
			assert PB_VERBOSE
				report "  Map PortNumber " & INTEGER'image(READ_MAPPINGS(i).PortNumber) &
							 " to register number " & INTEGER'image(READ_MAPPINGS(i).RegNumber) &
							 " as readable"
				severity NOTE;
			
			if (In_Address = to_slv(READ_MAPPINGS(i).PortNumber, In_Address'length)) then
				ReadAddress			<= to_slv(READ_MAPPINGS(i).RegNumber, ReadAddress'length);
				ReadHit					<= In_ReadStrobe;
			end if;
		end loop;
	end process;
	
	process(Clock, ReadHit, ReadAddress)
	begin
		if rising_edge(Clock) then
			if (WriteHit_K = '1') then
				Out_WriteStrobe_i		<= WriteHit_K;
				Out_WriteAddress_i	<= WriteAddress_K;
			else
				Out_WriteStrobe_i		<= WriteHit;
				Out_WriteAddress_i	<= WriteAddress;
			end if;
			
			Out_Data_i						<= In_Data;
		end if;
		
		Out_ReadStrobe_i				<= ReadHit;
		Out_ReadAddress_i				<= ReadAddress;
	end process;
	
	Out_WriteStrobe			<= Out_WriteStrobe_i;
	Out_ReadStrobe			<= Out_ReadStrobe_i;
	Out_WriteAddress		<= Out_WriteAddress_i;
	Out_ReadAddress			<= Out_ReadAddress_i;
	Out_Data						<= Out_Data_i;
end;
