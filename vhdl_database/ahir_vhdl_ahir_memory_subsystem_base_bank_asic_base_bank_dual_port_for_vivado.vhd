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
entity base_bank_dual_port_for_vivado is
   generic ( name: string;  g_addr_width: natural := 10; g_data_width : natural := 16);
	port(
		clka : in std_logic;
		clkb : in std_logic;
		ena : in std_logic;
		enb : in std_logic;
		wea : in std_logic;
		web : in std_logic;
		addra : in std_logic_vector(g_addr_width-1 downto 0);
		addrb : in std_logic_vector(g_addr_width-1 downto 0);
		dia : in std_logic_vector(g_data_width-1 downto 0);
		dib : in std_logic_vector(g_data_width-1 downto 0);
		doa : out std_logic_vector(g_data_width-1 downto 0);
		dob : out std_logic_vector(g_data_width-1 downto 0)
		);
end entity base_bank_dual_port_for_vivado;


architecture XilinxBramInfer of base_bank_dual_port_for_vivado is
  type MemArray is array (natural range <>) of std_logic_vector(g_data_width-1 downto 0);
  shared variable mem_array : MemArray((2**g_addr_width)-1 downto 0) := (others => (others => '0'));
begin  -- XilinxBramInfer


 process(CLKA)	
	begin
	if CLKA'event and CLKA = '1' then
			if ENA = '1' then
					DOA <= mem_array(to_integer(unsigned(ADDRA)));
				if WEA = '1' then
					mem_array(to_integer(unsigned(ADDRA))) := DIA;
				end if;
			end if;
		end if;
	end process;

	process(CLKB)
	begin
		if CLKB'event and CLKB = '1' then
			if ENB = '1' then
				DOB <= mem_array(to_integer(unsigned(ADDRB)));
				if WEB = '1' then
					mem_array(to_integer(unsigned(ADDRB))) := DIB;
				end if;
			end if;
		end if;
	end process;
end XilinxBramInfer;


