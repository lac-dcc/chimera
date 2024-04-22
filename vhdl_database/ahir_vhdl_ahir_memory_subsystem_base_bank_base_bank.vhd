------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
library ahir;
use ahir.Utilities.all;
use ahir.GlobalConstants.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity base_bank is
   generic ( name: string; g_addr_width: natural := 10; g_data_width : natural := 16);
   port (datain : in std_logic_vector(g_data_width-1 downto 0);
         dataout: out std_logic_vector(g_data_width-1 downto 0);
         addrin: in std_logic_vector(g_addr_width-1 downto 0);
         enable: in std_logic;
         writebar : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity base_bank;


architecture XilinxBramInfer of base_bank is
  type MemArray is array (natural range <>) of std_logic_vector(g_data_width-1 downto 0);
  signal mem_array : MemArray((2**g_addr_width)-1 downto 0) := (others => (others => '0'));
  signal addr_reg : std_logic_vector(g_addr_width-1 downto 0);
  signal rd_enable_reg : std_logic;
  signal read_data, read_data_reg: std_logic_vector(g_data_width-1 downto 0);

begin  -- XilinxBramInfer
 
  debugGen: if global_debug_flag generate
  assert false report "MemSliceInfo base_bank " & name & " " & " addr_width = " & Convert_To_String(g_addr_width) & " data-width = " & Convert_To_String(g_data_width) severity note;
  assert false report "MSLICE SP " &  Convert_To_String(g_addr_width) & " " & Convert_To_String(g_data_width) severity note;

  end generate debugGen;

  -- read/write process
  process(clk,addrin,enable,writebar)
  begin

    -- synch read-write memory
    if(clk'event and clk ='1') then

     	-- register the address
	-- and use it in a separate assignment
	-- for the delayed read.
      addr_reg <= addrin;

	-- generate a registered read enable
      if(reset = '1') then
	rd_enable_reg <= '0';
      else
	rd_enable_reg <= enable and writebar;
      end if;

      if(enable = '1' and writebar = '0') then
        mem_array(To_Integer(unsigned(addrin))) <= datain;
      end if;
    end if;
  end process;

  -- read data.
  read_data <= mem_array(To_Integer(unsigned(addr_reg)));
  process(clk) 
  begin
	if(clk'event and clk = '1') then
		if(rd_enable_reg = '1') then
			read_data_reg <= read_data;
		end if;
	end if;
  end process;

  -- to maintain dataout to the last value that was read!
  dataout <= read_data when (rd_enable_reg = '1') else read_data_reg;

end XilinxBramInfer;
