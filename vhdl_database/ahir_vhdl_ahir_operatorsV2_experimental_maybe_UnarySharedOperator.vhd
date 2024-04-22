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
-- output = op input 
--
-- constant input is not permitted.
-- 
entity UnarySharedOperator is
    generic
    (
      name : string;
      operator_id   : string := "ApIntNot";          -- operator id
      input_is_int : Boolean := true; -- false means float
      input_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_width      : integer := 4;    -- width of input1
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer := 4;          -- width of output.
      num_reqs : integer := 3; -- how many requesters?
      detailed_buffering_per_output : IntegerArray
    );
  port (
    -- input side.
    sample_req                     : in BooleanArray(num_reqs-1 downto 0);
    sample_ack                     : out BooleanArray(num_reqs-1 downto 0);
    -- output side.
    update_ack                     : out BooleanArray(num_reqs-1 downto 0);
    update_req                     : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    data_in                     : in std_logic_vector((input_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    data_out                    : out std_logic_vector((output_width*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset                  : in std_logic);
end UnarySharedOperator;

architecture Vanilla of UnarySharedOperator is

  signal reqL, ackL: BooleanArray(num_reqs-1 downto 0);


  signal dataL : std_logic_vector((num_reqs*input_width)-1 downto 0);

  constant tag_length: integer := Maximum(1,Ceil_Log2(num_reqs));

  constant debug_flag : boolean := global_debug_flag;

  constant inbuf: IntegerArray(0 downto 0) := (0 => 0);
  
begin  -- Behave

  reqL <= sample_req;
  sample_ack <= ackL;
  dataL <= data_in;

  sor: SplitOperatorShared 
    	generic map
    		(
      			name => name & " split-operator-shared ",
      			operator_id   => operator_id,
      			input1_is_int => input_is_int,
      			input1_characteristic_width => input_characteristic_width,
      			input1_mantissa_width => input_mantissa_width,
      			iwidth_1 => input_width,
      			input2_is_int => false,
      			input2_characteristic_width => 0,
      			input2_mantissa_width => 0,
      			iwidth_2     => 0,
      			num_inputs   => 1,
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
			use_input_buffering => false,
			detailed_buffering_per_input => inbuf,
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
