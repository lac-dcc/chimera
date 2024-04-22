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

--
-- a safe register with no combinational paths
-- from input to output or vice-versa.
--
entity PipelineRegister is
  generic (name : string; data_width: integer);
  port (
    read_req       : in  std_logic;
    read_ack       : out std_logic;
    read_data      : out std_logic_vector(data_width-1 downto 0);
    write_req       : in  std_logic;
    write_ack       : out std_logic;
    write_data      : in std_logic_vector((data_width-1) downto 0);
    clk, reset : in  std_logic);
  
end PipelineRegister;

architecture default_arch of PipelineRegister is

   type FsmState is (Empty, Full);
   signal fsm_state : FsmState;
   signal data_reg : std_logic_vector(data_width-1 downto 0);
  
begin  -- default_arch

	process(clk, reset, write_req, read_req, write_data, fsm_state)
		variable next_state : FsmState;
		variable read_ack_v, write_ack_v, latch_v : std_logic;
	begin
		next_state := fsm_state;
		read_ack_v := '0';
		write_ack_v := '0';
		latch_v := '0';
	
		case fsm_state is 
			when Empty =>
				write_ack_v := '1';
				if(write_req = '1') then
					next_state := Full;
					latch_v := '1';
				end if;
			when Full =>
				read_ack_v := '1';
				if(read_req = '1') then
					next_state := Empty;
				end if;
		end case;
					
		write_ack <= write_ack_v;
		read_ack  <= read_ack_v;

		if(clk'event and clk = '1') then
			if(reset = '1') then
				fsm_state <= Empty;
			else
				fsm_state <= next_state;
			end if;

			if(latch_v = '1') then
				data_reg <= write_data;
			end if;
		end if;
	end process;

	read_data <=  data_reg;
end default_arch;
