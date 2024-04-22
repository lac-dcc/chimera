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
-- if guards(I) is true, let the handshake proceed, else
-- shunt it.  This interface is inserted in between the
-- req/ack signals from/to the CP and the operators in the
-- datapath.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity GuardInterface is
	generic (nreqs: integer; delay_flag:boolean);
	port (reqL: in BooleanArray(nreqs-1 downto 0);
	      ackL: out BooleanArray(nreqs-1 downto 0); 
	      reqR: out BooleanArray(nreqs-1 downto 0);
	      ackR: in BooleanArray(nreqs-1 downto 0); 
	      guards: in std_logic_vector(nreqs-1 downto 0);
	      clk: in std_logic;
	      reset: in std_logic);
end entity;


architecture Behave of GuardInterface is
	signal ackL_un_guarded: BooleanArray(nreqs-1 downto 0);
begin

	process(reqL,ackR,guards,ackL_un_guarded)
	begin
		for I in 0 to nreqs-1 loop
			if(guards(I) = '1') then
				reqR(I) <= reqL(I);
				ackL(I) <= ackR(I);
			else
				reqR(I) <= false;
				ackL(I) <= ackL_un_guarded(I);
			end if;
		end loop;
	end process;

	nodelay: if not delay_flag generate
		ackL_un_guarded <= reqL;
	end generate nodelay;

	yesdelay: if delay_flag generate
		process(clk)
		begin
			if(clk'event and clk = '1') then 
				if(reset = '1') then
					ackL_un_guarded <= (others => false);
				else
					ackL_un_guarded <= reqL;
				end if;
			end if;
		end process;
	end generate yesdelay;

end Behave;
