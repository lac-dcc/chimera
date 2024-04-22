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

-- a protocol matching mediator, used to
-- decouple the split-protocol from the caller
-- module from the current unitary start-fin
-- protocol of the called module
entity CallMediator is
  port (
    call_req: in std_logic;             -- the first split req
    call_ack: out std_logic;            -- the first split ack
    enable_call_data: out std_logic;    -- latch the incoming data
    return_req: in std_logic;           -- the second split req
    return_ack: out std_logic;          -- the second split ack
    enable_return_data: out std_logic;  -- latch the return data
    start: out std_logic;               -- start to called module
    fin: in std_logic;                  -- fin from called module
    clk: in std_logic;
    reset: in std_logic);
end CallMediator;


architecture Struct of CallMediator is
	signal call_ack_sig, return_ack_sig: std_logic;
	signal call_reg, return_reg: std_logic;
begin

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1' or fin = '1') then
				call_reg <= '1';
			elsif (call_ack_sig = '1') then
				call_reg <= '0';
			end if;
		end if;
	end process;
	call_ack_sig <= call_req and call_reg;

	call_ack <= call_ack_sig;
	start <= call_ack_sig;
	enable_call_data <= call_ack_sig;

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1' or (return_ack_sig = '1' and return_req = '1')) then
				return_reg <= '0';
			elsif (fin = '1') then
				return_reg <= '1';
			end if;
		end if;
	end process;
	return_ack_sig <= return_reg or fin;
	return_ack <= return_ack_sig;
	enable_return_data <= fin;
end Struct;
