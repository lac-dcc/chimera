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
use ahir.mem_component_pack.all;
use ahir.mem_function_pack.all;

entity mem_shift_repeater is
    generic(name: string; g_data_width: integer := 32; g_number_of_stages: natural := 16);
    port(clk: in std_logic;
       reset: in std_logic;
       data_in: in std_logic_vector(g_data_width-1 downto 0);
       req_in: in std_logic;
       ack_out : out std_logic;
       data_out: out std_logic_vector(g_data_width-1 downto 0);
       req_out : out std_logic;
       ack_in: in std_logic);
end entity mem_shift_repeater;

architecture behave of mem_shift_repeater is

  type DataArray is array (natural range <>) of std_logic_vector(g_data_width-1 downto 0);
  signal idata : DataArray(0 to g_number_of_stages);
  signal ireq,iack : std_logic_vector(0 to g_number_of_stages);

begin  -- SimModel

  idata(0) <= data_in;
  ireq(0)  <= req_in;
  ack_out <= iack(0);

  data_out <= idata(g_number_of_stages);
  req_out <= ireq(g_number_of_stages);
  iack(g_number_of_stages) <= ack_in;

  ifGen: if g_number_of_stages > 0 generate

    RepGen: for I in 0 to g_number_of_stages-1 generate
      rptr : mem_repeater generic map (
	name => name & "-RepGen-rptr-" & Convert_Integer_To_String(I),
        g_data_width => g_data_width)
        port map (
          clk      => clk,
          reset    => reset,
          data_in  => idata(I),
          req_in   => ireq(I),
          ack_out  => iack(I),
          data_out => idata(I+1),
          req_out  => ireq(I+1),
          ack_in   => iack(I+1));
    end generate RepGen;
  end generate ifGen; 

end behave;
