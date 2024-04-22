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
use ahir.Components.all;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

--
-- optimized for single-reader case.
--
-- Assumptions
--    successive update-reqs will be separated
--    by update-acks.
--    
-- oack comes from a pipe with "Moore" outputs.
-- oreq paths into pipe are broken by FFs.
--
entity InputPortSingleReader is
  generic (name : string;
	   data_width: integer);
  port (
    -- pulse interface with the data-path
    sample_req        : in  BooleanArray(0 downto 0); -- sacrificial.
    sample_ack        : out BooleanArray(0 downto 0); -- sacrificial.
    update_req        : in  BooleanArray(0 downto 0);
    update_ack        : out BooleanArray(0 downto 0);
    data              : out std_logic_vector((data_width-1) downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector((data_width-1) downto 0);
    clk, reset : in  std_logic);
end entity;


architecture Base of InputPortSingleReader is

  signal data_register: std_logic_vector((data_width-1) downto 0);
  type FsmState is (Idle, WaitingForOack);

  signal fsm_state : FsmState;
begin

  sample_ack(0) <= sample_req(0); -- sacrificial, pretend to have split protocol.

  -- state machine.
  process(clk, reset, update_req,  oack, odata)
	variable next_fsm_state: FsmState;
	variable oreqv : std_logic;
	variable update_ack_v: boolean;
  begin
	next_fsm_state := fsm_state;
	oreqv := '0';
	update_ack_v := false;
	
	case fsm_state is 
		when Idle =>
			if(update_req(0)) then
				oreqv := '1';
			 	if  (oack = '1') then
					update_ack_v := true;
				else 
					next_fsm_state := WaitingForOack;
				end if;
			end if;
		when WaitingForOack =>
			oreqv := '1';
			if(oack = '1') then
				update_ack_v := true;
				next_fsm_state := Idle;
			end if;
	end case;

	oreq <= oreqv;
	
	if(clk'event and clk = '1') then
		if(reset = '1') then
			fsm_state <= Idle;
			update_ack(0) <= false;
		else
			fsm_state <= next_fsm_state;
			update_ack(0) <= update_ack_v;
		end if;

		if(update_ack_v) then
			data_register <= odata;
		end if;
	end if;
  end process;

  data <= data_register;

end Base;
