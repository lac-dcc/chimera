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

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;

entity PipeSizeMonitor is
  generic (name : string; depth: integer);
  port (
    write_req   : in  std_logic;
    write_ack   : in  std_logic;
    read_req    : in  std_logic;
    read_ack    : in  std_logic;
    has_data    : out Boolean;
    clk, reset  : in  std_logic);
end PipeSizeMonitor;

architecture default_arch of PipeSizeMonitor is
  signal number_of_elements_in_pipe: unsigned ((Ceil_Log2(depth+2))-1 downto 0); 
begin  -- default_arch
		-- count number of elements in pipe.
	process(clk, reset)
  	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				number_of_elements_in_pipe <= (others => '0');
			else
				if((read_req = '1') and (read_ack = '1')) then
					if(not ((write_req = '1') and (write_ack = '1'))) then
				          number_of_elements_in_pipe <= (number_of_elements_in_pipe -1);
					end if;
				elsif((write_req = '1') and (write_ack = '1')) then
					number_of_elements_in_pipe <= (number_of_elements_in_pipe + 1);
				end if;
			end if;
		end if;
  	end process;
	
  	has_data <= (number_of_elements_in_pipe > 0);

end default_arch;
