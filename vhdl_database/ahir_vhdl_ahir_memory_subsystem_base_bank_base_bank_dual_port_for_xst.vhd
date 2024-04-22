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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--
-- dual port synchronous memory.
--   similar to a flip-flop as far as simultaneous read/write  is concerned
--   if both ports try to write to the same address, the second port (1) wins
--
entity base_bank_dual_port_for_xst is
   generic ( name: string; g_addr_width: natural := 10; g_data_width : natural := 16);
   port (
	 datain_0 : in std_logic_vector(g_data_width-1 downto 0);
         dataout_0: out std_logic_vector(g_data_width-1 downto 0);
         addrin_0: in std_logic_vector(g_addr_width-1 downto 0);
         enable_0: in std_logic;
         writebar_0 : in std_logic;
	 datain_1 : in std_logic_vector(g_data_width-1 downto 0);
         dataout_1: out std_logic_vector(g_data_width-1 downto 0);
         addrin_1: in std_logic_vector(g_addr_width-1 downto 0);
         enable_1: in std_logic;
         writebar_1 : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity base_bank_dual_port_for_xst;


architecture XilinxBramInfer of base_bank_dual_port_for_xst is
  type MemArray is array (natural range <>) of std_logic_vector(g_data_width-1 downto 0);
  signal mem_array : MemArray((2**g_addr_width)-1 downto 0) := (others => (others => '0'));
  signal addr_reg_0 : std_logic_vector(g_addr_width-1 downto 0);
  signal rd_enable_reg_0 : std_logic;
  signal addr_reg_1 : std_logic_vector(g_addr_width-1 downto 0);
  signal rd_enable_reg_1 : std_logic;
begin  -- XilinxBramInfer

  -- read/write process
  process(clk, addrin_0,enable_0,writebar_0, addrin_1,enable_1,writebar_1)
  begin

    -- synch read-write memory
    if(clk'event and clk ='1') then

      -- register the address
      -- and use it in a separate assignment
      -- for the delayed read.
      addr_reg_0 <= addrin_0;
      addr_reg_1 <= addrin_1;

	-- generate a registered read enable
      if(reset = '1') then
	rd_enable_reg_0 <= '0';
	rd_enable_reg_1 <= '0';
      else
	rd_enable_reg_0 <= enable_0 and writebar_0;
	rd_enable_reg_1 <= enable_1 and writebar_1;
      end if;

      -- both ports write.. second one wins if writes
      -- are to the same address.
      if(enable_0 = '1' and writebar_0 = '0') then
        mem_array(To_Integer(unsigned(addrin_0))) <= datain_0;
      end if;
      if(enable_1 = '1' and writebar_1 = '0') then
        mem_array(To_Integer(unsigned(addrin_1))) <= datain_1;
      end if;
    end if;
  end process;
      	
  -- use the registered read enable with the registered address to 
  -- describe the read
  dataout_0 <= mem_array(To_Integer(unsigned(addr_reg_0)));
  dataout_1 <= mem_array(To_Integer(unsigned(addr_reg_1)));

end XilinxBramInfer;
