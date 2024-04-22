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
-- Module:					PicoBlaze Interrupt Controller with up to 32 ports.
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
use			PoC.components.all;

library L_PicoBlaze;
use			L_PicoBlaze.pb.all;


entity pb_InterruptController_Device is
	generic (
		DEBUG													: BOOLEAN												:= FALSE;
		DEVICE_INSTANCE								: T_PB_DEVICE_INSTANCE;
		PORTS													: POSITIVE											:= 4
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
		Message												: out T_SLV_8;
		
		-- PicoBlaze interrupt interface (direct coupled)
		PB_Interrupt									: out	STD_LOGIC;
		PB_Interrupt_Ack							: in	STD_LOGIC;
				
		-- Interrupt source interface
		Dev_Interrupt									: in	STD_LOGIC_VECTOR(PORTS - 1 downto 0);
		Dev_Interrupt_Ack							: out	STD_LOGIC_VECTOR(PORTS - 1 downto 0);
		Dev_Interrupt_Message					: in	T_SLVV_8(PORTS - 1 downto 0)
	);
end entity;


architecture rtl of pb_InterruptController_Device is
	attribute KEEP										: BOOLEAN;
	
	constant REQUIRED_REG_BYTES				: POSITIVE		:= div_ceil(PORTS, 8);
	-- Regarding REQUIRED_REG_BYTES, the position of the enable/disable marker bit is moved from LSB to MSB
	-- Example 1:
	--	REQUIRED_REG_BYTES = 1
	--	-> no bit is required to address the register in the field, because it's only one byte
	--	=> enable/disable bit is located at bit 0
	--
	-- Example 2:
	--	REQUIRED_REG_BYTES = 3
	--	-> 2 bits are required to address 3 registers in the field [23:0]
	--	-> [1:0] is used to address the correct byte/register
	--	=> enable/disable bit is located at bit 2
	constant BIT_EN_DIS									: NATURAL			:= log2ceil(REQUIRED_REG_BYTES);
	constant BIT_VEC_MES								: NATURAL			:= log2ceil(REQUIRED_REG_BYTES);
	
	constant REG_WO_ENABLE_BIT_VALUE		: STD_LOGIC		:= '0';
	constant REG_WO_DISABLE_BIT_VALUE		: STD_LOGIC		:= '1';
	constant REG_RO_VECTOR_BIT_VALUE		: STD_LOGIC		:= '0';
	constant REG_RO_MESSAGE_BIT_VALUE		: STD_LOGIC		:= '1';
	
	signal AdrDec_we										: STD_LOGIC;
	signal AdrDec_re										: STD_LOGIC;
	signal AdrDec_WriteAddress					: T_SLV_8;
	signal AdrDec_ReadAddress						: T_SLV_8;
	signal AdrDec_Data									: T_SLV_8;
	
	signal Reg_InterruptEnable_slvv			: T_SLVV_8(REQUIRED_REG_BYTES - 1 downto 0)								:= (others => (others => '0'));
	signal Reg_InterruptEnable					: STD_LOGIC_VECTOR((REQUIRED_REG_BYTES * 8) - 1 downto 0);
	
	type T_STATE is (ST_IDLE, ST_INTERRUPT_PENDING, ST_INTERRUPT_MESSAGE);
	
	signal State												: T_STATE																			:= ST_IDLE;
	signal NextState										: T_STATE;

	signal Interrupt_re									: STD_LOGIC_VECTOR(PORTS - 1 downto 0);
	signal InterruptPending_r						: STD_LOGIC_VECTOR(PORTS - 1 downto 0)				:= (others => '0');
	signal InterruptMessages_d					: T_SLVV_8(PORTS - 1 downto 0)								:= (others => (others => '0'));
	signal InterruptRequestsOpen				: STD_LOGIC;
	
	signal InterruptRequestVector				: STD_LOGIC_VECTOR(PORTS - 1 downto 0);

	signal InterruptSource_Read					: STD_LOGIC;
	signal FSM_DataOut									: T_SLV_8;
	signal FSM_Arbitrate								: STD_LOGIC;
	signal FSM_InterruptClearVector			: STD_LOGIC_VECTOR(PORTS - 1 downto 0);
	
	signal Arb_GrantVector							: STD_LOGIC_VECTOR(PORTS - 1 downto 0);
	signal Arb_GrantVector_bin					: STD_LOGIC_VECTOR(log2ceilnz(PORTS) - 1 downto 0);
	
	attribute KEEP of FSM_Arbitrate						: signal is DEBUG;
	attribute KEEP of Arb_GrantVector					: signal is DEBUG;
	attribute KEEP of InterruptRequestVector	: signal is DEBUG;
	
begin
	assert (PORTS <= 32)
		report "InterruptController supports only up to 32 interrupt sources!"
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
			In_Address								=> Address,
			In_WriteStrobe						=> WriteStrobe,
			In_WriteStrobe_K					=> WriteStrobe_K,
			In_ReadStrobe							=> ReadStrobe,
			In_Data										=> DataIn,
			Out_WriteAddress					=> AdrDec_WriteAddress,
			Out_ReadAddress						=> AdrDec_ReadAddress,
			Out_WriteStrobe						=> AdrDec_we,
			Out_ReadStrobe						=> AdrDec_re,
			Out_Data									=> AdrDec_Data
		);

	process(Clock, AdrDec_WriteAddress)
		variable index	: NATURAL;
	begin
		index := to_index(AdrDec_WriteAddress(BIT_EN_DIS - 1 downto 0));
	
		if rising_edge(Clock) then
			if (Reset = '1') then
				Reg_InterruptEnable_slvv			<= (others => (others => '0'));
			elsif (AdrDec_we = '1') then
				case AdrDec_WriteAddress(BIT_EN_DIS) is
					when REG_WO_ENABLE_BIT_VALUE =>		Reg_InterruptEnable_slvv(index)	<= Reg_InterruptEnable_slvv(index) or AdrDec_Data;
					when REG_WO_DISABLE_BIT_VALUE =>	Reg_InterruptEnable_slvv(index)	<= Reg_InterruptEnable_slvv(index) and not AdrDec_Data;
					when others =>										null;
				end case;
			end if;
		end if;
	end process;

	process(AdrDec_re, AdrDec_ReadAddress, Reg_InterruptEnable_slvv, FSM_DataOut)
		variable index	: NATURAL;
	begin
		index			:= to_index(AdrDec_ReadAddress(BIT_VEC_MES - 1 downto 0));
		DataOut		<= FSM_DataOut;
	
		case AdrDec_ReadAddress(BIT_VEC_MES) is
			when REG_RO_VECTOR_BIT_VALUE =>		DataOut		<= Reg_InterruptEnable_slvv(index);
			when REG_RO_MESSAGE_BIT_VALUE =>	DataOut		<= FSM_DataOut;
			when others =>										DataOut		<= (others => 'X');
		end case;
		
		InterruptSource_Read	<= AdrDec_re and to_sl(AdrDec_ReadAddress(BIT_VEC_MES) = REG_RO_MESSAGE_BIT_VALUE);
	end process;

	Interrupt		<= '0';
	Message			<= x"00";

	genPort : for i in 0 to PORTS - 1 generate
		signal Interrupt_d			: STD_LOGIC				:= '0';
	begin
		Interrupt_d							<= Dev_Interrupt(i) when rising_edge(Clock);
		Interrupt_re(i)					<= not Interrupt_d and Dev_Interrupt(i);

		-- RS-FFs to latch the interrupt signal and the message
		InterruptPending_r(i)		<= ffrs(q => InterruptPending_r(i),															 			rst => (Reset or FSM_InterruptClearVector(i)), set => Interrupt_re(i))	when rising_edge(Clock);
		InterruptMessages_d(i)	<= ffdre(q => InterruptMessages_d(i), d => Dev_Interrupt_Message(i),	rst => (Reset or FSM_InterruptClearVector(i)), en => Interrupt_re(i))		when rising_edge(Clock);
	end generate;

	Reg_InterruptEnable			<= to_slv(Reg_InterruptEnable_slvv);
	InterruptRequestVector	<= InterruptPending_r and Reg_InterruptEnable(InterruptPending_r'range);
	InterruptRequestsOpen		<= slv_or(InterruptRequestVector and not FSM_InterruptClearVector);

	Arb : entity PoC.bus_Arbiter
		generic map (
			STRATEGY									=> "RR",
			PORTS											=> PORTS,
			WEIGHTS										=> (0 to PORTS - 1 => 1),
			OUTPUT_REG								=> FALSE
		)
		port map (
			Clock											=> Clock,
			Reset											=> Reset,
			Arbitrate									=> FSM_Arbitrate,
			Request_Vector						=> InterruptRequestVector,
			Grant_Vector							=> Arb_GrantVector,
			Grant_Index								=> Arb_GrantVector_bin
		);

	process(Clock)
	begin
		if rising_edge(Clock) then
			if (Reset = '1') then
				State			<= ST_IDLE;
			else
				State			<= NextState;
			end if;
		end if;
	end process;

	process(State, InterruptRequestsOpen, Arb_GrantVector, Arb_GrantVector_bin, PB_Interrupt_Ack, InterruptSource_Read, InterruptMessages_d)
	begin
		NextState												<= State;
				
		PB_Interrupt										<= InterruptRequestsOpen;
		FSM_DataOut											<= resize(Arb_GrantVector_bin, FSM_DataOut'length);
		
		Dev_Interrupt_Ack								<= (others => '0');
			
		FSM_Arbitrate										<= '0';
		FSM_InterruptClearVector				<= (others => '0');
	
		case State is
			when ST_IDLE =>
				if (InterruptRequestsOpen = '1') then
					FSM_Arbitrate							<= '1';
					NextState									<= ST_INTERRUPT_PENDING;				
				end if;
				
			when ST_INTERRUPT_PENDING =>
				FSM_DataOut									<= resize(Arb_GrantVector_bin, FSM_DataOut'length);
		
				if (InterruptSource_Read = '1') then
					NextState									<= ST_INTERRUPT_MESSAGE;
				end if;
			
			when ST_INTERRUPT_MESSAGE =>
				FSM_DataOut									<= InterruptMessages_d(to_index(Arb_GrantVector_bin));
			
				if (PB_Interrupt_Ack = '1') then
					FSM_InterruptClearVector	<= Arb_GrantVector;
					Dev_Interrupt_Ack					<= Arb_GrantVector;
					
					if (InterruptRequestsOpen = '1') then
						FSM_Arbitrate						<= '1';
						NextState								<= ST_INTERRUPT_PENDING;
					else
						NextState								<= ST_IDLE;
					end if;
				end if;
			
		end case;
	end process;
end;
