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
library ahir;
use ahir.Utilities.all;
use ahir.GlobalConstants.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.mem_component_pack.all;
use ahir.GlobalConstants.all;
--
-- synchronous memory with 1 write and 1 read port.
--
entity register_file_1w_1r_port is
   generic ( name: string; g_addr_width: natural := 10; g_data_width : natural := 16);
   port (
	 -- write port 0
	 datain_0 : in std_logic_vector(g_data_width-1 downto 0);
         addrin_0: in std_logic_vector(g_addr_width-1 downto 0);
         enable_0: in std_logic;
	 -- read port 1
         dataout_1: out std_logic_vector(g_data_width-1 downto 0);
         addrin_1: in std_logic_vector(g_addr_width-1 downto 0);
         enable_1: in std_logic;
	
         clk: in std_logic;
         reset : in std_logic);
end entity register_file_1w_1r_port;


architecture Struct of register_file_1w_1r_port is
	signal tied_high, tied_low: std_logic;
	signal unused_dout_0, unused_din_1: std_logic_vector(g_data_width-1 downto 0);
begin  -- XilinxBramInfer

  debugGen: if global_debug_flag generate
  assert false report "MemSliceInfo register_file_1w_1r_port " & name & " " & " addr_width = " & Convert_To_String(g_addr_width) & " data-width = " & Convert_To_String(g_data_width) severity note;
  assert false report "MSLICE 1R1W " &  Convert_To_String(g_addr_width) & " " & Convert_To_String(g_data_width) severity note;
  end generate debugGen;


	tied_high <= '1';
	tied_low  <= '0';

	unused_din_1 <= (others => '0');

	-- default model.. use a dual port mem.
	-- for ASIC, need a different one.
        dpramInst: base_bank_dual_port
		generic map (name => name & "-dpram", 
				g_addr_width => g_addr_width,
				g_data_width => g_data_width)
		port map (
				-- port 0 for write
				datain_0 =>  datain_0,
				dataout_0 => unused_dout_0,
				addrin_0 =>  addrin_0,
				enable_0 => enable_0,
				writebar_0 => tied_low,
				-- port 1 for read.
				datain_1  => unused_din_1,
				dataout_1 => dataout_1,
				addrin_1 =>  addrin_1,
				enable_1 => enable_1,
				writebar_1 => tied_high,
				-- clock pos edge..
				clk => clk, 
				-- reset active high.
				reset => reset
			 );

end Struct;
