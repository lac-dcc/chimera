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
use ahir.Components.all;
use ahir.BaseComponents.all;
use ahir.Subprograms.all;
use ahir.Utilities.all;

--
-- a full-rate input port.  The assumption here
-- is that a data item is picked up from the
-- input port for every req pulse.  The production
-- of a new output data-item is indicated by an
-- ack pulse.
--
entity InputPortRevised is
  generic (name : string;
	   num_reqs: integer;
	   data_width: integer;
	   output_buffering: IntegerArray;
	   nonblocking_read_flag: boolean := false;
	   no_arbitration: boolean := false);
  port (
    -- pulse interface with the data-path
    sample_req        : in  BooleanArray(num_reqs-1 downto 0); -- sacrificial.
    sample_ack        : out BooleanArray(num_reqs-1 downto 0); -- sacrificial.
    update_req        : in  BooleanArray(num_reqs-1 downto 0);
    update_ack        : out BooleanArray(num_reqs-1 downto 0);
    data              : out std_logic_vector((num_reqs*data_width)-1 downto 0);
    -- ready/ready interface with outside world
    oreq       : out std_logic;
    oack       : in  std_logic;
    odata      : in  std_logic_vector(data_width-1 downto 0);
    clk, reset : in  std_logic);
end entity;


architecture Base of InputPortRevised is

  --alias outBUFs: IntegerArray(num_reqs-1 downto 0) is output_buffering;
  signal has_room, write_enable : std_logic_vector(num_reqs-1 downto 0);

  type   IPWArray is array(integer range <>) of std_logic_vector(data_width-1 downto 0);
  signal write_data, read_data: IPWArray(num_reqs-1 downto 0);

  signal demux_data : std_logic_vector((num_reqs*data_width)-1 downto 0);

  signal ack_raw: BooleanArray(num_reqs-1 downto 0);
  
  type FsmState is (Idle, Waiting);
   
  -- to deal with nonblocking case..
  signal oreq_qualified       : std_logic;
  signal oack_qualified       : std_logic;
  signal odata_qualified      : std_logic_vector(data_width-1 downto 0);

  constant c_d_0      : std_logic_vector(data_width-1 downto 0) := (others => '0');

  -- bypass if there is only one requester.
  constant bypass_flag : boolean := (num_reqs = 1);

begin

  -----------------------------------------------------------------------------
  -- non-block/block qualification.. no need to do it here since nonblock
  -- functionality is present in UnloadRegister.
  -----------------------------------------------------------------------------
  oreq <= oreq_qualified;
  oack_qualified <= oack;
  odata_qualified <= odata;


  -----------------------------------------------------------------------------
  -- data register for every requester.
  -----------------------------------------------------------------------------
  ProTx : for I in 0 to num_reqs-1 generate

    --
    -- Note: for correct functioning of this input port
    --   external dependencies on the control-path side
    --   must be correctly setup.
    --     sr->sa->cr->ca chain
    --     ca -o-> sr  (0-delay) dependency.
    --
    sample_ack(I) <= sample_req(I); -- to maintain illusion of split protocol.

    -- the unload-register..
    ulreg: UnloadRegister
		generic map (name => name & "-unload-reg",
				data_width => data_width,
				bypass_flag => bypass_flag,
				nonblocking_read_flag => nonblocking_read_flag)	
		port map (write_req => write_enable(I),
				write_ack => has_room(I),
				  write_data => write_data(I),
				unload_req => update_req(I),
				  unload_ack => update_ack(I),
				   read_data => read_data(I),
				     clk => clk, reset => reset);
  end generate ProTx;

  demux : InputPortLevel generic map (
    name => name & "-demux",
    num_reqs       => num_reqs,
    data_width     => data_width,
    no_arbitration => no_arbitration)
    port map (
      req => has_room,
      ack => write_enable,
      data => demux_data,
      oreq => oreq_qualified,
      odata => odata_qualified,
      oack => oack_qualified,
      clk => clk,
      reset => reset);

  -----------------------------------------------------------------------------
  -- data handling
  -----------------------------------------------------------------------------
  process(read_data)
    variable ldata: std_logic_vector((num_reqs*data_width)-1 downto 0);
  begin
    for J in num_reqs-1 downto 0 loop
      ldata(((J+1)*data_width)-1 downto J*data_width) := read_data(J);
    end loop;
    data <= ldata;
  end process;

  gen : for I in num_reqs-1 downto 0 generate
    write_data(I) <= demux_data(((I+1)*data_width)-1 downto I*data_width); 
  end generate gen;

end Base;
