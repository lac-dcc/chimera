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
-- Module:					Divider 8/16/24/32 bit) Device for PicoBlaze
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


entity pb_Divider_Device is
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


architecture rtl of pb_Divider_Device is
	signal AdrDec_we						: STD_LOGIC;
	signal AdrDec_re						: STD_LOGIC;
	signal AdrDec_WriteAddress	: T_SLV_8;
	signal AdrDec_ReadAddress		: T_SLV_8;
	signal AdrDec_Data					: T_SLV_8;
	
	constant REQUIRED_REG_BYTES	: POSITIVE																			:= div_ceil(BITS, 8);
	constant BIT_AB							: NATURAL																				:= log2ceil(REQUIRED_REG_BYTES);
	
	signal Reg_Start						: STD_LOGIC																			:= '0';
	signal Reg_Operand_A				: T_SLVV_8(REQUIRED_REG_BYTES - 1 downto 0)			:= (others => (others => '0'));
	signal Reg_Operand_B				: T_SLVV_8(REQUIRED_REG_BYTES - 1 downto 0)			:= (others => (others => '0'));
	signal Reg_Result						: T_SLVV_8(REQUIRED_REG_BYTES - 1 downto 0)			:= (others => (others => '0'));
	
	signal Div_Result						: STD_LOGIC_VECTOR(BITS - 1 downto 0);
	signal Div_Done_d						: STD_LOGIC																			:= '0';
	signal Div_Done_re					: STD_LOGIC;
	
begin
	assert ((BITS = 8) or (BITS = 16) or (BITS = 24) or (BITS = 32))
		report "Divider size is not supported. Supported sizes: 8, 16, 24, 32. BITS=" & INTEGER'image(BITS)
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
			Reg_Start									<= '0';
			
			if (Reset = '1') then
				Reg_Operand_A						<= (others => (others => '0'));
				Reg_Operand_B						<= (others => (others => '0'));
				Reg_Result							<= (others => (others => '0'));
			else
				if (AdrDec_we = '1') then
					if (AdrDec_WriteAddress(BIT_AB) = '0') then
						Reg_Operand_A(to_index(AdrDec_WriteAddress(BIT_AB - 1 downto 0)))	<= AdrDec_Data;
					else
						Reg_Operand_B(to_index(AdrDec_WriteAddress(BIT_AB - 1 downto 0)))	<= AdrDec_Data;
					end if;

					if (slv_and(AdrDec_WriteAddress(BIT_AB downto 0)) = '1') then
						Reg_Start										<= '1';
					end if;					
				end if;
				
				if (Div_Done_re = '1') then
					Reg_Result		<= to_slvv_8(Div_Result);
				end if;
			end if;
		end if;
	end process;

	process(AdrDec_re, AdrDec_ReadAddress, Reg_Result, Div_Done_d)
	begin
		DataOut					<= Reg_Result(to_index(AdrDec_ReadAddress(BIT_AB - 1 downto 0), Reg_Result'length - 1));
		
		if (slv_and(AdrDec_ReadAddress(BIT_AB downto 0)) = '1') then
			DataOut				<= "0000000" & Div_Done_d;
		end if;
	end process;

	Interrupt		<= Div_Done_re;
	Message			<= x"00";
	
	blkDiv : block
		signal Operand_A_slv		: STD_LOGIC_VECTOR(BITS - 1 downto 0);
		signal Operand_B_slv		: STD_LOGIC_VECTOR(BITS - 1 downto 0);
		
		signal Div_Done					: STD_LOGIC;
	begin
		Operand_A_slv		<= to_slv(Reg_Operand_A);
		Operand_B_slv		<= to_slv(Reg_Operand_B);
	
		Div : entity PoC.arith_div
			generic map (
				N							=> BITS,			-- Operand /Result bit widths
				RAPOW					=> 2,					-- Power of Radix used (2**RAPOW)
				REGISTERED		=> FALSE
			)
			port map (
				clk				=> Clock,
				rst				=> Reset,

				start			=> Reg_Start,
				arg1			=> Operand_A_slv,
				arg2			=> Operand_B_slv,

				rdy				=> Div_Done,
				res				=> Div_Result
			);

		Div_Done_d	<= Div_Done		when rising_edge(Clock);
		Div_Done_re	<= not Div_Done_d and Div_Done;
	end block;
end;
