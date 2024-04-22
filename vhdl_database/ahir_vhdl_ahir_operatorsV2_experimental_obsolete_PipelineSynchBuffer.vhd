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
use ahir.Utilities.all;
use ahir.BaseComponents.all;

--
-- A fast synch buffer.  Has  combinational paths from
--     write-req -> write-ack
--     read-req  -> write-ack
-- handle with care..
--
-- to play it safe (but to be satisfied with half-rate),
-- leave full_flag as false.
--
entity PipelineSynchBuffer is
  generic (name : string; in_data_width: integer; out_data_width: integer; full_rate : boolean);
  port (
    read_req       : in  boolean;
    read_ack       : out boolean;
    read_data      : out std_logic_vector(out_data_width-1 downto 0);
    write_req       : in  boolean;
    write_ack       : out boolean;
    write_data      : in std_logic_vector((in_data_width-1) downto 0);
    clk, reset : in  std_logic);
  
end PipelineSynchBuffer;

architecture default_arch of PipelineSynchBuffer is
  constant min_data_width: integer := Minimum(in_data_width, out_data_width);
  signal data_register : std_logic_vector(min_data_width-1 downto 0);
  signal joined_req : boolean;

  signal full_flag : boolean := false;
  
begin  -- default_arch
 

  -- join.
    reqJoin: join2 generic map (name => name & "-reqJoin", bypass => true)
			port map (pred0 => write_req, pred1 => read_req, symbol_out => joined_req,
					clk => clk, reset => reset);

    FullRate: if full_rate generate
      write_ack <= joined_req;
    end generate FullRate;
   
    -- not full rate.. introduce a delay between write-req
    -- and write-ack..  This will cut the peak rate at which
    -- this ILB can run to 1/2, but will also cut the combi
    -- path from read-req to write-ack.
    NotFullRate: if (not full_rate) generate
	process(clk, reset)
        begin
            if(clk'event and clk = '1') then
		if(reset = '1') then
			write_ack <= false;
		else
			write_ack <= joined_req;
		end if;
	    end if;
	end process;
    end generate NotFullRate;


    process(clk, reset, joined_req)
    begin
	  if(clk'event and clk = '1') then
		  if(reset = '1') then
			  read_ack <= false;
			  data_register <= (others => '0');
		  else
			  read_ack <= joined_req;
			  if(joined_req) then
				  data_register <= write_data(min_data_width-1 downto 0);	
			  end if;
		  end if;
	  end if;	
    end process;


    process(data_register) 
    begin
	read_data <= (others => '0');
	read_data(min_data_width-1 downto 0) <= data_register;
    end process;

end default_arch;
