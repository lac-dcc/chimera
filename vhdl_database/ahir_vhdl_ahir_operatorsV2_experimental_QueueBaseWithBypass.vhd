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


entity QueueBaseWithBypass is
  generic(name : string; queue_depth: integer := 1; data_width: integer := 32);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity QueueBaseWithBypass;

architecture behave of QueueBaseWithBypass  is

  type QueueArray is array(natural range <>) of std_logic_vector(data_width-1 downto 0);
  function Incr(x: integer; M: integer) return integer is
  begin
    if(x < M) then
      return(x + 1);
    else
      return(0);
    end if;
  end Incr;

begin  -- SimModel

 --
 -- 0-depth queue is just a set of wires.
 --
 triv: if queue_depth = 0 generate
	push_ack <= pop_req;
	pop_ack  <= push_req;
	data_out <= data_in;
 end generate triv;


 nontriv: if queue_depth > 0 generate 
  NTB: block 
  	signal queue_array : QueueArray(queue_depth-1 downto 0);
  	signal read_pointer, write_pointer : integer range 0 to queue_depth-1;
  	signal queue_size : integer range 0 to queue_depth;
        signal data_out_from_queue : std_logic_vector(data_width-1 downto 0);
        signal bypass_signal: Boolean;
  begin
 
    assert (queue_size < queue_depth) report "Queue " & name & " is full." severity note;

    push_ack <= '1' when (bypass_signal or (queue_size < queue_depth)) else '0';
    pop_ack  <= '1' when (bypass_signal or (queue_size > 0)) else '0';

    -- bottom pointer gives the data in FIFO mode..
    data_out_from_queue <= queue_array(read_pointer);

    --
    -- if queue size = 0, and if push-req is true, then data is
    -- presented to data-out through the bypass path.
    --
    data_out <= data_in when bypass_signal else data_out_from_queue;

  
    -- single process
    process(clk, queue_size, push_req, pop_req, write_pointer, read_pointer)
      variable qsize : integer range 0 to queue_depth;
      variable push,pop : boolean;
      variable next_read_ptr,next_write_ptr : integer range 0 to queue_depth-1;
      variable bypass: boolean;
    begin

      qsize := queue_size;
      push  := false;
      pop   := false;
      next_read_ptr := read_pointer;
      next_write_ptr := write_pointer;

      bypass := ((qsize = 0) and  (push_req = '1') and (pop_req = '1'));
      bypass_signal <= bypass;
      
      if((qsize < queue_depth) and (push_req = '1') and (not bypass)) then
          push := true;
      end if;
  
      if((qsize > 0) and (pop_req = '1') and (not bypass)) then
          pop := true;
      end if;
  
  
      if(push) then
          next_write_ptr := Incr(next_write_ptr,queue_depth-1);
      end if;
  
      if(pop) then
         next_read_ptr := Incr(next_read_ptr,queue_depth-1);
      end if;
  
      if(pop and (not push)) then
         qsize := qsize - 1;
      elsif(push and (not pop)) then
         qsize := qsize + 1;
      end if;
        
  
      if(clk'event and clk = '1') then
        if(reset = '1') then
		queue_size <= 0;
		read_pointer <= 0;
		write_pointer <= 0;
	else
        	if(push) then
          		queue_array(write_pointer) <= data_in;
        	end if;
        	
        	queue_size <= qsize;
        	read_pointer <= next_read_ptr;
        	write_pointer <= next_write_ptr;
	end if;
      end if;
      
    end process;
   end block NTB;
  end generate nontriv;
  

end behave;
