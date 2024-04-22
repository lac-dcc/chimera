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
use ahir.BaseComponents.all;

--
--
-- assumption: data is maintained valid between sample-req and sample-ack.
--
entity OutputPortSingleWriter is
  generic(name : string;
	  data_width: integer);
  port (
    sample_req        : in  BooleanArray(0 downto 0);
    sample_ack        : out BooleanArray(0 downto 0);
    update_req        : in  BooleanArray(0 downto 0); -- sacrificial
    update_ack        : out BooleanArray(0 downto 0); -- sacrificial
    data       : in  std_logic_vector((data_width-1) downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector((data_width-1) downto 0);
    clk, reset : in  std_logic);
end entity;

architecture Base of OutputPortSingleWriter is
  type   FsmState is (Idle, Waiting);
  signal fsm_state : FsmState;
begin

  update_ack <= update_req; -- sacrificial, pretend to have split protocol.

  process(clk, reset, oack, sample_req)
	variable next_fsm_state : FsmState;
	variable oreqv : std_logic;
	variable sample_ackv : boolean;

  begin
	next_fsm_state := fsm_state;
	oreqv := '0';
	sample_ackv := false;

	case fsm_state is
		when Idle =>
			if(sample_req(0)) then
				oreqv := '1';
				if(oack = '1') then
					sample_ackv := true;
				else
					next_fsm_state := Waiting;
				end if;
			end if;
		when Waiting =>
			oreqv := '1';
			if(oack = '1') then
				sample_ackv := true;
			end if;
	end case;

	oreq <= oreqv;
	sample_ack(0) <= sample_ackv;

	if(clk'event and clk = '1') then
		if(reset = '1') then
			fsm_state <= Idle;
		else
			fsm_state <= next_fsm_state;
		end if;
	end if;
  end process; 

  odata <= data;
end Base;
