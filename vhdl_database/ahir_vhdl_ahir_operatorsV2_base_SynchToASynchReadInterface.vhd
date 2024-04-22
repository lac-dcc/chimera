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


entity SynchToAsynchReadInterface is
  generic (
    name: string;
    data_width : integer);
  port (
    clk : in std_logic;
    reset  : in std_logic;
    synch_req : in std_logic;  -- indicates that synch side has data.
    synch_ack : out std_logic; -- indicates that synch-side should do a read 
				-- (there is a 1-cycle delay between the assertion of this signal
				--   and availability of synch data).
    asynch_req : out std_logic; --  indicates that asynch side wishes to forward data
    asynch_ack: in std_logic;  -- indicates that forwarded data is accepte.
    synch_data: in std_logic_vector(data_width-1 downto 0); -- synch data in
    asynch_data : out std_logic_vector(data_width-1 downto 0)); -- forwarded data out.
end SynchToAsynchReadInterface;


architecture Behave of SynchToAsynchReadInterface is

  type InMatchingFSMState is (Idle,LatchSynchData,WaitForAsynchAck);
  signal in_fsm_state : InMatchingFSMState;

  signal synch_data_reg: std_logic_vector(data_width-1 downto 0);
  
begin

  process(clk,reset, in_fsm_state, synch_req, asynch_ack)
    variable next_state: InMatchingFSMState;
    variable synch_ack_var, asynch_req_var: std_logic;
    variable latch_var: std_logic;
    
  begin
    next_state := in_fsm_state;

    synch_ack_var := '0';
    asynch_req_var := '0';
    latch_var := '0';
    
    case in_fsm_state is
      when idle =>
        if(synch_req = '1') then
            synch_ack_var := '1';
	    next_state := LatchSynchData;
	end if;
      when LatchSynchData =>
	-- latch the data from the synch side
        -- because that data is guarateed to be valid
        -- only in this cycle.
        latch_var := '1';
        asynch_req_var := '1';
        if(asynch_ack = '1') then
          synch_ack_var := '1';
	  -- if synch-req is '1', then stay
          -- here... 
          if(synch_req = '0') then
          	next_state :=  Idle;
	  end if;
        else
           next_state := WaitForAsynchAck;
        end if;
      when WaitForAsynchAck =>
	-- wait for ack from asynch-side
        asynch_req_var := '1';
        if(asynch_ack = '1')  then
            -- if synch-requests then latch
            -- synch data.
	    if(synch_req = '1') then
               synch_ack_var := '1';
               next_state := LatchSynchData;
            else
               next_state := Idle;
            end if;
        end if;
      when others => null;
    end case;
    
    synch_ack <= synch_ack_var;
    asynch_req <= asynch_req_var;

    if(clk'event and clk = '1') then
       if(reset = '1') then
         in_fsm_state <= Idle;
         synch_data_reg <= (others => '0');
       else 
         in_fsm_state <= next_state;
	 if(latch_var = '1') then
		synch_data_reg <= synch_data;
	 end if;
       end if;
    end if;
  end process;

  asynch_data <= synch_data when (in_fsm_state = LatchSynchData) else synch_data_reg; 
  
end Behave;
