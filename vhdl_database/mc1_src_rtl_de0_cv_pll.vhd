----------------------------------------------------------------------------------------------------
-- Copyright (c) 2019 Marcus Geelnard
--
-- This software is provided 'as-is', without any express or implied warranty. In no event will the
-- authors be held liable for any damages arising from the use of this software.
--
-- Permission is granted to anyone to use this software for any purpose, including commercial
-- applications, and to alter it and redistribute it freely, subject to the following restrictions:
--
--  1. The origin of this software must not be misrepresented; you must not claim that you wrote
--     the original software. If you use this software in a product, an acknowledgment in the
--     product documentation would be appreciated but is not required.
--
--  2. Altered source versions must be plainly marked as such, and must not be misrepresented as
--     being the original software.
--
--  3. This notice may not be removed or altered from any source distribution.
----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
-- This is a VHDL wrapper around the Verilog version of the Intel PLL.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity pll is
  generic(
    REFERENCE_CLOCK_FREQUENCY : integer := 100_000_000;
    NUMBER_OF_CLOCKS : positive := 1;

    OUTPUT_CLOCK_FREQUENCY0 : integer := 100_000_000;
    PHASE_SHIFT0 : time := 0 ps;
    DUTY_CYCLE0 : positive := 50;

    OUTPUT_CLOCK_FREQUENCY1 : integer := 0;
    PHASE_SHIFT1 : time := 0 ps;
    DUTY_CYCLE1 : positive := 50;

    OUTPUT_CLOCK_FREQUENCY2 : integer := 0;
    PHASE_SHIFT2 : time := 0 ps;
    DUTY_CYCLE2 : positive := 50;

    OUTPUT_CLOCK_FREQUENCY3 : integer := 0;
    PHASE_SHIFT3 : time := 0 ps;
    DUTY_CYCLE3 : positive := 50;

    OUTPUT_CLOCK_FREQUENCY4 : integer := 0;
    PHASE_SHIFT4 : time := 0 ps;
    DUTY_CYCLE4 : positive := 50;

    OUTPUT_CLOCK_FREQUENCY5 : integer := 0;
    PHASE_SHIFT5 : time := 0 ps;
    DUTY_CYCLE5 : positive := 50;

    OUTPUT_CLOCK_FREQUENCY6 : integer := 0;
    PHASE_SHIFT6 : time := 0 ps;
    DUTY_CYCLE6 : positive := 50;

    OUTPUT_CLOCK_FREQUENCY7 : integer := 0;
    PHASE_SHIFT7 : time := 0 ps;
    DUTY_CYCLE7 : positive := 50
  );
  port(
    i_rst : in std_logic;
    i_refclk : in std_logic;

    o_locked : out std_logic;
    o_clk0 : out std_logic;
    o_clk1 : out std_logic;
    o_clk2 : out std_logic;
    o_clk3 : out std_logic;
    o_clk4 : out std_logic;
    o_clk5 : out std_logic;
    o_clk6 : out std_logic;
    o_clk7 : out std_logic
  );
end pll;


architecture rtl of pll is
  component pll_intel is
    generic(
      REFERENCE_CLOCK_FREQUENCY : string;
      NUMBER_OF_CLOCKS : positive;

      OUTPUT_CLOCK_FREQUENCY0 : string;
      PHASE_SHIFT0 : string;
      DUTY_CYCLE0 : positive;

      OUTPUT_CLOCK_FREQUENCY1 : string;
      PHASE_SHIFT1 : string;
      DUTY_CYCLE1 : positive;

      OUTPUT_CLOCK_FREQUENCY2 : string;
      PHASE_SHIFT2 : string;
      DUTY_CYCLE2 : positive;

      OUTPUT_CLOCK_FREQUENCY3 : string;
      PHASE_SHIFT3 : string;
      DUTY_CYCLE3 : positive;

      OUTPUT_CLOCK_FREQUENCY4 : string;
      PHASE_SHIFT4 : string;
      DUTY_CYCLE4 : positive;

      OUTPUT_CLOCK_FREQUENCY5 : string;
      PHASE_SHIFT5 : string;
      DUTY_CYCLE5 : positive;

      OUTPUT_CLOCK_FREQUENCY6 : string;
      PHASE_SHIFT6 : string;
      DUTY_CYCLE6 : positive;

      OUTPUT_CLOCK_FREQUENCY7 : string;
      PHASE_SHIFT7 : string;
      DUTY_CYCLE7 : positive
    );
    port(
      i_rst : in std_logic;
      i_refclk : in std_logic;

      o_locked : out std_logic;
      o_clk0 : out std_logic;
      o_clk1 : out std_logic;
      o_clk2 : out std_logic;
      o_clk3 : out std_logic;
      o_clk4 : out std_logic;
      o_clk5 : out std_logic;
      o_clk6 : out std_logic;
      o_clk7 : out std_logic
    );
  end component;

  function to_mhz_string(hz : integer) return string is
    variable v_mhz : real;
  begin
    v_mhz := real(hz) / 1000000.0;
    return real'image(v_mhz) & " MHz";
  end function;

  function to_string(t : time) return string is
  begin
    if t = 0 ps then
      return "0 ps";
    end if;
    return real'image(real(t / 1 ps)) & " ps";
  end function;
begin
  pll_1: pll_intel
    generic map (
      REFERENCE_CLOCK_FREQUENCY => to_mhz_string(REFERENCE_CLOCK_FREQUENCY),
      NUMBER_OF_CLOCKS => NUMBER_OF_CLOCKS,

      OUTPUT_CLOCK_FREQUENCY0 => to_mhz_string(OUTPUT_CLOCK_FREQUENCY0),
      PHASE_SHIFT0 => to_string(PHASE_SHIFT0),
      DUTY_CYCLE0 => DUTY_CYCLE0,

      OUTPUT_CLOCK_FREQUENCY1 => to_mhz_string(OUTPUT_CLOCK_FREQUENCY1),
      PHASE_SHIFT1 => to_string(PHASE_SHIFT1),
      DUTY_CYCLE1 => DUTY_CYCLE1,

      OUTPUT_CLOCK_FREQUENCY2 => to_mhz_string(OUTPUT_CLOCK_FREQUENCY2),
      PHASE_SHIFT2 => to_string(PHASE_SHIFT2),
      DUTY_CYCLE2 => DUTY_CYCLE2,

      OUTPUT_CLOCK_FREQUENCY3 => to_mhz_string(OUTPUT_CLOCK_FREQUENCY3),
      PHASE_SHIFT3 => to_string(PHASE_SHIFT3),
      DUTY_CYCLE3 => DUTY_CYCLE3,

      OUTPUT_CLOCK_FREQUENCY4 => to_mhz_string(OUTPUT_CLOCK_FREQUENCY4),
      PHASE_SHIFT4 => to_string(PHASE_SHIFT4),
      DUTY_CYCLE4 => DUTY_CYCLE4,

      OUTPUT_CLOCK_FREQUENCY5 => to_mhz_string(OUTPUT_CLOCK_FREQUENCY5),
      PHASE_SHIFT5 => to_string(PHASE_SHIFT5),
      DUTY_CYCLE5 => DUTY_CYCLE5,

      OUTPUT_CLOCK_FREQUENCY6 => to_mhz_string(OUTPUT_CLOCK_FREQUENCY6),
      PHASE_SHIFT6 => to_string(PHASE_SHIFT6),
      DUTY_CYCLE6 => DUTY_CYCLE6,

      OUTPUT_CLOCK_FREQUENCY7 => to_mhz_string(OUTPUT_CLOCK_FREQUENCY7),
      PHASE_SHIFT7 => to_string(PHASE_SHIFT7),
      DUTY_CYCLE7 => DUTY_CYCLE7
    )
    port map (
      i_rst => i_rst,
      i_refclk => i_refclk,

      o_locked => o_locked,
      o_clk0 => o_clk0,
      o_clk1 => o_clk1,
      o_clk2 => o_clk2,
      o_clk3 => o_clk3,
      o_clk4 => o_clk4,
      o_clk5 => o_clk5,
      o_clk6 => o_clk6,
      o_clk7 => o_clk7
    );
end rtl;
