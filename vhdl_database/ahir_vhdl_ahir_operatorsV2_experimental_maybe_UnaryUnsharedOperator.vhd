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

library std;
use std.standard.all;

library ahir;
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
use ahir.FloatOperatorPackage.all;

--
--  result = op input_1
--
entity UnaryUnsharedOperator is
  generic
    (
      name          : string;          -- instance name.
      operator_id   : string;          -- operator id
      input_is_int : Boolean := true; -- false means float
      input_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      input_width        : integer;    -- width of input1
      input_is_constant  : boolean; 
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      output_width        : integer;          -- width of output.
      output_buffering : integer := 2
      );
  port (
    -- req -> ack follow pulse protocol
    sample_req:  in Boolean;
    sample_ack:  out Boolean;
    update_req:  in Boolean;
    update_ack:  out Boolean;
    -- operands.
    dataL      : in  std_logic_vector(input_width - 1 downto 0);
    dataR      : out std_logic_vector(output_width-1 downto 0);
    clk, reset : in  std_logic);
end UnaryUnsharedOperator;


architecture Vanilla of UnaryUnsharedOperator is
  signal  result: std_logic_vector(output_width-1 downto 0);
  signal ub_write_req, ub_write_ack: boolean;
begin  -- Behave
  -----------------------------------------------------------------------------
  -- combinational block.. this is ever-active!
  -----------------------------------------------------------------------------
  comb_block: GenericCombinationalOperator
    generic map (
      operator_id                 => operator_id,
      input1_is_int               => input_is_int,
      input1_characteristic_width => input_characteristic_width,
      input1_mantissa_width       => input_mantissa_width,
      iwidth_1                    => input_width,
      input2_is_int               => true,
      input2_characteristic_width => 0,
      input2_mantissa_width       => 0,
      iwidth_2                    => 0,
      num_inputs                  => 1,
      output_is_int               => output_is_int,
      output_characteristic_width => output_characteristic_width,
      output_mantissa_width       => output_mantissa_width,
      owidth                      => output_width,
      constant_operand            => (0 => '0'),
      constant_width              => 1,
      use_constant                => false)
    port map (data_in => dataL, result  => result);


  nonConst: if not input_is_constant generate
    -----------------------------------------------------------------------------
    -- interlock buffer.
    -----------------------------------------------------------------------------
    ib: InterlockBuffer generic map (name => name & " interlock-buffer ",
					  buffer_size => output_buffering,
					  in_data_width => output_width,
					  out_data_width => output_width)
		  port map(write_req => sample_req, write_ack => sample_ack,
				  write_data => result,
				  read_req => update_req,
				  read_ack => update_ack,
				  read_data => dataR,
				  clk => clk, reset => reset);
  end generate nonConst; 

  constCase: if input_is_constant generate
	dataR <= result;
	update_ack <= update_req;
  end generate constCase;

end Vanilla;

