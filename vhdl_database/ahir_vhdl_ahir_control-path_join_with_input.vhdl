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
use ahir.subprograms.all;
use ahir.BaseComponents.all;
use ahir.utilities.all;

entity join_with_input is
  generic (number_of_predecessors: integer; place_capacity : integer := 1; bypass : boolean := true; name : string);
  port ( preds      : in   BooleanArray(number_of_predecessors-1 downto 0);
    	symbol_in  : in   boolean;
    	symbol_out : out  boolean;
	clk: in std_logic;
	reset: in std_logic);
end join_with_input;

architecture default_arch of join_with_input is
  signal symbol_out_sig : BooleanArray(0 downto 0);
  signal place_sigs: BooleanArray(preds'range);
  signal inp_place_sig: Boolean;
  constant H: integer := number_of_predecessors-1;
  constant L: integer := 0;
begin  -- default_arch
  
  Byp: if bypass generate 
    placegen: for I in H downto L generate
      placeBlock: block
	  signal place_pred: BooleanArray(0 downto 0);
      begin
	  place_pred(0) <= preds(I);
	  pI: place_with_bypass generic map(capacity => place_capacity, marking => 0,
				   name => name & ":" & Convert_To_String(I) )
		  port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end block;
    end generate placegen;
    
    inplaceBlock: block
	  signal place_pred: BooleanArray(0 downto 0);
    begin
	  place_pred(0) <= symbol_in;
	  pI: place_with_bypass generic map(capacity => place_capacity, marking => 0,
				   name => name & ":inputplace")
		  port map(place_pred,symbol_out_sig,inp_place_sig,clk,reset);
    end block;
  end generate Byp;

  NoByp: if (not bypass) generate 
    placegen: for I in H downto L generate
      placeBlock: block
	  signal place_pred: BooleanArray(0 downto 0);
      begin
	  place_pred(0) <= preds(I);
	  pI: place generic map(capacity => place_capacity, marking => 0,
				   name => name & ":" & Convert_To_String(I) )
		  port map(place_pred,symbol_out_sig,place_sigs(I),clk,reset);
      end block;
    end generate placegen;
    
    inplaceBlock: block
	  signal place_pred: BooleanArray(0 downto 0);
    begin
	  -- note: input transitions are always bypassed, because they
	  --       always come with a delay (no need to incur an additional delay for them).
	  place_pred(0) <= symbol_in;
	  pI: place_with_bypass generic map(capacity => place_capacity, marking => 0,
				   name => name & ":inputplace")
		  port map(place_pred,symbol_out_sig,inp_place_sig,clk,reset);
    end block;
  end generate NoByp;


  -- The transition is enabled only when all preds are true.
  symbol_out_sig(0) <= inp_place_sig and AndReduce(place_sigs);
  symbol_out <= symbol_out_sig(0);
end default_arch;
