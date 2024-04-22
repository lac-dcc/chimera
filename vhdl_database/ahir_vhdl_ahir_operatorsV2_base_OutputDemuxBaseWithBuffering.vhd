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

-------------------------------------------------------------------------------
-- a single level requester on the left, and nreq requesters on the right.
--
-- reqR -> ackR can be zero delay.
-- reqL -> ackL has at least a unit delay
--
-- This demux provides buffering for each output.
-- (potentially useful in loop-pipelining).
-------------------------------------------------------------------------------
entity OutputDeMuxBaseWithBuffering is
  generic(name: string;
          iwidth: integer := 4;
	  owidth: integer := 12;
	  twidth: integer := 2;
	  nreqs: integer := 3;
	  detailed_buffering_per_output: IntegerArray;
	  full_rate: boolean);
  port (
    -- req/ack follow level protocol
    reqL                 : in  std_logic;
    ackL                 : out std_logic;
    dataL                : in  std_logic_vector(iwidth-1 downto 0);
    -- tag identifies index to which demux
    -- should happen
    tagL                 : in std_logic_vector(twidth-1 downto 0);
    -- reqR/ackR follow pulse protocol
    -- and are of length n
    reqR                : in BooleanArray(nreqs-1 downto 0);
    ackR                : out  BooleanArray(nreqs-1 downto 0);
    -- dataR is array(n,m) 
    dataR               : out std_logic_vector(owidth-1 downto 0);
    clk, reset          : in std_logic);
end OutputDeMuxBaseWithBuffering;

architecture Behave of OutputDeMuxBaseWithBuffering is
  signal ackL_array : std_logic_vector(nreqs-1 downto 0);
  --alias buffer_sizes: IntegerArray(detailed_buffering_per_output'length-1 downto 0) is detailed_buffering_per_output;

begin  -- Behave
  assert(owidth = iwidth*nreqs) report "word-length mismatch in output demux " & name severity failure;

  bufGen: for I in 0 to nreqs-1 generate

    -- purpose: instantiate a buffer
    BufBlock: block
      signal write_req,write_ack : std_logic;
      signal unload_req,unload_ack : boolean;
      signal buf_data_in, buf_data_out : std_logic_vector(iwidth-1 downto 0);
      signal valid : std_logic;
      signal has_data: std_logic;

    begin  -- block BufBlock

       ub : UnloadBuffer generic map (
         name => name & " buffer " & Convert_To_String(I),
         buffer_size => detailed_buffering_per_output(I),
         data_width  => iwidth, 
	 bypass_flag => false,
	 use_unload_register => true)
         port map (
           write_req  => write_req,
           write_ack  => write_ack,
           write_data => buf_data_in,
           unload_req => unload_req,
           unload_ack => unload_ack,
           read_data  => buf_data_out,
           has_data   => has_data,
           clk        => clk,
           reset      => reset);

      
      ---------------------------------------------------------------------------
      -- valid true if this I is mentioned in tag
      ---------------------------------------------------------------------------
      valid <= '1' when (reqL = '1') and (I = To_Integer(To_Unsigned(tagL))) else '0';
      write_req <= valid;
      ackL_array(I) <= write_ack when (valid = '1') else '0';

      -------------------------------------------------------------------------
      -- dataL goes to each buffer.
      -------------------------------------------------------------------------
      buf_data_in <= dataL;


      -------------------------------------------------------------------------
      -- unload side is straightforward
      -------------------------------------------------------------------------
      unload_req <= reqR(I);
      ackR(I) <= unload_ack;
      dataR(((I+1)*iwidth)-1 downto I*iwidth) <= buf_data_out;
      
    end block BufBlock;
  end generate bufGen;

  -- ack is OrReduced from the Demux combinations.
  ackL <= OrReduce(ackL_array);
end Behave;
