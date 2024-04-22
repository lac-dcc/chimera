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

library pl_mirage;
use pl_mirage.pl_mirage_component_package.all;

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


architecture ImageMirage of base_bank is
	signal clk_bit, wr_bar_bit, enable_bit: bit;
	signal addr_bit: bit_vector(g_addr_width-1 downto 0);
	signal din_bit, dout_bit: bit_vector(g_data_width-1 downto 0);

begin  
	clk_bit <= '1' when clk = '1' else '0';
	wr_bar_bit <= '1' when writebar = '1' else '0';
	enable_bit <= '1' when enable = '1' else '0';

        process(datain)
        begin 
		for I in g_data_width-1 downto 0 loop
			if(datain(I) = '1') then
				din_bit(I) <= '1';
			else
				din_bit(I) <= '0';
			end if;
		end loop;
	end process;

	process(dout_bit)
	begin
		for I in g_data_width-1 downto 0 loop
			if(dout_bit(I) = '1') then
        			dataout(I) <= '1';
			else
        			dataout(I) <= '0';
			end if;
		end loop;
	end process;

        process(addrin)
        begin 
		for I in g_addr_width-1 downto 0 loop
			if(addrin(I) = '1') then
				addr_bit(I) <= '1';
			else
				addr_bit(I) <= '0';
			end if;
		end loop;
	end process;
	
  	bank: PL_Mirage_SyncWSyncR_RAM_1Port 
			generic map(address_width => g_addr_width,
					data_width => g_data_width)
			port map(clk => clk_bit,
					read_write_bar => wr_bar_bit,
					enable => enable_bit,
					address_in => addr_bit,
					data_in => din_bit,
					data_out => dout_bit); 
				

end ImageMirage;
