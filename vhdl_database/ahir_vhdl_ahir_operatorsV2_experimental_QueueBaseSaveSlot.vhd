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


-- Save a slot, introduce a pop_req -> push_ack path.
entity QueueBaseSaveSlot is
  generic(name : string; queue_depth: integer := 2; data_width: integer := 32;
		save_one_slot: boolean := false);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity QueueBaseSaveSlot;

architecture behave of QueueBaseSaveSlot is



  constant physical_queue_depth: integer := queue_depth-1;
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

  assert (queue_depth > 0) report "QueueBaseSaveSlot " & name & " must have at least one slot"
			severity error;

 --
 -- 0-depth queue is just a set of wires.
 --
 triv: if physical_queue_depth = 0 generate
	push_ack <= pop_req;
	pop_ack  <= push_req;
	data_out <= data_in;
 end generate triv;



 qDGt0: if physical_queue_depth > 0 generate 
  NTB: block 
  	signal queue_array : QueueArray(physical_queue_depth-1 downto 0);
  	signal read_pointer, write_pointer : integer range 0 to physical_queue_depth-1;
  	signal incr_write_pointer, incr_read_pointer : integer range 0 to physical_queue_depth-1;
  	signal queue_size : integer range 0 to physical_queue_depth;
  begin
 
    assert (queue_size < physical_queue_depth) report "Queue " & name & " is full." severity note;
    assert (queue_size < (3*physical_queue_depth/4)) report "Queue " & name & " is three-quarters-full." severity note;
    assert (queue_size < (physical_queue_depth/2)) report "Queue " & name & " is half-full." severity note;
    assert (queue_size < (physical_queue_depth/4)) report "Queue " & name & " is quarter-full." severity note;

    qD1: if (physical_queue_depth = 1) generate
     incr_read_pointer <= read_pointer;
     incr_write_pointer <= write_pointer;
    end generate qD1;

    qDG1: if (physical_queue_depth > 1) generate
     incr_read_pointer <= Incr(read_pointer, physical_queue_depth-1);
     incr_write_pointer <= Incr(write_pointer, physical_queue_depth-1);
    end generate qDG1;

    push_ack <= '1' when (queue_size < physical_queue_depth) or (pop_req = '1') else '0';
    pop_ack  <= '1' when (queue_size > 0) else '0';

    -- bottom pointer gives the data in FIFO mode..
    data_out <= queue_array(read_pointer);
  
    -- single process
    process(clk, reset, read_pointer, write_pointer, incr_read_pointer, incr_write_pointer, queue_size, push_req, pop_req)
      variable qsize : integer range 0 to physical_queue_depth;
      variable push,pop : boolean;
      variable next_read_ptr,next_write_ptr : integer range 0 to physical_queue_depth-1;
    begin

      qsize := queue_size;
      push  := false;
      pop   := false;
      next_read_ptr := read_pointer;
      next_write_ptr := write_pointer;
      
      if (((pop_req = '1') or (qsize < physical_queue_depth)) and push_req = '1') then
          push := true;
      end if;
  
      if((qsize > 0) and pop_req = '1') then
          pop := true;
      end if;
  
  
      if(push) then
          next_write_ptr := incr_write_pointer;
      end if;
  
      if(pop) then
          next_read_ptr := incr_read_pointer;
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
           queue_array(0) <= (others => '0'); -- initially 0.
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
  end generate qDGt0;
  

end behave;
