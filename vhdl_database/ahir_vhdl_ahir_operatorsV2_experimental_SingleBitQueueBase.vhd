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
use ahir.SubPrograms.all;

--
-- a special purpose queue which keeps a 1-bit data value.
--
entity SingleBitQueueBase is
  generic(name : string; queue_depth: integer := 1; bypass_flag: boolean := false);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(0 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(0 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity SingleBitQueueBase;

architecture behave of SingleBitQueueBase is

  function rotate_left(x: std_logic_vector) return std_logic_vector is
	alias lx: std_logic_vector(1 to x'length) is x;
	variable ret_val : std_logic_vector(1 to x'length);
  begin
	ret_val(1 to x'length-1)  := lx(2 to x'length);
	ret_val (x'length) := lx(1);
	return(ret_val);
  end rotate_left;


begin  -- SimModel

 --
 -- 0-depth queue is just a set of wires.
 --
 triv: if queue_depth = 0 generate
	push_ack <= pop_req;
	pop_ack  <= push_req;
	data_out <= data_in;
 end generate triv;



 qDGt0: if queue_depth > 0 generate 
  NTB: block 
  	signal queue_vector: std_logic_vector(queue_depth-1 downto 0);
  	signal write_pointer, incr_write_pointer: std_logic_vector(queue_depth-1 downto 0);
  	signal read_pointer, incr_read_pointer: std_logic_vector(queue_depth-1 downto 0);
     	signal queue_size : unsigned ((Ceil_Log2(queue_depth+1))-1 downto 0);
	signal empty_flag, bypass_active : boolean := false;
	signal actual_push_req: std_logic;
  begin

 
    assert (queue_size < queue_depth) report "Queue " & name & " is full." severity note;
    assert (queue_size < (3*queue_depth/4)) report "Queue " & name & " is three-quarters-full." severity note;
    assert (queue_size < (queue_depth/2)) report "Queue " & name & " is half-full." severity note;
    assert (queue_size < (queue_depth/4)) report "Queue " & name & " is quarter-full." severity note;

    qD1: if (queue_depth = 1) generate
     incr_read_pointer <= read_pointer;
     incr_write_pointer <= write_pointer;
    end generate qD1;

    byp_gen: if bypass_flag generate

	empty_flag <= (queue_size = 0);
	bypass_active <= (empty_flag and (push_req = '1'));

	actual_push_req <= '0' when (bypass_active and (pop_req = '1')) else push_req;
    	pop_ack  <= '1' when ((queue_size > 0) or bypass_active) else '0';

    	data_out(0) <= data_in(0) when bypass_active else
				OrReduce (queue_vector and read_pointer);
    end generate byp_gen;

    no_byp_gen: if not bypass_flag generate

	bypass_active <= false;
	actual_push_req <= push_req;
    	pop_ack  <= '1' when (queue_size > 0) else '0';
    
	-- bottom pointer gives the data in FIFO mode..
    	data_out(0) <= OrReduce (queue_vector and read_pointer);

    end generate no_byp_gen;

    qDG1: if (queue_depth > 1) generate
     incr_read_pointer <= rotate_left(read_pointer);
     incr_write_pointer <= rotate_left(write_pointer);
    end generate qDG1;

    push_ack <= '1' when (queue_size < queue_depth) else '0';

  
    -- single process
    process(clk, reset, read_pointer, write_pointer, incr_read_pointer, incr_write_pointer, queue_size, 
			actual_push_req, pop_req)
      variable qsize : unsigned ((Ceil_Log2(queue_depth+1))-1 downto 0);
      variable push,pop : boolean;
      variable next_read_ptr,next_write_ptr : std_logic_vector(queue_depth-1 downto 0);
    begin

      qsize := queue_size;
      push  := false;
      pop   := false;
      next_read_ptr := read_pointer;
      next_write_ptr := write_pointer;
      
      if((qsize < queue_depth) and (actual_push_req = '1')) then
          push := true;
      end if;
  
      if((qsize > 0) and (pop_req = '1') and (not bypass_active)) then
          pop := true;
      end if;
  
  
      if(push) then
          next_write_ptr := incr_write_pointer;
      end if;
  
      if(pop) then
          next_read_ptr := incr_read_pointer;
      end if;
  
  
      -- queue size modified only in non-bypass case
      if(pop and (not push)) then
          qsize := qsize - 1;
      elsif(push and (not pop)) then
          qsize := qsize + 1;
      end if;
        
  
      if(clk'event and clk = '1') then
        
	if(reset = '1') then
           queue_size <= (others => '0');
           read_pointer <= (0 => '1', others => '0');
           write_pointer <= (0 => '1', others => '0');
           queue_vector <= (others => '0'); -- initially 0.
	else
           if(push) then
		if(data_in(0) = '1') then
			queue_vector <= queue_vector or write_pointer;
		else
			queue_vector <= queue_vector and (not write_pointer);
		end if;
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
