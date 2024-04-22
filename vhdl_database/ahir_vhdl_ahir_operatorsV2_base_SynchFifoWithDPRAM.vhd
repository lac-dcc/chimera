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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity SynchFifoWithDPRAM is
  generic(name: string; queue_depth: integer := 3; data_width: integer := 72);
  port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(data_width-1 downto 0);
       push_req: in std_logic;
       push_ack : out std_logic;
       nearly_full: out std_logic;
       data_out: out std_logic_vector(data_width-1 downto 0);
       pop_ack : out std_logic;
       pop_req: in std_logic);
end entity SynchFifoWithDPRAM;

architecture behave of SynchFifoWithDPRAM is

  constant addr_width_of_dpram: integer := Ceil_Log2(queue_depth);
  signal read_pointer, write_pointer : unsigned(addr_width_of_dpram-1 downto 0);
  signal queue_size : integer range 0 to queue_depth;

  function Incr(x: unsigned; M: integer) return unsigned is
     variable ret_var: unsigned(1 to x'length);
  begin
    if(x < M) then
      	ret_var := (x + 1);
    else
	ret_var := (others => '0');
    end if;
    return(ret_var);
  end Incr;

  signal incr_read_pointer, incr_write_pointer : unsigned(addr_width_of_dpram-1 downto 0);

  signal write_to_dpram, read_from_dpram, latch_read_data: std_logic;
  
  type ReadFsmState is (Idle, Valid, WaitPop);
  signal read_state: ReadFsmState;
  signal read_data : std_logic_vector(data_width-1 downto 0);
  signal read_data_reg: std_logic_vector(data_width-1 downto 0);

  signal ready_for_bypass: std_logic;
-- see comment above..
--##decl_synopsys_sync_set_reset##

begin  -- SimModel


  assert(queue_depth > 1) report "Synch FIFO depth must be greater than 1" severity failure;
  assert (queue_size < queue_depth) report "Queue " & name & " is full." severity note;

  incr_read_pointer <= Incr(read_pointer, queue_depth-1);
  incr_write_pointer <= Incr(write_pointer, queue_depth-1);

  -- pointer management process.
  process(clk, reset)
  begin
     if(clk'event and (clk = '1') ) then
	if(reset ='1') then
		read_pointer <= (others => '0');
		write_pointer <= (others => '0');
                queue_size <= 0;
	else
             if(write_to_dpram = '1') then
		write_pointer <= incr_write_pointer;
	     end if;
	     if (read_from_dpram = '1') then
		read_pointer <= incr_read_pointer;
	     end if;

	     if ((write_to_dpram = '1') and (read_from_dpram = '0')) then
		queue_size <= queue_size + 1;
	     elsif ((read_from_dpram = '1') and (write_to_dpram = '0')) then
		queue_size <= queue_size - 1;
	     end if;
	end if;
     end if;
  end process;

  -- write is easy.
  write_to_dpram <= '1' when ((push_req = '1') and (queue_size < queue_depth) and (ready_for_bypass = '0')) 
						else '0';
  push_ack <= '1' when (queue_size < queue_depth) else '0';
  nearly_full <= '1' when (queue_size = (queue_depth-1)) else '0';


  
  -- read process.
  process(clk,reset,read_state, pop_req, queue_size, push_req) 
	variable next_read_state:  ReadFsmState;
	variable read_from_dpram_var: std_logic;
	variable latch_read_data_var: std_logic;
	variable ready_for_bypass_var: std_logic;
	variable pop_ack_var : std_logic;
  begin
	next_read_state := read_state;
	read_from_dpram_var := '0';
	latch_read_data_var := '0';
	ready_for_bypass_var := '0';

	pop_ack_var := '0';
	
	
	case read_state is 
		when Idle =>
			if (queue_size > 0) then
				read_from_dpram_var := '1';
				next_read_state := Valid;	
			elsif (push_req = '1') then
				ready_for_bypass_var := '1';
				latch_read_data_var := '1';
				next_read_state := WaitPop;
			end if;
		when Valid =>
			pop_ack_var := '1';
			if (pop_req = '1') then
				if(queue_size > 0) then 
					read_from_dpram_var := '1';
				elsif (push_req = '1') then
					ready_for_bypass_var := '1';
					latch_read_data_var := '1';
					next_read_state := WaitPop;
				else
					next_read_state := Idle;
				end if;
			else
				next_read_state := WaitPop;
				latch_read_data_var := '1';
			end if;
		when WaitPop =>
			pop_ack_var := '1';
			if(pop_req = '1') then
				if(queue_size > 0) then
					read_from_dpram_var := '1';
					next_read_state := Valid;
				elsif (push_req = '1') then
					ready_for_bypass_var := '1';
					latch_read_data_var := '1';
					next_read_state := WaitPop;
				else
					next_read_state := Idle;
				end if;
			end if;
	end case;

	read_from_dpram <= read_from_dpram_var;
	latch_read_data <= latch_read_data_var;
	ready_for_bypass <= ready_for_bypass_var;

	pop_ack <= pop_ack_var;

	if(clk'event and (clk = '1')) then
		if(reset = '1') then
			read_state <= Idle;
		else
			read_state <= next_read_state;
		end if;
	end if;
  end process;

  rf_1w_1r_inst: register_file_1w_1r_port
		generic map (name => name & "-register_file_1w_1r", 
				g_addr_width => addr_width_of_dpram,
				g_data_width => data_width)
		port map (
				-- port 0 for write
				datain_0 =>  data_in,
				addrin_0 =>  std_logic_vector(write_pointer),
				enable_0 => write_to_dpram,
				-- port 1 for read.
				dataout_1 => read_data,
				addrin_1 =>  std_logic_vector(read_pointer),
				enable_1 => read_from_dpram,
				-- clock pos edge..
				clk => clk, 
				-- reset active high.
				reset => reset
			 );
   -- registering
   process(clk, reset)
   begin
       if(clk'event and (clk = '1')) then
		if(reset = '1') then
			read_data_reg <= (others => '0');
		elsif (latch_read_data = '1') then
			if(ready_for_bypass = '1') then
				read_data_reg <= data_in;
			else
				read_data_reg <= read_data;
			end if;
		end if;
       end if;
   end process;

   -- output mux
   data_out <= read_data when (read_state = Valid) else read_data_reg;

end behave;


