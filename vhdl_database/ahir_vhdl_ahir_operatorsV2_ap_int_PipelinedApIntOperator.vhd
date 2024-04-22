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
use ahir.ApIntComponents.all;

entity PipelinedApIntOperator is
  generic (
      name : string;
      operator_id : string;
      no_arbitration: boolean := true;
      in_data_width: integer;
      out_data_width: integer;
      num_reqs : integer := 3; -- how many requesters?
      use_input_buffering: boolean := true;
      detailed_buffering_per_input: IntegerArray;
      detailed_buffering_per_output: IntegerArray;
      full_rate: boolean
    );
  port (
    -- req/ack follow level protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackR                     : out BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    reqR                     : in  BooleanArray(num_reqs-1 downto 0);
    -- input data consists of concatenated pairs of ips
    dataL                    : in std_logic_vector((2*in_data_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    dataR                    : out std_logic_vector((out_data_width*num_reqs)-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
end entity;

architecture Vanilla of PipelinedApIntOperator is

  constant num_operands : integer := 2;
  constant operand_width : integer := in_data_width;
  constant iwidth : integer := 2*operand_width;
  constant owidth : integer := out_data_width;
  
  constant tag_length: integer := Maximum(1,Ceil_Log2(reqL'length));
  signal itag,otag : std_logic_vector(tag_length-1 downto 0);
  signal ireq,iack, oreq, oack: std_logic;

  constant debug_flag : boolean := global_debug_flag;

  signal idata: std_logic_vector(iwidth-1 downto 0);
  signal odata: std_logic_vector(owidth-1 downto 0);
begin  -- Behave

  assert ackL'length = reqL'length report "mismatched req/ack vectors" severity error;
  assert ((operand_width = 32) or (operand_width = 64)) report "32/64 bit operand-support only!" severity error;
  assert ((operator_id = "ApFloatMul") or (operator_id = "ApFloatAdd") or (operator_id = "ApFloatSub"))
    report "operator_id must be either add or mul or sub" severity error;  

  -- DebugGen: if debug_flag generate 
    -- assert( (not ((reset = '0') and (clk'event and clk = '1') and no_arbitration)) or Is_At_Most_One_Hot(reqL))
    -- report "in no-arbitration case, at most one request should be hot on clock edge (in SplitOperatorShared)" severity error;
  -- end generate DebugGen;
  NoInBuffers : if not use_input_buffering generate 
    imux: InputMuxBase
      generic map(name => name & "-imux",
		  iwidth => iwidth*num_reqs,
                  owidth => iwidth, 
                  twidth => tag_length,
                  nreqs => num_reqs,
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
   end generate NoInBuffers;

  InBuffers: if use_input_buffering generate
    imuxWithInputBuf: InputMuxWithBuffering
      generic map(name => name & "-imux" , 
		iwidth => iwidth*num_reqs,
                owidth => iwidth, 
                twidth => tag_length,
                nreqs => num_reqs,
		buffering => detailed_buffering_per_input,
                no_arbitration => no_arbitration,
		full_rate => full_rate,
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
  end generate InBuffers;

   pipeOp: GenericApIntArithOperator
		generic map(name => name & "-int-operator", op_id => operator_id,
				tag_width => tag_length,
				 in_operand_width => in_data_width,
					num_non_constant_inputs => 0,	
					   first_operand_is_constant => false,
					    second_operand_is_constant => false,
						constant_value => "",
						out_result_width => out_data_width)
		port map ( in_data => idata,
    				out_data => odata,
    				clk => clk,
				reset => reset,
    				tag_in => itag,
    				tag_out => otag,
    				env_rdy => ireq,
		        	accept_rdy => oack, 
    				op_i_rdy => iack,
				op_o_rdy => oreq);


  odemux: OutputDeMuxBaseWithBuffering
    generic map (
        name => name & "-odemux",
  	iwidth => owidth,
  	owidth =>  owidth*num_reqs,
	twidth =>  tag_length,
	nreqs  => num_reqs,
	detailed_buffering_per_output => detailed_buffering_per_output,
	full_rate => full_rate)
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

