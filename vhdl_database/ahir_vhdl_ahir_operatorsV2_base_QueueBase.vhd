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
use ahir.BaseComponents.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity QueueBase is
  generic(name : string; queue_depth: integer := 1; data_width: integer := 32;
		save_one_slot: boolean := false);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity QueueBase;

architecture behave of QueueBase is

  type QueueArray is array(natural range <>) of std_logic_vector(data_width-1 downto 0);

-- see comment above..
--##decl_synopsys_sync_set_reset##

begin  -- SimModel

 --
 -- 0-depth queue is just a set of wires.
 --
 triv: if queue_depth = 0 generate
	push_ack <= pop_req;
	pop_ack  <= push_req;
	data_out <= data_in;
 end generate triv;

 qD1: if (queue_depth = 1) generate
   RB: block
      signal full_flag: boolean;
      signal data_reg: std_logic_vector(data_width-1 downto 0);

   begin

      push_ack <= '1' when (not full_flag) else '0';
      pop_ack  <= '1' when full_flag else '0';
      data_out <= data_reg;

      process(clk, reset, push_req, pop_req, full_flag, data_in, data_reg)
	variable next_full_flag_var: boolean;
        variable next_data_reg_var: std_logic_vector(data_width-1 downto 0);
      begin
	next_full_flag_var := full_flag;
        next_data_reg_var := data_reg;

        if (full_flag) then
           if (pop_req = '1') then
              next_full_flag_var := false;
           end if;
        else 
           if (push_req = '1') then
               next_full_flag_var := true;
               next_data_reg_var :=  data_in;
	   end if;
         end if;
  
       if (clk'event and clk='1') then
         if(reset  = '1') then
            full_flag <= false;
            data_reg <= (others => '0');
         else
             full_flag <= next_full_flag_var;
	     data_reg  <= next_data_reg_var;
         end if;
      end if;
     end process;
   end block;
 end generate qD1;


 qDGt1: if queue_depth > 1 generate 
  NTB: block 
   signal queue_array : QueueArray(queue_depth-1 downto 0);
   signal read_pointer, write_pointer: unsigned ((Ceil_Log2(queue_depth))-1 downto 0);
   signal next_read_pointer, next_write_pointer, write_pointer_plus_1: unsigned ((Ceil_Log2(queue_depth))-1 downto 0);

  constant URW0: unsigned ((Ceil_Log2(queue_depth))-1 downto 0):= (others => '0');

  signal full_flag, empty_flag: boolean;
  signal queue_size : unsigned ((Ceil_Log2(queue_depth+1))-1 downto 0);
  signal incr_read_pointer, incr_write_pointer: boolean;
  signal incr_queue_size, decr_queue_size: boolean;

  signal write_flag : boolean;
  signal eq_flag: boolean;

  begin
 
    assert (not full_flag) report "Queue " & name & " is full." severity note;

    write_pointer_plus_1 <= (others => '0') when (write_pointer = queue_depth-1) else (write_pointer+1);

    push_ack <= '1' when (not full_flag) else '0';
    pop_ack  <= '1' when (not empty_flag) else '0';

    -- next read pointer, write pointer.
    process(incr_read_pointer, read_pointer) 
    begin
	if(incr_read_pointer) then
		if(read_pointer = queue_depth-1) then
			next_read_pointer <= (others => '0');
		else
			next_read_pointer <= read_pointer + 1;
		end if;
	else
		next_read_pointer <= read_pointer;
	end if;
    end process;
    rdpReg: SynchResetRegisterUnsigned generic map (name => name & ":rpreg", data_width => read_pointer'length)
		port map (clk => clk, reset => reset, din => next_read_pointer, dout => read_pointer);

    process(incr_write_pointer, write_pointer, write_pointer_plus_1) 
    begin
	if(incr_write_pointer) then
		next_write_pointer <= write_pointer_plus_1;
	else
		next_write_pointer <= write_pointer;
	end if;
    end process;

    -- empty/full logic.
    eq_flag <= (next_read_pointer = next_write_pointer);
    fe_logic: QueueEmptyFullLogic 
	port map (clk => clk, reset => reset, 
			read => incr_read_pointer, write => incr_write_pointer,
				eq_flag => eq_flag,
				full => full_flag, empty => empty_flag);

    wrpReg: SynchResetRegisterUnsigned generic map (name => name & ":wrpreg", data_width => write_pointer'length)
		port map (clk => clk, reset => reset, din => next_write_pointer, dout => write_pointer);

    -- bottom pointer gives the data in FIFO mode..
    process (read_pointer, queue_array)
	variable data_out_var : std_logic_vector(data_width-1 downto 0);
    begin
	data_out_var := (others =>  '0');
        for I in 0 to queue_depth-1 loop
	    if(I = To_Integer(read_pointer)) then
    		data_out_var := queue_array(I);
	    end if;
	end loop;
	data_out <= data_out_var;
    end process;

    -- write to queue-array.
    Wgen: for W in 0 to queue_depth-1 generate
       process(clk, reset, write_flag, write_pointer, data_in) 
       begin
		if(clk'event and (clk = '1')) then
			if(reset = '1') then
                             queue_array(W) <= (others => '0');
			elsif (write_flag and (W = write_pointer)) then
			     queue_array(W) <= data_in;
			end if;
		end if;
       end process;
    end generate Wgen;
  
    -- single process..  Synopsys mangles the logic... split it into two.
    process(read_pointer, write_pointer, empty_flag, full_flag, push_req, pop_req)
      variable push,pop : boolean;
    begin
      push  := false;
      pop   := false;
      
      if((not full_flag) and push_req = '1') then
          push := true;
      end if;
  
      if((not empty_flag) and pop_req = '1') then
          pop := true;
      end if;
  
      incr_read_pointer <= pop;
      incr_write_pointer <= push;
  
      write_flag <= push;
    end process;

   end block NTB;
  end generate qDGt1;

end behave;
