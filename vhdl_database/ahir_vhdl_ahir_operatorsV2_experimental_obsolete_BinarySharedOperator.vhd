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
use ahir.BaseComponents.all;

--
-- output = input1 op input2
-- 
entity BinarySharedOperator is
    generic
    (
      name : string;
      operator_id   : string := "ApIntAdd";          -- operator id
      input_1_is_int : Boolean := true; -- false means float
      input_1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_1_width      : integer := 4;    -- width of input1
      input_1_is_constant : BooleanArray;   -- constant case needs to be handled a bit differently..
      input_2_is_int : Boolean := true; -- false means float
      input_2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input_2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      input_2_width      : integer := 0;    -- width of input2
      input_2_is_constant : BooleanArray;  -- constant case needs to be handled a bit differently..
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer := 4;          -- width of output.
      num_reqs : integer := 3; -- how many requesters?
      detailed_buffering_per_input: IntegerArray;
      detailed_buffering_per_output : IntegerArray
    );
  port (
    -- input side.
    sample_req_1                     : in BooleanArray(num_reqs-1 downto 0);
    sample_req_2                     : in BooleanArray(num_reqs-1 downto 0);
    sample_ack_1                     : out BooleanArray(num_reqs-1 downto 0);
    sample_ack_2                     : out BooleanArray(num_reqs-1 downto 0);
    -- output side.
    update_ack                       : out BooleanArray(num_reqs-1 downto 0);
    update_req                       : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    data_in_1                    : in std_logic_vector((input_1_width*num_reqs)-1 downto 0);
    data_in_2                    : in std_logic_vector((input_2_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    data_out                    : out std_logic_vector((output_width*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
end BinarySharedOperator;

architecture Vanilla of BinarySharedOperator is

  signal reqL, ackL: BooleanArray(num_reqs-1 downto 0);

  constant input_width : integer := input_1_width + input_2_width;

  signal dataL : std_logic_vector((num_reqs*input_width)-1 downto 0);

  constant tag_length: integer := Maximum(1,Ceil_Log2(num_reqs));
  signal itag,otag : std_logic_vector(tag_length-1 downto 0);
  signal ireq,iack, oreq, oack: std_logic;

  constant debug_flag : boolean := global_debug_flag;
  alias i1_const: BooleanArray(num_reqs-1 downto 0) is input_1_is_constant;
  alias i2_const: BooleanArray(num_reqs-1 downto 0) is input_2_is_constant;
  
begin  -- Behave

  -- generate reqL using a join of both input sample reqs.
  joinGen:   for I in 0 to num_reqs-1 generate

	assert not (i1_const(I) and i2_const(I)) 
		report " both inputs to binary operator cannot be constants " severity failure;

        notBothConst: if not (i1_const(I) or i2_const(I)) generate
	  sample_ack_1(I) <= ackL(I);
	  sample_ack_2(I) <= ackL(I);
  
	  j2:  join2 generic map(name => name & ":join2:", bypass => true )
		  port map (pred0 => sample_req_1(I),
			    pred1 => sample_req_2(I),
			    symbol_out => reqL(I),
			    clk => clk, reset => reset);
	end generate notBothConst;

	i1Const: if (i1_const(I) and not i2_const(I)) generate
		reqL(I) <= sample_req_2(I);
		sample_ack_2(I) <= ackL(I);
	end generate i1Const;

	i2Const: if (i2_const(I) and not i1_const(I)) generate
		reqL(I) <= sample_req_1(I);
		sample_ack_1(I) <= ackL(I);
	end generate i2Const;
  
	-- concatenate.
	dataL(((num_reqs+1)*input_width)-1 downto (num_reqs*input_width))
		<= data_in_1(((num_reqs+1)*input_1_width)-1 downto (num_reqs*input_1_width))
			& 
		     data_in_2(((num_reqs+1)*input_2_width)-1 downto (num_reqs*input_2_width));

  end generate joinGen;


  sor: SplitOperatorShared 
    	generic map
    		(
      			name => name & " split-operator-shared ",
      			operator_id   => operator_id,
      			input1_is_int => input_1_is_int,
      			input1_characteristic_width => input_1_characteristic_width,
      			input1_mantissa_width => input_1_mantissa_width,
      			iwidth_1 => input_1_width,
      			input2_is_int => input_2_is_int,
      			input2_characteristic_width => input_2_characteristic_width,
      			input2_mantissa_width => input_2_mantissa_width,
      			iwidth_2     => input_2_width,
      			num_inputs   => 2,
      			output_is_int => output_is_int,
      			output_characteristic_width => output_characteristic_width,
      			output_mantissa_width => output_mantissa_width,
      			owidth        => output_width,
      			constant_operand => (0 => '0'),
      			constant_width => 1,
      			use_constant  => false,
      			no_arbitration => false,
      			min_clock_period => true,
      			num_reqs => num_reqs,
			use_input_buffering => true,
			detailed_buffering_per_input => detailed_buffering_per_input,
      			detailed_buffering_per_output => detailed_buffering_per_output)
  		port map (
    				reqL => reqL,
    				ackR => update_ack,
    				ackL => ackL,
    				reqR => update_req,
    				dataL => dataL,
    				dataR => data_out,
    				clk => clk, reset => reset);
end Vanilla;
