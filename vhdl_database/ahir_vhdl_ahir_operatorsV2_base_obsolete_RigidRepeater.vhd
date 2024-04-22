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


-- forwards req_in to req_out (with one cycle delay)
-- and waits until ack_in appears before forwarding ack_out (one cycle delay).
entity RigidRepeater is
    generic(data_width: integer := 32);
    port(clk: in std_logic;
         reset: in std_logic;
         data_in: in std_logic_vector(data_width-1 downto 0);
         req_in: in std_logic;
         ack_out: out std_logic;
         data_out: out std_logic_vector(data_width-1 downto 0);
         req_out : out std_logic;
         ack_in: in std_logic);
end entity RigidRepeater;

architecture behave of RigidRepeater is

	type RR_State is (idle, busy, done);
	signal state_sig: RR_State;

begin  -- SimModel
  process(clk,state_sig,req_in,ack_in)
    variable nstate: RR_State;
    variable latch_v : boolean;
    variable req_out_v, ack_out_v : std_logic;
  begin
    nstate := state_sig;
    latch_v := false;
    req_out_v := '0';
    ack_out_v := '0';
    
    case state_sig is
      when idle =>
        -- req_in?
        if(req_in = '1') then
          nstate := busy;
          -- latch the data
          latch_v := true;
        end if;
      when busy =>
        -- pass to req_out
        req_out_v := '1';
        if(ack_in = '1') then
          -- ack_in?
          nstate := done;
        end if;
      when done =>
        -- spend one cycle here.. ack_out
        ack_out_v := '1';
        nstate := idle;
    end case;

    req_out <= req_out_v;
    ack_out <= ack_out_v;

    if(clk'event and clk = '1') then
      if(reset = '1') then
        state_sig <= idle;
      else
        state_sig <= nstate;
      end if;
      
      if(latch_v) then
        data_out <= data_in;
      end if;
    end if;
    
  end process;

end behave;
