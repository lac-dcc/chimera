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

-- Synopsys DC ($^^$@!)  needs you to declare an attribute
-- to infer a synchronous set/reset ... unbelievable.
--##decl_synopsys_attribute_lib##

entity PhiBase is
  generic (
    name: string;
    num_reqs   : integer;
    data_width : integer;
    bypass_flag : boolean := false);
  port (
    req                 : in  BooleanArray(num_reqs-1 downto 0);
    ack                 : out Boolean;
    idata               : in  std_logic_vector((num_reqs*data_width)-1 downto 0);
    odata               : out std_logic_vector(data_width-1 downto 0);
    clk, reset          : in std_logic);
end PhiBase;



architecture Behave of PhiBase is
   signal muxed_idata: std_logic_vector(data_width-1 downto 0);
   signal odata_reg: std_logic_vector(data_width-1 downto 0);
   signal there_is_a_req: boolean;
   signal ack_internal: boolean;
   signal req_registered, final_req : BooleanArray(num_reqs-1 downto 0);
-- see comment above..
--##decl_synopsys_sync_set_reset##
begin  -- Behave

  assert(idata'length = (odata'length * req'length)) report "data size mismatch in PhiBase " & name severity failure;

  -- muxed data..
  odata <= MuxOneHot(idata,final_req);

  there_is_a_req <= OrReduce(req);
  ack_internal <= there_is_a_req;

  process(clk)
	variable mux_data : std_logic_vector(odata'length-1 downto 0);
  begin
     if(clk'event and clk = '1') then
	if(reset = '1') then
          req_registered <= (others => false);
	elsif (there_is_a_req) then
	  req_registered <= req;
	end if;
     end if;
  end process;

  -- bypass.
  Byp: if bypass_flag generate
  	final_req <= req when there_is_a_req else req_registered;
        ack <= ack_internal;
  end generate Byp;

  -- no-bypass.
  NoByp: if (not bypass_flag) generate
	final_req <= req_registered;
        process(clk)
        begin
 	   if(clk'event and clk = '1') then
		if(reset = '1') then
			ack <= false;
		else 
			ack <= ack_internal;
		end if;
	   end if;
        end process;
  end generate NoByp;
end Behave;
