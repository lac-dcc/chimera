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
-- Module:					BitBanging I/O Device for PicoBlaze
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
use			PoC.vectors.all;
use			PoC.strings.all;

library	L_PicoBlaze;
use			L_PicoBlaze.pb.all;


entity pb_BitBangingIO_Device is
	generic (
		DEVICE_INSTANCE								: T_PB_DEVICE_INSTANCE;
		BITS													: POSITIVE											:= 8;
		INITIAL_VALUE									: STD_LOGIC_VECTOR
	);
	port (
		Clock													: in	STD_LOGIC;
		Reset													: in	STD_LOGIC;

		-- PicoBlaze interface
		Address												: in	T_SLV_8;
		WriteStrobe										: in	STD_LOGIC;
		WriteStrobe_K									: in	STD_LOGIC;
		ReadStrobe										: in	STD_LOGIC;
		DataIn												: in	T_SLV_8;
		DataOut												: out	T_SLV_8;

		Interrupt											: out	STD_LOGIC;
		Interrupt_Ack									: in	STD_LOGIC;
		Message												: out	T_SLV_8;
		
		-- BBIO interface
		BBIO_Out											: OUT	STD_LOGIC_VECTOR(BITS - 1 downto 0);
		BBIO_In												: IN	STD_LOGIC_VECTOR(BITS - 1 downto 0)
	);
end entity;


architecture rtl of pb_BitBangingIO_Device is
	signal AdrDec_we						: STD_LOGIC;
	signal AdrDec_re						: STD_LOGIC;
	signal AdrDec_WriteAddress	: T_SLV_8;
	signal AdrDec_ReadAddress		: T_SLV_8;
	signal AdrDec_Data					: T_SLV_8;
	
	constant REQUIRED_REG_BYTES				: POSITIVE									:= div_ceil(BITS, 8);
	constant BIT_SET_CLR							: NATURAL										:= log2ceil(REQUIRED_REG_BYTES);
	constant BIT_OUT_IN								: NATURAL										:= log2ceil(REQUIRED_REG_BYTES);
	
	constant REG_WO_SET_BIT_VALUE			: STD_LOGIC		:= '0';
	constant REG_WO_CLEAR_BIT_VALUE		: STD_LOGIC		:= '1';
	constant REG_RO_OUTPUT_BIT_VALUE	: STD_LOGIC		:= '0';
	constant REG_RO_INPUT_BIT_VALUE		: STD_LOGIC		:= '1';
	
	constant INITIAL_VALUE_I					: STD_LOGIC_VECTOR((REQUIRED_REG_BYTES * 8) - 1 downto 0)	:= resize(INITIAL_VALUE, REQUIRED_REG_BYTES * 8);
	
	signal Reg_DataOut								: T_SLVV_8(REQUIRED_REG_BYTES - 1 downto 0)			:= to_slvv_8(INITIAL_VALUE_I);
	signal Reg_DataIn									: T_SLVV_8(REQUIRED_REG_BYTES - 1 downto 0)			:= to_slvv_8(INITIAL_VALUE_I);
	
begin
	assert (BITS <= 16)
		report "BitBangingIO size is not supported. Supported sizes up to 16 bits. BITS=" & INTEGER'image(BITS)
		severity failure;

	AdrDec : entity L_PicoBlaze.PicoBlaze_AddressDecoder
		generic map (
			DEVICE_NAME				=> str_trim(DEVICE_INSTANCE.DeviceShort),
			BUS_NAME					=> str_trim(DEVICE_INSTANCE.BusShort),
			READ_MAPPINGS			=> pb_FilterMappings(DEVICE_INSTANCE, PB_MAPPING_KIND_READ),
			WRITE_MAPPINGS		=> pb_FilterMappings(DEVICE_INSTANCE, PB_MAPPING_KIND_WRITE),
			WRITEK_MAPPINGS		=> pb_FilterMappings(DEVICE_INSTANCE, PB_MAPPING_KIND_WRITEK)
		)
		port map (
			Clock											=> Clock,
			Reset											=> Reset,

			-- PicoBlaze interface
			In_WriteStrobe						=> WriteStrobe,
			In_WriteStrobe_K					=> WriteStrobe_K,
			In_ReadStrobe							=> ReadStrobe,
			In_Address								=> Address,
			In_Data										=> DataIn,
			Out_WriteStrobe						=> AdrDec_we,
			Out_ReadStrobe						=> AdrDec_re,
			Out_WriteAddress					=> AdrDec_WriteAddress,
			Out_ReadAddress						=> AdrDec_ReadAddress,
			Out_Data									=> AdrDec_Data
		);
	
	process(Clock)
		variable index		: NATURAL;
	begin
		if rising_edge(Clock) then
			index	:= to_index(AdrDec_WriteAddress(BIT_SET_CLR - 1 downto 0));
			
			if (Reset = '1') then
				Reg_DataOut					<= to_slvv_8(INITIAL_VALUE_I);
			else
				if (AdrDec_we = '1') then
					case AdrDec_WriteAddress(BIT_SET_CLR) is
						when REG_WO_SET_BIT_VALUE =>		Reg_DataOut(index)	<= Reg_DataOut(index) or AdrDec_Data;
						when REG_WO_CLEAR_BIT_VALUE =>	Reg_DataOut(index)	<= Reg_DataOut(index) and not AdrDec_Data;
						when others =>									null;
					end case;
				end if;
				
				Reg_DataIn	<= to_slvv_8(resize(BBIO_In, (Reg_DataIn'length * 8)));
			end if;
		end if;
	end process;
	
	process(AdrDec_re, AdrDec_ReadAddress, Reg_DataOut, Reg_DataIn)
		variable index	: NATURAL;
	begin
		index			:= to_index(AdrDec_ReadAddress(BIT_OUT_IN - 1 downto 0));
	
		case AdrDec_ReadAddress(BIT_OUT_IN) is
			when REG_RO_OUTPUT_BIT_VALUE =>		DataOut		<= Reg_DataOut(index);
			when REG_RO_INPUT_BIT_VALUE =>		DataOut		<= Reg_DataIn(index);
			when others =>										DataOut		<= (others => 'X');
		end case;
	end process;

	Interrupt		<= '0';
	Message			<= x"00";

	BBIO_Out		<= resize(to_slv(Reg_DataOut), BBIO_Out'length);
end;
