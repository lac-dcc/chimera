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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##


-- make sure that there is no starvation..
--
-- latch the incoming requests (reqIn) and present them
-- to the downstream user (reqOut).  As ackIn is received,
-- clear reqOut.  The latching of reqIn to reqOut is done
-- only if reqOut is cleared.  There is a bypass path
-- from reqIn to reqOut if reqIn_register is 0..  This
-- prevents a useless latency.
entity NobodyLeftBehind is
  generic ( name: string; num_reqs : integer := 1);
  port (
    clk,reset : in std_logic;
    reqIn : in std_logic_vector(num_reqs-1 downto 0);
    ackOut: out std_logic_vector(num_reqs-1 downto 0);
    reqOut : out std_logic_vector(num_reqs-1 downto 0);
    ackIn : in std_logic_vector(num_reqs-1 downto 0));
end entity;


architecture Fair of NobodyLeftBehind is
  signal reqIn_register: std_logic_vector(num_reqs-1 downto 0);
  signal reqIn_reg_is_non_zero: std_logic;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- Behave


   -- if there is only one requester, there is really no point.
   Trivial: if num_reqs = 1 generate
     reqOut <= reqIn;
     ackOut <= ackIn;
   end generate Trivial;

   Nontrivial: if num_reqs > 1 generate

     reqIn_reg_is_non_zero <= OrReduce(reqIn_register);
     reqOut <= reqIn_register when reqIn_reg_is_non_zero = '1' else reqIn;
     
     process(clk, reset, reqIn_reg_is_non_zero, reqIn_register, reqIn, ackIn)
	  variable next_reqIn_register : std_logic_vector(num_reqs-1 downto 0);
     begin
	  next_reqIn_register := reqIn_register;
  
          if(reqIn_reg_is_non_zero = '0') then
              -- if reqIn_register is 0, then reqIn will be 
	      -- immediately forwarded to reqOut..  An ackIn
              -- may immediately appear.. in which case reqIn_register
              -- will stay 0.
	      next_reqIn_register := reqIn and (not ackIn); -- reqIn and (reqIn xor ackIn);
          else
              -- reqOut must come from reqIn_register.. the next
              -- state will be determined by reqIn_register and ackIn
	      next_reqIn_register := reqIn_register and (not ackIn); -- reqIn_register and (reqIn_register xor ackIn);
          end if;
  
          if(clk'event and clk = '1') then
		  if(reset = '1') then
			  reqIn_register <= (others => '0');
		  else
			  reqIn_register <= next_reqIn_register;
		  end if;
	  end if;
	  
     end process;

     ackOut <= ackIn;
   
   end generate NonTrivial;

end Fair;
