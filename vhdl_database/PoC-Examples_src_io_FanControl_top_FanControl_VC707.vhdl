-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- ============================================================================
-- Authors:					Patrick Lehmann
--									Thomas B. Preusser
--
-- Top-Module:			FanControl example design for a VC707 board
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


entity top_FanControl_VC707 is
  port (
    VC707_SystemClock_200MHz_p  : in	STD_LOGIC;
    VC707_SystemClock_200MHz_n  : in	STD_LOGIC;

    VC707_FanControl_PWM        : out STD_LOGIC;
    VC707_FanControl_Tacho      : in  STD_LOGIC
  );
end entity;


architecture top of top_FanControl_VC707 is
	attribute KEEP                      : BOOLEAN;

	-- ===========================================================================
	-- configurations
	-- ===========================================================================
	-- common configuration
	constant DEBUG                      : BOOLEAN             := TRUE;
	constant SYSTEM_CLOCK_FREQ          : FREQ                := 200 MHz;

	-- ===========================================================================
	-- signal declarations
	-- ===========================================================================
	signal System_Clock_ibufgds         : STD_LOGIC;
	signal System_Clock                 : STD_LOGIC;
	signal System_Reset                 : STD_LOGIC;

begin
	-- ===========================================================================
	-- assert statements
	-- ===========================================================================
	assert FALSE report "FanControl configuration:"                               severity NOTE;
	assert FALSE report "  SYSTEM_CLOCK_FREQ: " & to_string(SYSTEM_CLOCK_FREQ, 3) severity note;

	-- ===========================================================================
	-- Input/output buffers
	-- ===========================================================================
	IBUFGDS_SystemClock : IBUFGDS
		port map (
			I     => VC707_SystemClock_200MHz_p,
			IB    => VC707_SystemClock_200MHz_n,
			O     => System_Clock_ibufgds
		);

	BUFG_SystemClock : BUFG
		port map (
			I => System_Clock_ibufgds,
			O => System_Clock);
	
		System_Reset    <= '0';

	-- ===========================================================================
	-- Fan Control
	-- ===========================================================================
	blkFanControl : block
		signal FanControl_PWM           : STD_LOGIC;
		signal FanControl_PWM_d         : STD_LOGIC        := '0';
		
		signal FanControl_Tacho_async   : STD_LOGIC;
		signal FanControl_Tacho_sync    : STD_LOGIC;
		
	begin
		FanControl_Tacho_async  <= VC707_FanControl_Tacho;
	
		sync : entity PoC.sync_Bits
			port map (
				Clock       => System_Clock,            -- Clock to be synchronized to
				Input(0)    => FanControl_Tacho_async,  -- Data to be synchronized
				Output(0)   => FanControl_Tacho_sync    -- synchronized data
			);
	
		Fan : entity PoC.io_FanControl
			generic map (
				CLOCK_FREQ          => SYSTEM_CLOCK_FREQ    -- 200 MHz
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
		VC707_FanControl_PWM    <= FanControl_PWM_d;
	end block;
end architecture;
