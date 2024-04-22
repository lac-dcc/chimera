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

entity LoadReqShared is
  generic
    (
	name: string;
	addr_width: integer := 8;
      	num_reqs : integer := 1; -- how many requesters?
	tag_length: integer := 1;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true;
	time_stamp_width: integer := 0
    );
  port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- concatenated address corresponding to access
    dataL                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector((addr_width)-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);

    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
end LoadReqShared;

architecture Vanilla of LoadReqShared is

  constant iwidth: integer := addr_width*num_reqs;
  constant owidth: integer := addr_width;

  constant debug_flag : boolean := false;
-- constant registered_output : boolean := min_clock_period and (time_stamp_width = 0);

  -- must register..  ack implies that address has been sampled.
  constant registered_output : boolean := true; 

  signal imux_tag_out: std_logic_vector(tag_length-1 downto 0);
  
begin  -- Behave
  assert(tag_length >= Ceil_Log2(num_reqs)) report "insufficient tag width" severity error;

  TstampGen: if time_stamp_width > 0 generate

    Tstamp: block
	signal time_stamp: std_logic_vector(time_stamp_width-1 downto 0);
    begin 
    	mtag <= imux_tag_out & time_stamp; 


	-- ripple counter.
	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(reset = '1') then
				time_stamp <= (others => '0');
			else
				for I in 1 to time_stamp_width-1 loop
					time_stamp(I) <= time_stamp(I) xor AndReduce(time_stamp(I-1 downto 0));
				end loop;
				time_stamp(0) <= not time_stamp(0);
			end if;
		end if;
	end process;
    end block;
    
  end generate TstampGen;

  NoTstampGen: if time_stamp_width < 1 generate
	mtag <= imux_tag_out;
  end generate NoTstampGen;

  -- xilinx xst does not like this assertion...
  -- DbgAssert: if debug_flag generate
    -- assert( (not ((reset = '0') and (clk'event and clk = '1') and no_arbitration)) or Is_At_Most_One_Hot(reqL))
      -- report "in no-arbitration case, at most one request should be hot on clock edge (in SplitOperatorShared)" severity error;    
  -- end generate DbgAssert;

  
  imux: InputMuxBase
    generic map(name => name & "-imux",
		iwidth => iwidth,
                owidth => owidth, 
                twidth => tag_length,
                nreqs => num_reqs,
                no_arbitration => no_arbitration,
                registered_output => registered_output)
    port map(
      reqL       => reqL,
      ackL       => ackL,
      dataL      => dataL,
      reqR       => mreq,
      ackR       => mack,
      dataR      => maddr,
      tagR       => imux_tag_out,
      clk        => clk,
      reset      => reset);
  
end Vanilla;

