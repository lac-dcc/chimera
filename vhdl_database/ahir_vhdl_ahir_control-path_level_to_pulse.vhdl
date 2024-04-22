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
use ahir.BaseComponents.all;
-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##


-- on reset, trigger an AHIR module, and keep
-- retriggering it..
-- TODO: add a single cycle delay in lreq -> preq
-- path and also in the pack -> lack path in order
-- to control the clock period...
entity level_to_pulse is
  generic (name: string; forward_delay: integer; backward_delay: integer);
  port (clk   : in  std_logic;
    	reset : in  std_logic;
        lreq: in std_logic;
        lack: out std_logic;
        preq: out boolean;
        pack: in boolean);
end level_to_pulse;

architecture default_arch of level_to_pulse is
  type L2PState is (idle,waiting);
  signal l2p_state : L2PState;
  signal pack_sig, preq_sig: boolean;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin

  process(clk,reset,lreq, pack_sig, l2p_state)
    variable nstate : L2PState;
    variable lack_v : std_logic;
    variable preq_v : boolean;
    
  begin
    lack_v := '0';
    preq_v := false;
    nstate := l2p_state;
    if(l2p_state = idle) then
      if(lreq ='1') then
        preq_v := true;
        if(pack_sig) then
          lack_v := '1';
        else
          nstate := waiting;
        end if;
      end if;
    else
      if(pack_sig) then
        lack_v := '1';
        nstate := idle;
      end if;
    end if;

    lack     <= lack_v;
    preq_sig <= preq_v;
    
    if(reset = '1') then
      nstate := idle;
    end if;

    if(clk'event and clk = '1') then
      l2p_state <= nstate;
    end if;
    
  end process;

  fDelay: control_delay_element generic map(name => name & "-fDelay", delay_value => forward_delay)
	port map(req => preq_sig, ack => preq, clk => clk, reset => reset);

  bDelay: control_delay_element generic map(name => name & "-bDelay", delay_value => backward_delay)
	port map(req => pack, ack => pack_sig, clk => clk, reset => reset);

  
end default_arch;
