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

entity PhiBaseTB is
end entity;


architecture Behave of PhiBaseTB is

	signal a, b, c, d, e, odata : std_logic_vector(4 downto 0);
	signal f : std_logic_vector(24 downto 0);
	signal clk, reset: std_logic := '0';
	signal req: BooleanArray(4 downto 0);
	signal ack: Boolean;

begin  -- Behave

	a <= (0 => '1', others => '0');
	b <= (1 => '1', others => '0');
	c <= (2 => '1', others => '0');
	d <= (3 => '1', others => '0');
	e <= (4 => '1', others => '0');

	f <= e & d & c & b & a;
        

	clk <= not clk after 5 ns;

	process
	begin
		req <= (others => false);
		reset <= '1';
		wait until clk = '1';
		
		reset <= '0';
		for I in 0 to 4 loop
		        req <= (others => false);
			req(I) <= true;
			while true loop
				wait until clk = '1';
                                req(I) <= false;
				if ack then
					exit;
				end if;
			end loop;
			assert (odata(I) = '1') report "result mismatch" severity error;
		end loop;

		wait;
	end process;

        phi : PhiBase
          generic map (
	    name => "phi",
            num_reqs   => 5,
            data_width => 5)
          port map ( req => req,
                     ack => ack,
                     idata => f,
                     odata => odata,
                     clk => clk,
                     reset => reset);
end Behave;
