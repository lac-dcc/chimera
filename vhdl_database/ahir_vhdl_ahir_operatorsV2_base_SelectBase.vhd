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
library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;

entity SelectBase is
  generic(name: string; data_width: integer; flow_through: boolean := false);
  port(x,y: in std_logic_vector(data_width-1 downto 0);
       sel: in std_logic_vector(0 downto 0);
       req: in boolean;
       z: out std_logic_vector(data_width-1 downto 0);
       ack: out boolean;
       clk,reset: in std_logic);
end SelectBase;


architecture arch of SelectBase is 
begin

  noFlowThrough: if (not flow_through) generate

    process(x,y,sel,req,reset,clk)
    begin
      
      if(clk'event and clk = '1') then
        if(reset = '1') then
          ack <= false;
          z <= (others => '0');
        elsif(sel(sel'right) = '1' and req = true) then
          ack <= req;
          z <= x;
        elsif(sel(sel'right) = '0' and req = true) then
          ack <= req;
          z <= y; 
        else 
          ack <= false;
        end if;
      end if;
    end process;
  end generate noFlowThrough;

  flowThrough: if flow_through generate
	ack <= req;
	z <= x when sel(sel'right) = '1' else y;
  end generate flowThrough;

end arch;

