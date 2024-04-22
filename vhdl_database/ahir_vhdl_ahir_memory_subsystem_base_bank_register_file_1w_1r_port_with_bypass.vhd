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
--    write value is bypassed to read out on address match.
entity register_file_1w_1r_port_with_bypass is
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
end entity register_file_1w_1r_port_with_bypass;


architecture Struct of register_file_1w_1r_port_with_bypass is

	signal bypassed_write_to_read: std_logic_vector(g_data_width-1 downto 0);
        signal mem_dataout_1, mem_dataout_1_reg, resolved_mem_dataout_1: std_logic_vector(g_data_width-1 downto 0);
	signal write_to_read_bypass, use_bypassed_value, enable_1_reg: std_logic;

begin  -- XilinxBramInfer

	base_inst: register_file_1w_1r_port 
			generic map (name => name & ":Base", 
					g_addr_width => g_addr_width,
					g_data_width => g_data_width)
			port map (clk => clk, reset => reset,
	 				datain_0 => datain_0,
         				addrin_0 => addrin_0,
         				enable_0 => enable_0,
         				dataout_1 => mem_dataout_1,
         				addrin_1 => addrin_1,
         				enable_1 => enable_1);
					

	write_to_read_bypass <= '1' when
		(enable_1 = '1') and (enable_0 = '1') and (addrin_0 = addrin_1) else '0';

	process(clk)
	begin
		if(clk'event and (clk = '1')) then
			if(reset = '1') then
				use_bypassed_value <= '0';
				bypassed_write_to_read <= (others => '0');
				enable_1_reg <= '0';
			else 
				enable_1_reg <= enable_1;
				if(write_to_read_bypass = '1') then
					bypassed_write_to_read <= datain_0;
					use_bypassed_value <= '1';
				elsif (enable_1 = '1') then  -- an unmatched memory read resets the bypass flag.
					bypassed_write_to_read <= (others => '0');
					use_bypassed_value <= '0';
				end if;

				if(enable_1_reg = '1') then
					mem_dataout_1_reg <= mem_dataout_1;
				end if;
			end if;
		end if;
	end process;

	-- hold the data...
	resolved_mem_dataout_1 <= mem_dataout_1 when (enable_1_reg = '1') else mem_dataout_1_reg;
	dataout_1 <= bypassed_write_to_read when (use_bypassed_value = '1') else resolved_mem_dataout_1;

end Struct;
