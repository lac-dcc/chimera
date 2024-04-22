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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

library ahir;
use ahir.GlobalConstants.all;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

entity place_with_bypass is

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

end place_with_bypass;

architecture default_arch of place_with_bypass is

  signal incoming_token : boolean;      -- true if a pred fires
  signal backward_reset : boolean;      -- true if a succ fires
  signal token_latch    : unsigned (LogWidth(capacity)-1 downto 0);
  constant U0    : unsigned (LogWidth(capacity)-1 downto 0) := (others => '0');

  signal non_zero       : boolean;

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


  CapGtOne: if (capacity > 1) generate
  
    non_zero <= (token_latch /= U0);

    latch_token_cap_gt_one : process (clk, reset,incoming_token, backward_reset, token_latch, non_zero)
	variable incr, decr          : boolean;
    	variable next_token_latch_var: unsigned (token_latch'high downto token_latch'low);
    begin

      incr := incoming_token and (not backward_reset);
      decr := backward_reset and (not incoming_token);
      next_token_latch_var := token_latch;
  
      if(incr) then
          next_token_latch_var := token_latch + 1;
      elsif (decr) then
          next_token_latch_var := token_latch - 1;
      end if;
      
      if clk'event and clk = '1' then  -- rising clock edge

        if reset = '1' then            -- synchronous reset (active high)
          token_latch <= To_Unsigned(marking, token_latch'length);
        else
          token_latch <= next_token_latch_var;
        end if;
  
        if((reset /= '1') and debug_flag and decr) then
             
        	  if (token_latch = 0) then
          		  assert false report "in place-with-bypass: " & name &  ": number of tokens cannot become negative!" severity error;
        	  end if;
           	  assert false report "in place " & name & ": token count decremented from " & Convert_To_String(to_integer(token_latch))
		 	  severity note;
        end if;
  
        if ((reset /= '1') and debug_flag and incr) then
  
       		  if(token_latch = capacity) then
         		  assert false report "in place-with-bypass: " & name & " number of tokens "
			 	  & Convert_To_String(to_integer(token_latch)+1) & " cannot exceed capacity " 
			 	  & Convert_To_String(capacity) severity error;
       		  end if;
           	  assert false report "in place " & name & " token count incremented from " & Convert_To_String(to_integer(token_latch))
		  	  severity note;
	  end if;

      end if;
    end process latch_token_cap_gt_one;
  end generate CapGtOne;


  -- When capacity = 1, we will write this process in a slightly optimized
  -- manner in order to save a flip-flop.
  CapEqOne: if (capacity = 1) generate

    latch_token_cap_eq_one : process (clk, reset,incoming_token, backward_reset, non_zero)
	variable incr, decr          : boolean;
	variable next_non_zero_var        : boolean; 
    begin

      incr := incoming_token and (not backward_reset);
      decr := backward_reset and (not incoming_token);

      next_non_zero_var := non_zero;
  
      if(incr) then
          next_non_zero_var := true;
      elsif (decr) then
          next_non_zero_var := false;
      end if;
      
  
      if clk'event and clk = '1' then  -- rising clock edge

        if reset = '1' then            -- synchronous reset (active high)
          non_zero <= (marking > 0);
        else
          non_zero    <= next_non_zero_var;
        end if;
  
        if((reset /= '1') and debug_flag and decr) then
             
        	  if (not non_zero) then
          		  assert false report "in place-with-bypass: " & name &  ": number of tokens cannot become negative!" severity error;
        	  end if;
           	  assert false report "in place " & name & ": token count decremented from 1 to 0 " severity note;
        end if;
  
        if ((reset /= '1') and debug_flag and incr) then
  
       		  if(non_zero) then
         		  assert false report "in place-with-bypass: " & name & " number of tokens "
			 	  & " cannot exceed capacity " 
			 	  & Convert_To_String(capacity) severity error;
       		  end if;
           	  assert false report "in place " & name & " token count incremented from 0 to 1" severity note;
	  end if;

      end if;
    end process latch_token_cap_eq_one;
  end generate CapEqOne;

  token <= incoming_token or non_zero;

end default_arch;
