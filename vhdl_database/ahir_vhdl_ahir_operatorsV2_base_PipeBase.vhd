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
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;
use ahir.BaseComponents.all;
use ahir.GlobalConstants.all;

--
-- base Pipe.
--   Implementation guarantees registering of every in->out path
--   unless save_slot flag is true, in which case there will be
--   a combi path from write_req -> read_ack.
--

entity PipeBase is
  generic (name : string;
	   num_reads: integer;
           num_writes: integer;
           data_width: integer;
           lifo_mode: boolean := false;
           depth: integer := 1;
	   signal_mode: boolean := false;
           shift_register_mode: boolean := false;
	   save_slot: boolean := false;
	   bypass: boolean := false;
	   full_rate: boolean);
  port (
    read_req       : in  std_logic_vector(num_reads-1 downto 0);
    read_ack       : out std_logic_vector(num_reads-1 downto 0);
    read_data      : out std_logic_vector((num_reads*data_width)-1 downto 0);
    write_req       : in  std_logic_vector(num_writes-1 downto 0);
    write_ack       : out std_logic_vector(num_writes-1 downto 0);
    write_data      : in std_logic_vector((num_writes*data_width)-1 downto 0);
    clk, reset : in  std_logic);
  
end PipeBase;

architecture default_arch of PipeBase is

  signal pipe_data, pipe_data_repeated : std_logic_vector(data_width-1 downto 0);
  signal pipe_req, pipe_ack, pipe_req_repeated, pipe_ack_repeated: std_logic;
  signal signal_data : std_logic_vector(data_width-1 downto 0); 
  signal written_at_least_once: std_logic;

  --
  -- shallow => will be implemented using flip-flops.  Can be expensive!
  --
  constant shallow_flag : boolean :=    (depth < global_pipe_shallowness_threshold);
  -- constant shallow_flag : boolean :=   true;
  
  signal write_ack_sig: std_logic_vector(num_writes-1 downto 0);
  signal read_ack_sig: std_logic_vector(num_reads-1 downto 0);
  signal read_data_sig: std_logic_vector((num_reads*data_width)-1 downto 0);

begin  -- default_arch

 write_ack <= write_ack_sig;
 read_ack  <= read_ack_sig;
  
 read_data <= read_data_sig;
 debugGen: if global_pipe_report_flag generate
	-- super useful for tracing.

  process (clk)
	variable wvar : std_logic_vector(data_width-1 downto 0);
	variable rvar : std_logic_vector(data_width-1 downto 0);
  begin
	if(clk'event and clk = '1') then
		if(reset = '0') then
			for I in  0 to num_writes-1 loop
				wvar := write_data (((I+1)*data_width)-1 downto  I*data_width);
				if(write_req(I)= '1' and  write_ack_sig(I) = '1') then
					assert false report "WPIPE " & name & " requester=" & Convert_To_String(I) & " data= " & 
								Convert_SLV_to_Hex_String(wvar) severity note;
				end if;
			end loop;
			for J in  0 to num_reads-1 loop
				rvar := read_data_sig (((J+1)*data_width)-1 downto  J*data_width);
				if(read_req(J)= '1' and  read_ack_sig(J) = '1') then
					assert false report "RPIPE " & name & " requester=" & Convert_To_String(J) & " data= " & 
								Convert_SLV_to_Hex_String(rvar) severity note;
				end if;
			end loop;
		end if;
	end if;
  end process;
  end generate debugGen;

  manyWriters: if (num_writes > 1) generate
    wmux : OutputPortLevel generic map (
      name => name & "-wmux",
      num_reqs       => num_writes,
      data_width     => data_width,
      no_arbitration => false)
      port map (
        req   => write_req,
        ack   => write_ack_sig,
        data  => write_data,
        oreq  => pipe_req,                -- no cross-over, drives req
        oack  => pipe_ack,                -- no cross-over, receives ack
        odata => pipe_data,
        clk   => clk,
        reset => reset);
  end generate manyWriters;

  singleWriter: if (num_writes = 1) generate
    pipe_req <= write_req(0);
    write_ack_sig(0) <= pipe_ack;
    pipe_data <= write_data;
  end generate singleWriter;
 
  -- in signal mode, the pipe is just a flag
  SignalMode: if signal_mode generate

     -- write always succeeds.
     pipe_ack <= '1';
     process(clk,reset) 
     begin
	if(clk'event and clk = '1') then
		if(reset = '1') then
			signal_data <= (others => '0');	
  			written_at_least_once <= '0';
		else
			if(pipe_req = '1') then
				signal_data <= pipe_data;
  				written_at_least_once <= '1';
			end if;
		end if;
	end if;
     end process;

     ReaderGen: for R in 0 to num_reads-1 generate
	read_ack_sig(R) <= '1'; -- read-ack always succeeds..
	read_data_sig(((R+1)*data_width)-1 downto (R*data_width)) <= signal_data;
     end generate ReaderGen;

  end generate SignalMode;

  Shallow: if (not signal_mode) and shallow_flag and (not lifo_mode) generate

     saveSlot: if save_slot and (depth > 0) generate
      queue : QueueBaseSaveSlot generic map (	
        name => name & "-queue",	
        queue_depth => depth,
        data_width       => data_width)
        port map (
          push_req   => pipe_req,
          push_ack => pipe_ack,
          data_in  => pipe_data,
          pop_req  => pipe_req_repeated,
          pop_ack  => pipe_ack_repeated,
          data_out => pipe_data_repeated,
          clk      => clk,
          reset    => reset);
     end generate saveSlot;

     notSaveSlot: if ((not save_slot) and (not bypass)) or (depth = 0) generate

      queue : QueueBase generic map (	
        name => name & "-queue",	
        queue_depth => depth,
        data_width       => data_width)
        port map (
          push_req   => pipe_req,
          push_ack => pipe_ack,
          data_in  => pipe_data,
          pop_req  => pipe_req_repeated,
          pop_ack  => pipe_ack_repeated,
          data_out => pipe_data_repeated,
          clk      => clk,
          reset    => reset);
     end generate notSaveSlot;

     bypassCase: if (not save_slot) and bypass and (depth > 0) generate

      queue : QueueWithBypass generic map (	
        name => name & "-queue",	
        queue_depth => depth,
        data_width       => data_width)
        port map (
          push_req   => pipe_req,
          push_ack => pipe_ack,
          data_in  => pipe_data,
          pop_req  => pipe_req_repeated,
          pop_ack  => pipe_ack_repeated,
          data_out => pipe_data_repeated,
          clk      => clk,
          reset    => reset);
     end generate bypassCase;
  end generate Shallow;

  DeepFifo: if (not signal_mode) and (not shallow_flag) and (not lifo_mode) generate
    
   notShiftReg: if (not shift_register_mode) generate
    queue : SynchFifoWithDPRAM generic map (
      name => name & "-queue", 
      queue_depth => depth,
      data_width       => data_width)
      port map (
        push_req   => pipe_req,
        push_ack => pipe_ack,
        data_in  => pipe_data,
        pop_req  => pipe_req_repeated,
        pop_ack  => pipe_ack_repeated,
        data_out => pipe_data_repeated,
        nearly_full => open,
        clk      => clk,
        reset    => reset);
   end generate notShiftReg;
    
   shiftReg: if shift_register_mode generate
      srqueue : ShiftRegisterQueue generic map (	
        name => name & "-srqueue",	
        queue_depth => depth,
        data_width       => data_width)
        port map (
          push_req   => pipe_req,
          push_ack => pipe_ack,
          data_in  => pipe_data,
          pop_req  => pipe_req_repeated,
          pop_ack  => pipe_ack_repeated,
          data_out => pipe_data_repeated,
          clk      => clk,
          reset    => reset);
   end generate shiftReg;
 
  end generate DeepFifo;

  Lifo: if (not signal_mode) and  lifo_mode generate
    stack : SynchLifo generic map (
      name => name & "-stack",
      queue_depth => depth,
      data_width       => data_width)
      port map (
        push_req   => pipe_req,
        push_ack => pipe_ack,
        data_in  => pipe_data,
        pop_req  => pipe_req_repeated,
        pop_ack  => pipe_ack_repeated,
        data_out => pipe_data_repeated,
        nearly_full => open,
        clk      => clk,
        reset    => reset);
  end generate Lifo;
  

  manyReaders: if  (not signal_mode) and (num_reads > 1) generate
    rmux : InputPortLevel generic map (
	name => name & "-rmux",
      num_reqs       => num_reads,
      data_width     => data_width,
      no_arbitration => false)
      port map (
        req => read_req,
        ack => read_ack_sig,
        data => read_data_sig,
        oreq => pipe_req_repeated,       
        oack => pipe_ack_repeated,       
        odata => pipe_data_repeated,
        clk => clk,
        reset => reset);
  end generate manyReaders;

  singleReader: if  (not signal_mode) and (num_reads = 1) generate
    read_ack_sig(0) <= pipe_ack_repeated;
    pipe_req_repeated <= read_req(0);
    read_data_sig <= pipe_data_repeated;
  end generate singleReader;
  
end default_arch;
