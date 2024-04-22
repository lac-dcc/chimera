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
-- phi-sequencer.. improved version
--  src-expressions are triggered only when needed
--  (as opposed to the old phi which was clumsy).
-- written by Madhav P. Desai, December 2015.
library ieee;
use ieee.std_logic_1164.all;
library ahir;
use ahir.Types.all;
use ahir.subprograms.all;
use ahir.BaseComponents.all;
use ahir.Utilities.all;
use ahir.GlobalConstants.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity phi_sequencer_v2  is
  generic (place_capacity : integer; 
	   ntriggers : integer; 
	   name : string);
  port (
  	triggers : in BooleanArray(0 to ntriggers-1); 	    -- there are nreq triggers.
  	src_sample_starts : out BooleanArray(0 to ntriggers-1);   -- sample starts for sources.
	src_sample_completes: in BooleanArray(0 to ntriggers-1);  -- sample completes from sources.
  	src_update_starts : out BooleanArray(0 to ntriggers-1);   -- update starts for sources.
	src_update_completes: in BooleanArray(0 to ntriggers-1);  -- update completes from sources.
  	phi_sample_req  : in Boolean;			   	  -- incoming sample-req to phi.
	phi_sample_ack  : out Boolean;				  -- outgoing sample-ack from phi.
  	phi_update_req  : in Boolean;			   	  -- incoming update-req to phi.
	phi_update_ack  : out Boolean;				  -- outgoing update-ack from phi.
  	phi_mux_select_reqs    : out BooleanArray(0 to ntriggers-1);	  -- phi-select mux select reqs.
	phi_mux_ack: in Boolean;				  -- ack from mux signifying select complete.
  	clk, reset: in std_logic);
end phi_sequencer_v2;


--
-- on reset, wait for a transition on any of the in_places.
-- the corresponding req is asserted..  A token in the
-- enable places is needed to allow firing of the reqs.
--
architecture Behave of phi_sequencer_v2 is
  signal trigger_tokens, trigger_clears : BooleanArray(0 to ntriggers-1);
  signal sample_wait_tokens, sample_wait_clears : BooleanArray(0 to ntriggers-1);
  signal src_update_start_tokens, src_update_start_clears : BooleanArray(0 to ntriggers-1);
  signal src_update_wait_tokens, src_update_wait_clears : BooleanArray(0 to ntriggers-1);
  signal src_sample_start_sigs : BooleanArray(0 to ntriggers-1);   -- sample starts for sources.
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- Behave

  src_sample_starts <= src_sample_start_sigs;

  -- fatal: multiple triggers should never be active.
  ErrorFlag: if global_debug_flag generate
    process(clk, reset)
        variable found_flag : Boolean := false;
    begin
       found_flag := false;
       if(clk'event and clk = '1') then
         if(reset = '0') then
	   for I in 0 to ntriggers-1 loop
             if(triggers(I)) then
		if(found_flag) then
		   assert false report "Multiple triggers to phi " & name & " are active. "
				severity error;
		else
		   found_flag := true;
                end if;
             end if;
          end loop;
         end if;
       end if;
    end process;
  end generate ErrorFlag;
 
  --
  -- the sample/update pairs are totally independent.
  -- If the phi-sequencer drives an operator which does
  -- not couple the sample-req/ack pair with the
  -- update req/ack pair (as can happen if the operation
  -- is guarded, for example), then we need to introduce an additional
  -- external dependency in the control-path...
  --
  trigForkSample: conditional_fork
		generic map (place_capacity => place_capacity,
				ntriggers => ntriggers,
					name => name & ":trigFork")
		port map (triggers => triggers,
				in_transition => phi_sample_req,
					out_transitions => src_sample_start_sigs, 
						clk => clk, reset => reset);
  trigForkUpdate: conditional_fork
		generic map (place_capacity => place_capacity,
				ntriggers => ntriggers,
					name => name & ":trigFork")
		port map (triggers => triggers,
				in_transition => phi_update_req,
					out_transitions => src_update_starts, 
						clk => clk, reset => reset);
					
					

  -- mux-selects triggered by src-update completes.
  phi_mux_select_reqs <= src_update_completes;

  -- phi-sample-ack is reduced or src-sample-completes.
  phi_sample_ack <= OrReduce(src_sample_completes);

  -- phi-mux-ack goes back as phi_update_ack.
  phi_update_ack <= phi_mux_ack; 

end Behave;
