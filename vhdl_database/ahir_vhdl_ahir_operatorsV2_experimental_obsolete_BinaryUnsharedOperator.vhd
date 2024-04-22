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
-- TODO: add bypass generic..
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
use ahir.FloatOperatorPackage.all;

--
--  result = input_1 op input_2
--
--  constant operand case is shifted 
--  to UnaryUnsharedOperator.
--
entity BinaryUnsharedOperator is
  generic
    (
      name          : string;          -- instance name.
      operator_id   : string;          -- operator id
      input_1_is_int : Boolean := true; -- false means float
      input_1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_1_width        : integer;    -- width of input1
      input_1_is_constant  : boolean;
      input_2_is_int : Boolean := true; -- false means float
      input_2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input_2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      input_2_width        : integer;    -- width of input1
      input_2_is_constant  : boolean;
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer;          -- width of output.
      output_buffering : integer := 2
      );
  port (
    -- req -> ack follow pulse protocol
    sample_req:  in BooleanArray(1 downto 0);
    sample_ack:  out BooleanArray(1 downto 0);
    update_req:  in Boolean;
    update_ack:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(input_1_width + input_2_width - 1 downto 0);
    dataR      : out std_logic_vector(output_width-1 downto 0);
    clk, reset : in  std_logic);
end BinaryUnsharedOperator;


architecture Vanilla of BinaryUnsharedOperator is
  signal   result: std_logic_vector(output_width-1 downto 0);
  signal fReq, fAck: boolean;
  
  signal ub_write_req, ub_write_ack: boolean;

begin  -- Behave
  -----------------------------------------------------------------------------
  -- join the two sample reqs...
  -- (that is, the operation will fire when both appear)
  -----------------------------------------------------------------------------
  bothNonConst: if not (input_1_is_constant or input_2_is_constant) generate
    reqJoin: join2 generic map (name => name & ":reqJoin:", bypass => true)
		port map(pred0 => sample_req(0), 
			pred1 => sample_req(1),
			symbol_out => fReq, 
			clk => clk, reset => reset);
    sample_ack(0) <= fAck;
    sample_ack(1) <= fAck;

  end generate bothNonConst;

  Const1: if (input_1_is_constant and (not input_2_is_constant) ) generate
	fReq <= sample_req(1);
	sample_ack(1) <= fAck;
  end generate Const1;

  Const2: if (input_2_is_constant and (not input_1_is_constant) ) generate
	fReq <= sample_req(0);
	sample_ack(0) <= fAck;
  end generate Const2;

  -----------------------------------------------------------------------------
  -- combinational block.. this is ever-active!
  -----------------------------------------------------------------------------
  comb_block: GenericCombinationalOperator
      generic map (
        operator_id                 => operator_id,
        input1_is_int               => input_1_is_int,
        input1_characteristic_width => input_1_characteristic_width,
        input1_mantissa_width       => input_1_mantissa_width,
        iwidth_1                    => input_1_width,
        input2_is_int               => input_2_is_int,
        input2_characteristic_width => input_2_characteristic_width,
        input2_mantissa_width       => input_2_mantissa_width,
        iwidth_2                    => input_2_width,
        num_inputs                  => 2,
        output_is_int               => output_is_int,
        output_characteristic_width => output_characteristic_width,
        output_mantissa_width       => output_mantissa_width,
        owidth                      => output_width,
        constant_operand            => (0 => '0'),
        constant_width              => 1,
        use_constant                => false)
      port map (data_in => dataL, result  => result);
  
  
  
  notBothConst: if not (input_1_is_constant and input_2_is_constant) generate
    -----------------------------------------------------------------------------
    -- interlock buffer.
    -----------------------------------------------------------------------------
    ib: InterlockBuffer generic map (name => name & " interlock-buffer ",
					  buffer_size => output_buffering,
					  in_data_width => output_width,
					  out_data_width => output_width)
		  port map(write_req => fReq, write_ack => fAck,
				  write_data => result,
				  read_req => update_req,
				  read_ack => update_ack,
				  read_data => dataR,
				  clk => clk, reset => reset);
  end generate notBothConst;

  bothConst: if (input_1_is_constant and input_2_is_constant) generate
	fReq <= false;
	dataR <= result;
	update_ack <= update_req;
  end generate bothConst;

end Vanilla;

