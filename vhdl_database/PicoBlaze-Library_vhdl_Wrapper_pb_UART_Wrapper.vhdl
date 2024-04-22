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
-- Module:					PicoBlaze UART Wrapper
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
use			PoC.config.all;
use			PoC.utils.all;
use			PoC.vectors.all;
use			PoC.physical.all;
use			PoC.components.all;
use			PoC.uart.all;
use			PoC.xil.all;

library	L_PicoBlaze;
use			L_PicoBlaze.pb.all;
use			L_PicoBlaze.pb_comp.all;


entity pb_UART_Wrapper is
	generic (
		DEBUG													: BOOLEAN												:= TRUE;
		ENABLE_CHIPSCOPE							: BOOLEAN												:= TRUE;
		CLOCK_FREQ										: FREQ													:= 100 MHz;
		BAUDRATE											: BAUD													:= 115200 Bd;
		DEVICE_INSTANCE								: T_PB_DEVICE_INSTANCE;
		USE_POC_UART									: BOOLEAN												:= FALSE
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
		
		ICON_ControlBus								: inout	T_XIL_CHIPSCOPE_CONTROL;
		
		-- UART physical interface
		UART_TX												: out	STD_LOGIC;
		UART_RX												: in	STD_LOGIC
	);
end entity;


architecture rtl of pb_UART_Wrapper is
	attribute KEEP										: BOOLEAN;
	attribute FSM_ENCODING						: STRING;

	signal Adapter_TX_put							: STD_LOGIC;
	signal Adapter_TX_Data						: T_SLV_8;
	signal UART_TX_Empty_n							: STD_LOGIC;
	signal UART_TX_HalfFull						: STD_LOGIC;
	signal UART_TX_Full								: STD_LOGIC;
	
	signal UART_RX_Data								: T_SLV_8;
	signal Adapter_RX_got							: STD_LOGIC;
	signal UART_RX_Empty_n							: STD_LOGIC;
	signal UART_RX_HalfFull						: STD_LOGIC;
	signal UART_RX_Full								: STD_LOGIC;

	signal UART_TX_i									: STD_LOGIC;

BEGIN
	assert FALSE report "pb_UART_Wrapper: BAUDRATE=: " & to_string(BAUDRATE, 3)						severity NOTE;
	assert io_UART_IsTypicalBaudRate(BAUDRATE) report "The given baudrate is not known to be a typical baudrate!" severity WARNING;

	UART : entity L_PicoBlaze.pb_UART_Device
		generic map (
			DEVICE_INSTANCE			=> DEVICE_INSTANCE
		)
		port map (
			Clock								=> Clock,
			Reset								=> Reset,
			
			-- PicoBlaze interface
			Address							=> Address,
			WriteStrobe					=> WriteStrobe,
			WriteStrobe_K				=> WriteStrobe_K,
			ReadStrobe					=> ReadStrobe,
			DataIn							=> DataIn,
			DataOut							=> DataOut,
			
			Interrupt						=> Interrupt,
			Interrupt_Ack				=> Interrupt_Ack,
			Message							=> Message,
			
			UART_TX_put					=> Adapter_TX_put,
			UART_TX_Data				=> Adapter_TX_Data,
			UART_TX_Empty_n			=> UART_TX_Empty_n,
			UART_TX_HalfFull		=> UART_TX_HalfFull,
			UART_TX_Full				=> UART_TX_Full,
						
			UART_RX_got					=> Adapter_RX_got,
			UART_RX_Data				=> UART_RX_Data,
			UART_RX_Empty_n			=> UART_RX_Empty_n,
			UART_RX_HalfFull		=> UART_RX_HalfFull,
			UART_RX_Full				=> UART_RX_Full
		);
	
	genXilinx : if (USE_POC_UART = FALSE) generate
		constant UART_OVERSAMPLING_RATE		: POSITIVE					:= 16;
		constant TIME_UNIT_INTERVAL				: TIME							:= 1 sec / (to_real(BAUDRATE, 1 Bd) * real(UART_OVERSAMPLING_RATE));
		constant BAUDRATE_COUNTER_MAX			: POSITIVE					:= TimingToCycles(TIME_UNIT_INTERVAL, CLOCK_FREQ);
		constant BAUDRATE_COUNTER_BITS		: POSITIVE					:= log2ceilnz(BAUDRATE_COUNTER_MAX + 1);
		
		signal BaudRate_Counter_us				: UNSIGNED(BAUDRATE_COUNTER_BITS + 1 downto 0)	:= (others => '0');
		signal BaudRate_Counter_eq				: STD_LOGIC;

		signal ClockEnable								: STD_LOGIC;

	begin
		assert FALSE report "  TIME_UNIT_INTERVAL: " & to_string(TIME_UNIT_INTERVAL, 3)				severity NOTE;
		assert FALSE report "  BAUDRATE_COUNTER_MAX: " & INTEGER'image(BAUDRATE_COUNTER_MAX)	severity NOTE;
	
		BaudRate_Counter_us		<= upcounter_next(cnt => BaudRate_Counter_us, rst => BaudRate_Counter_eq) when rising_edge(Clock);
		BaudRate_Counter_eq		<= upcounter_equal(cnt => BaudRate_Counter_us, value => (BAUDRATE_COUNTER_MAX - 1));
		ClockEnable						<= BaudRate_Counter_eq;

		gen00 : if (DEVICE = DEVICE_VIRTEX5) generate
			TX : uart_tx6_unconstrained
				port map (
					clk										=> Clock,
					buffer_reset					=> Reset,
					en_16_x_baud					=> ClockEnable,
				
					data_in								=> Adapter_TX_Data,
					buffer_write					=> Adapter_TX_put,

					buffer_data_present		=> UART_TX_Empty_n,
					buffer_half_full			=> UART_TX_HalfFull,
					buffer_full						=> UART_TX_Full,
								 
					serial_out						=> UART_TX_i
				);
		end generate;
		gen01 : if (DEVICE /= DEVICE_VIRTEX5) generate
			TX : uart_tx6
				port map (
					clk										=> Clock,
					buffer_reset					=> Reset,
					en_16_x_baud					=> ClockEnable,
				
					data_in								=> Adapter_TX_Data,
					buffer_write					=> Adapter_TX_put,

					buffer_data_present		=> UART_TX_Empty_n,
					buffer_half_full			=> UART_TX_HalfFull,
					buffer_full						=> UART_TX_Full,
								 
					serial_out						=> UART_TX_i
				);
		end generate;
		
		gen10 : if (DEVICE = DEVICE_VIRTEX5) generate
			RX : uart_rx6_unconstrained
				port map (
					clk										=> Clock,
					buffer_reset					=> Reset,
					en_16_x_baud					=> ClockEnable,
					
					data_out							=> UART_RX_Data,
					buffer_read						=> Adapter_RX_got,
					
					buffer_data_present		=> UART_RX_Empty_n,
					buffer_half_full			=> UART_RX_HalfFull,
					buffer_full						=> UART_RX_Full,

					serial_in							=> UART_RX
				);
		end generate;
		gen11 : if (DEVICE /= DEVICE_VIRTEX5) generate
			RX : uart_rx6
				port map (
					clk										=> Clock,
					buffer_reset					=> Reset,
					en_16_x_baud					=> ClockEnable,
					
					data_out							=> UART_RX_Data,
					buffer_read						=> Adapter_RX_got,
					
					buffer_data_present		=> UART_RX_Empty_n,
					buffer_half_full			=> UART_RX_HalfFull,
					buffer_full						=> UART_RX_Full,

					serial_in							=> UART_RX
				);
		end generate;
	end generate;
	
	genPoC : if (USE_POC_UART = TRUE) generate
		constant FIFO_DEPTH				: POSITIVE		:= 32;
		constant FILLSTATE_BITS		: POSITIVE		:= log2ceil(FIFO_DEPTH);
		
		signal UART_TX_EmptyState	: STD_LOGIC_VECTOR(FILLSTATE_BITS - 1 downto 0);
		signal UART_RX_FullState	: STD_LOGIC_VECTOR(FILLSTATE_BITS - 1 downto 0);
		
		
	begin
		UART : entity PoC.uart_fifo
			generic map (
				CLOCK_FREQ				=> CLOCK_FREQ,
				BAUDRATE					=> BAUDRATE,
				FLOWCONTROL				=> UART_FLOWCONTROL_NONE,
				TX_MIN_DEPTH			=> FIFO_DEPTH,
				TX_ESTATE_BITS		=> FILLSTATE_BITS,
				RX_MIN_DEPTH			=> FIFO_DEPTH,
				RX_FSTATE_BITS		=> FILLSTATE_BITS
				)
			port map (
				Clock					=> Clock,
				Reset					=> Reset,

				-- FIFO interface
				TX_put				=> Adapter_TX_put,
				TX_Data				=> Adapter_TX_Data,
				TX_Full				=> UART_TX_Full,
				TX_EmptyState	=> UART_TX_EmptyState,
				
				RX_Valid			=> UART_RX_Empty_n,
				RX_Data				=> UART_RX_Data,
				RX_got				=> Adapter_RX_got,
				RX_FullState	=> UART_RX_FullState,
				RX_Overflow		=> open,
				
				-- External Pins
				UART_TX				=> UART_TX_i,
				UART_RX				=> UART_RX
			);
		
		UART_TX_Empty_n		<= to_sl(unsigned(UART_TX_EmptyState) < 31);
		UART_TX_HalfFull	<= to_sl(unsigned(UART_TX_EmptyState) <=  7);
		UART_RX_HalfFull	<= to_sl(unsigned(UART_RX_FullState)	>=  8);
		UART_RX_Full			<= to_sl(unsigned(UART_RX_FullState)	>= 16);
	end generate;

	-- assign outputs
	UART_TX	<= UART_TX_i;


	genDebug : if (ENABLE_CHIPSCOPE = TRUE) generate
		signal Trigger0					: STD_LOGIC_VECTOR(29 downto 0);
		signal Trigger0_d				: STD_LOGIC_VECTOR(29 downto 0)		:= (others => '0');
	begin
		Trigger0(0)							<= Reset;
		Trigger0(1)							<= '0';
		Trigger0(2)							<= Adapter_RX_got;
		Trigger0(10 downto 3)		<= UART_RX_Data;
		Trigger0(11)						<= UART_RX_Empty_n;
		Trigger0(12)						<= UART_RX_HalfFull;
		Trigger0(13)						<= UART_RX_Full;
		Trigger0(14)						<= Adapter_TX_put;
		Trigger0(22 downto 15)	<= Adapter_TX_Data;
		Trigger0(23)						<= UART_TX_Empty_n;
		Trigger0(24)						<= UART_TX_HalfFull;
		Trigger0(25)						<= UART_TX_Full;
		Trigger0(26)						<= UART_TX_i;
		Trigger0(27)						<= UART_RX;
		Trigger0(28)						<= Address(0);
		Trigger0(29)						<= ReadStrobe;
		
		Trigger0_d	<= Trigger0 when rising_edge(Clock);
		
		CSP_UART : entity L_PicoBlaze.CSP_UART_ILA
			port map (
				CONTROL							=> ICON_ControlBus,
				CLK									=> Clock,
				TRIG0								=> Trigger0_d,
				TRIG_OUT						=> open
			);
	end generate;
end;
