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
-- modified by Madhav Desai.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;
use ahir.ApIntComponents.all;

entity GenericBinaryApIntArithOperatorPipelined is
  generic (
	    name : string;
	    op_id: string;
	    tag_width : integer := 8;
	    in_operand_width: integer;
	    out_result_width: integer
           );
  port(
    inA, inB: in std_logic_vector(in_operand_width-1 downto 0);
    outR: out std_logic_vector(out_result_width-1 downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    pipeline_stall: in std_logic;
    env_rdy: in std_logic;
    op_o_rdy: out std_logic);
end entity;

architecture rtl of GenericBinaryApIntArithOperatorPipelined is
begin


  -- binary operator.

  mulOp: if (op_id = "ApIntMul") generate
	op: UnsignedMultiplier_n_n_2n
		generic map (name => name & "-mul", 
				tag_width => tag_width,
				    operand_width => in_operand_width,
					chunk_width => 32)
		port map (
    				slv_L => inA,
				slv_R => inB,
    				slv_RESULT  => outR,
				clk => clk, 
				reset => reset,
    				in_rdy   => env_rdy,
    				out_rdy  => op_o_rdy,
    				stall    => pipeline_stall,
    				tag_in   => tag_in,
    				tag_out  => tag_out
			 );
  end generate mulOp;

  shiftOp: if ((op_id = "ApIntSHL") or (op_id = "ApIntLSHR") or (op_id = "ApIntASHR")) generate
    bb: block
       signal shift_right_flag: std_logic;
       signal signed_flag: std_logic;
    begin
	signed_flag <= '1' when (op_id = "ApIntASHR") else '0';
	shift_right_flag <= '1' when ((op_id = "ApIntLSHR") or (op_id = "ApIntASHR"))  else '0';

	op: UnsignedShifter_n_n_n
		generic map (
				name => name & "-shift",
				tag_width => tag_width,
				operand_width => in_operand_width,
				shift_amount_width => out_result_width
			    )
		port map (
				clk => clk, 
				reset => reset,
				slv_L => inA,
				slv_R => inB,
				slv_RESULT => outR,
				signed_flag => signed_flag,
				shift_right_flag => shift_right_flag,
				stall => pipeline_stall,
				tag_in => tag_in,
				tag_out => tag_out,
				in_rdy => env_rdy,
				out_rdy => op_o_rdy
			 );
    end block;
  end generate shiftOp;

  -- only mul and shifts here for now.
  assert ((op_id = "ApIntSHL") or (op_id = "ApIntLSHR") or (op_id = "ApIntASHR") or (op_id = "ApIntMul"))
	report "Currently unsupported operator " & op_id severity failure;

end rtl;
