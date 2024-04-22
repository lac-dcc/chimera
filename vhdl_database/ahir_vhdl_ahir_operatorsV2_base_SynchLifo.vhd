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
-- written by Madhav Desai
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

entity SynchLifo is
  generic(name : string; queue_depth: integer := 3; data_width: integer := 72);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack : out std_logic;
       nearly_full: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity SynchLifo;

architecture behave of SynchLifo is

  type QueueArray is array(natural range <>) of std_logic_vector(data_width-1 downto 0);

  signal queue_array : QueueArray(queue_depth-1 downto 0);
  signal tos_pointer, write_pointer : integer range 0 to queue_depth-1;
  signal queue_size : integer range 0 to queue_depth;

  signal bypass_reg, mem_out_reg : std_logic_vector(data_width-1 downto 0);

  function Incr(x: integer; M: integer) return integer is
  begin
    if(x < M) then
      return(x + 1);
    else
      return(0);
    end if;
  end Incr;

  signal nearly_empty_sig, empty_sig, full_sig : std_logic;
  signal select_bypass : std_logic;
  signal pop_req_int: std_logic;
begin  -- SimModel
  assert (queue_size < queue_depth) report "LIFO " & name & " is full." severity note;

  full_sig  <= '1' when (queue_size = queue_depth) else '0';
  empty_sig <= '1' when (queue_size = 0) else '0';
  nearly_empty_sig <= '1' when (queue_size = 1) else '0';
  nearly_full <= '1' when (queue_size = (queue_depth-1)) else '0';


  -- single process
  process(clk,reset,
          empty_sig,
          full_sig,
          queue_size,
          push_req,
          pop_req, pop_req_int,
          tos_pointer,
          write_pointer)
    variable qsize : integer range 0 to queue_depth;
    variable push,pop,bypass : boolean;
    variable next_tos_ptr, next_write_ptr : integer range 0 to queue_depth-1;
  begin
    qsize := queue_size;
    push  := false;
    pop   := false;
    next_tos_ptr := tos_pointer;
    next_write_ptr := write_pointer;
    
    if((queue_size < queue_depth) and push_req = '1') then
      push := true;
    end if;

    if((queue_size > 0) and pop_req_int = '1') then
      pop := true;
    end if;

    bypass := push and pop;
    
    if push and (not pop) then
      -- increment write pointer and tos-pointer.
      next_write_ptr := Incr(write_pointer,queue_depth-1);
      if(queue_size > 0) then
        next_tos_ptr := Incr(tos_pointer,queue_depth-1);
      else
        next_tos_ptr := 0;
      end if;
      qsize := queue_size + 1;      
    elsif pop and (not push) then
      if(write_pointer > 0) then
      	next_write_ptr := write_pointer-1;
      else
	-- if write-ptr is 0, it must have wrapped around
        -- in the increment function.
	next_write_ptr := queue_depth - 1;
      end if;

      if(tos_pointer > 0) then
        next_tos_ptr := tos_pointer - 1;
      else
        next_tos_ptr := 0;
      end if;
      qsize := queue_size - 1;            
    end if;
    
    if(clk'event and clk = '1') then
      
      if(reset = '1') then
	queue_size <= 0;
        tos_pointer <= 0;
        write_pointer <= 0;
        select_bypass <= '0';
      else
        queue_size <= qsize;
        tos_pointer <= next_tos_ptr;
        write_pointer <= next_write_ptr;
      end if;

      if(bypass) then
        select_bypass <= '1';
        bypass_reg <= data_in;
      elsif push then
        queue_array(write_pointer) <= data_in;
        select_bypass <= '1';
        bypass_reg <= data_in;
      elsif pop then
        select_bypass <= '0';        
	if(tos_pointer > 0) then
        	mem_out_reg <= queue_array(tos_pointer-1);        
	end if;
      end if;
    end if;  
  end process;

  push_ack <= not full_sig;
  pop_ack  <= not empty_sig;
  pop_req_int <= pop_req;
  data_out <= bypass_reg when select_bypass = '1' else mem_out_reg;
  
end behave;


