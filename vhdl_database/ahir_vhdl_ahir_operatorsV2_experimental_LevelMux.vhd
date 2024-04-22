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


-- a simple multiplexor with output
-- queue.
entity LevelMux is
  generic(name:string;
	  num_reqs: integer;
	  data_width: integer;
	  no_arbitration: boolean := true);
  port (
    write_req       : in  std_logic_vector(num_reqs-1 downto 0);
    write_ack       : out std_logic_vector(num_reqs-1 downto 0);
    write_data      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    read_req        : in  std_logic;
    read_ack        : out std_logic;
    read_data       : out std_logic_vector(data_width-1 downto 0);
    clk, reset      : in  std_logic);
end entity;

architecture Base of LevelMux is
  
  type OPWArray is array(integer range <>) of std_logic_vector(data_width-1 downto 0);
  signal data_array : OPWArray(num_reqs-1 downto 0);
  signal req_active, ack_sig , fair_reqs, fair_acks : std_logic_vector(num_reqs-1 downto 0);
  
  signal q_data_in,q_data_out  : std_logic_vector(data_width-1 downto 0);
  signal q_push_req, q_push_ack, q_pop_req, q_pop_ack: std_logic;
begin

  -- input arbitration.
  fairify: NobodyLeftBehind generic map(name => name & "-fairify", num_reqs => num_reqs)
		port map(clk => clk, reset => reset,
				reqIn => write_req,
				ackOut => write_ack,
				reqOut => fair_reqs,
				ackIn => fair_acks);
  
  NoArb: if no_arbitration generate
     req_active <= fair_reqs;
  end generate NoArb;

  Arb: if not no_arbitration generate
     req_active <= PriorityEncode(fair_reqs);
  end generate Arb;


  -- combinational multiplexor (AND-OR form).
  -- AND
  gen: for I in num_reqs-1 downto 0 generate

       ack_sig(I) <= req_active(I) and q_push_ack; 
       fair_acks(I) <= ack_sig(I);

       process(write_data,req_active(I))
         variable target: std_logic_vector(data_width-1 downto 0);
       begin
          if(req_active(I) = '1') then
		-- Extract(write_data,I,target);
		target := write_data(((I+1)*data_width)-1 downto I*data_width);
	  else
		target := (others => '0');
	  end if;	
       	  data_array(I) <= target;
       end process;
  end generate gen;

  -- OR
  process (data_array)
    variable var_odata : std_logic_vector(data_width-1 downto 0) := (others => '0');
  begin  -- process
    var_odata := (others => '0');
    for I in 0 to num_reqs-1 loop
      var_odata := data_array(I) or var_odata;
    end loop;  -- I
    q_data_in <= var_odata;
  end process;


  -- output queue (2 stage).
  q_push_req <= OrReduce(req_active);
  q_pop_req  <= read_req;
  read_ack   <= q_pop_ack;
  read_data  <= q_data_out;
  oQ:  QueueBase generic map(name => "-oQ", queue_depth => 2, data_width => data_width)
	port map( clk => clk, reset => reset,
			data_in => q_data_in,
			push_req => q_push_req,
			push_ack => q_push_ack,
			data_out => q_data_out,
			pop_req => q_pop_req,
			pop_ack => q_pop_ack);
end Base;
