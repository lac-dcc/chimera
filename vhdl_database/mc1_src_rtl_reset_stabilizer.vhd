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
-- This is a reset signal stabilizer (e.g. de-bouncing).
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reset_stabilizer is
  generic(
    -- With a 50 MHz clock, a 16 bit counter will wrap roughly every 1 ms.
    STABLE_COUNT_BITS : positive := 16
  );
  port(
    i_rst_n : in std_logic;
    i_clk : in std_logic;
    o_rst : out std_logic
  );
end reset_stabilizer;

architecture rtl of reset_stabilizer is
  constant C_ALL_ONES : unsigned(STABLE_COUNT_BITS-1 downto 0) := (others => '1');

  signal s_conditioned_rst_1 : std_logic := '1';
  signal s_conditioned_rst : std_logic := '1';

  signal s_stable_rst_1 : std_logic := '1';
  signal s_stable_rst : std_logic := '1';
  signal s_stable_count : unsigned(STABLE_COUNT_BITS-1 downto 0) := to_unsigned(0, STABLE_COUNT_BITS);
begin
  -- Two cascaded flip-flops to condition the source reset signal.
  process(i_clk, i_rst_n)
  begin
    if i_rst_n = '0' then
      s_conditioned_rst_1 <= '1';
      s_conditioned_rst <= '1';
    elsif rising_edge(i_clk) then
      s_conditioned_rst_1 <= '0';
      s_conditioned_rst <= s_conditioned_rst_1;
    end if;
  end process;

  -- Counter
  process(i_clk, s_conditioned_rst)
  begin
    if s_conditioned_rst = '1' then
      s_stable_rst_1 <= '1';
      s_stable_rst <= '1';
      s_stable_count <= to_unsigned(0, STABLE_COUNT_BITS);
    elsif rising_edge(i_clk) then
      -- Deassert the first stable reset signal when the counter has reached its maximum value.
      if s_stable_count = C_ALL_ONES then
        s_stable_rst_1 <= '0';
      end if;

      -- Cascade the stable reset through another register for good measure.
      s_stable_rst <= s_stable_rst_1;

      -- Increment the counter (wrapping).
      s_stable_count <= s_stable_count + 1;
    end if;
  end process;

  o_rst <= s_stable_rst;
end rtl;

