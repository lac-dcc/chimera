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
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

-- rL -> aL delay can be 0
entity Sample_Pulse_To_Level_Translate_Entity is
  generic (name: string);
  port( rL : in boolean;
        rR : out std_logic;
        aL : out boolean;
        aR : in std_logic;
        clk : in std_logic;
        reset : in std_logic);
end entity;

architecture Behave of Sample_Pulse_To_Level_Translate_Entity is
  type PullModeState is (Idle,Waiting);
  signal pull_mode_state : PullModeState;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- Behave

  process(clk, rL, aR, pull_mode_state)
    variable nstate : PullModeState;
  begin
    nstate := pull_mode_state;
    rR <= '0';
    aL <= false;

      case pull_mode_state is
        when Idle =>
          if(rL) then
            rR <= '1';
            if(aR = '1') then
              aL <= true;
            else
              nstate := Waiting;
            end if;
          end if;
        when Waiting =>
	  rR <= '1';
          if(aR = '1') then
            nstate := Idle;
	    aL <= true;
          end if;
        when others => null;
      end case;

    if(clk'event and clk = '1') then
	if reset = '1' then
		pull_mode_state <= Idle;
	else
      		pull_mode_state <= nstate;
	end if;
    end if;
  end process;
end Behave;
