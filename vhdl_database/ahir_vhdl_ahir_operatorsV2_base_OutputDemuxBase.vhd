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

-------------------------------------------------------------------------------
-- a single level requester on the left, and nreq requesters on the right.
--
-- reqR -> ackR has unit delay if pipeline_flag is true.
-- reqL -> ackL has at least a unit delay.
-------------------------------------------------------------------------------
entity OutputDeMuxBase is
  generic(name: string; iwidth: integer := 4;
	  owidth: integer := 12;
	  twidth: integer := 2;
	  nreqs: integer := 3;
	  no_arbitration: Boolean := false;
          pipeline_flag: Boolean := true);
  port (
    -- req/ack follow level protocol
    reqL                 : in  std_logic;
    ackL                 : out std_logic;
    dataL                : in  std_logic_vector(iwidth-1 downto 0);
    -- tag identifies index to which demux
    -- should happen
    tagL                 : in std_logic_vector(twidth-1 downto 0);
    -- reqR/ackR follow pulse protocol
    -- and are of length n
    reqR                : in BooleanArray(nreqs-1 downto 0);
    ackR                : out  BooleanArray(nreqs-1 downto 0);
    -- dataR is array(n,m) 
    dataR               : out std_logic_vector(owidth-1 downto 0);
    clk, reset          : in std_logic);
end OutputDeMuxBase;

architecture Behave of OutputDeMuxBase is

  type WordArray is array (natural range <>) of std_logic_vector(iwidth-1 downto 0);
  signal dfinal, dfinal_reg: WordArray(nreqs-1 downto 0);

  signal ackL_sig : std_logic_vector(nreqs-1 downto 0);
  signal ackR_sig : BooleanArray(nreqs-1 downto 0);
  
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- Behave

  assert(owidth = iwidth*nreqs) report "word-length mismatch in output demux " & name severity failure;

  
  -----------------------------------------------------------------------------
  -- parallel generate across all requesters
  -----------------------------------------------------------------------------
  PGen: for I in reqR'range generate
    RegFSM: block
      signal valid: std_logic;
      signal lhs_clear : std_logic;
      signal rhs_state, lhs_state : std_logic;
    begin  -- block Reg
      
      ---------------------------------------------------------------------------
      -- valid true if this I is mentioned in tag
      ---------------------------------------------------------------------------
      valid <= '1' when (reqL = '1') and (I = To_Integer(To_Unsigned(tagL))) else '0';

      ---------------------------------------------------------------------------
      -- lhs-state machine.
      ---------------------------------------------------------------------------
      process(clk,lhs_state, lhs_clear,reset,valid)
        variable nstate : std_logic;
        variable latch_flag : boolean;
        variable aL_var : std_logic;
      begin
        nstate := lhs_state;
        latch_flag := false;
        aL_var := '0';
        
        case lhs_state is
          when '0' =>
            if(valid = '1') then
              nstate := '1';
              latch_flag := true;
              aL_var := '1';
            end if;
          when '1' =>
            if(lhs_clear = '1') then
              nstate := '0';
            end if;

	    -- to track down some mixup issues!
	    assert (valid = '0') report "In Outputdemux " & name & ": stalled request " & Convert_To_String(I)
			severity warning;

          when others => null;
        end case;

        ackL_sig(I) <= aL_var;
        
        if(clk'event and clk = '1') then
	  if(reset = '1') then
		lhs_state <= '0';
	  else
            	lhs_state <= nstate;
          end if;

          if(latch_flag) then
            dfinal(I) <= dataL;
          end if;          
        end if;
      end process;

      -------------------------------------------------------------------------
      -- rhs state machine
      -------------------------------------------------------------------------
     process(clk,rhs_state,reset,reqR(I),lhs_state)
       variable nstate : std_logic;
       variable aR_var : boolean;
       variable lhs_clear_var : std_logic;
     begin
        nstate := rhs_state;
        aR_var := false;
        lhs_clear_var := '0';
        
        case rhs_state is
          when '0' =>
            if(reqR(I)) then
              if(lhs_state = '1') then
                aR_var := true;
                lhs_clear_var := '1';
              else
                nstate := '1';
              end if;
            end if;
          when '1' =>
            if(lhs_state = '1') then
              lhs_clear_var := '1';
              aR_var := true;
              nstate := '0';
            end if;
          when others => null;
        end case;

        ackR_sig(I) <= aR_var;
        lhs_clear <= lhs_clear_var;
        
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

  -----------------------------------------------------------------------------
  -- non-pipelined case, ackR_sig goes straight to ackR, dfinal goes to dataR
  -----------------------------------------------------------------------------
  Nonpipelined: if (not pipeline_flag) generate

    ackR <= ackR_sig;

    process(dfinal)
      variable dataRv : std_logic_vector(owidth-1 downto 0);
    begin
      for I in dfinal'range loop
	dataRv(((I+1)*iwidth)-1 downto I*iwidth) := dfinal(I);
        --Insert(dataRv,I,dfinal(I));
      end loop;
      dataR <= dataRv;
    end process;
    
  end generate Nonpipelined;  

  -----------------------------------------------------------------------------
  -- pipelined case, ackR_sig delayed to ackR, dfinal delayed to dataR
  -----------------------------------------------------------------------------
  Pipelined: if pipeline_flag generate

    process(clk,reset)
    begin
      if(clk'event and clk = '1') then
        if(reset = '1') then
          ackR <= (others => false);
        else
          ackR <= ackR_sig;
        end if;
      end if;
    end process;

    Freggen: for I in 0 to nreqs-1 generate
      process(clk)
      begin
        if(clk'event and clk = '1') then
          if(ackR_sig(I)) then
            dfinal_reg(I) <= dfinal(I);
          end if;
        end if;
      end process;
    end generate Freggen;

    process(dfinal_reg)
      variable dataRv : std_logic_vector(owidth-1 downto 0);
    begin
      for I in dfinal_reg'range loop
	dataRv(((I+1)*iwidth)-1 downto I*iwidth) := dfinal_reg(I);
        -- Insert(dataRv,I,dfinal_reg(I));
      end loop;
      dataR <= dataRv;
    end process;
  end generate Pipelined;

end Behave;
