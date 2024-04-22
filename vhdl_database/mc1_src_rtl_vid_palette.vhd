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
-- Video color palette memory.
----------------------------------------------------------------------------------------------------

entity vid_palette is
  port(
    i_rst : in std_logic;
    i_clk : in std_logic;

    i_write_enable : in std_logic;
    i_write_addr : in std_logic_vector(7 downto 0);
    i_write_data : in std_logic_vector(31 downto 0);

    i_read_addr : in std_logic_vector(7 downto 0);
    o_read_data : out std_logic_vector(31 downto 0)
  );
end vid_palette;

architecture rtl of vid_palette is
  type T_MEM is array (255 downto 0) of std_logic_vector(31 downto 0);
  signal s_mem : T_MEM;
begin
  -- The palette memory is a simple dual port memory (should synthesize to BRAM
  -- in an FPGA).
  process(i_clk)
  begin
    if rising_edge(i_clk) then
      if i_write_enable = '1' then
        s_mem(to_integer(unsigned(i_write_addr))) <= i_write_data;
      end if;
      o_read_data <= s_mem(to_integer(unsigned(i_read_addr)));
    end if;
  end process;
end rtl;
