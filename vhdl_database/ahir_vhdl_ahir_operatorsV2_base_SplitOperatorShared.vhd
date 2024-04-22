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

entity SplitOperatorShared is
    generic
    (
      name : string;
      operator_id   : string := "ApIntAdd";          -- operator id
      input1_is_int : Boolean := true; -- false means float
      input1_characteristic_width : integer := 0; -- characteristic width if input1 is float
      input1_mantissa_width       : integer := 0; -- mantissa width if input1 is float
      iwidth_1      : integer := 4;    -- width of input1
      input2_is_int : Boolean := true; -- false means float
      input2_characteristic_width : integer := 0; -- characteristic width if input2 is float
      input2_mantissa_width       : integer := 0; -- mantissa width if input2 is float
      iwidth_2      : integer := 0;    -- width of input2
      num_inputs    : integer := 1;    -- can be 1 or 2.
      output_is_int : Boolean := true;  -- false means that the output is a float
      output_characteristic_width : integer := 0;
      output_mantissa_width       : integer := 0;
      owidth        : integer := 4;          -- width of output.
      constant_operand : std_logic_vector := "0001"; -- constant operand.. (it is always the second operand)
      constant_width: integer := 4;
      use_constant  : boolean := true;
      no_arbitration: boolean := false;
      min_clock_period: boolean := true;
      num_reqs : integer := 3; -- how many requesters?
      detailed_buffering_per_output : IntegerArray := (0 => 0);
      detailed_buffering_per_input : IntegerArray  := (0 => 0);
      use_input_buffering: boolean := false;
      full_rate : boolean 
    );
  port (
    -- req/ack follow level protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackR                     : out BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    reqR                     : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    dataL                    : in std_logic_vector(((iwidth_1 + iwidth_2)*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    dataR                    : out std_logic_vector((owidth*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
end SplitOperatorShared;

architecture Vanilla of SplitOperatorShared is

  constant num_operands : integer := num_inputs;
  constant iwidth : integer := iwidth_1 + iwidth_2;
  
  constant ignore_tag  : boolean := no_arbitration or (reqL'length = 1);

  signal idata : std_logic_vector(iwidth-1 downto 0);
  signal odata: std_logic_vector(owidth-1 downto 0);

  constant tag_length: integer := Maximum(1,Ceil_Log2(reqL'length));
  signal itag,otag : std_logic_vector(tag_length-1 downto 0);
  signal ireq,iack, oreq, oack: std_logic;

  constant debug_flag : boolean := global_debug_flag;
  
begin  -- Behave
  assert ackL'length = reqL'length report "mismatched req/ack vectors" severity error;
  

  -- DebugGen: if debug_flag generate 
    -- assert( (not ((reset = '0') and (clk'event and clk = '1') and no_arbitration)) or Is_At_Most_One_Hot(reqL))
    -- report "in no-arbitration case, at most one request should be hot on clock edge (in SplitOperatorShared)" severity error;
  -- end generate DebugGen;
  
   imuxWithInputBuf: InputMuxWithBuffering
      generic map(name => name & "-imux " , 
		iwidth => iwidth*num_reqs,
                owidth => iwidth, 
                twidth => tag_length,
                nreqs => num_reqs,
		buffering => detailed_buffering_per_input,
		full_rate => full_rate, 
                no_arbitration => no_arbitration,
                registered_output => false)
      port map(
        reqL       => reqL,
        ackL       => ackL,
        reqR       => ireq,
        ackR       => iack,
        dataL      => dataL,
        dataR      => idata,
        tagR       => itag,
        clk        => clk,
        reset      => reset);

  op: SplitOperatorBase
    generic map (
      name => name & "-op",
      operator_id   => operator_id,
      input1_is_int => input1_is_int,
      input1_characteristic_width => input1_characteristic_width,
      input1_mantissa_width => input1_mantissa_width,
      iwidth_1  => iwidth_1,
      input2_is_int => input2_is_int,
      input2_characteristic_width => input2_characteristic_width,
      input2_mantissa_width  => input2_mantissa_width,
      iwidth_2  => iwidth_2,
      num_inputs  => num_inputs,
      output_is_int => output_is_int,
      output_characteristic_width => output_characteristic_width,
      output_mantissa_width  => output_mantissa_width,
      owidth    => owidth,
      constant_operand => constant_operand,
      constant_width => constant_width,
      twidth     => tag_length,
      use_constant => use_constant
      )
    port map (
      reqL => ireq,
      ackL => iack,
      reqR => oreq,
      ackR => oack,
      dataL => idata,
      dataR => odata,
      tagR => otag,
      tagL => itag,
      clk => clk,
      reset => reset);


  odemux: OutputDeMuxBaseWithBuffering
    generic map (
        name => name & "-odemux ",
  	iwidth => owidth,
  	owidth =>  owidth*num_reqs,
	twidth =>  tag_length,
	nreqs  => num_reqs,
        detailed_buffering_per_output => detailed_buffering_per_output,
	full_rate => full_rate )  
    port map (
      reqL   => oreq,
      ackL   => oack,
      dataL => odata,
      tagL  => otag,
      reqR  => reqR,
      ackR  => ackR,
      dataR => dataR,
      clk   => clk,
      reset => reset);
  
end Vanilla;

