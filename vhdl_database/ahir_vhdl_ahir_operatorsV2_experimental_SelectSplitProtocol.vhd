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
use ahir.Subprograms.all;
use ahir.BaseComponents.all;

entity SelectSplitProtocol is
  generic(name: string; 
	  data_width: integer; 
	  buffering: integer; 
	  flow_through: boolean := false; 
	  full_rate: boolean );
  port(x,y: in std_logic_vector(data_width-1 downto 0);
       sel: in std_logic_vector(0 downto 0);
       z : out std_logic_vector(data_width-1 downto 0);
       sample_req: in boolean;
       sample_ack: out boolean;
       update_req: in boolean;
       update_ack: out boolean;
       clk,reset: in std_logic);
end SelectSplitProtocol;


architecture arch of SelectSplitProtocol is 
   signal ilb_data_in: std_logic_vector(data_width-1 downto 0);
begin

    
     -- if mux select is X during normal operations then we
     -- have a problem.
     -- assert (not (sample_req and clk'event  and (clk = '1') and (reset = '0')) 
		-- or (not is_x(sel(0)))) report "mux " & name & " select is X" severity error;

     ilb_data_in <=  x when (sel(0) = '1') else y;

     noFlowThrough: if (not flow_through) generate
    	ilb: InterlockBuffer 
		generic map(name => name & "-ilb",
				buffer_size => buffering,
				in_data_width => data_width,
				out_data_width => data_width)
		port map(write_req => sample_req,
			 write_ack => sample_ack,
			 write_data => ilb_data_in,
			 read_req  => update_req,
			 read_ack => update_ack,
			 read_data => z,
			 clk => clk, reset => reset);
     end generate noFlowThrough;

	-- like a combinational circuit..
	-- the control path must worry about all
	-- sequencing issues.
     flowThrough: if (flow_through) generate
	z <= ilb_data_in;
    	sample_ack <= sample_req;
    	update_ack <= update_req;

     end generate flowThrough;
end arch;

