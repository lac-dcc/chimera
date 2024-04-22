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
-- Module:					PicoBlaze General Perpose I/O Adapter
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


entity pb_GPIO_Adapter is
	generic (
		DEBUG													: BOOLEAN												:= TRUE;
		DEVICE_INSTANCE								: T_PB_DEVICE_INSTANCE;
		BITS													: POSITIVE											:= 8
	);
	port (
		Clock													: IN	STD_LOGIC;
		Reset													: IN	STD_LOGIC;

		-- PicoBlaze interface
		Address												: IN	T_SLV_8;
		WriteStrobe										: IN	STD_LOGIC;
		WriteStrobe_K									: IN	STD_LOGIC;
		ReadStrobe										: IN	STD_LOGIC;
		DataIn												: IN	T_SLV_8;
		DataOut												: OUT	T_SLV_8;

		Interrupt											: OUT	STD_LOGIC;
		Interrupt_Ack									: IN	STD_LOGIC;
		Message												: OUT	T_SLV_8;
		
		-- GPIO interface
		GPIO_Out											: OUT	STD_LOGIC_VECTOR(BITS - 1 downto 0);
		GPIO_In												: IN	STD_LOGIC_VECTOR(BITS - 1 downto 0)
	);
end entity;


architecture rtl of pb_GPIO_Adapter is
	constant REG_RW_DATAOUT			: UNSIGNED(0 downto 0)			:= "0";
	constant REG_RO_DATAIN			: UNSIGNED(0 downto 0)			:= "1";
	
	signal AdrDec_we						: STD_LOGIC;
	signal AdrDec_re						: STD_LOGIC;
	signal AdrDec_WriteAddress	: T_SLV_8;
	signal AdrDec_ReadAddress		: T_SLV_8;
	signal AdrDec_Data					: T_SLV_8;
	
	signal Reg_DataOut					: T_SLV_8										:= (others => '0');
	signal Reg_DataIn						: T_SLV_8										:= (others => '0');
	
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
			if (Reset = '1') then
				Reg_DataOut					<= (others => '0');
				Reg_DataIn					<= (others => '0');
			else
				if (AdrDec_we = '1') THEN
					case unsigned(AdrDec_WriteAddress(0 downto 0)) is
						when REG_RW_DATAOUT =>
							Reg_DataOut		<= AdrDec_Data;
							
						when others =>
							null;
					end case;
				end if;
				
				Reg_DataIn	<= GPIO_In;
			end if;
		end if;
	end process;
	
	process(AdrDec_re, AdrDec_ReadAddress, Reg_DataIn, Reg_DataOut)
	begin
		DataOut					<= Reg_DataIn;
		
		case unsigned(AdrDec_ReadAddress(0 downto 0)) is
			when REG_RW_DATAOUT =>
				DataOut			<= Reg_DataOut;
			when REG_RO_DATAIN =>
				DataOut			<= Reg_DataIn;

			when others =>
				null;
		end case;
	end process;

	Interrupt		<= '0';
	Message			<= x"00";
	
	GPIO_Out		<= Reg_DataOut;
	
end;
