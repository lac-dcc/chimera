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
--  An interlock with a write interface
--  triggered by a pulse protocol and completed
--  by a level-pulse protocol.  The read-interface
--  is partially regulated by a pulse protocol.
--
--  sample_req->sample_ack can be zero delay.
--  update_req->update_ack has unit delay.
--
entity PulseLevelPulseInterlockBuffer is
  generic (name : string; data_width: integer; buffer_size : integer);
  port( write_req : in boolean;
        write_ack : out boolean;
        write_data : in std_logic_vector(data_width-1 downto 0);
        update_req : in boolean;
        update_ack : out boolean;
        has_data    : out std_logic;
        read_enable : in std_logic;
        read_data : out std_logic_vector(data_width-1 downto 0);
        clk : in std_logic;
        reset : in std_logic);
end entity;

architecture Behave of PulseLevelPulseInterlockBuffer is
	signal zero_sig : std_logic;
	signal rx_has_data, rx_read_enable: std_logic;

	signal rx_read_data : std_logic_vector(data_width-1 downto 0);
	type UpdateFsmState is (idle, acking, waiting);
	signal update_fsm_state: UpdateFsmState;

begin  -- Behave

   zero_sig <= '0';


   read_data <= rx_read_data;

   Rxbuf: ReceiveBuffer generic map (name => name & " buffer ",
				data_width => data_width,
			 	buffer_size => buffer_size)
		port map(write_req => write_req,
                         write_ack => write_ack,
			 write_data => write_data,
			 read_req => rx_read_enable,
			 read_ack => rx_has_data,
                         read_data => rx_read_data,
			 clk => clk, reset => reset);		


   process(clk,reset,update_fsm_state, update_req, rx_has_data, read_enable)
	variable nstate: UpdateFsmState;
	variable uackv : boolean;
   begin
	nstate := update_fsm_state;
	uackv := false;

	rx_read_enable <= '0';
	has_data <= '0';

        case update_fsm_state is
	   when idle | acking =>
		if(update_req) then
			 if (rx_has_data = '1') then  
				has_data <= '1';
				if (read_enable = '1') then
					rx_read_enable <= '1';
					nstate := acking;
				else
					nstate := waiting;
				end if;
			else
				nstate := waiting;
			end if;
		else
			nstate := idle;
		end if;
		if(update_fsm_state = acking) then
			uackv := true;
		end if;
	   when waiting => -- update-req has been seen, forward rx-has-data, wait until read_enable.
		has_data <= rx_has_data;
		if(read_enable = '1') then
			rx_read_enable <= '1';
			nstate := acking;
		end if;
	end case;
			
        update_ack <= uackv;

	if(clk'event and clk = '1') then
		if(reset = '1') then
			update_fsm_state <= idle;
		else
			update_fsm_state <= nstate;
		end if;
	end if;
   end process;

end Behave;
