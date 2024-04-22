----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 Marcus Geelnard
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
-- This is a two-flip-flop synchronization circuit for single-bit signals.
--
-- In addition to passing a signal over from one clock domain to another, this design also employs
-- mitigations bounces and instabilities. This is done by detecting changes in the signal and only
-- propagating the new signal value to the output once the signal has stayed constant for a certain
-- number of clock cycles (this functionality is optional).
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bit_synchronizer is
  generic(
    STEADY_CYCLES : integer := 3
  );
  port(
    i_rst : in std_logic;

    -- Clock signal for the target clock domain.
    i_clk : in std_logic;

    -- Signal from the source clock domain (or an asynchronous signal).
    i_d : in std_logic;

    -- Synchronized signal.
    o_q : out std_logic
  );
end bit_synchronizer;

architecture rtl of bit_synchronizer is
  -- Signals for the synchronizer flip-flops.
  signal s_metastable : std_logic;
  signal s_stable : std_logic;

  -- Signals for the value change detector.
  signal s_prev_stable : std_logic;
  signal s_stable_changed : std_logic;
  signal s_steady_cycles : integer range 0 to STEADY_CYCLES;

  -- Intel/Altera specific constraints.
  attribute ALTERA_ATTRIBUTE : string;
  attribute ALTERA_ATTRIBUTE of rtl : architecture is "-name SDC_STATEMENT ""set_false_path -to [get_registers {*|bit_synchronizer:*|s_metastable*}] """;
  attribute ALTERA_ATTRIBUTE of s_metastable : signal is "-name SYNCHRONIZER_IDENTIFICATION ""FORCED IF ASYNCHRONOUS""";
  attribute PRESERVE : boolean;
  attribute PRESERVE of s_metastable : signal is true;
  attribute PRESERVE of s_stable : signal is true;

  -- Xilinx specific constraints.
  attribute ASYNC_REG : string;
  attribute ASYNC_REG of s_metastable : signal is "TRUE";
  attribute SHREG_EXTRACT : string;
  attribute SHREG_EXTRACT of s_metastable : signal is "NO";
  attribute SHREG_EXTRACT of s_stable : signal is "NO";
begin
  -- Synchronize the source signal using two flip-flops in series.
  process(i_rst, i_clk)
  begin
    if i_rst = '1' then
      s_metastable <= '0';
      s_stable <= '0';
    elsif rising_edge(i_clk) then
      s_metastable <= i_d;
      s_stable <= s_metastable;
    end if;
  end process;

  SteadyGen: if STEADY_CYCLES > 0 generate
    -- Only accept a value after STEADY_CYCLES cycles of steady state.
    s_stable_changed <= '1' when s_stable /= s_prev_stable else '0';

    process(i_rst, i_clk)
    begin
      if i_rst = '1' then
        s_prev_stable <= '0';
        s_steady_cycles <= 0;
        o_q <= '0';
      elsif rising_edge(i_clk) then
        -- Count the number of steady cycles that we have.
        if s_stable_changed = '1' then
          s_steady_cycles <= 0;
        else
          s_steady_cycles <= s_steady_cycles + 1;
        end if;

        -- Time to update the output value?
        if s_steady_cycles = STEADY_CYCLES then
          o_q <= s_stable;
        end if;

        s_prev_stable <= s_stable;
      end if;
    end process;
  else generate
    o_q <= s_stable;
  end generate;
end rtl;
