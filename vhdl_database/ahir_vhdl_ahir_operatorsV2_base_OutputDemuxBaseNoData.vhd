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

entity OutputDeMuxBaseNoData is
  generic(name : string;
          twidth: integer;
	  nreqs: integer;
	  detailed_buffering_per_output: IntegerArray);
  port (
    -- req/ack follow level protocol
    reqL                 : in  std_logic;
    ackL                 : out std_logic;
    -- tag identifies index to which demux
    -- should happen
    tagL                 : in std_logic_vector(twidth-1 downto 0);
    -- reqR/ackR follow pulse protocol
    -- and are of length n
    reqR                : in BooleanArray(nreqs-1 downto 0);
    ackR                : out  BooleanArray(nreqs-1 downto 0);
    clk, reset          : in std_logic);
end OutputDeMuxBaseNoData;

architecture Behave of OutputDeMuxBaseNoData is
  signal ackL_sig : std_logic_vector(nreqs-1 downto 0);

-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- Behave

  assert detailed_buffering_per_output'length = reqR'length report "Mismatch." severity failure;

  -----------------------------------------------------------------------------
  -- parallel generate across all requesters
  -----------------------------------------------------------------------------
  PGen: for I in reqR'range generate
    RegFSM: block
      signal valid: std_logic;
      signal lhs_clear : std_logic;
      signal rhs_state : std_logic;

      signal lhs_state : unsigned ((Ceil_Log2(detailed_buffering_per_output(I)+1))-1 downto 0); 
      signal lhs_valid: Boolean;

      signal aR, aR_reg: Boolean;

    begin  -- block Reg
      
      ---------------------------------------------------------------------------
      -- valid true if this I is mentioned in tag
      ---------------------------------------------------------------------------
      valid <= '1' when (reqL = '1') and (I = To_Integer(To_Unsigned(tagL))) else '0';

      ---------------------------------------------------------------------------
      -- lhs-state machine.. just a 3 bit counter which counts up everytime
      -- there is a valid input to this index, and down when the req appears 
      -- at the receiver end.
      ---------------------------------------------------------------------------
      process(clk,lhs_state, lhs_clear,reset,valid)
        variable nstate : unsigned ((Ceil_Log2(detailed_buffering_per_output(I)+1))-1 downto 0); 
        variable aL_var : std_logic;
	variable lhs_valid_var: Boolean;
      begin
        nstate := lhs_state;
        aL_var := '0';
        lhs_valid_var := false;
        
        if(lhs_state < detailed_buffering_per_output(I)) then
            aL_var := '1';
            if(valid = '1') then
              nstate := lhs_state + 1;
            end if;
        end if;

        if(nstate > 0) then
	    lhs_valid_var := true;
            if(lhs_clear = '1') then
              nstate := nstate-1;
            end if;
	end if;

        ackL_sig(I) <= aL_var;
        lhs_valid   <= lhs_valid_var;
        
        if(clk'event and clk = '1') then
           if(reset = '1') then
	      lhs_state <= (others => '0');
	   else
              lhs_state <= nstate;
           end if;        
        end if;

      end process;

      -------------------------------------------------------------------------
      -- rhs state machine
      -------------------------------------------------------------------------
     process(clk,rhs_state,reset,reqR(I),lhs_valid)
       variable nstate : std_logic;
       variable aR_var: boolean;
       variable lhs_clear_var : std_logic;
     begin
        nstate := rhs_state;
        aR_var     := false;
        lhs_clear_var := '0';
        
        case rhs_state is
          when '0' =>
            if(reqR(I)) then
	      nstate := '1';
            end if;
          when '1' =>
            if(lhs_valid) then
              aR_var := true;
              lhs_clear_var := '1';
	      if (not reqR(I)) then
                 nstate := '0';
	      end if;
            end if;
          when others => null;
        end case;

        lhs_clear <= lhs_clear_var;
        ackR(I) <= aR_var;
        
        if(clk'event and clk = '1') then
	  if(reset = '1') then 
          	rhs_state <= '0';
	  else
          	rhs_state <= nstate;
	  end if;
        end if;
     end process;
    end block RegFSM;
    
  end generate PGen;

  -----------------------------------------------------------------------------
  -- ackL
  -----------------------------------------------------------------------------
  ackL <= OrReduce(ackL_sig);

end Behave;
