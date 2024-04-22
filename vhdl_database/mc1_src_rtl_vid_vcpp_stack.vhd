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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------------------------------------------------------------------
-- VCPP call stack.
----------------------------------------------------------------------------------------------------

entity vid_vcpp_stack is
  generic(
    LOG2_NUM_ENTRIES : positive := 4;
    NUM_DATA_BITS : positive := 24
  );
  port(
    i_rst : in std_logic;
    i_clk : in std_logic;

    i_push : in std_logic;
    i_pop : in std_logic;
    i_data : in std_logic_vector(NUM_DATA_BITS-1 downto 0);
    o_data : out std_logic_vector(NUM_DATA_BITS-1 downto 0)
  );
end vid_vcpp_stack;

architecture rtl of vid_vcpp_stack is
  constant C_NUM_ENTIRES : positive := 2**LOG2_NUM_ENTRIES;
  type T_STACK is array (C_NUM_ENTIRES-1 downto 0) of std_logic_vector(NUM_DATA_BITS-1 downto 0);
  signal s_stack : T_STACK;
  signal s_pos : unsigned(LOG2_NUM_ENTRIES-1 downto 0);

  -- This RAM is tiny (only 384 bits), so use logic cells instead of block RAM so that we don't
  -- waste a full BRAM block.
  attribute RAMSTYLE : string;
  attribute RAMSTYLE of s_stack : signal is "MLAB";
begin
  process(i_clk, i_rst)
    variable v_pos : unsigned(LOG2_NUM_ENTRIES-1 downto 0);
    variable v_next_pos : unsigned(LOG2_NUM_ENTRIES-1 downto 0);
  begin
    if i_rst = '1' then
      s_pos <= to_unsigned(0, LOG2_NUM_ENTRIES);
    elsif rising_edge(i_clk) then
      v_pos := s_pos;

      if i_push = '1' then
        v_next_pos := v_pos - 1;
        s_stack(to_integer(v_next_pos)) <= i_data;
      elsif i_pop = '1' then
        v_next_pos := v_pos + 1;
      else
        v_next_pos := v_pos;
      end if;

      o_data <= s_stack(to_integer(v_pos));

      s_pos <= v_next_pos;
    end if;
  end process;
end rtl;
