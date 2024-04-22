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

entity StoreReqShared is
    generic
    (
	name: string;
	addr_width: integer;
	data_width : integer;
	time_stamp_width : integer;
      	num_reqs : integer; -- how many requesters?
	tag_length: integer;
	no_arbitration: Boolean := false;
        min_clock_period: Boolean := true        
    );
  port (
    -- req/ack follow pulse protocol
    reqL                     : in BooleanArray(num_reqs-1 downto 0);
    ackL                     : out BooleanArray(num_reqs-1 downto 0);
    -- address corresponding to access
    addr                    : in std_logic_vector((addr_width*num_reqs)-1 downto 0);
    data                    : in std_logic_vector((data_width*num_reqs)-1 downto 0);
    -- address to memory
    maddr                   : out std_logic_vector(addr_width-1 downto 0);
    mdata                   : out std_logic_vector(data_width-1 downto 0);
    mtag                    : out std_logic_vector(tag_length+time_stamp_width-1 downto 0);
    mreq                    : out std_logic;
    mack                    : in std_logic;
    -- clock, reset (active high)
    clk, reset              : in std_logic);
end StoreReqShared;

architecture Vanilla of StoreReqShared is

  constant iwidth: integer := addr_width*num_reqs;
  constant owidth: integer := addr_width;

  signal idata: std_logic_vector(((addr_width+data_width)*num_reqs)-1 downto 0);
  signal odata: std_logic_vector((addr_width+data_width)-1 downto 0);

  constant debug_flag : boolean := global_debug_flag;
--  constant registered_output: boolean := min_clock_period and (time_stamp_width = 0);

  -- must register..  ack implies that address has been sampled.
  constant registered_output: boolean := true;

  
  signal imux_tag_out: std_logic_vector(tag_length-1 downto 0);
begin  -- Behave

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

  process(addr,data)
  begin
     for I in num_reqs-1 downto 0 loop
	idata(((I+1)*(addr_width+data_width))-1 downto (I*(addr_width+data_width))) <= 
		addr(((I+1)*addr_width)-1 downto I*addr_width) & 
		data(((I+1)*data_width)-1 downto I*data_width);
     end loop;
  end process;

  maddr <= odata(addr_width+data_width-1 downto data_width);
  mdata <= odata(data_width-1 downto 0);

  assert(tag_length >= Ceil_Log2(num_reqs)) report "insufficient tag width" severity error;

  -- debugCase: if debug_flag generate
    -- assert( (not ((reset = '0') and (clk'event and clk = '1') and no_arbitration)) or Is_At_Most_One_Hot(reqL))
      -- report "in no-arbitration case, at most one request should be hot on clock edge (in SplitOperatorShared)" severity error;
  -- end generate debugCase;
  
  imux: InputMuxBase
  	generic map(name => name & "-imux",
		    iwidth => (addr_width+data_width)*num_reqs ,
                    owidth => addr_width+data_width, 
                    twidth => tag_length,
                    nreqs => num_reqs,
                    registered_output => registered_output,
                    no_arbitration => no_arbitration)
    port map(
      reqL       => reqL,
      ackL       => ackL,
      reqR       => mreq,
      ackR       => mack,
      dataL      => idata,
      dataR      => odata,
      tagR       => imux_tag_out,
      clk        => clk,
      reset      => reset);
  
end Vanilla;

