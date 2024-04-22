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

--
-- Assumptions: 
--  1.  at most one of the sample_req's is asserted at any time.
--  2.  between two successive sample-reqs, there must be a sample-ack.
--
entity PhiPipelined is
  generic (
    name       : string;
    num_reqs   : integer;
    buffering  : integer;
    data_width : integer);
  port (
    sample_req                 : in  BooleanArray(num_reqs-1 downto 0);
    sample_ack                 : out Boolean;
    update_req                 : in Boolean;
    update_ack                 : out Boolean;
    idata                      : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    odata                      : out std_logic_vector(data_width-1 downto 0);
    clk, reset                 : in std_logic);
end PhiPipelined;


-- a single interlock buffer which is written into by
-- one of num_reqs sources.
architecture Behave of PhiPipelined is

    signal ilb_write_data, mux_data_prereg, mux_data_reg: std_logic_vector(data_width-1 downto 0);
    signal ilb_write_req : boolean;

    signal sample_req_reg: BooleanArray(num_reqs-1 downto 0);
    signal clear_sample_reg: Boolean;
begin  -- Behave

  ilb: InterlockBuffer generic map(name => name & " ilb " ,
				buffer_size => buffering,
				in_data_width => data_width,
				out_data_width => data_width, 
				bypass_flag => true)
		port map(write_req => ilb_write_req,
			 write_ack => sample_ack,
			 write_data => ilb_write_data,
			 read_req => update_req,
			 read_ack => update_ack,
			 read_data => odata,
		         clk => clk,
		         reset => reset);		

  ilb_write_req <= OrReduce(sample_req);
  ilb_write_data <= mux_data_prereg when ilb_write_req  else mux_data_reg;

  -- mux with bypassed register.. to keep track of last word that was written
  -- in
  -- TODO: this is a bit expensive.. can we do better?
  process(clk,reset,sample_req,ilb_write_req,idata)
	variable mux_data : std_logic_vector(odata'length-1 downto 0);
  begin
     mux_data := MuxOneHot(idata,sample_req); 
     mux_data_prereg <= mux_data;
     if(clk'event and clk = '1') then
	if(reset = '1') then 
          mux_data_reg <= (others => '0');
        elsif(ilb_write_req) then
            mux_data_reg <= mux_data;
	end if;
     end if;
  end process;

end Behave;
