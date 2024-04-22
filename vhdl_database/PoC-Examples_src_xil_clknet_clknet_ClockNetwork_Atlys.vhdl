-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- 
-- =============================================================================
-- Authors:					Patrick Lehmann
--
-- Entity:					TODO
--
-- Description:
-- ------------------------------------
--		TODO
-- 
-- License:
-- =============================================================================
-- Copyright 2007-2017 Technische Universitaet Dresden - Germany
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

library IEEE;
use			IEEE.STD_LOGIC_1164.all;
use			IEEE.NUMERIC_STD.all;

library UNISIM;
use			UNISIM.VCOMPONENTS.all;

library PoC;
use			PoC.utils.all;
use			PoC.physical.all;
use			PoC.components.all;
use			PoC.io.all;


entity clknet_ClockNetwork_Atlys is
	generic (
		DEBUG                      : BOOLEAN                       := FALSE;
		CLOCK_IN_FREQ              : FREQ                          := 100 MHz
	);
	port (
		ClockIn_100MHz            : in	STD_LOGIC;

		ClockNetwork_Reset        : in	STD_LOGIC;
		ClockNetwork_ResetDone    :	out	STD_LOGIC;
		
		Control_Clock_100MHz      : out	STD_LOGIC;
		
		Clock_200MHz              : out	STD_LOGIC;
		Clock_125MHz              : out	STD_LOGIC;
		Clock_100MHz              : out	STD_LOGIC;
		Clock_10MHz               : out	STD_LOGIC;

		Clock_Stable_200MHz       : out	STD_LOGIC;
		Clock_Stable_125MHz       : out	STD_LOGIC;
		Clock_Stable_100MHz       : out	STD_LOGIC;
		Clock_Stable_10MHz        : out	STD_LOGIC
	);
end entity;

-- DCM - clock wizard report
-- 
-- Output		Output			Phase		 Duty			Pk-to-Pk		 	Phase
-- Clock		Freq (MHz) (degrees) Cycle (%) Jitter (ps)		Error (ps)
-------------------------------------------------------------------------------
-- CLK_OUT0		100.000			0.000			50.0			200.000			 150.000
-- CLK_OUT1		200.000			0.000			50.0			300.000			 150.000
-- CLK_OUT2		125.000			0.000			50.0			360.000			 150.000
-- CLK_OUT3		 10.000			0.000			50.0			300.000			 150.000
--

architecture rtl of clknet_ClockNetwork_Atlys is
	attribute KEEP                      : BOOLEAN;

	-- delay CMB resets until the slowed syncBlock has noticed that LockedState is low
	--	control clock:				100 MHz
	--	slowest output clock:	10 MHz
	--	worst case delay:			(Control_Clock freq / slowest clock in MHz) * register stages		+ safety
	--    => 24								(100 MHz						/ 10 MHz)								* 2 register stages	+ 4
	constant CMB_DELAY_CYCLES           : POSITIVE    := integer(real(CLOCK_IN_FREQ / 10 MHz) * 2.0 + 4.0);

	signal ClkNet_Reset                 : STD_LOGIC;
	
	signal DCM_Reset                    : STD_LOGIC;
	signal DCM_Reset_clr                : STD_LOGIC;
	signal DCM_ResetState               : STD_LOGIC    := '0';
	signal DCM_Reset_delayed            : STD_LOGIC_VECTOR(CMB_DELAY_CYCLES - 1 DOWNTO 0);
	signal DCM_Locked_async             : STD_LOGIC;
	signal DCM_Locked                   : STD_LOGIC;
	signal DCM_Locked_d                 : STD_LOGIC    := '0';
	signal DCM_Locked_re                : STD_LOGIC;
	signal DCM_LockedState              : STD_LOGIC    := '0';

	signal Locked                       : STD_LOGIC;
	signal Reset                        : STD_LOGIC;
	
	signal Control_Clock                : STD_LOGIC;
	signal Control_Clock_BUFG           : STD_LOGIC;
	
	signal DCM_Clock_10MHz              : STD_LOGIC;
	signal DCM_Clock_100MHz             : STD_LOGIC;
	signal DCM_Clock_125MHz             : STD_LOGIC;
	signal DCM_Clock_200MHz             : STD_LOGIC;

	signal DCM_Clock_10MHz_BUFG         : STD_LOGIC;
	signal DCM_Clock_100MHz_BUFG        : STD_LOGIC;
	signal DCM_Clock_125MHz_BUFG        : STD_LOGIC;
	signal DCM_Clock_200MHz_BUFG        : STD_LOGIC;

	attribute KEEP of DCM_Clock_10MHz_BUFG     : signal is DEBUG;
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
			Clock         => Control_Clock,       -- Clock to be synchronized to
			Input(0)      => ClockNetwork_Reset,  -- Data to be synchronized
			Input(1)      => DCM_Locked_async,    -- 
			Output(0)     => ClkNet_Reset,        -- synchronized data
			Output(1)     => DCM_Locked           -- 
		);
	-- clear reset signals, if external Reset is low and CMB (clock modifying block) noticed reset -> locked = low
	DCM_Reset_clr           <= ClkNet_Reset nor DCM_Locked;

	-- detect rising edge on CMB locked signals
	DCM_Locked_d            <= DCM_Locked	when rising_edge(Control_Clock);
	DCM_Locked_re           <= not DCM_Locked_d	and DCM_Locked;
	
	--												RS-FF					Q										RST										SET														CLK
	-- hold reset until external reset goes low and CMB noticed reset
	DCM_ResetState          <= ffrs(q => DCM_ResetState,	 rst => DCM_Reset_clr,	set => ClkNet_Reset)	 when rising_edge(Control_Clock);
	-- deassert *_LockedState, if CMBs are going to be reseted; assert it if *_Locked is high again
	DCM_LockedState         <= ffrs(q => DCM_LockedState, rst => DCM_Reset,			set => DCM_Locked_re) when rising_edge(Control_Clock);
	
	-- delay CMB resets until the slowed syncBlock has noticed that LockedState is low
	DCM_Reset_delayed       <= sr_left(DCM_Reset_delayed, DCM_ResetState) when rising_edge(Control_Clock);
	DCM_Reset               <= DCM_Reset_delayed(DCM_Reset_delayed'high);
	
	Locked                  <= DCM_LockedState and '1';  --PLL_LockedState;
	ClockNetwork_ResetDone  <= Locked;

	-- ==================================================================
	-- ClockBuffers
	-- ==================================================================
	-- Control_Clock
	BUFR_Control_Clock : BUFG
		port map (
			I    => ClockIn_100MHz,
			O    => Control_Clock_BUFG
		);
	
	Control_Clock <= Control_Clock_BUFG;
	
	-- 10 MHz BUFG
	BUFG_DCM_Clock_10MHz : BUFG
		port map (
			I    => DCM_Clock_10MHz,
			O    => DCM_Clock_10MHz_BUFG
		);

	-- 100 MHz BUFG
	BUFG_DCM_Clock_100MHz : BUFG
		port map (
			I    => DCM_Clock_100MHz,
			O    => DCM_Clock_100MHz_BUFG
		);

	-- 125 MHz BUFG
	BUFG_DCM_Clock_125MHz : BUFG
		port map (
			I    => DCM_Clock_125MHz,
			O    => DCM_Clock_125MHz_BUFG
		);

	-- 200 MHz BUFG
	BUFG_DCM_Clock_200MHz : BUFG
		port map (
			I    => DCM_Clock_200MHz,
			O    => DCM_Clock_200MHz_BUFG
		);
		
	-- ==================================================================
	-- Mixed-Mode Clock Manager (DCM)
	-- ==================================================================
	System_DCM : DCM_SP
		generic map (
			STARTUP_WAIT            => false,
			DESKEW_ADJUST            => "SYSTEM_SYNCHRONOUS",  -- "SOURCE_SYNCHRONOUS"
			PHASE_SHIFT              => 0,
			
			CLKIN_PERIOD            => to_real(to_time(CLOCK_IN_FREQ), 1.0 ns),
			CLKIN_DIVIDE_BY_2        => FALSE,

			CLK_FEEDBACK            => "1X",

			CLKOUT_PHASE_SHIFT      => "NONE",
			
			CLKDV_DIVIDE            => 10.0,
			CLKFX_DIVIDE            => 4,
			CLKFX_MULTIPLY          => 5
		)
		port map (
			RST                 => DCM_Reset,

			CLKIN               => ClockIn_100MHz,
			CLKFB               => DCM_Clock_100MHz_BUFG,
			
			CLK0                => DCM_Clock_100MHz,
			CLK90               => open,
			CLK180              => open,
			CLK270              => open,
			CLK2X               => DCM_Clock_200MHz,
			CLK2X180            => open,
			CLKFX               => DCM_Clock_125MHz,
			CLKFX180            => open,
			CLKDV               => DCM_Clock_10MHz,

			-- DCM status
			LOCKED              =>	DCM_Locked_async,
			STATUS              => open,
			
			-- Dynamic Phase Shift Port
			PSCLK               =>	'0',
			PSEN                =>	'0',
			PSINCDEC            =>	'0', 
			PSDONE              =>	open,
			
			DSSEN               => '0'
		);
		
	Control_Clock_100MHz  <= Control_Clock_BUFG;
	Clock_200MHz          <= DCM_Clock_200MHz_BUFG;
	Clock_125MHz          <= DCM_Clock_125MHz_BUFG;
	Clock_100MHz          <= DCM_Clock_100MHz_BUFG;
	Clock_10MHz           <= DCM_Clock_10MHz_BUFG;

	-- synchronize internal Locked signal to output clock domains
	syncLocked200MHz: entity PoC.sync_Bits_Xilinx
		port map (
			Clock         => DCM_Clock_200MHz_BUFG,     -- Clock to be synchronized to
			Input(0)      => Locked,                    -- Data to be synchronized
			Output(0)     => Clock_Stable_200MHz        -- synchronized data
		);

	syncLocked125MHz: entity PoC.sync_Bits_Xilinx
		port map (
			Clock         => DCM_Clock_125MHz_BUFG,     -- Clock to be synchronized to
			Input(0)      => Locked,                    -- Data to be synchronized
			Output(0)     => Clock_Stable_125MHz        -- synchronized data
		);

	syncLocked100MHz: entity PoC.sync_Bits_Xilinx
		port map (
			Clock         => DCM_Clock_100MHz_BUFG,     -- Clock to be synchronized to
			Input(0)      => Locked,                    -- Data to be synchronized
			Output(0)     => Clock_Stable_100MHz        -- synchronized data
		);

	syncLocked10MHz: entity PoC.sync_Bits_Xilinx
		port map (
			Clock         => DCM_Clock_10MHz_BUFG,      -- Clock to be synchronized to
			Input(0)      => Locked,                    -- Data to be synchronized
			Output(0)     => Clock_Stable_10MHz         -- synchronized data
		);
end architecture;
