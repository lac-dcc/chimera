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
-- TODO: add bypass generic to create a flow-through
--       trivial operator (to save clock-cycles!)
--
-- The unshared operator uses a split protocol.
--    reqL/ackL  for sampling the inputs
--    reqR/ackR  for updating the outputs.
-- The two pairs should be used independently,
-- that is, there should be NO DEPENDENCY between
-- ackL and reqR!
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
use ahir.FloatOperatorPackage.all;

entity UnsharedOperatorWithBuffering is
  generic
    (
      name   : string;
      operator_id   : string;          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer;    -- width of input2
      num_inputs    : integer := 2;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer;          -- width of output.
      constant_operand : std_logic_vector; -- constant operand.. (it is always the second operand)
      constant_width : integer;
      buffering      : integer;
      use_constant  : boolean := false;
      flow_through  : boolean := false;
      full_rate: boolean 
      );
  port (
    -- req -> ack follow pulse protocol
    reqL:  in Boolean;
    ackL : out Boolean;
    reqR : in Boolean;
    ackR:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(iwidth_1 + iwidth_2 - 1 downto 0);
    dataR      : out std_logic_vector(owidth-1 downto 0);
    clk, reset : in  std_logic);
end UnsharedOperatorWithBuffering;


architecture Vanilla of UnsharedOperatorWithBuffering is
  signal   result: std_logic_vector(owidth-1 downto 0);
  constant iwidth : integer := iwidth_1  + iwidth_2;
  
  -- joined req, and joint ack.
  signal fReq,fAck: boolean;
 

begin  -- Behave

  assert((num_inputs = 1) or (num_inputs = 2)) report "either 1 or 2 inputs" severity failure;
  -----------------------------------------------------------------------------
  -- combinational block..
  -----------------------------------------------------------------------------
  comb_block: GenericCombinationalOperator
    generic map (
      name => name & "-comb_block",
      operator_id                 => operator_id,
      input1_is_int               => input1_is_int,
      input1_characteristic_width => input1_characteristic_width,
      input1_mantissa_width       => input1_mantissa_width,
      iwidth_1                    => iwidth_1,
      input2_is_int               => input2_is_int,
      input2_characteristic_width => input2_characteristic_width,
      input2_mantissa_width       => input2_mantissa_width,
      iwidth_2                    => iwidth_2,
      num_inputs                  => num_inputs,
      output_is_int               => output_is_int,
      output_characteristic_width => output_characteristic_width,
      output_mantissa_width       => output_mantissa_width,
      owidth                      => owidth,
      constant_operand            => constant_operand,
      constant_width              => constant_width,
      use_constant                => use_constant)
    port map (data_in => dataL, result  => result);


  noFlowThrough: if not flow_through generate
    -----------------------------------------------------------------------------
    -- output interlock buffer
    -----------------------------------------------------------------------------
    ilb: InterlockBuffer 

	  generic map(name => name & "-ilb",
			  buffer_size => buffering,
			  in_data_width => owidth,
			  out_data_width => owidth) 

	  port map(write_req => reqL, write_ack => ackL, write_data => result,
			  read_req => reqR, read_ack => ackR, read_data => dataR,
				  clk => clk, reset => reset);
  end generate noFlowThrough;

  flowThrough: if flow_through generate
		-- in the flow-through case, the operator looks just like
		-- a combinational circuit.  
                -- NOTE that there is no bypass register for the data.
                -- Control sequencing must be handled entirely by the
		-- control-path which uses this operator.

		ackL <= reqL;
		ackR <= reqR;
		dataR <= result;

  end generate flowThrough;

end Vanilla;

