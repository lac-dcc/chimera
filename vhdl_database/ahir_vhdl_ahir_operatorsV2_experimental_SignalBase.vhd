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
use ahir.BaseComponents.all;

--
-- base Pipe.
--  in all cases, we will go for an implementation which
--  gives a throughput of one word/cycle.
--

entity SignalBase is
  generic (name : string;
	   volatile_flag: boolean := false;
           num_writes: integer;
           data_width: integer);
  port (
    read_data      : out std_logic_vector(data_width-1 downto 0);
    write_req       : in  std_logic_vector(num_writes-1 downto 0);
    write_ack       : out std_logic_vector(num_writes-1 downto 0);
    write_data      : in std_logic_vector((num_writes*data_width)-1 downto 0);
    clk, reset : in  std_logic);
  
end SignalBase;

architecture default_arch of SignalBase is

  signal pipe_data, read_data_reg: std_logic_vector(data_width-1 downto 0);
  signal pipe_req, pipe_ack: std_logic;
  
begin  -- default_arch


  manyWriters: if (num_writes > 1) generate
    wmux : OutputPortLevel generic map (
      name => name & "-wmux",
      num_reqs       => num_writes,
      data_width     => data_width,
      no_arbitration => false)
      port map (
        req   => write_req,
        ack   => write_ack,
        data  => write_data,
        oreq  => pipe_req,                -- no cross-over, drives req
        oack  => pipe_ack,                -- no cross-over, receives ack
        odata => pipe_data,
        clk   => clk,
        reset => reset);
  end generate manyWriters;

  singleWriter: if (num_writes = 1) generate
    pipe_req <= write_req(0);
    write_ack(0) <= pipe_ack;
    pipe_data <= write_data;
  end generate singleWriter;
 
  -- in signal mode, the pipe is just a flag
  -- write always succeeds.
  pipe_ack <= '1';

  -- in volatile-mode, the signal follws the input
  -- as long as the request is maintained else
  -- it shows a blank (0)
  VolatileGen: if volatile_flag generate
	read_data <= pipe_data when pipe_req = '1' else (others => '0');
  end generate VolatileGen;

  -- in non-volatile mode, the signal is a flag, 
  -- set by pipe-reg.
  nonVolatileGen: if not volatile_flag generate
     process(clk,reset) 
     begin
	if(clk'event and clk = '1') then
		if(reset = '1') then
			read_data_reg <= (others => '0');	
		else
			if(pipe_req = '1') then
				read_data_reg <= pipe_data;
			end if;
		end if;
	end if;
     end process;

     read_data <= read_data_reg;
  end generate nonVolatileGen;


end default_arch;
