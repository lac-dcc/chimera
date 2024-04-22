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
use ahir.GlobalConstants.all;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity place is

  generic (
    capacity: integer := 1;
    marking : integer := 0;
    name   : string
    );
  port (
    preds : in  BooleanArray;
    succs : in  BooleanArray;
    token : out boolean;
    clk   : in  std_logic;
    reset : in  std_logic);

end place;

architecture default_arch of place is

  signal incoming_token : boolean;      -- true if a pred fires
  signal backward_reset : boolean;      -- true if a succ fires
  signal token_sig      : boolean;  -- asynchronously computed value of the token
  signal token_latch    : unsigned (LogWidth(capacity)-1 downto 0);
  
  constant debug_flag : boolean := global_debug_flag;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- default_arch

  assert capacity > 0 report "in place " & name & ": place must have capacity > 0." severity error;
  assert marking <= capacity report "in place " & name & ": initial marking must be less than place capacity." severity error;


  -- At most one of the preds can send a pulse.
  -- We detect it with an OR over all inputs
  incoming_token <= OrReduce(preds);

  -- At most one of the succs can send a pulse.
  -- We detect it with an OR over all inputs
  backward_reset <= OrReduce(succs);

  latch_token : process (clk, reset, token_latch, backward_reset, incoming_token)
    variable next_token_latch_var: unsigned (token_latch'high downto token_latch'low);
  begin

    next_token_latch_var := token_latch;
    if (backward_reset and (not incoming_token)) then
	if(token_latch> 0) then
            next_token_latch_var := (token_latch - 1);
        end if;
    elsif (incoming_token and (not backward_reset)) then
	if(token_latch < capacity) then
            next_token_latch_var := (token_latch + 1);
        end if;
    end if;
    
    if clk'event and clk = '1' then  -- rising clock edge
      if reset = '1' then            -- synchronous reset (active high)
        token_latch <= To_Unsigned(marking,token_latch'length);
      else
        token_latch <= next_token_latch_var;
  
        if(debug_flag) then
           if (backward_reset and (not incoming_token)) then
              assert token_latch > 0 report "in place " & name &  ": number of tokens cannot become negative!" severity error;
              assert false report "in place " & name & ": token count decremented from " & Convert_To_String(To_Integer(token_latch)) 
	severity note;
  	   elsif (incoming_token and (not backward_reset)) then
          	assert token_latch < capacity report "in place " & name & " number of tokens "
			 	& Convert_To_String(To_Integer(token_latch)+1) & " cannot exceed capacity " 
			 	& Convert_To_String(capacity) severity error;
          	assert false report "in place " & name & " token count incremented from " & Convert_To_String(To_Integer(token_latch))
		 	severity note;
       	    end if;
        end if; -- if debug_flag
      end if; -- if reset
    end if; -- if clk'event
  end process latch_token;

  token <= true when (token_latch > 0) else false;

end default_arch;
