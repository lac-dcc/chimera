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
-- Module:					Binary to BCD converter (24 bit) for PicoBlaze
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


entity pb_ConverterBCD24_Device is
	generic (
		DEVICE_INSTANCE								: T_PB_DEVICE_INSTANCE
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


architecture rtl of pb_ConverterBCD24_Device is
	constant REG_WO_A0					: STD_LOGIC_VECTOR(1 downto 0)			:= "00";
	constant REG_WO_A1					: STD_LOGIC_VECTOR(1 downto 0)			:= "01";
	constant REG_WO_A2					: STD_LOGIC_VECTOR(1 downto 0)			:= "10";
	
	constant REG_RO_R0					: STD_LOGIC_VECTOR(1 downto 0)			:= "00";
	constant REG_RO_R1					: STD_LOGIC_VECTOR(1 downto 0)			:= "01";
	constant REG_RO_R2					: STD_LOGIC_VECTOR(1 downto 0)			:= "10";
	constant REG_RO_STATUS			: STD_LOGIC_VECTOR(1 downto 0)			:= "11";
	
	signal AdrDec_we						: STD_LOGIC;
	signal AdrDec_re						: STD_LOGIC;
	signal AdrDec_WriteAddress	: T_SLV_8;
	signal AdrDec_ReadAddress		: T_SLV_8;
	signal AdrDec_Data					: T_SLV_8;
	
	signal Reg_Start						: STD_LOGIC		:= '0';
	signal Flag_IsSigned				: STD_LOGIC		:= '0';
	signal Reg_Operand_a				: T_SLV_24		:= (OTHERS => '0');
	signal Reg_Result						: T_SLV_32		:= (OTHERS => '0');

	signal Conv_Busy						: STD_LOGIC;
	signal Conv_Busy_d					: STD_LOGIC		:= '0';
	signal Conv_Busy_fe					: STD_LOGIC;
	signal Conv_Sign						: STD_LOGIC;
	signal Conv_Result					: T_BCD_VECTOR(6 downto 0);
	
begin
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
			Flag_IsSigned							<= '0';
			
			if (Reset = '1') then
				Reg_Operand_A						<= (others => '0');
				Reg_Result							<= (others => '0');
			else
				if (AdrDec_we = '1') then
					case AdrDec_WriteAddress(1 downto 0) IS
						when REG_WO_A0 =>		Reg_Operand_A(7 downto 0)		<= AdrDec_Data;
						when REG_WO_A1 =>		Reg_Operand_A(15 downto 8)	<= AdrDec_Data;
						when REG_WO_A2 =>		Reg_Operand_A(23 downto 16)	<= AdrDec_Data;
																Reg_Start										<= '1';
						when others =>			null;
					end case;
				elsif (Conv_Busy_fe = '1') then
					Reg_Result(31 downto 28)	<= "0000";
					for i in 0 to 6 loop
						Reg_Result((i * 4) + 3 downto (i * 4))	<= std_logic_vector(Conv_Result(i));
					end loop;
				end if;
			end if;
		end if;
	end process;
	
	process(AdrDec_re, AdrDec_ReadAddress, Reg_Result, Conv_Sign, Conv_Busy)
		variable Reg_Result_slvv	: T_SLVV_8(3 downto 0);
	begin
		Reg_Result_slvv	:= to_slvv_8(Reg_Result);
		DataOut					<= Reg_Result_slvv(to_index(AdrDec_ReadAddress(1 downto 0), Reg_Result_slvv'length - 1));
		
		if (AdrDec_ReadAddress(1 downto 0) = REG_RO_STATUS) then
			DataOut				<= (not Conv_Busy) & "00" & Conv_Sign & Reg_Result_slvv(Reg_Result_slvv'high)(3 downto 0);
		end if;
	end process;

	Interrupt		<= Conv_Busy_fe;
	Message			<= to_slv(0, Message'length);
	
	Conv : entity PoC.arith_convert_bin2bcd
		generic map (
			BITS					=> 24,
			DIGITS				=> 7,
			RADIX					=> 4
		)
		port map (
			Clock					=> Clock,
			Reset					=> Reset,
		
			Start					=> Reg_Start,
			Busy					=> Conv_Busy,
		
			Binary				=> Reg_Operand_A,
			IsSigned			=> Flag_IsSigned,
			BCDDigits			=> Conv_Result,
			Sign					=> Conv_Sign
  );
	
	Conv_Busy_d		<= Conv_Busy		when rising_edge(Clock);
	Conv_Busy_fe	<= Conv_Busy_d and not Conv_Busy;
	
end;
