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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

-- a stall protocol to pulse translator used at the
-- output end of a data-path operator in order
-- to interface to the control path.
-- Madhav Desai.
entity Stall_To_Pulse_Translate_Entity is
  generic (name : string);
  port(
	stall_out : out std_logic;
        rR : in  boolean;
        valid_in : in std_logic;
        aR : out boolean;
        clk : in std_logic;
        reset : in std_logic);
end entity;

architecture Behave of Stall_To_Pulse_Translate_Entity is
  type S2PState is (Idle, WaitForValid, HoldValue);
  signal s2p_state : S2PState;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- Behave

  process(clk, reset, valid_in, rR, s2p_state)
    variable nstate : S2PState;
    variable stall_out_var: std_logic;
  begin
    nstate := s2p_state;
    stall_out_var := '1';
    aR <= false;

    case s2p_state is
        when Idle =>
	  stall_out_var :=  valid_in; -- if valid is observed, start stalling.
          if(rR) then
              nstate := WaitForValid;
          end if;
        when WaitForValid => -- rR has been observed, we are waiting for valid-in.
          stall_out_var := valid_in;  -- stall if valid is observed.
          if(valid_in = '1') then
            aR <= true;
	    if(not rR) then
	      nstate := HoldValue;  -- hold value until rR.
	    else
	      stall_out_var := '0'; -- rR seen, no need to hold, move the pipeline forward.
	    end if;
          end if; 
        when HoldValue =>  -- hold the value until the next rR;
          stall_out_var := '1';  -- keep stalling until rR...
	  if (rR) then
	     nstate := WaitForValid;
             stall_out_var := '0'; -- quit stalling, no need to hold value..
	  end if;
    end case;

    stall_out <= stall_out_var;

    if(clk'event and clk = '1') then
	if reset = '1' then
		s2p_state <= Idle;
	else
      		s2p_state <= nstate;
	end if;
    end if;
  end process;
end Behave;
