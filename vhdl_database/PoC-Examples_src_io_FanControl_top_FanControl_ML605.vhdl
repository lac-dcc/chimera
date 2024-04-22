-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- ============================================================================
-- Authors:					Patrick Lehmann
--									Thomas B. Preusser
--
-- Top-Module:			FanControl example design for a ML605 board
--	
-- Description:
-- ------------------------------------
--		TODO
--
-- License:
-- ============================================================================
-- Copyright 2007-2015 Technische Universitaet Dresden - Germany
--                     Chair for VLSI-Design, Diagnostics and Architecture
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--              http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- ============================================================================

library IEEE;
use			IEEE.std_logic_1164.all;

library unisim;
use			unisim.vcomponents.all;

library PoC;
use			PoC.physical.all;


entity top_FanControl_ML605 is
  port (
    ML605_SystemClock_200MHz_p  : in	STD_LOGIC;
    ML605_SystemClock_200MHz_n  : in	STD_LOGIC;

		ML605_GPIO_LED              : out	STD_LOGIC_VECTOR(7 downto 0);

    ML605_FanControl_PWM        : out STD_LOGIC;
    ML605_FanControl_Tacho      : in  STD_LOGIC
  );
end entity;


architecture top of top_FanControl_ML605 is
	attribute KEEP                      : BOOLEAN;

	-- ===========================================================================
	-- configurations
	-- ===========================================================================
	-- common configuration
	constant DEBUG                      : BOOLEAN             := TRUE;
	constant SYS_CLOCK_FREQ             : FREQ                := 200 MHz;
	
	-- ClockNetwork configuration
	-- ===========================================================================
	constant SYSTEM_CLOCK_FREQ          : FREQ                := SYS_CLOCK_FREQ / 2;


	-- ===========================================================================
	-- signal declarations
	-- ===========================================================================
	-- clock and reset signals
  signal System_RefClock_200MHz       : STD_LOGIC;

	signal ClkNet_Reset                 : STD_LOGIC;
	signal ClkNet_ResetDone             : STD_LOGIC;

	signal SystemClock_200MHz           : STD_LOGIC;
	signal SystemClock_100MHz           : STD_LOGIC;

	signal SystemClock_Stable_200MHz    : STD_LOGIC;
	signal SystemClock_Stable_100MHz    : STD_LOGIC;

	signal System_Clock                 : STD_LOGIC;
	signal System_Reset                 : STD_LOGIC;
	attribute KEEP of System_Clock      : signal is TRUE;
	attribute KEEP of System_Reset      : signal is TRUE;

begin
	-- ===========================================================================
	-- assert statements
	-- ===========================================================================
	assert FALSE report "FanControl configuration:"                         severity NOTE;
	assert FALSE report "  SYS_CLOCK_FREQ: " & to_string(SYS_CLOCK_FREQ, 3)	severity note;

	-- ===========================================================================
	-- Input/output buffers
	-- ===========================================================================
	IBUFGDS_SystemClock : IBUFGDS
		port map (
			I     => ML605_SystemClock_200MHz_p,
			IB    => ML605_SystemClock_200MHz_n,
			O     => System_RefClock_200MHz
		);

	-- ==========================================================================================================================================================
	-- ClockNetwork
	-- ==========================================================================================================================================================
	ClkNet_Reset    <= '0';
	
	ClkNet : entity PoC.clknet_ClockNetwork_ML605
		generic map (
			CLOCK_IN_FREQ           => SYS_CLOCK_FREQ
		)
		port map (
			ClockIn_200MHz          => System_RefClock_200MHz,

			ClockNetwork_Reset      => ClkNet_Reset,
			ClockNetwork_ResetDone  => ClkNet_ResetDone,
			
			Control_Clock_200MHz    => open,
			
			Clock_250MHz            => open,
			Clock_200MHz            => SystemClock_200MHz,
			Clock_125MHz            => open,
			Clock_100MHz            => SystemClock_100MHz,
			Clock_10MHz             => open,

			Clock_Stable_250MHz     => open,
			Clock_Stable_200MHz     => SystemClock_Stable_200MHz,
			Clock_Stable_125MHz     => open,
			Clock_Stable_100MHz     => SystemClock_Stable_100MHz,
			Clock_Stable_10MHz      => open
		);
	
	-- system signals
	System_Clock    <= SystemClock_100MHz;
	System_Reset    <= not SystemClock_Stable_100MHz;

	-- ==========================================================================================================================================================
	-- General Purpose I/O
	-- ==========================================================================================================================================================
	blkGPIO : block
		signal GPIO_LED        : STD_LOGIC_VECTOR(7 downto 0);
		signal GPIO_LED_d      : STD_LOGIC_VECTOR(7 downto 0)    := (others => '0');
		
	begin
		GPIO_LED        <= "0000000" & ClkNet_ResetDone;
		GPIO_LED_d      <= GPIO_LED when rising_edge(System_Clock);
		ML605_GPIO_LED  <= GPIO_LED_d;
	end block;
	-- ==========================================================================================================================================================
	-- Fan Control
	-- ==========================================================================================================================================================
	blkFanControl : block
		signal FanControl_PWM            : STD_LOGIC;
		signal FanControl_PWM_d          : STD_LOGIC        := '0';
		
		signal FanControl_Tacho_async    : STD_LOGIC;
		signal FanControl_Tacho_sync    : STD_LOGIC;
		
	begin
		FanControl_Tacho_async  <= ML605_FanControl_Tacho;
	
		sync : entity PoC.sync_Bits
			port map (
				Clock       => System_Clock,            -- Clock to be synchronized to
				Input(0)    => FanControl_Tacho_async,  -- Data to be synchronized
				Output(0)   => FanControl_Tacho_sync    -- synchronized data
			);
	
		Fan : entity PoC.io_FanControl
			generic map (
				CLOCK_FREQ          => SYSTEM_CLOCK_FREQ    -- 100 MHz
			)
			port map (
				Clock               => System_Clock,
				Reset               => System_Reset,
					
				Fan_PWM             => FanControl_PWM,
				Fan_Tacho           => FanControl_Tacho_sync,
				
				TachoFrequency      => open
			);
		
		-- IOB-FF
		FanControl_PWM_d        <= FanControl_PWM when rising_edge(System_Clock);
		ML605_FanControl_PWM    <= FanControl_PWM_d;
	end block;
end architecture;
