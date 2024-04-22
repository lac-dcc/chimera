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
-------------------------------------------------------------------------------
-- generic ap-int (signed/unsigned operator)
-- Madhav Desai.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;
use ahir.ApIntComponents.all;


-- 
-- mul/lshl/lshr/ashr.
-- 
entity GenericApIntArithOperator is
  generic (
	    name: string;
	    op_id: string;
	    tag_width : integer := 8;
	    in_operand_width: integer;
	    num_non_constant_inputs: integer;
            first_operand_is_constant: boolean;
            second_operand_is_constant: boolean;
	    constant_value: std_logic_vector;
	    out_result_width: integer
           );
  port(
    in_data: in std_logic_vector((num_non_constant_inputs*in_operand_width)-1 downto 0);
    out_data: out std_logic_vector(out_result_width-1 downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    env_rdy, accept_rdy: in std_logic;
    op_i_rdy, op_o_rdy: out std_logic);
end entity;

architecture rtl of GenericApIntArithOperator is

  signal pipeline_stall : std_logic;
  signal op_o_rdy_sig: std_logic;
  signal outR: std_logic_vector(out_result_width-1 downto 0);

begin

  assert (not (first_operand_is_constant and second_operand_is_constant))
	report "In " & " operator " & name & ", both operands are constants." severity failure;

  out_data <= outR;
  pipeline_stall <= op_o_rdy_sig and (not accept_rdy);
  op_o_rdy <= op_o_rdy_sig;
  op_i_rdy <= (not pipeline_stall);


  -- binary operator.
  arithOp: if ( (op_id = "ApIntMul") or
		(op_id = "ApIntSHL") or
		(op_id = "ApIntLSHR") or
		(op_id = "ApIntLASHR") or
		(op_id = "ApIntROL") or
		(op_id = "ApIntROR"))  generate
       gBlk: block
	signal inA, inB: std_logic_vector(in_operand_width-1 downto 0);
       begin
	     firstConstant: if (first_operand_is_constant) generate
	    	inA <= constant_value;
	     end generate firstConstant;

	     notfirstConstant: if (not first_operand_is_constant) generate
	    	inA <= in_data((2*in_operand_width)-1 downto in_operand_width);
	     end generate notfirstConstant;
	
	     secondConstant: if (second_operand_is_constant) generate
	    	inB <= constant_value;
	     end generate secondConstant;

	     notsecondConstant: if (not second_operand_is_constant) generate
	    	inB <= in_data(in_operand_width-1 downto 0);
             end generate notsecondConstant;

	     oprtr: GenericBinaryApIntArithOperatorPipelined
			generic map(name => name & ":binary" ,
					op_id => op_id,
					tag_width => tag_width,
					in_operand_width => in_operand_width,
					out_result_width => out_result_width)
			port map (inA => inA, inB => inB, outR => outR,
					pipeline_stall => pipeline_stall,
					tag_in => tag_in, tag_out => tag_out,
					env_rdy => env_rdy,
					op_o_rdy => op_o_rdy_sig,
					clk => clk, reset => reset);
       end block gBlk;
  end generate arithOp;

  notArithOp:if ( (op_id /= "ApIntMul") and
		(op_id /= "ApIntSHL") and
		(op_id /= "ApIntLSHR") and
		(op_id /= "ApIntLASHR"))  generate

 	assert false report op_id & " is not a pipelined binary arith operation" severity failure;

  end generate notArithOp;
end rtl;
