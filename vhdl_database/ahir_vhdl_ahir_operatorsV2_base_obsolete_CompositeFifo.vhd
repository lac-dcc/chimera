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
-- copyright: Madhav Desai
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;
use ahir.mem_component_pack.all;

-- queue depth must be at least 5.
entity CompositeFifo is
  generic(name: string; queue_depth: integer := 5; data_width: integer := 72);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack : out std_logic;
       nearly_full: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity CompositeFifo;

architecture behave of CompositeFifo is

  signal dq_size: integer range 0 to queue_depth-1;
  signal sq_size: integer range 0 to 2;

  signal dq_push_req, dq_push_ack, sq_push_req, sq_push_ack: std_logic;
  signal dq_pop_req, dq_pop_ack, sq_pop_req, sq_pop_ack: std_logic;

  signal dq_data_in, sq_data_in, dq_data_out, sq_data_out: std_logic_vector(data_width-1 downto 0);

  signal write_to_dq: boolean;

  signal ignore_nf : std_logic;
begin  -- SimModel

  assert(queue_depth > 4) report "Composite FIFO depth must be greater than 4" severity failure;

  process(clk)
	variable dq_incr, dq_decr: boolean;
	variable sq_incr, sq_decr: boolean;
  begin
	dq_incr := ((dq_push_req = '1') and (dq_push_ack = '1'));
	dq_decr := ((dq_pop_req = '1') and (dq_pop_ack = '1'));

	sq_incr := ((sq_push_req = '1') and (sq_push_ack = '1'));
	sq_decr := ((sq_pop_req = '1') and (sq_pop_ack = '1'));

	if (clk'event and clk = '1') then
		if(reset ='1') then
			dq_size <= 0;
			sq_size <= 0;
		else	
			if (dq_incr and (not dq_decr)) then
				dq_size <= dq_size + 1;
			elsif (dq_decr and (not dq_incr)) then
				dq_size <= dq_size - 1;
			end if;
			if (sq_incr and (not sq_decr)) then
				sq_size <= sq_size + 1;
			elsif (sq_decr and (not sq_incr)) then
				sq_size <= sq_size - 1;
			end if;
		
		end if;
	end if;
  end process;

  -- write to deep queue only if short-queue is full
  -- or deep-queue already has something in it.
  write_to_dq <= (sq_size = 2) or (dq_size > 0);

  -- write-to-dq?
  dq_push_req <= push_req when write_to_dq else '0';

  -- short-queue is either written from input or from deep-queue.
  sq_push_req <= push_req  when  (not write_to_dq) else dq_pop_ack;

  -- push ack can be from deep queue or from short queue.
  push_ack <= dq_push_ack when write_to_dq else sq_push_ack;

  -- dq always gets data from data_in
  dq_data_in <= data_in;

  -- sq gets data from dq if dq is being written into
  -- else it gets it from data_i.
  sq_data_in <= dq_data_out when write_to_dq else  data_in;

  -- dq can get popped only from sq and that too only
  -- if short queue is not being written into.
  dq_pop_req  <= sq_push_ack when write_to_dq else '1' when ((sq_size < 2) and write_to_dq) else '0';

  -- short queue gets popped from the outside.
  sq_pop_req <= pop_req;
  pop_ack <= sq_pop_ack;

  -- data-out
  data_out <= sq_data_out;

  sq: QueueBase 
	generic map (name => name & ":short-queue", queue_depth => 2, data_width => data_width)
	port map (clk => clk, reset => reset, data_in => sq_data_in,
			push_req => sq_push_req, push_ack => sq_push_ack,
				data_out => sq_data_out, pop_ack => sq_pop_ack, pop_req => sq_pop_req);

  dq: SynchFifoWithDPRAM
	generic map (name => name & ":short-queue", queue_depth => queue_depth-2, data_width => data_width)
	port map (clk => clk, reset => reset, data_in => dq_data_in,
			push_req => dq_push_req, push_ack => dq_push_ack, nearly_full => ignore_nf,
				data_out => dq_data_out, pop_ack => dq_pop_ack, pop_req => dq_pop_req);

end behave;


