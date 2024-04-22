-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- =============================================================================
-- Authors:					Patrick Lehmann
--
-- Package:					TODO
--
-- Description:
-- ------------------------------------
--		TODO
-- 
-- License:
-- =============================================================================
-- Copyright 2007-2015 Technische Universitaet Dresden - Germany
--										 Chair for VLSI-Design, Diagnostics and Architecture
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
-- =============================================================================

library	IEEE;
use			IEEE.STD_LOGIC_1164.all;
use			IEEE.NUMERIC_STD.all;

library	UNISIM;
use			UNISIM.VCOMPONENTS.all;

library PoC;
use			PoC.utils.all;
use			PoC.physical.all;
use			PoC.components.all;
use			PoC.io.all;


entity clknet_ClockNetwork_ML505 is
	generic (
		DEBUG                    : BOOLEAN            := FALSE;
		CLOCK_IN_FREQ            : FREQ              := 100 MHz
	);
	port (
		ClockIn_100MHz          : in	STD_LOGIC;

		ClockNetwork_Reset      : in	STD_LOGIC;
		ClockNetwork_ResetDone  :	out	STD_LOGIC;
		
		Control_Clock_100MHz    : out	STD_LOGIC;
		
		Clock_200MHz            : out	STD_LOGIC;
		Clock_125MHz            : out	STD_LOGIC;
		Clock_100MHz            : out	STD_LOGIC;
		Clock_10MHz              : out	STD_LOGIC;

		Clock_Stable_200MHz      : out	STD_LOGIC;
		Clock_Stable_125MHz      : out	STD_LOGIC;
		Clock_Stable_100MHz      : out	STD_LOGIC;
		Clock_Stable_10MHz      : out	STD_LOGIC
	);
end entity;


architecture trl of clknet_ClockNetwork_ML505 is
	attribute KEEP                      : BOOLEAN;
	attribute ASYNC_REG                  : STRING;
	attribute SHREG_EXTRACT              : STRING;

	signal ClkNet_Reset                  : STD_LOGIC;
	
	signal DCM_Reset                    : STD_LOGIC;
	signal DCM_Reset_clr                : STD_LOGIC;
	signal DCM_Locked                    : STD_LOGIC;
	signal DCM_Locked_async              : STD_LOGIC;

	signal Locked                        : STD_LOGIC;
	signal Reset                        : STD_LOGIC;
	
	signal Control_Clock                : STD_LOGIC;
	signal Control_Clock_BUFR            : STD_LOGIC;
	
	signal DCM_Clock_10MHz              : STD_LOGIC;
	signal DCM_Clock_100MHz              : STD_LOGIC;
	signal DCM_Clock_125MHz              : STD_LOGIC;
	signal DCM_Clock_200MHz              : STD_LOGIC;

	signal DCM_Clock_10MHz_BUFG          : STD_LOGIC;
	signal DCM_Clock_100MHz_BUFG        : STD_LOGIC;
	signal DCM_Clock_125MHz_BUFG        : STD_LOGIC;
	signal DCM_Clock_200MHz_BUFG        : STD_LOGIC;

	attribute KEEP of DCM_Clock_10MHz_BUFG    : signal is DEBUG;
	attribute KEEP of DCM_Clock_100MHz_BUFG    : signal is DEBUG;
	attribute KEEP of DCM_Clock_125MHz_BUFG    : signal is DEBUG;
	attribute KEEP of DCM_Clock_200MHz_BUFG    : signal is DEBUG;

begin
-- ==================================================================
	-- ResetControl
	-- ==================================================================
	-- synchronize external (async) ClockNetwork_Reset and internal (but async) DCM_Locked signals to "Control_Clock" domain
	syncControlClock: entity PoC.sync_Bits_Xilinx
		generic map (
			BITS          => 2                    -- number of BITS to synchronize
		)
		port map (
			Clock          => Control_Clock,        -- Clock to be synchronized to
			Input(0)      => ClockNetwork_Reset,  -- Data to be synchronized
			Input(1)      => DCM_Locked_async,    -- 
			Output(0)      => ClkNet_Reset,        -- synchronized data
			Output(1)      => DCM_Locked            -- 
		);
	
	DCM_Reset_clr            <= ClkNet_Reset NOR DCM_Locked;
	
	--												RS-FF							Q										RST										SET														CLK
	DCM_Reset                <= ffrs(q => ClkNet_Reset,	rst => DCM_Reset_clr,	set => ClkNet_Reset) when rising_edge(Control_Clock);
	
	Locked                  <= DCM_Locked;
	Reset                    <= NOT Locked;
	ClockNetwork_ResetDone  <= Locked;

	-- ==================================================================
	-- ClockBuffers
	-- ==================================================================
	-- Control_Clock
	BUFR_Control_Clock : BUFR
--		GENERIC MAP (
--			SIM_DEVICE  => "7SERIES"
--		)
		port map (
			CE  => '1',
			CLR  => '0',
			I    => ClockIn_100MHz,
			O    => Control_Clock_BUFR
		);
	
	Control_Clock <= Control_Clock_BUFR;
	
	-- 10 MHz BUFG
	BUFG_Clock_10MHz : BUFG
		port map (
			I    => DCM_Clock_10MHz,
			O    => DCM_Clock_10MHz_BUFG
		);

	-- 100 MHz BUFG
	BUFG_Clock_100MHz : BUFG
		port map (
			I    => DCM_Clock_100MHz,
			O    => DCM_Clock_100MHz_BUFG
		);

	-- 125 MHz BUFG
	BUFG_Clock_125MHz : BUFG
		port map (
			I    => DCM_Clock_125MHz,
			O    => DCM_Clock_125MHz_BUFG
		);
		
	-- 200 MHz BUFG
	BUFG_Clock_200MHz : BUFG
		port map (
			I    => DCM_Clock_200MHz,
			O    => DCM_Clock_200MHz_BUFG
		);
		
	-- ==================================================================
	-- Digital Clock Manager (DCM)
	-- ==================================================================
	System_DCM : DCM_BASE
		generic map (
			DUTY_CYCLE_CORRECTION    => TRUE,
			FACTORY_JF              => x"F0F0",
			CLKIN_PERIOD            => 1.0e9 / real(CLOCK_IN_FREQ / 1 Hz),
			
			CLKDV_DIVIDE            => 10.0,
			
			CLKFX_MULTIPLY          => 5,
			CLKFX_DIVIDE            => 4
		)
		port map (
			CLKIN                    => ClockIn_100MHz,
			CLKFB                    => DCM_Clock_100MHz_BUFG,
			
			RST                      => DCM_Reset,
			
			CLKDV                    => DCM_Clock_10MHz,
			
			CLK0                    => DCM_Clock_100MHz,
			CLK90                    => open,
			CLK180                  => open,
			CLK270                  => open,
		
			CLK2X                    => DCM_Clock_200MHz,
			CLK2X180                => open,
			
			CLKFX                    => DCM_Clock_125MHz,
			CLKFX180                => open,
			
			LOCKED                  => DCM_Locked_async
		);
	
	Control_Clock_100MHz    <= Control_Clock_BUFR;
	Clock_200MHz      <= DCM_Clock_200MHz_BUFG;
	Clock_125MHz      <= DCM_Clock_125MHz_BUFG;
	Clock_100MHz      <= DCM_Clock_100MHz_BUFG;
	Clock_10MHz        <= DCM_Clock_10MHz_BUFG;
	
	-- synchronize internal Locked signal to ouput clock domains
	syncReset200MHz: entity PoC.sync_Bits_Xilinx
		port map (
			Clock          => DCM_Clock_200MHz_BUFG,    -- Clock to be synchronized to
			Input(0)      => Locked,                  -- Data to be synchronized
			Output(0)      => Clock_Stable_200MHz      -- synchronized data
		);

	syncReset125MHz: entity PoC.sync_Bits_Xilinx
		port map (
			Clock          => DCM_Clock_125MHz_BUFG,    -- Clock to be synchronized to
			Input(0)      => Locked,                  -- Data to be synchronized
			Output(0)      => Clock_Stable_125MHz      -- synchronized data
		);

	syncReset100MHz: entity PoC.sync_Bits_Xilinx
		port map (
			Clock          => DCM_Clock_100MHz_BUFG,    -- Clock to be synchronized to
			Input(0)      => Locked,                  -- Data to be synchronized
			Output(0)      => Clock_Stable_100MHz      -- synchronized data
		);

	syncReset10MHz: entity PoC.sync_Bits_Xilinx
		port map (
			Clock          => DCM_Clock_10MHz_BUFG,    -- Clock to be synchronized to
			Input(0)      => Locked,                  -- Data to be synchronized
			Output(0)      => Clock_Stable_10MHz        -- synchronized data
		);
end architecture;
