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
use ahir.Utilities.all;
use ahir.BaseComponents.all;

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

-- uses an aggressive pulse-to-level translation
-- that allows back-to-back transfers to an output
-- port.  The combinational paths are a bit longer
-- but cant have everything..
--
-- added full_rate flag to indicate that throughput is paramount.
entity OutputPortRevised is
  generic(name : string;
	  num_reqs: integer;
	  data_width: integer;
	  no_arbitration: boolean := false;
	  input_buffering: IntegerArray;
	  full_rate: boolean);
  port (
    sample_req        : in  BooleanArray(num_reqs-1 downto 0);
    sample_ack        : out BooleanArray(num_reqs-1 downto 0);
    update_req        : in  BooleanArray(num_reqs-1 downto 0); -- sacrificial.
    update_ack        : out BooleanArray(num_reqs-1 downto 0); -- sacrificial.
    data       : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : out std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
end entity;

architecture Base of OutputPortRevised is

  signal reqR, ackR : std_logic_vector(num_reqs-1 downto 0);

  signal omux_data_in       : std_logic_vector((num_reqs*data_width)-1 downto 0);

  type   OPWArray is array(integer range <>) of std_logic_vector(data_width-1 downto 0);
  signal in_data_array, out_data_array : OPWArray(num_reqs-1 downto 0);
  
  constant input_buf_sizes: IntegerArray(num_reqs-1 downto 0) :=  input_buffering;

  signal zero_sig: std_logic;
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin

  zero_sig <= '0';

  -----------------------------------------------------------------------------
  -- protocol conversion
  -----------------------------------------------------------------------------
  BufGen : for I in 0 to num_reqs-1 generate
	
	in_data_array(I) <= data(((I+1)*data_width)-1 downto (I*data_width));
	
	--  
	-- update ack..
        --   Note: to prevent runaway,  the following dependencies must be
	--    imposed in the control path.
        --  
        --   sa -> cr
        --   ca -o-> sr (0-delay)
        --
	process(clk,reset)
        begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				update_ack(I) <= false;
			else
				update_ack(I) <= update_req(I); -- sacrificial.. to maintain pretense of split protocol.
			end if;
		end if;
	end process;

	rxB: ReceiveBuffer 
		generic map( name => name & "-rxB" & Convert_To_String(I),
				buffer_size => input_buf_sizes(I),
				data_width => data_width,
				full_rate => full_rate)
		port map(write_req => sample_req(I),
		 	write_ack => sample_ack(I),
		 	write_data => in_data_array(I),
		 	-- note: cross-over
		 	read_req =>  ackR(I),
		 	read_ack => reqR(I), 
	         	read_data => out_data_array(I),	
		 	clk => clk, reset => reset);

  end generate BufGen;

  process(out_data_array)
  begin
	for J in  0 to num_reqs-1 loop
		omux_data_in(((J+1)*data_width)-1 downto J*data_width) <= out_data_array(J);
	end loop;
  end process;


  mux : OutputPortLevel generic map (
    name => name & "-mux",
    num_reqs       => num_reqs,
    data_width     => data_width,
    no_arbitration => no_arbitration)
    port map (
      req   => reqR,
      ack   => ackR,
      data  => omux_data_in,
      oreq  => oreq,
      oack  => oack,
      odata => odata,
      clk   => clk,
      reset => reset);
end Base;
