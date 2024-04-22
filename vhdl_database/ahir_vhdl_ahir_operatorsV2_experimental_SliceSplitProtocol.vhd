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
library ahir;
use ahir.Types.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

-- a simple slicing element.
entity SliceSplitProtocol is
  generic(name: string; 
	in_data_width : integer; 
	high_index: integer; 
	low_index : integer; 
	buffering : integer;
	flow_through: boolean := false;
	full_rate: boolean := false
	);
  port(din: in std_logic_vector(in_data_width-1 downto 0);
       dout: out std_logic_vector(high_index-low_index downto 0);
       sample_req: in boolean;
       sample_ack: out boolean;
       update_req: in boolean;
       update_ack: out boolean;
       clk,reset: in std_logic);
end SliceSplitProtocol;


architecture arch of SliceSplitProtocol is
   signal ilb_data_in: std_logic_vector(high_index-low_index downto 0);
begin

  assert ((high_index < in_data_width) and (low_index >= 0) and (high_index >= low_index))
    report "inconsistent slice parameters" severity failure;
  
  noFlowThrough: if (not flow_through) generate

    ilb_data_in <= din(high_index downto low_index);
    ilb: InterlockBuffer 
		generic map(name => name & "-ilb",
				buffer_size => buffering,
				in_data_width => (high_index - low_index) + 1,
				out_data_width => (high_index - low_index) + 1)
		port map(write_req => sample_req,
			 write_ack => sample_ack,
			 write_data => ilb_data_in,
			 read_req  => update_req,
			 read_ack => update_ack,
			 read_data => dout,
			 clk => clk, reset => reset);

  end generate noFlowThrough;

  flowThrough: if flow_through generate
    dout <= din(high_index downto low_index);
    sample_ack <= sample_req;
    update_ack <= update_req;
  end generate flowThrough;
  
end arch;

