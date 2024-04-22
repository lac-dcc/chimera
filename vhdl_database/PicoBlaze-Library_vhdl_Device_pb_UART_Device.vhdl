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
-- Module:					PicoBlaze UART Adapter
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


entity pb_UART_Device is
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
		Message												: out	T_SLV_8;
		
		UART_TX_put										: out	STD_LOGIC;
		UART_TX_Data									: out	T_SLV_8;
		UART_TX_Empty_n								: in	STD_LOGIC;
		UART_TX_HalfFull							: in	STD_LOGIC;
		UART_TX_Full									: in	STD_LOGIC;
		
		UART_RX_got										: out	STD_LOGIC;
		UART_RX_Data									: in	T_SLV_8;
		UART_RX_Empty_n								: in	STD_LOGIC;
		UART_RX_HalfFull							: in	STD_LOGIC;
		UART_RX_Full									: in	STD_LOGIC
	);
end entity;


architecture rtl of pb_UART_Device is
	CONSTANT REG_WO_INT_ENABLE			: UNSIGNED(0 downto 0)			:= "0";
	CONSTANT REG_RO_STATUS					: UNSIGNED(0 downto 0)			:= "0";
	CONSTANT REG_RW_FIFO						: UNSIGNED(0 downto 0)			:= "1";
	
	signal AdrDec_we								: STD_LOGIC;
	signal AdrDec_re								: STD_LOGIC;
	signal AdrDec_WriteAddress			: T_SLV_8;
	signal AdrDec_ReadAddress				: T_SLV_8;
	signal AdrDec_Data							: T_SLV_8;
	
	constant REG_INT_ENABLE_DEFAULT	: T_SLV_8										:= x"88";		-- interrupt on TX/RX_DataLoss		
	signal Reg_Int_Enable						: T_SLV_8										:= REG_INT_ENABLE_DEFAULT;
	signal Reg_Status								: T_SLV_8										:= (others => '0');
	
	signal UART_TX_put_i						: STD_LOGIC;
	
	signal UART_TX_DataLoss					: STD_LOGIC;
	signal UART_RX_DataLoss					: STD_LOGIC;
	
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
			Clock							=> Clock,
			Reset							=> Reset,

			-- PicoBlaze interface
			In_WriteStrobe		=> WriteStrobe,
			In_WriteStrobe_K	=> WriteStrobe_K,
			In_ReadStrobe			=> ReadStrobe,
			In_Address				=> Address,
			In_Data						=> DataIn,
			Out_WriteStrobe		=> AdrDec_we,
			Out_ReadStrobe		=> AdrDec_re,
			Out_WriteAddress	=> AdrDec_WriteAddress,
			Out_ReadAddress		=> AdrDec_ReadAddress,
			Out_Data					=> AdrDec_Data
		);
	
	process(Clock)
	begin
		if rising_edge(Clock) then
			if (Reset = '1') then
				Reg_Int_Enable					<= REG_INT_ENABLE_DEFAULT;
				Reg_Status							<= (others => '0');
			else
				if (AdrDec_we = '1') THEN
					case unsigned(AdrDec_WriteAddress(0 downto 0)) is
						when REG_WO_INT_ENABLE =>		Reg_Int_Enable		<= AdrDec_Data;
						when others =>							null;
					end case;
				end if;
				
				Reg_Status		<= UART_TX_DataLoss	& UART_TX_Full & UART_TX_HalfFull & UART_TX_Empty_n &
												 UART_RX_DataLoss	& UART_RX_Full & UART_RX_HalfFull & UART_RX_Empty_n;
			end if;
		end if;
	end process;
	
	UART_TX_put_i			<= to_sl(unsigned(AdrDec_WriteAddress(0 downto 0)) = REG_RW_FIFO) and AdrDec_we;
	
	UART_TX_DataLoss	<= UART_TX_Full and UART_TX_put_i;
	UART_RX_DataLoss	<= UART_RX_Full and '1';					-- TODO: 
	
	UART_TX_put				<= UART_TX_put_i;
	UART_TX_Data			<= AdrDec_Data;
	
	process(AdrDec_re, AdrDec_ReadAddress, Reg_Status, UART_RX_Data)
	begin
		DataOut						<= Reg_Status;
		UART_RX_got				<= '0';
		
		case unsigned(AdrDec_ReadAddress(0 downto 0)) is
			when REG_RO_STATUS =>
				DataOut				<= Reg_Status;
			when REG_RW_FIFO =>
				DataOut				<= UART_RX_Data;
				UART_RX_got		<= AdrDec_re;
			when others =>
				null;
		end case;
	end process;

	Interrupt		<= slv_or(Reg_Int_Enable and Reg_Status);
	Message			<= Reg_Status;
	
end;
