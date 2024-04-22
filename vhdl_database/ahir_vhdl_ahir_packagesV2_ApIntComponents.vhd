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

package ApIntComponents is

 component UnsignedAdderSubtractor_n_n_n is
  
  generic (
    name	       : string;
    tag_width          : integer;
    operand_width      : integer;
    chunk_width        : integer
	);

  port (
    slv_L            : in  std_logic_vector(operand_width-1 downto 0);
    slv_R            : in  std_logic_vector(operand_width-1 downto 0);
    slv_RESULT       : out std_logic_vector(operand_width-1 downto 0);
    slv_carry_out    : out std_logic;
    slv_carry_in     : in std_logic;  
    subtract_op      : in std_logic;
    clk, reset       : in  std_logic;
    in_rdy           : in  std_logic;
    out_rdy          : out std_logic;
    stall            : in std_logic;
    tag_in           : in std_logic_vector(tag_width-1 downto 0);
    tag_out          : out std_logic_vector(tag_width-1 downto 0));

 end component;

 component UnsignedMultiplier_n_n_2n is
  
  generic (
    name: string;
    tag_width     : integer;
    operand_width : integer;
    chunk_width   : integer := 16);

  port (
    slv_L, slv_R   : in  std_logic_vector(operand_width-1 downto 0);
    slv_RESULT     : out std_logic_vector((2*operand_width)-1 downto 0);
    clk, reset : in  std_logic;
    in_rdy     : in  std_logic;
    out_rdy    : out std_logic;
    stall      : in std_logic;
    tag_in     : in std_logic_vector(tag_width-1 downto 0);
    tag_out    : out std_logic_vector(tag_width-1 downto 0));
 end component;

 component UnsignedShifter_n_n_n is
  generic (
    name: string;
    tag_width          : integer;
    operand_width      : integer;
    shift_amount_width : integer);

  port (
    slv_L       : in  std_logic_vector(operand_width-1 downto 0);
    slv_R       : in  std_logic_vector(shift_amount_width-1 downto 0);
    slv_RESULT  : out std_logic_vector(operand_width-1 downto 0);
    clk, reset  : in  std_logic;
    in_rdy      : in  std_logic;
    out_rdy     : out std_logic;
    stall       : in std_logic;
    shift_right_flag   : in std_logic;
    signed_flag        : in std_logic;
    tag_in      : in std_logic_vector(tag_width-1 downto 0);
    tag_out     : out std_logic_vector(tag_width-1 downto 0));
 end component;

 component GenericBinaryApIntArithOperatorPipelined is
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
 end component;

 component GenericApIntArithOperator is
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
 end component;
end package;
