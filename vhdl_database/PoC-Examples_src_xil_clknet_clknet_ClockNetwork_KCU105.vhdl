-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
-- =============================================================================
-- Authors:          Patrick Lehmann
--
-- Package:          TODO
--
-- Description:
-- ------------------------------------
--    TODO
-- 
-- License:
-- =============================================================================
-- Copyright 2017-2020 Patrick Lehmann - Boetzingen, Germany
-- Copyright 2007-2015 Technische Universitaet Dresden - Germany
--                     Chair for VLSI-Design, Diagnostics and Architecture
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--    http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =============================================================================

library IEEE;
use     IEEE.STD_LOGIC_1164.all;
use     IEEE.NUMERIC_STD.all;

library UNISIM;
use     UNISIM.VCOMPONENTS.all;

library PoC;
use     PoC.utils.all;
use     PoC.physical.all;
use     PoC.components.all;
use     PoC.io.all;


entity clknet_ClockNetwork_KCU105 is
  generic (
    DEBUG                     : BOOLEAN                       := FALSE;
    CLOCK_IN_FREQ             : FREQ                          := 300.0 MHz
  );
  port (
    ClockIn_300MHz            : in  STD_LOGIC;

    ClockNetwork_Reset        : in  STD_LOGIC;
    ClockNetwork_ResetDone    :  out  STD_LOGIC;
    
    Control_Clock_300MHz      : out  STD_LOGIC;
    
    Clock_300MHz              : out  STD_LOGIC;
    Clock_200MHz              : out  STD_LOGIC;
    Clock_100MHz              : out  STD_LOGIC;

    Clock_Stable_300MHz       : out  STD_LOGIC;
    Clock_Stable_200MHz       : out  STD_LOGIC;
    Clock_Stable_100MHz       : out  STD_LOGIC
  );
end entity;

-- MMCM - Clock Wizard Report
-- 
-- Output    Output      Phase     Duty      Pk-to-Pk       Phase
-- Clock    Freq (MHz) (degrees) Cycle (%) Jitter (ps)    Error (ps)
-------------------------------------------------------------------------------
-- CLK_OUT0    300.000      0.000      50.0       81.568       77.836
-- CLK_OUT1    200.000      0.000      50.0       88.351       77.836
-- CLK_OUT2    100.000      0.000      50.0      101.278       77.836
--

architecture rtl of clknet_ClockNetwork_KCU105 is
  attribute KEEP                      : BOOLEAN;

  -- delay CMB resets until the slowed syncBlock has noticed that LockedState is low
  --  control clock:        300 MHz
  --  slowest output clock:  100 Mhz
  --  worst case delay:      (Control_Clock freq / slowest clock in MHz) * register stages    + safety
  --    => 44                (300 MHz            / 100 MHz)              * 2 register stages  + 4
  constant CMB_DELAY_CYCLES           : POSITIVE    := integer(real(CLOCK_IN_FREQ / 100 MHz) * 2.0 + 4.0);

  signal ClkNet_Reset                 : STD_LOGIC;
  
  signal MMCM_Reset                   : STD_LOGIC;
  signal MMCM_Reset_clr               : STD_LOGIC;
  signal MMCM_ResetState              : STD_LOGIC    := '0';
  signal MMCM_Reset_delayed           : STD_LOGIC_VECTOR(CMB_DELAY_CYCLES - 1 downto 0) := (others => '0');
  signal MMCM_Locked_async            : STD_LOGIC;
  signal MMCM_Locked                  : STD_LOGIC;
  signal MMCM_Locked_d                : STD_LOGIC    := '0';
  signal MMCM_Locked_re               : STD_LOGIC;
  signal MMCM_LockedState             : STD_LOGIC    := '0';
  
  signal Locked                       : STD_LOGIC;
  signal Reset                        : STD_LOGIC;
  
  signal Control_Clock                : STD_LOGIC;
  signal Control_Clock_BUFR           : STD_LOGIC;
  
  signal MMCM_Clock_300MHz            : STD_LOGIC;
  signal MMCM_Clock_200MHz            : STD_LOGIC;
  signal MMCM_Clock_100MHz            : STD_LOGIC;

  signal MMCM_Clock_300MHz_BUFG       : STD_LOGIC;
  signal MMCM_Clock_200MHz_BUFG       : STD_LOGIC;
  signal MMCM_Clock_100MHz_BUFG       : STD_LOGIC;

  attribute KEEP of MMCM_Clock_300MHz_BUFG    : signal is DEBUG;
  attribute KEEP of MMCM_Clock_200MHz_BUFG    : signal is DEBUG;
  attribute KEEP of MMCM_Clock_100MHz_BUFG    : signal is DEBUG;
  
begin
  -- ==================================================================
  -- ResetControl
  -- ==================================================================
  -- synchronize external (async) ClockNetwork_Reset and internal (but async) MMCM_Locked signals to "Control_Clock" domain
  syncControlClock : entity PoC.sync_Bits_Xilinx
    generic map (
      BITS          => 2                    -- number of BITS to synchronize
    )
    port map (
      Clock         => Control_Clock,        -- Clock to be synchronized to
      Input(0)      => ClockNetwork_Reset,  -- Data to be synchronized
      Input(1)      => MMCM_Locked_async,    -- 
      Output(0)     => ClkNet_Reset,        -- synchronized data
      Output(1)     => MMCM_Locked          -- 
    );
  -- clear reset signals, if external Reset is low and CMB (clock modifying block) noticed reset -> locked = low
  MMCM_Reset_clr          <= ClkNet_Reset NOR MMCM_Locked;

  -- detect rising edge on CMB locked signals
  MMCM_Locked_d           <= MMCM_Locked  when rising_edge(Control_Clock);
  MMCM_Locked_re          <= NOT MMCM_Locked_d  AND MMCM_Locked;
  
  --                        RS-FF          Q                    RST                    SET                            CLK
  -- hold reset until external reset goes low and CMB noticed reset
  MMCM_ResetState         <= ffrs(q => MMCM_ResetState,   rst => MMCM_Reset_clr,  set => ClkNet_Reset)   when rising_edge(Control_Clock);
  -- deassert *_LockedState, if CMBs are going to be reseted; assert it if *_Locked is high again
  MMCM_LockedState        <= ffrs(q => MMCM_LockedState, rst => MMCM_Reset,      set => MMCM_Locked_re) when rising_edge(Control_Clock);
  
  -- delay CMB resets until the slowed syncBlock has noticed that LockedState is low
  MMCM_Reset_delayed      <= shreg_left(MMCM_Reset_delayed, MMCM_ResetState) when rising_edge(Control_Clock);
  MMCM_Reset              <= MMCM_Reset_delayed(MMCM_Reset_delayed'high);
  
  Locked                  <= MMCM_LockedState;
  ClockNetwork_ResetDone  <= Locked;

  -- ==================================================================
  -- ClockBuffers
  -- ==================================================================
  -- Control_Clock
  BUFR_Control_Clock : BUFR
    generic map (
      SIM_DEVICE  => "7SERIES"
    )
    port map (
      CE  => '1',
      CLR  => '0',
      I    => ClockIn_300MHz,
      O    => Control_Clock_BUFR
    );
  
  Control_Clock <= Control_Clock_BUFR;
  
  -- 300 MHz BUFG
  BUFG_Clock_300MHz : BUFG
    port map (
      I    => MMCM_Clock_300MHz,
      O    => MMCM_Clock_300MHz_BUFG
    );

  -- 200 MHz BUFG
  BUFG_Clock_200MHz : BUFG
    port map (
      I    => MMCM_Clock_200MHz,
      O    => MMCM_Clock_200MHz_BUFG
    );
    
  -- 100 MHz BUFG
  BUFG_Clock_100MHz : BUFG
    port map (
      I    => MMCM_Clock_100MHz,
      O    => MMCM_Clock_100MHz_BUFG
    );

  -- ==================================================================
  -- Mixed-Mode Clock Manager (MMCM)
  -- ==================================================================
  System_MMCM : MMCME3_ADV
    generic map (
      STARTUP_WAIT            => "FALSE",
      BANDWIDTH               => "LOW",                                      -- LOW = Jitter Filter
      COMPENSATION            => "BUF_IN",  --"ZHOLD",

      CLKIN1_PERIOD           => 1.0e9 / real(CLOCK_IN_FREQ / 1 Hz),
      CLKIN2_PERIOD           => 1.0e9 / real(CLOCK_IN_FREQ / 1 Hz),        -- Not used
      REF_JITTER1             => 0.00048,
      REF_JITTER2             => 0.00048,                                    -- Not used

      CLKFBOUT_MULT_F         => 4.0,
      CLKFBOUT_PHASE          => 0.0,
      CLKFBOUT_USE_FINE_PS    => "FALSE",
      
      DIVCLK_DIVIDE           => 1,
      
      CLKOUT0_DIVIDE_F        => 4.0,
      CLKOUT0_PHASE           => 0.0,
      CLKOUT0_DUTY_CYCLE      => 0.500,
      CLKOUT0_USE_FINE_PS     => "FALSE",
      
      CLKOUT1_DIVIDE          => 6,
      CLKOUT1_PHASE           => 0.0,
      CLKOUT1_DUTY_CYCLE      => 0.500,
      CLKOUT1_USE_FINE_PS     => "FALSE",
      
      CLKOUT2_DIVIDE          => 12,
      CLKOUT2_PHASE           => 0.0,
      CLKOUT2_DUTY_CYCLE      => 0.500,
      CLKOUT2_USE_FINE_PS     => "FALSE",
      
      CLKOUT3_DIVIDE          => 120,
      CLKOUT3_PHASE           => 0.0,
      CLKOUT3_DUTY_CYCLE      => 0.500,
      CLKOUT3_USE_FINE_PS     => "FALSE"
    )
    port map (
      RST                 => MMCM_Reset,

      CLKIN1              => ClockIn_300MHz,
      CLKIN2              => ClockIn_300MHz,
      CLKINSEL            => '1',
      CLKINSTOPPED        => open,
      
      CLKFBOUT            => open,
      CLKFBOUTB           => open,
      CLKFBIN             => MMCM_Clock_300MHz_BUFG,
      CLKFBSTOPPED        => open,
      
      CDDCREQ             => '0',
      CDDCDONE            => open,
      
      CLKOUT0             => MMCM_Clock_300MHz,
      CLKOUT0B            => open,
      CLKOUT1             => MMCM_Clock_200MHz,
      CLKOUT1B            => open,
      CLKOUT2             => MMCM_Clock_100MHz,
      CLKOUT2B            => open,
      CLKOUT3             => open,
      CLKOUT3B            => open,
      CLKOUT4             => open,
      CLKOUT5             => open,
      CLKOUT6             => open,

      -- Dynamic Reconfiguration Port
      DO                  => open,
      DRDY                => open,
      DADDR               => "0000000",
      DCLK                => '0',
      DEN                 => '0',
      DI                  => x"0000",
      DWE                 => '0',

      PWRDWN              => '0',      
      LOCKED              => MMCM_Locked_async,
      
      PSCLK               => '0',
      PSEN                => '0',
      PSINCDEC            => '0', 
      PSDONE              => open         
    );
    

  Control_Clock_300MHz  <= Control_Clock_BUFR;
  Clock_300MHz          <= MMCM_Clock_300MHz_BUFG;
  Clock_200MHz          <= MMCM_Clock_200MHz_BUFG;
  Clock_100MHz          <= MMCM_Clock_100MHz_BUFG;
  
  -- synchronize internal Locked signal to ouput clock domains
  syncLocked300MHz : entity PoC.sync_Bits_Xilinx
    port map (
      Clock         => MMCM_Clock_300MHz_BUFG,    -- Clock to be synchronized to
      Input(0)      => Locked,                    -- Data to be synchronized
      Output(0)     => Clock_Stable_300MHz        -- synchronized data
    );
  
  syncLocked200MHz : entity PoC.sync_Bits_Xilinx
    port map (
      Clock         => MMCM_Clock_200MHz_BUFG,    -- Clock to be synchronized to
      Input(0)      => Locked,                    -- Data to be synchronized
      Output(0)     => Clock_Stable_200MHz        -- synchronized data
    );

  syncLocked100MHz : entity PoC.sync_Bits_Xilinx
    port map (
      Clock         => MMCM_Clock_100MHz_BUFG,    -- Clock to be synchronized to
      Input(0)      => Locked,                    -- Data to be synchronized
      Output(0)     => Clock_Stable_100MHz        -- synchronized data
    );
end architecture;
