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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity UnloadRegister is
  generic (name: string; 
		data_width : integer ; 
		bypass_flag: boolean := false;  -- if specified, bypasses in->out if possible.
		nonblocking_read_flag : boolean := false);
  port ( write_req: in std_logic;
        write_ack: out std_logic;
        write_data: in std_logic_vector(data_width-1 downto 0);
        unload_req: in boolean;
        unload_ack: out boolean;
        read_data: out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset: in std_logic);
end UnloadRegister;

architecture default_arch of UnloadRegister is
	signal unload_ack_sig : boolean;
	signal write_req_nonblockified : std_logic;
	signal write_data_nonblockified: std_logic_vector(data_width-1 downto 0);
	type FsmState is (Idle, Waiting);
	signal fsm_state : FsmState;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- default_arch


    noBypass: if not bypass_flag generate 
	-- FSM
  	--   Two states: Idle, Waiting
  	process(clk, reset, fsm_state, unload_req, write_req, write_data)
     		variable nstate: FsmState;
     		variable load_v : boolean;
		variable write_ack_v : std_logic;
		variable data_v : std_logic_vector(data_width-1 downto 0);
        begin
     		nstate :=  fsm_state;
		write_ack_v := '0';
     		load_v := false;
		data_v := write_data;
  		
     		case fsm_state is
         		when Idle => 
               			if(unload_req) then
					write_ack_v := '1';
					if (write_req = '1') then
						load_v := true;
					elsif nonblocking_read_flag then
						load_v := true;
						data_v := (others => '0'); -- non-blocking!
					else
						nstate := Waiting;
					end if;
				end if;
	 		when Waiting =>
				write_ack_v := '1';
				if(write_req = '1') then
					load_v := true;
					nstate := Idle;
				end if;
     		end case;
 
		write_ack <= write_ack_v;
		
     		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= idle;
				unload_ack <= false;
           			read_data <= (others => '0');
			else
				fsm_state <= nstate;
				unload_ack <= load_v;
				if(load_v) then
           				read_data <= data_v;
        			end if;
			end if;
		
     		end if;
  	end process;
   end generate noBypass;

  --
  -- buffer_size = 0 means we want a fast write_data->read_data path
  -- with the UnloadBuffer just doing protocol conversion.
  --
  yesBypassNonBlocking: if bypass_flag and nonblocking_read_flag generate
     bypassBlock: block
        signal bypass_reg_flag: Boolean;
	signal write_data_reg, write_data_prereg: std_logic_vector(data_width-1 downto 0);

        -- delayed and immediate versions of unload-ack
	-- corresponding to the two possible unload scenarios.
	signal unload_ack_sig: boolean;
     begin
    
	-- FSM
  	--   Two states: Idle, Waiting
  	process(clk,fsm_state, unload_req, write_req, write_data)
     		variable nstate: FsmState;
     		variable loadv : boolean;
     		variable write_ackv: std_logic;
     		variable datav: std_logic_vector(data_width-1 downto 0);
        begin
     		nstate :=  fsm_state;
     		write_ackv := '0';

     		loadv := false;
     		datav := (others => '0');
  		
     		case fsm_state is
         		when idle => 
               			if(unload_req) then
					nstate := Waiting;
               			end if;
	 		when Waiting =>
		    		write_ackv := '1';
				loadv   := true;

				-- write-data is 0 unless write-reg='1'.
				if(write_req = '1') then
		    			datav := write_data;
				end if;


				if(not unload_req) then
					nstate := Idle;
				end if;
     		end case;
 
     		write_ack <= write_ackv;
                unload_ack_sig <= loadv;
		write_data_prereg <= datav;
		
     		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= idle;
           			write_data_reg <= (others => '0');
			else
				fsm_state <= nstate;
				if(loadv) then
           				write_data_reg <= datav;
        			end if;
			end if;
     		end if;
  	end process;
        read_data <= write_data_prereg when unload_ack_sig else write_data_reg;
	unload_ack <= unload_ack_sig;
    end block;
  end generate yesBypassNonBlocking;

  yesBypassBlocking: if bypass_flag and (not nonblocking_read_flag) generate
     bypassBlock: block
	type FsmStateBypass is (Idle, Waiting_1, Waiting_2);
        signal bypass_reg_flag: Boolean;
	signal write_data_reg, write_data_prereg: std_logic_vector(data_width-1 downto 0);

        -- delayed and immediate versions of unload-ack
	-- corresponding to the two possible unload scenarios.
	signal unload_ack_sig: boolean;
	signal fsm_state_bypass : FsmStateBypass;
     begin
    
	-- FSM
  	--   Three states: Idle, Waiting_1, Waiting_2.. Not clear
	--     why we need Waiting_1 and Waiting_2?  I thought I
	--     had a reason for this.. Let the synthesis tool 
	--     optimize this one.
	--
	-- creates a forward path from write_req to unload_ack..
	-- 
  	process(clk,fsm_state_bypass, unload_req, write_req, write_data)
     		variable nstate: FsmStateBypass;
     		variable loadv : boolean;
     		variable write_ackv: std_logic;
     		variable datav: std_logic_vector(data_width-1 downto 0);
        begin
     		nstate :=  fsm_state_bypass;
     		write_ackv := '0';

     		loadv := false;
		datav := write_data;
  		
     		case fsm_state_bypass is
         		when idle => 
               			if(unload_req) then
					nstate := Waiting_1;
               			end if;
	 		when Waiting_1 =>
				-- unload-req observed in previous cycle, wait for write-req.
		    		write_ackv := '1';

				if (write_req = '1') then
					loadv   := true;
					if(not unload_req) then
						-- no unload-req? go to idle..
						-- else stay here..
						nstate := Idle;
					end if;
				else
					nstate := Waiting_2;
				end if;
			when Waiting_2 =>
				-- unload req observed.. but not immediately
				-- previous cycle.  Idle and Waiting_2 are 
				-- distinguished by the fact that when we
				-- are in Waiting_2, we have a pending unload.
		    		write_ackv := '1';
				if(write_req = '1') then
					loadv := true;
					if(unload_req) then
						nstate := Waiting_1;
					else
						nstate := Idle;
					end if;
				end if;
     		end case;
 
     		write_ack <= write_ackv;
                unload_ack_sig <= loadv;
		write_data_prereg <= datav;
		
     		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state_bypass <= Idle;
           			write_data_reg <= (others => '0');
			else
				fsm_state_bypass <= nstate;
				if(loadv) then
           				write_data_reg <= datav;
        			end if;
			end if;
     		end if;
  	end process;
	-- note bypass..
        read_data <= write_data_prereg when unload_ack_sig else write_data_reg;
	unload_ack <= unload_ack_sig;
    end block;
  end generate yesBypassBlocking;
end default_arch;
