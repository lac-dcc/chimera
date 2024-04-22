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
    clkin:        in std_ulogic;
    rstin:        in std_ulogic;

    sysclk:       out std_ulogic;
    sysclk_shift: out std_ulogic;
    hdmibaseclk:  out std_ulogic;
    pll_locked:   out std_ulogic;
    rstout:       out std_ulogic
  );
end entity clkgen;

architecture behave of clkgen is

signal rst1_q: std_logic := '1';
signal rst2_q: std_logic := '1';
signal clkout_i: std_ulogic;
signal clkin_i: std_ulogic;
signal clkfb: std_ulogic;
signal clk0: std_ulogic;
signal clk1: std_ulogic;
signal clk2: std_ulogic;
signal clkin_i_2: std_logic;

signal pll1_locked: std_ulogic;
signal not_pll1_locked: std_ulogic;

signal pll1_to_clkfb, clkfb_to_pll1: std_ulogic;

signal sysclk_i, sysclk_shift_i, hdmi_base_clk_i: std_ulogic;
begin

  sysclk <= clkout_i;
  pll_locked <= pll1_locked;
  rstout <= rst1_q;

  process(pll1_locked, clkout_i, rstin)
  begin
    if pll1_locked='0' or rstin='1' then
      rst1_q <= '1';
      rst2_q <= '1';
    else
      if rising_edge(clkout_i) then
        rst1_q <= rst2_q;
        rst2_q <= '0';
      end if;
    end if;
  end process;

  -- Clock buffers - input

  clkin_inst: IBUFG  port map ( I => clkin,       O =>  clkin_i );

  -- Clock buffers - output

  clk0_inst: BUFG port map ( I => sysclk_i,       O => clkout_i );
  clk1_inst: BUFG port map ( I => sysclk_shift_i, O => sysclk_shift );
  clk2_inst: BUFG port map ( I => hdmi_base_clk_i,O => hdmibaseclk );
   
  --clkfb_inst: BUFG
  --  port map (
  --    O=> clkfb_to_pll1,
  --    I=> pll1_to_clkfb
  --  );
  clkfb_to_pll1 <= pll1_to_clkfb;

pll_base_inst : PLL_ADV
  generic map
   (BANDWIDTH            => "OPTIMIZED",
    CLK_FEEDBACK         => "CLKFBOUT",
    COMPENSATION         => "INTERNAL",
    DIVCLK_DIVIDE        => 1,
    CLKFBOUT_MULT        => 30,
    CLKFBOUT_PHASE       => 0.000,

    CLKOUT0_DIVIDE       => 10,
    CLKOUT0_PHASE        => 0.000,
    CLKOUT0_DUTY_CYCLE   => 0.500,

    CLKOUT1_DIVIDE       => 10,
    CLKOUT1_PHASE        => 250.0,
    CLKOUT1_DUTY_CYCLE   => 0.500,

    CLKOUT2_DIVIDE       => 43,
    CLKOUT2_PHASE        => 0.0,
    CLKOUT2_DUTY_CYCLE   => 0.500,

    CLKIN1_PERIOD         => 31.25, -- 27 MHz
    SIM_DEVICE           => "SPARTAN6")
  port map
    -- Output clocks
   (CLKFBOUT            => pll1_to_clkfb,
    CLKOUT0             => sysclk_i,
    CLKOUT1             => sysclk_shift_i,
    CLKOUT2             => hdmi_base_clk_i,
    LOCKED              => pll1_locked,

    RST                 => '0',
    -- Input clock control
    CLKFBIN             => clkfb_to_pll1,
    CLKIN1              => clkin_i,
    CLKIN2 => '0',
    CLKINSEL => '1',
    DADDR => (others => '0'),
    DCLK => '0',
    DEN => '0',
    DI => (others => '0'),
    DWE => '0',
    REL => '0'
   );

end behave;
