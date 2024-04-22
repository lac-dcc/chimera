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
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

entity FifoTest is
     generic(lifo_mode: boolean := true);
end entity FifoTest;

architecture Behave of FifoTest is
   signal clk, reset, push_req, push_ack, pop_req, pop_ack, nearly_full: std_logic := '0';
   signal data_out, data_in: std_logic_vector(7 downto 0) := (others => '0');
   
begin

    clk <= not clk after 5 ns;

    process
    begin
      reset <= '1';
      wait until clk = '1';
      reset <= '0';
      wait;
    end process;

    process
    begin
      push_req <= '0';
      pop_req  <= '0';
      wait until reset = '0';
      push_req <= '1';
      for I in 0 to 15 loop
	while true loop
		wait until clk = '1';
                if push_ack = '1' then
			exit;
		end if;
	end loop;
	data_in <= not data_in;
      end loop;

      if lifo_mode then
        data_in <= (others => '1');
      else
        data_in <= (others => '0');
      end if;

      push_req <= '0';
      pop_req  <= '1';
      for I in 0 to 15 loop
	while true loop
		wait until clk = '1';
                if pop_ack = '1' then
			exit;
		end if;
	end loop;
	assert data_out = data_in report "mismatch " severity error;
	data_in <= not data_in;
      end loop;
      wait;
    end process;

    Lifo: if lifo_mode generate
	stack: SynchLifo generic map (name => "Lifo", queue_depth => 16, data_width => 8)
		port map(clk => clk, reset => reset, data_in => data_in, push_req => push_req,
				push_ack => push_ack, pop_req => pop_req, pop_ack => pop_ack,
				nearly_full => nearly_full, data_out => data_out);
    end generate Lifo;
    Fifo: if not lifo_mode generate
	queue: SynchFifo generic map (name => "Fifo", queue_depth => 16, data_width => 8)
		port map(clk => clk, reset => reset, data_in => data_in, push_req => push_req,
				push_ack => push_ack, pop_req => pop_req, pop_ack => pop_ack,
				nearly_full => nearly_full, data_out => data_out);
    end generate Fifo;
end Behave;
