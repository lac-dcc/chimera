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
-- dual port synchronous memory.. implemented with registers..
--  with asynchronous read.
--
entity fifo_mem_synch_write_asynch_read is
   generic ( name: string; address_width: natural;  
			data_width : natural;
				mem_size: natural);
   port (
	 write_enable: in std_logic;
	 write_data: in std_logic_vector(data_width-1 downto 0);
	 write_address: in std_logic_vector(address_width-1 downto 0);
	 read_data: out std_logic_vector(data_width-1 downto 0);
	 read_address: in std_logic_vector(address_width-1 downto 0);
         clk: in std_logic);
end entity fifo_mem_synch_write_asynch_read;


architecture PlainRegisters of fifo_mem_synch_write_asynch_read is
  type MemArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  signal mem_array : MemArray(mem_size-1 downto 0);
begin  -- PlainRegisters

	process(clk, write_address, read_address, mem_array)
		variable wr_addr_var, rd_addr_var : integer;
		variable wr_ok: boolean;
	begin

		wr_addr_var := To_Integer(unsigned(write_address));
		wr_ok := (wr_addr_var < mem_size);

		if(clk'event and clk = '1') then

			if (wr_ok and (write_enable = '1')) then
        			mem_array(wr_addr_var) <= write_data;
			end if;

		end if;
	
		read_data <= mem_array(To_Integer(unsigned(read_address)));
	end process;

end PlainRegisters;
