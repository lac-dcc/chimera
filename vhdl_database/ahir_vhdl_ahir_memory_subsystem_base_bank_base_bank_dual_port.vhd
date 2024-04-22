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
-- dual port synchronous memory.
--   similar to a flip-flop as far as simultaneous read/write  is concerned
--   if both ports try to write to the same address, the second port (1) wins
--
entity base_bank_dual_port is
   generic ( name: string; g_addr_width: natural := 10; g_data_width : natural := 16);
   port (
	 datain_0 : in std_logic_vector(g_data_width-1 downto 0);
         dataout_0: out std_logic_vector(g_data_width-1 downto 0);
         addrin_0: in std_logic_vector(g_addr_width-1 downto 0);
         enable_0: in std_logic;
         writebar_0 : in std_logic;
	 datain_1 : in std_logic_vector(g_data_width-1 downto 0);
         dataout_1: out std_logic_vector(g_data_width-1 downto 0);
         addrin_1: in std_logic_vector(g_addr_width-1 downto 0);
         enable_1: in std_logic;
         writebar_1 : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity base_bank_dual_port;


architecture XilinxBramInfer of base_bank_dual_port is
	signal wea, web: std_logic;
begin  -- XilinxBramInfer

  debugGen: if global_debug_flag generate
  assert false report "MemSliceInfo base_bank_dual_port " & name & " " & " addr_width = " & Convert_To_String(g_addr_width) & " data-width = " & Convert_To_String(g_data_width) severity note;
  assert false report "MSLICE DP " &  Convert_To_String(g_addr_width) & " " & Convert_To_String(g_data_width) severity note;
  end generate debugGen;

	wea <= not writebar_0;
	web <= not writebar_1;

	-- global constant: use_vivado_bbank_dual_port.
	ifVivado: if global_use_vivado_bbank_dual_port generate
		vivadobb: base_bank_dual_port_for_vivado
				generic map (name => name & "_vivado",
						g_addr_width => g_addr_width,
						g_data_width => g_data_width)
				port map (
					clka => clk,
					clkb => clk,
					ena  => enable_0,
					enb => enable_1,
					wea => wea,
					web => web,
					addra => addrin_0,
					addrb => addrin_1,
					dia => datain_0,
					dib => datain_1,
					doa => dataout_0,
					dob => dataout_1
				);
	end generate ifVivado;

	ifXst: if (not global_use_vivado_bbank_dual_port) generate
		xstbb: base_bank_dual_port_for_xst
				generic map (name => name & "_xst",
						g_addr_width => g_addr_width,
						g_data_width => g_data_width)
				port map (
	 				datain_0 => datain_0,
         				dataout_0 => dataout_0,
         				addrin_0 => addrin_0,
         				enable_0 => enable_0,
         				writebar_0 => writebar_0,
	 				datain_1 => datain_1,
         				dataout_1 => dataout_1,
         				addrin_1 => addrin_1,
         				enable_1 => enable_1,
         				writebar_1 => writebar_1,
         				clk => clk,
         				reset => reset);
	end generate ifXst;
end XilinxBramInfer;
