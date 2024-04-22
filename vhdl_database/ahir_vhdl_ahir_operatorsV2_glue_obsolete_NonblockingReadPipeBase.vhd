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
-- returns 0 if there is no data available for reading.
--  (data must be coded so that all-0's is invalid).
--

entity NonblockingReadPipeBase is
  generic (name : string;
	   num_reads: integer;
           num_writes: integer;
           data_width: integer;
           lifo_mode: boolean := false;
           depth: integer := 1;
	   signal_mode: boolean := false;
	   shift_register_mode: boolean := false;
	   full_rate: boolean);
  port (
    read_req       : in  std_logic_vector(num_reads-1 downto 0);
    read_ack       : out std_logic_vector(num_reads-1 downto 0);
    read_data      : out std_logic_vector((num_reads*data_width)-1 downto 0);
    write_req       : in  std_logic_vector(num_writes-1 downto 0);
    write_ack       : out std_logic_vector(num_writes-1 downto 0);
    write_data      : in std_logic_vector((num_writes*data_width)-1 downto 0);
    clk, reset : in  std_logic);
  
end NonblockingReadPipeBase;

architecture default_arch of NonblockingReadPipeBase is

   signal write_req_nb       : std_logic_vector(num_reads-1 downto 0);
   signal write_ack_nb       : std_logic_vector(num_reads-1 downto 0);
   signal write_data_nb      : std_logic_vector((num_reads*data_width)-1 downto 0);
  
begin  -- default_arch

 
	pb: PipeBase generic map (name => name & "-pb" ,
				    num_reads => num_reads,
					num_writes => num_writes,
				         data_width => data_width,
						lifo_mode => lifo_mode, 
							depth => depth,
								signal_mode => signal_mode, 
								     shift_register_mode => shift_register_mode,
									full_rate => full_rate)
		port map(read_req => write_ack_nb,
			   read_ack => write_req_nb,
				read_data => write_data_nb,
					write_req => write_req,
					  write_ack => write_ack,
						write_data => write_data,
							clk => clk, reset => reset);


	genNB: for I in 0 to num_reads-1 generate

		nb: PipeUnblock 
			generic map (name => name & "-nb-" & Convert_To_String(I),
					data_width => data_width)
			port map (write_req => write_req_nb(I),
					write_ack => write_ack_nb(I),
						write_data => write_data_nb (((I+1)*data_width)-1 downto (I*data_width)),
							read_req => read_req(I),
								read_ack => read_ack(I),
									read_data => read_data (((I+1)*data_width)-1 downto (I*data_width)),
										clk => clk, reset => reset);
	end generate genNB;

end default_arch;
