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

-- a level to pulse translator used at the
-- output end of a data-path operator in order
-- to interface to the control path.
-- Madhav Desai.
entity Level_To_Pulse_Translate_Entity is
  generic (name : string);
  port(
	rL : out std_logic;
        rR : in  boolean;
        aL : in std_logic;
        aR : out boolean;
        clk : in std_logic;
        reset : in std_logic);
end entity;

architecture Behave of Level_To_Pulse_Translate_Entity is
  type L2PState is (Idle,WaitForAckL);
  signal l2p_state : L2PState;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- Behave

  process(clk, reset, aL, rR, l2p_state)
    variable nstate : L2PState;
  begin
    nstate := l2p_state;
    rL <= '0';
    aR <= false;

    case l2p_state is
        when Idle =>
          if(rR) then
              nstate := WaitForAckL;
          end if;
        when WaitForAckL =>
          rL <= '1';
          if(aL = '1') then
            aR <= true;
	    if(rR)  then
               nstate := WaitForAckL;
            else
               nstate := Idle;
	    end if;
          end if; 
        when others => null;
      end case;

    if(clk'event and clk = '1') then
	if reset = '1' then
		l2p_state <= Idle;
	else
      		l2p_state <= nstate;
	end if;
    end if;
  end process;
end Behave;
