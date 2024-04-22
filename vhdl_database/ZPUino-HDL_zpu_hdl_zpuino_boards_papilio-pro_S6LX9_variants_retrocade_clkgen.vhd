--
--  System Clock generator for ZPUINO (papilio one)
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--

library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all; 
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity clkgen is
  port (
    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
    clkout1: out std_logic;
    clkout2: out std_logic;
	clk_1Mhz_out: out std_logic;
    rstout: out std_logic
  );
end entity clkgen;

architecture behave of clkgen is

signal dcmlocked: std_ulogic;
signal dcmlocked_1mhz: std_logic;
signal dcmclock: std_ulogic;
signal dcmclock_1mhz: std_logic;

signal rst1_q: std_logic := '1';
signal rst2_q: std_logic := '1';
signal clkout_i: std_ulogic;
signal clkin_i: std_ulogic;
signal clkfb: std_ulogic;
signal clk0: std_ulogic;
signal clk1: std_ulogic;
signal clk2: std_ulogic;
signal clkin_i_2: std_logic;
-- signal clk_div: std_logic;
-- signal count: integer;

signal clkin_i_1mhz: std_logic;
signal clkfb_1mhz: std_logic;
signal clk0_1mhz: std_logic;

begin

  clkout <= clkout_i;

  rstout <= rst1_q;
  

  process(dcmlocked, dcmlocked_1mhz, clkout_i, rstin)
  begin
    if dcmlocked='0' or dcmlocked_1mhz='0' or rstin='1' then
      rst1_q <= '1';
      rst2_q <= '1';
    else
      if rising_edge(clkout_i) then
        rst1_q <= rst2_q;
        rst2_q <= '0';
      end if;
    end if;
  end process;

  -- Clock buffers

  clkfx_inst: BUFG
    port map (
      I =>  clk0,
      O =>  clkout_i
    );
   
  clkin_inst: IBUFG
    port map (
      I =>  clkin,
      O =>  clkin_i
    );
   
  clkfb_inst: BUFG
    port map (
      I=> dcmclock,
      O=> clkfb
    );

  clk1_inst: BUFG port map ( I => clk1, O => clkout1 );
  clk2_inst: BUFG port map ( I => clk2, O => clkout2 );
  
pll_base_inst : PLL_ADV
  generic map
   (BANDWIDTH            => "OPTIMIZED",
    CLK_FEEDBACK         => "CLKFBOUT",
    COMPENSATION         => "SYSTEM_SYNCHRONOUS",
    DIVCLK_DIVIDE        => 1,
    CLKFBOUT_MULT        => 30,
    CLKFBOUT_PHASE       => 0.000,
    CLKOUT0_DIVIDE       => 10,
    CLKOUT0_PHASE        => 0.000,
    CLKOUT0_DUTY_CYCLE   => 0.500,
    CLKOUT1_DIVIDE       => 10,
    CLKOUT1_PHASE        => 250.0,--300.0,--155.52,--103.700,--343.125,
    CLKOUT1_DUTY_CYCLE   => 0.500,
    CLKOUT2_DIVIDE       => 10,
    CLKOUT2_PHASE        => 0.0,
    CLKOUT2_DUTY_CYCLE   => 0.500,
    CLKIN1_PERIOD         => 31.250,
    REF_JITTER           => 0.010,
    SIM_DEVICE           => "SPARTAN6")
  port map
    -- Output clocks
   (CLKFBOUT            => dcmclock,
    CLKOUT0             => clk0,
    CLKOUT1             => clk1,
    CLKOUT2             => clk2,
    CLKOUT3             => open,
    CLKOUT4             => open,
    CLKOUT5             => open,
    LOCKED              => dcmlocked,
    RST                 => '0',
    -- Input clock control
    CLKFBIN             => clkfb,
    CLKIN1               => clkin_i,
    CLKIN2 => '0',
      CLKINSEL => '1',
      DADDR => (others => '0'),
      DCLK => '0',
      DEN => '0',
      DI => (others => '0'),
      DWE => '0',
      REL => '0'

   );
   
DCM_inst_1mhz : DCM
  generic map (
    CLKDV_DIVIDE => 16.0, -- Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5,7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
    CLKFX_DIVIDE => 1,--8, -- Can be any integer from 1 to 32
    CLKFX_MULTIPLY => 3,--23, -- Can be any integer from 1 to 32
    CLKIN_DIVIDE_BY_2 => TRUE, -- TRUE/FALSE to enable CLKIN divide by two feature
    CLKIN_PERIOD => 31.25, -- Specify period of input clock
    CLKOUT_PHASE_SHIFT => "NONE", -- Specify phase shift of NONE, FIXED or VARIABLE
    CLK_FEEDBACK => "NONE", -- Specify clock feedback of NONE, 1X or 2X
    DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", -- SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or an integer from 0 to 15
    DFS_FREQUENCY_MODE => "LOW", -- HIGH or LOW frequency mode for frequency synthesis
    DLL_FREQUENCY_MODE => "LOW", -- HIGH or LOW frequency mode for DLL
    DUTY_CYCLE_CORRECTION => TRUE, -- Duty cycle correction, TRUE or FALSE
    FACTORY_JF => X"C080", -- FACTORY JF Values
    PHASE_SHIFT => 0, -- Amount of fixed phase shift from -255 to 255
    STARTUP_WAIT => FALSE -- Delay configuration DONE until DCM LOCK, TRUE/FALSE
    )
  port map (
    CLK0 => clk0_1mhz, -- 0 degree DCM CLK ouptput
    CLK180 => open, -- 180 degree DCM CLK output
    CLK270 => open, -- 270 degree DCM CLK output
    CLK2X => open, -- 2X DCM CLK output
    CLK2X180 => open, -- 2X, 180 degree DCM CLK out
    CLK90 => open, -- 90 degree DCM CLK output
    CLKDV => dcmclock_1mhz, -- Divided DCM CLK out (CLKDV_DIVIDE)
    CLKFX => open, -- DCM CLK synthesis out (M/D)
    CLKFX180 => open, -- 180 degree CLK synthesis out
    LOCKED => dcmlocked_1mhz, -- DCM LOCK status output
    PSDONE => open, -- Dynamic phase adjust done output
    STATUS => open, -- 8-bit DCM status bits output
    CLKFB => clkfb_1mhz, -- DCM clock feedback
    CLKIN => clkin_i, -- Clock input (from IBUFG, BUFG or DCM)
    PSCLK => '0', -- Dynamic phase adjust clock input
    PSEN => '0', -- Dynamic phase adjust enable input
    PSINCDEC => '0', -- Dynamic phase adjust increment/decrement
    RST => '0' -- DCM asynchronous reset input
  );

  clkfx_inst_1mhz: BUFG
    port map (
      I => dcmclock_1mhz,
      O => clk_1Mhz_out
    );
	
	clkin_i_1mhz <= clkout_i;	   

end behave;
