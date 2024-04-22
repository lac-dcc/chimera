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
-- This is a reset conditioner circuit for asynchronous reset.
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity reset_conditioner is
  port(
    -- Clock signal for the target clock domain.
    i_clk : in std_logic;

    -- Asynchronous reset signal.
    i_async_rst : in std_logic;

    -- Synchronized reset signal.
    o_rst : out std_logic
  );
end reset_conditioner;

architecture rtl of reset_conditioner is
  signal s_rst_1 : std_logic;
begin
  -- First flip-flop.
  process(i_clk, i_async_rst)
  begin
    if i_async_rst = '1' then
      s_rst_1 <= '1';
    elsif rising_edge(i_clk) then
      s_rst_1 <= '0';
    end if;
  end process;

  -- Second flip-flop.
  process(i_clk, i_async_rst)
  begin
    if i_async_rst = '1' then
      o_rst <= '1';
    elsif rising_edge(i_clk) then
      o_rst <= s_rst_1;
    end if;
  end process;
end rtl;
