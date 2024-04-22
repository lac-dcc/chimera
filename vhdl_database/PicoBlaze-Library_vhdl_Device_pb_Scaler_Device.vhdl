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
-- Module:					Scaler (8/16/24/32/40 bit) Device for PicoBlaze
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


entity pb_Scaler_Device is
	generic (
		DEVICE_INSTANCE								: T_PB_DEVICE_INSTANCE;
		BITS													: POSITIVE
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
		Message												: out T_SLV_8
	);
end entity;


architecture rtl of pb_Scaler_Device is
	constant REG_RW_A0					: STD_LOGIC_VECTOR(2 downto 0)			:= "000";
	constant REG_RW_A1					: STD_LOGIC_VECTOR(2 downto 0)			:= "001";
	constant REG_RW_A2					: STD_LOGIC_VECTOR(2 downto 0)			:= "010";
	constant REG_RW_A3					: STD_LOGIC_VECTOR(2 downto 0)			:= "011";
	constant REG_RW_A4					: STD_LOGIC_VECTOR(2 downto 0)			:= "100";
	constant REG_WO_MULT				: STD_LOGIC_VECTOR(2 downto 0)			:= "101";
	constant REG_WO_DIV					: STD_LOGIC_VECTOR(2 downto 0)			:= "110";
	constant REG_RO_STATUS			: STD_LOGIC_VECTOR(2 downto 0)			:= "111";
	
	signal AdrDec_we						: STD_LOGIC;
	signal AdrDec_re						: STD_LOGIC;
	signal AdrDec_WriteAddress	: T_SLV_8;
	signal AdrDec_ReadAddress		: T_SLV_8;
	signal AdrDec_Data					: T_SLV_8;
	
	constant BYTES							: POSITIVE		:= div_ceil(BITS, 8);
	constant BITS_A							: NATURAL			:= log2ceil(BYTES);
	
	signal Reg_Scaler						: STD_LOGIC_VECTOR(BITS - 1 downto 0)	:= x"0000000000";
	signal Reg_Mult							: T_SLV_8															:= x"00";
	signal Reg_Div							: T_SLV_8															:= x"00";
	
	function getVALUES return T_POSVEC is
		variable Result		: T_POSVEC(0 to 255);
	begin
		Result(0)		:= 1;
		for i in 1 to Result'high loop
			Result(I)	:= I;
		end loop;
		return Result;
	end function;
	
	constant MULTS	: T_POSVEC	:= getVALUES;
	constant DIVS		: T_POSVEC	:= getVALUES;
	
	signal MultDiv_Start		: STD_LOGIC;
	signal MultDiv_Start_d	: STD_LOGIC															:= '0';
	signal MultDiv_Done			: STD_LOGIC;
	signal MultDiv_Done_d		: STD_LOGIC															:= '0';
	signal MultDiv_Done_re	: STD_LOGIC;
	signal MultDiv_Result		: STD_LOGIC_VECTOR(BITS - 1 downto 0);
	
begin
	assert (BITS = 40)
--	assert ((BITS = 8) or (BITS = 16) or (BITS = 24) or (BITS = 32) or (BITS = 40))
		report "Multiplier size is not supported. Supported sizes: 8, 16, 24, 32, 40. BITS=" & INTEGER'image(BITS)
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
	begin
		if rising_edge(Clock) then
			if (Reset = '1') then
				Reg_Scaler				<= (others => '0');
				Reg_Mult					<= (others => '0');
				Reg_Div						<= (others => '0');
			else
				if (AdrDec_we = '1') then
					case AdrDec_WriteAddress(2 downto 0) IS
						when REG_WO_MULT =>			Reg_Mult									<= AdrDec_Data;
						when REG_WO_DIV =>			Reg_Div										<= AdrDec_Data;
						when REG_RW_A0 =>				Reg_Scaler(7 downto 0)		<= AdrDec_Data;
						when REG_RW_A1 =>				Reg_Scaler(15 downto 8)		<= AdrDec_Data;
						when REG_RW_A2 =>				Reg_Scaler(23 downto 16)	<= AdrDec_Data;
						when REG_RW_A3 =>				Reg_Scaler(31 downto 24)	<= AdrDec_Data;
						when REG_RW_A4 =>				Reg_Scaler(39 downto 32)	<= AdrDec_Data;
						when others =>					null;
					end case;
				elsif (MultDiv_Done_re = '1') then
					Reg_Scaler	<= MultDiv_Result;
				end if;
			end if;
		end if;
	end process;
	
	MultDiv_Start		<= AdrDec_we and to_sl(AdrDec_WriteAddress(2 downto 0) = REG_WO_DIV);
	MultDiv_Start_d	<= MultDiv_Start	when rising_edge(Clock);
	MultDiv_Done_d	<= MultDiv_Done		when rising_edge(Clock);
	MultDiv_Done_re	<= not MultDiv_Done_d and MultDiv_Done;
	
	MultDiv : entity PoC.arith_scaler
		generic map (
			MULS			=> MULTS,		-- The set of multipliers to choose from in scaling operations.
			DIVS			=> DIVS			-- The set of divisors to choose from in scaling operations.
		)
		port map (
			clk				=> Clock,
			rst				=> Reset,

			start			=> MultDiv_Start_d,
			arg				=> Reg_Scaler,
			msel			=> Reg_Mult,
			dsel			=> Reg_Div,

			done			=> MultDiv_Done,
			res				=> MultDiv_Result
  );
	
	process(AdrDec_re, AdrDec_ReadAddress, Reg_Scaler, MultDiv_Done_d)
		variable Reg_Scaler_slvv	: T_SLVV_8(4 downto 0);
	begin
		Reg_Scaler_slvv	:= to_slvv_8(Reg_Scaler);
		DataOut					<= Reg_Scaler_slvv(to_index(AdrDec_ReadAddress(2 downto 0), Reg_Scaler_slvv'length - 1));
		
		if (AdrDec_ReadAddress(2 downto 0) = REG_RO_STATUS) then
			DataOut				<= "0000000" & MultDiv_Done_d;
		end if;
	end process;

	Interrupt		<= MultDiv_Done_re;
	Message			<= x"00";
end;
