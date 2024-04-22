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

-- author: Madhav Desai.

library ahir;
use ahir.Types.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;


entity access_regulator is
  generic (name: string; num_reqs : integer := 1; num_slots: integer := 1);
  port (
    -- the req-ack pair being regulated.
    req   : in BooleanArray(num_reqs-1 downto 0);
    ack   : out BooleanArray(num_reqs-1 downto 0);
    -- the regulated versions of req/ack
    regulated_req : out BooleanArray(num_reqs-1 downto 0);
    regulated_ack : in BooleanArray(num_reqs-1 downto 0);
    -- transitions on the next two will
    -- open up a slot.
    release_req   : in BooleanArray(num_reqs-1 downto 0);
    release_ack   : in BooleanArray(num_reqs-1 downto 0);
    clk   : in  std_logic;
    reset : in  std_logic);

end access_regulator;

architecture default_arch of access_regulator is


begin  -- default_arch
   gen: for I in 0 to num_reqs-1 generate
	aR: access_regulator_base generic map(name => name & "(" & Convert_To_String(I) & ")", num_slots => num_slots)
		port map(req => req(I),
			 ack => ack(I),
			 regulated_req => regulated_req(I),
			 regulated_ack => regulated_ack(I),
			 release_req => release_req(I),
			 release_ack => release_ack(I),
			 clk => clk, 
			 reset => reset);
   end generate gen;
end default_arch;
