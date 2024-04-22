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
use ahir.BaseComponents.all;


entity countDownTimer is -- 
    generic (tag_length : integer);
    port ( -- 
      time_count : in  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity countDownTimer;

architecture Behave of countDownTimer is
	type TimerState is (idle, busy, done);
	signal tstate : TimerState;
	signal count_sig : unsigned(31 downto 0);
	signal tag_reg: std_logic_vector(tag_length-1 downto 0);
begin

	process(clk,reset,tstate,count_sig,start_req,fin_req,tag_in)
		variable next_state: TimerState;
		variable latch_var, decr_count, latch_otag: boolean;
	begin
		next_state := tstate;

		start_ack <= '0';
		fin_ack <= '0';

		latch_var := false;
		decr_count := false;
		latch_otag := false;

		case tstate is 
			when idle =>
				start_ack <= '1';
				if(start_req = '1') then
					next_state := busy;
					latch_var  := true;
				end if;
			when busy =>
				decr_count := true;
				if(count_sig = 0) then
					next_state := done;
					latch_otag := true;
				end if;
			when done =>
				fin_ack <= '1';
				if(fin_req = '1') then
					next_state := idle;
				end if;
			when others =>
		end case;
		if(clk'event  and clk = '1') then
			if(reset = '1') then
				tstate <= idle;
			else
				tstate <= next_state;	
			end if;

			if(latch_var) then
				count_sig <= unsigned(time_count);
				tag_reg <= tag_in;
			elsif(decr_count) then
				count_sig <= count_sig - 1;
			end if;

			if(latch_otag) then
				tag_out <= tag_reg;	
			end if;
		end if;
	end process;

end Behave;

