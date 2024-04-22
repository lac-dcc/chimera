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

entity LoadCompleteShared is
    generic
    (
      name : string;
      data_width: integer := 8;
      tag_length:  integer := 1;
      num_reqs : integer := 1;
      no_arbitration: boolean := false;
      detailed_buffering_per_output: IntegerArray
    );
  port (
    -- req/ack follow level protocol
    reqR                     : in BooleanArray(num_reqs-1 downto 0);
    ackR                     : out BooleanArray(num_reqs-1 downto 0);
    dataR                    : out std_logic_vector((data_width*num_reqs)-1 downto 0);
    -- output data consists of concatenated pairs of ops.
    mdata                    : in std_logic_vector(data_width-1 downto 0);
    mreq                     : out  std_logic;
    mack                     : in std_logic;
    mtag                     : in std_logic_vector(tag_length-1 downto 0);
    -- with dataR
    clk, reset              : in std_logic);
end LoadCompleteShared;

architecture Vanilla of LoadCompleteShared is

begin  -- Behave


  odemux: OutputDeMuxBaseWithBuffering
    generic map (
      name => name & "-odemux ",
      iwidth => data_width,
      owidth =>  data_width*num_reqs,
      twidth =>  tag_length,
      nreqs  => num_reqs,
      detailed_buffering_per_output => detailed_buffering_per_output,
      full_rate => true )   -- always double buffered.
    port map (
      reqL   => mack,                   -- cross-over (mack from mem-subsystem)
      ackL   => mreq,                   -- cross-over 
      dataL =>  mdata,
      tagL  =>  mtag,
      reqR  => reqR,
      ackR  => ackR,
      dataR => dataR,
      clk   => clk,
      reset => reset);
  
  
end Vanilla;

