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
use ahir.Types.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
use ahir.FloatOperatorPackage.all;

--
-- output = input_1 op input_2.
--
-- input_1 uses the higher bits of data_in, and the (1) index of sample-req/ack.
--
-- note: if output is determined without needing an input, then that
--       input is killed..
entity BinaryLogicalOperator is
  generic
    (
      name  : string;
      operator_id         : string;            -- operator id
      input_width         : integer;           -- input width
      output_width        : integer;           -- the width of the output.
      input_1_buffer_depth: integer;           -- buffering at input 1.
      input_2_buffer_depth: integer;           -- buffering at input 2.
      output_buffer_depth : integer;           -- buffering at output.
	-- both should never be constants.
      input_1_is_constant : boolean := false;
      input_2_is_constant : boolean := false;
      flow_through: boolean := false
      );
  port (
    -- input operands.
    sample_req : in BooleanArray(1 downto 0);  -- sample reqs, one per input.
    sample_ack : out BooleanArray(1 downto 0); -- sample acks, one per output.
    data_in      : in  std_logic_vector((2*input_width)-1 downto 0);
    -- result.
    update_req : in Boolean;  -- req for output update.
    update_ack : out Boolean; -- ack for output update.
    data_out      : out std_logic_vector(output_width-1 downto 0);
    -- clock, reset.
    clk, reset : in  std_logic);
end BinaryLogicalOperator;


architecture Vanilla of BinaryLogicalOperator is
	constant cZero: std_logic_vector(input_width-1 downto 0) := (others => '0');
	constant cOne: std_logic_vector(input_width-1 downto 0) := (others => '1');

	signal in_data_1: std_logic_vector(input_width-1 downto 0);
	signal in_data_1_valid, in_data_1_accept, in_data_1_kill, in_data_1_zero, in_data_1_one: std_logic;

	signal in_data_2: std_logic_vector(input_width-1 downto 0);
	signal in_data_2_valid, in_data_2_accept, in_data_2_kill, in_data_2_zero, in_data_2_one: std_logic;

	signal out_data: std_logic_vector(output_width-1 downto 0);
	signal out_data_valid, out_data_accept: std_logic;

begin  -- Vanilla
	andCase: if(operator_id = "ApIntAnd") generate
			out_data <= (in_data_1 and in_data_2);
	end generate andCase;

	nandCase: if(operator_id = "ApIntNand") generate
		out_data <= not (in_data_1 and in_data_2);
	end generate nandCase;

	orCase: if(operator_id = "ApIntOr") generate
		out_data <= (in_data_1 or in_data_2);
	end generate orCase;

	norCase: if(operator_id = "ApIntNor") generate
		out_data <= not (in_data_1 or in_data_2);
	end generate norCase;

	xorCase: if(operator_id = "ApIntXor") generate
		out_data <= (in_data_1 xor in_data_2);
	end generate xorCase;

	xnorCase: if(operator_id = "ApIntXnor") generate
		out_data <= not (in_data_1 xor in_data_2);
	end generate xnorCase;

    noFlowThrough:  if (not flow_through) generate
	in_data_1_zero <= '1' when (in_data_1 = cZero) else '0';
	in_data_1_one <= '1' when (in_data_1 = cOne) else '0';
	in_data_2_zero <= '1' when (in_data_2 = cZero) else '0';
	in_data_2_one <= '1' when (in_data_2 = cOne) else '0';

        -- receive buffers.
	i1NoConst: if (not input_1_is_constant) generate
		rx1: ReceiveBuffer generic map(name => name & " receiver-buffer-input-1 ",
						buffer_size => 	input_1_buffer_depth,
						data_width => input_width,
						kill_counter_range => 65535)
			port map(write_req => sample_req(1),
				 write_ack => sample_ack(1),
			         write_data => data_in((2*input_width)-1 downto input_width),
				 read_req => in_data_1_accept,
				 read_ack => in_data_1_valid,
				 read_data => in_data_1,
				 kill => in_data_1_kill,
				 clk => clk, reset => reset);	
        end generate i1NoConst;

	i1Const: if (input_1_is_constant) generate
		in_data_1 <=  data_in((2*input_width)-1 downto input_width);
		in_data_1_valid <= '1';
		in_data_1_kill <= '0';
		sample_ack(1) <= sample_req(1);
        end generate i1Const;

	i2NoConst: if (not input_2_is_constant) generate
		rx2: ReceiveBuffer generic map(name => name & " receiver-buffer-input-2 ",
						buffer_size => 	input_2_buffer_depth,
						data_width => input_width,
						kill_counter_range => 65535)
			port map(write_req => sample_req(0),
				 write_ack => sample_ack(0),
			         write_data => data_in(input_width-1 downto 0),
				 read_req => in_data_2_accept,
				 read_ack => in_data_2_valid,
				 read_data => in_data_2,
				 kill => in_data_2_kill,
				 clk => clk, reset => reset);	
        end generate i2NoConst;

	i2Const: if (input_2_is_constant) generate
		in_data_2 <=  data_in(input_width-1 downto 0);
		in_data_2_valid <= '1';
		in_data_2_kill <= '0';
		sample_ack(0) <= sample_req(0);
        end generate i2Const;


	in_data_1_accept <=  in_data_1_valid and out_data_valid and out_data_accept;
        in_data_1_kill   <= (not in_data_1_valid) and out_data_valid and out_data_accept;

	in_data_2_accept <=  in_data_2_valid and out_data_valid and out_data_accept;
        in_data_2_kill   <= (not in_data_2_valid) and out_data_valid and out_data_accept;
        
	-- the operator itself. operator-id can be ApIntAnd, ApIntOr, ApIntXor, ApIntNor, 
        -- ApIntNand, ApIntXnor.
	andGen: if ((operator_id = "ApIntAnd") or (operator_id = "ApIntNand")) generate

		-- out-valid = i1valid.i2valid  + i1valid.(i1=0) + i2valid.(i2=0)
		out_data_valid <= (in_data_1_valid and in_data_2_valid) 
					or (in_data_1_valid and in_data_1_zero) or
						(in_data_2_valid and in_data_2_zero);

        end generate andGen;

	orGen: if ((operator_id = "ApIntOr") or (operator_id = "ApIntNor")) generate

		-- out-valid = i1valid.i2valid  + i1valid.(i1=1) + i2valid.(i2=1)
		out_data_valid <= (in_data_1_valid and in_data_2_valid) 
					or (in_data_1_valid and in_data_1_one) or
						(in_data_2_valid and in_data_2_one);


        end generate orGen;

	xorGen: if ((operator_id = "ApIntXor") or (operator_id = "ApIntXnor")) generate

		out_data_valid <= in_data_1_valid and in_data_2_valid;


        end generate xorGen;

       
	
	-- unload buffer on the output side. 
        ub: UnloadBuffer generic map (name => name & " output-buffer ",
					buffer_size => output_buffer_depth,
					data_width => output_width)
		port map(write_req => out_data_valid,
			 write_ack => out_data_accept,
			 write_data => out_data,
			 unload_req => update_req,
			 unload_ack => update_ack,
			 read_data => data_out,
			 clk => clk, reset => reset); 
  end generate noFlowThrough;

  flowThrough: if (flow_through) generate

	-- operator is just like a combinational operator.
	-- All other sequencing must be handled correctly by 
	-- the control-path.

	update_ack   <= update_req;
	sample_ack <= sample_req;	
		
	in_data_1 <=  data_in((2*input_width)-1 downto input_width);
	in_data_2 <=  data_in(input_width-1 downto 0);

	data_out <= out_data;
	
  end generate flowThrough;

end Vanilla;
