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

library	IEEE;
use			IEEE.STD_LOGIC_1164.all;
use			IEEE.NUMERIC_STD.all;

library	altera_mf;
use			altera_mf.Altera_MF_Components.all;

library PoC;
use			PoC.physical.all;
use			PoC.components.all;


entity clknet_ClockNetwork_DE4 is
	GENERIC (
		DEBUG                     : BOOLEAN                       := FALSE;
		CLOCK_IN_FREQ             : FREQ                          := 100 MHz
	);
	port (
		ClockIn_100MHz            : in	STD_LOGIC;

		ClockNetwork_Reset        : in	STD_LOGIC;
		ClockNetwork_ResetDone    :	out	STD_LOGIC;
		
		Control_Clock_100MHz      : out	STD_LOGIC;
		
		Clock_250MHz              : out	STD_LOGIC;
		Clock_200MHz              : out	STD_LOGIC;
		Clock_125MHz              : out	STD_LOGIC;
		Clock_100MHz              : out	STD_LOGIC;
		Clock_10MHz               : out	STD_LOGIC;

		Clock_Stable_250MHz       : out	STD_LOGIC;
		Clock_Stable_200MHz       : out	STD_LOGIC;
		Clock_Stable_125MHz       : out	STD_LOGIC;
		Clock_Stable_100MHz       : out	STD_LOGIC;
		Clock_Stable_10MHz        : out	STD_LOGIC
	);
end entity;


architecture rtl of clknet_ClockNetwork_DE4 is
	attribute PRESERVE          : BOOLEAN;
--	component altpll
--		generic (
--			bandwidth_type          : STRING;
--			clk0_divide_by          : NATURAL;
--			clk0_duty_cycle          : NATURAL;
--			clk0_multiply_by        : NATURAL;
--			clk0_phase_shift        : STRING;
--			inclk0_input_frequency  : NATURAL;
--			intended_device_family  : STRING;
--			lpm_hint                : STRING;
--			lpm_type                : STRING;
--			operation_mode          : STRING;
--			pll_type                : STRING;
--			port_activeclock        : STRING;
--			port_areset              : STRING;
--			port_clkbad0            : STRING;
--			port_clkbad1            : STRING;
--			port_clkloss            : STRING;
--			port_clkswitch          : STRING;
--			port_configupdate        : STRING;
--			port_fbin                : STRING;
--			port_fbout              : STRING;
--			port_inclk0              : STRING;
--			port_inclk1              : STRING;
--			port_locked              : STRING;
--			port_pfdena              : STRING;
--			port_phasecounterselect  : STRING;
--			port_phasedone          : STRING;
--			port_phasestep          : STRING;
--			port_phaseupdown        : STRING;
--			port_pllena              : STRING;
--			port_scanaclr            : STRING;
--			port_scanclk            : STRING;
--			port_scanclkena          : STRING;
--			port_scandata            : STRING;
--			port_scandataout        : STRING;
--			port_scandone            : STRING;
--			port_scanread            : STRING;
--			port_scanwrite          : STRING;
--			port_clk0                : STRING;
--			port_clk1                : STRING;
--			port_clk2                : STRING;
--			port_clk3                : STRING;
--			port_clk4                : STRING;
--			port_clk5                : STRING;
--			port_clk6                : STRING;
--			port_clk7                : STRING;
--			port_clk8                : STRING;
--			port_clk9                : STRING;
--			port_clkena0            : STRING;
--			port_clkena1            : STRING;
--			port_clkena2            : STRING;
--			port_clkena3            : STRING;
--			port_clkena4            : STRING;
--			port_clkena5            : STRING;
--			using_fbmimicbidir_port  : STRING;
--			width_clock              : NATURAL
--		);
--		port (
--			clk    : out	STD_LOGIC_VECTOR (9 downto 0);
--			inclk  : in	STD_LOGIC_VECTOR (1 downto 0)
--		);
--	end component;


	-- delay CMB resets until the slowed syncBlock has noticed that LockedState is low
	--	control clock:				100 MHz
	--	slowest output clock:	10 MHz
	--	worst case delay:			(Control_Clock freq / slowest clock in MHz) * register stages		+ safety
	--    => 44								(100 MHz						/ 10 MHz)								* 2 register stages	+ 4
	constant CMB_DELAY_CYCLES           : POSITIVE    := integer(real(CLOCK_IN_FREQ / 10 MHz) * 2.0 + 4.0);

	signal ClkNet_Reset                 : STD_LOGIC;
	
	signal PLL_Reset                    : STD_LOGIC;
	signal PLL_Reset_clr                : STD_LOGIC;
	signal PLL_ResetState               : STD_LOGIC    := '0';
	signal PLL_Reset_delayed            : STD_LOGIC_VECTOR(CMB_DELAY_CYCLES - 1 downto 0);
	signal PLL_Locked_async             : STD_LOGIC;
	signal PLL_Locked                   : STD_LOGIC;
	signal PLL_Locked_d                 : STD_LOGIC    := '0';
	signal PLL_Locked_re                : STD_LOGIC;
	signal PLL_LockedState              : STD_LOGIC    := '0';
	
	signal Locked                       : STD_LOGIC;
	signal Reset                        : STD_LOGIC;
	
	signal Control_Clock                : STD_LOGIC;
	signal PLL_Clock_250MHz             : STD_LOGIC;
	signal PLL_Clock_200MHz             : STD_LOGIC;
	signal PLL_Clock_125MHz             : STD_LOGIC;
	signal PLL_Clock_100MHz             : STD_LOGIC;
	signal PLL_Clock_10MHz              : STD_LOGIC;

	attribute PRESERVE of PLL_Clock_10MHz    : signal is DEBUG;
	attribute PRESERVE of PLL_Clock_100MHz  : signal is DEBUG;
	attribute PRESERVE of PLL_Clock_125MHz  : signal is DEBUG;
	attribute PRESERVE of PLL_Clock_200MHz  : signal is DEBUG;
	attribute PRESERVE of PLL_Clock_250MHz  : signal is DEBUG;

begin
	-- ==================================================================
	-- ResetControl
	-- ==================================================================
	-- synchronize external (async) ClockNetwork_Reset and internal (but async) PLL_Locked signals to "Control_Clock" domain
	syncControlClock: entity PoC.sync_Bits_Altera
		generic map (
			BITS          => 2                    -- number of BITS to synchronize
		)
		port map (
			Clock         => Control_Clock,       -- Clock to be synchronized to
			Input(0)      => ClockNetwork_Reset,  -- Data to be synchronized
			Input(1)      => PLL_Locked_async,    -- 
			Output(0)     => ClkNet_Reset,        -- synchronized data
			Output(1)     => PLL_Locked           -- 
		);
	-- clear reset signals, if external Reset is low and CMB (clock modifying block) noticed reset -> locked = low
	PLL_Reset_clr           <= ClkNet_Reset nor PLL_Locked;

	-- detect rising edge on CMB locked signals
	PLL_Locked_d            <= PLL_Locked		when rising_edge(Control_Clock);
	PLL_Locked_re           <= not PLL_Locked_d		and PLL_Locked;
	
	--												RS-FF					Q										RST										SET														CLK
	-- hold reset until external reset goes low and CMB noticed reset
	PLL_ResetState          <= ffrs(q => PLL_ResetState,	 rst => PLL_Reset_clr,	set => ClkNet_Reset)	 when rising_edge(Control_Clock);
	-- deassert *_LockedState, if CMBs are going to be reseted; assert it if *_Locked is high again
	PLL_LockedState         <= ffrs(q => PLL_LockedState,	 rst => ClkNet_Reset,			set => PLL_Locked_re)	 when rising_edge(Control_Clock);
	
	-- delay CMB resets until the slowed syncBlock has noticed that LockedState is low
	PLL_Reset_delayed       <= sr_left(PLL_Reset_delayed,	 PLL_ResetState)	when rising_edge(Control_Clock);
	
	PLL_Reset               <= PLL_Reset_delayed(PLL_Reset_delayed'high);
	
	Locked                  <= PLL_LockedState;
	ClockNetwork_ResetDone  <= Locked;

	-- ==================================================================
	-- ClockBuffers
	-- ==================================================================
	-- Control_Clock
	Control_Clock         <= ClockIn_100MHz;
	
	Control_Clock_100MHz  <= Control_Clock;
	Clock_250MHz          <= PLL_Clock_250MHz;
	Clock_200MHz          <= PLL_Clock_200MHz;
	Clock_125MHz          <= PLL_Clock_125MHz;
	Clock_100MHz          <= PLL_Clock_100MHz;
	Clock_10MHz           <= PLL_Clock_10MHz;

	PLL: entity work.mypll
		port map (
			AReset  => PLL_Reset,
			inclk0  => ClockIn_100MHz,
			Locked  => PLL_Locked_async,
			
			c0      => PLL_Clock_100MHz,
			c1      => PLL_Clock_200MHz,
			c2      => PLL_Clock_250MHz,
			c3      => PLL_Clock_125MHz,
			c4      => PLL_Clock_10MHz
		);

	-- synchronize internal Locked signal to output clock domains
	syncLocked250MHz: entity PoC.sync_Bits_Altera
		port map (
			Clock         => PLL_Clock_250MHz,          -- Clock to be synchronized to
			Input(0)      => Locked,                    -- Data to be synchronized
			Output(0)     => Clock_Stable_250MHz        -- synchronized data
		);
	
	syncLocked200MHz: entity PoC.sync_Bits_Altera
		port map (
			Clock         => PLL_Clock_200MHz,          -- Clock to be synchronized to
			Input(0)      => Locked,                    -- Data to be synchronized
			Output(0)     => Clock_Stable_200MHz        -- synchronized data
		);

	syncLocked125MHz: entity PoC.sync_Bits_Altera
		port map (
			Clock         => PLL_Clock_125MHz,          -- Clock to be synchronized to
			Input(0)      => Locked,                    -- Data to be synchronized
			Output(0)     => Clock_Stable_125MHz        -- synchronized data
		);

	syncLocked100MHz: entity PoC.sync_Bits_Altera
		port map (
			Clock         => PLL_Clock_100MHz,          -- Clock to be synchronized to
			Input(0)      => Locked,                    -- Data to be synchronized
			Output(0)     => Clock_Stable_100MHz        -- synchronized data
		);

	syncLocked10MHz: entity PoC.sync_Bits_Altera
		port map (
			Clock         => PLL_Clock_10MHz,           -- Clock to be synchronized to
			Input(0)      => Locked,                    -- Data to be synchronized
			Output(0)     => Clock_Stable_10MHz         -- synchronized data
		);
end architecture;
