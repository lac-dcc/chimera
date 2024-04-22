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

entity register_file_1w_1r_port_r_wrap is
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
end entity register_file_1w_1r_port_r_wrap;

architecture RecWrap of register_file_1w_1r_port_r_wrap is
begin
	rinst: register_file_1w_1r_port
		generic map (name => name, g_addr_width => g_addr_width, g_data_width => g_data_width)
		port map (
				datain_0 => datain_0,
				addrin_0 => addrin_0,
				enable_0 => enable_0,
				dataout_1 => dataout_1,
				addrin_1 => addrin_1,
				enable_1 => enable_1,
				clk => clk, reset => reset
			);

end RecWrap;





library ahir;
use ahir.Utilities.all;
use ahir.GlobalConstants.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.Types.all;
use ahir.GlobalConstants.all;
use ahir.mem_component_pack.all;
use ahir.MemCutsPackage.all;
use ahir.MemcutDescriptionPackage.all;
use ahir.mem_ASIC_components.all;
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


architecture improved_struct of register_file_1w_1r_port is
   component register_file_1w_1r_port_r_wrap is
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
   end component register_file_1w_1r_port_r_wrap;
	constant best_cut_info: IntegerArray(1 to 5) :=
			find_best_cut (register_file_1w_1r_cut_address_widths, 
					register_file_1w_1r_cut_data_widths,
					register_file_1w_1r_cut_row_heights,
					g_addr_width, g_data_width);
	constant best_cut_address_width : integer := best_cut_info(2);
	constant best_cut_data_width    : integer := best_cut_info(3);
	constant best_cut_nrows         : integer := best_cut_info(4);
	constant best_cut_ncols         : integer := best_cut_info(5);
	constant use_side_strip: boolean :=
			(best_cut_info(1) > 0) and
					((best_cut_data_width*best_cut_ncols) < g_data_width);
begin
	noCutFound: if (best_cut_info(1) <= 0) generate
		regbb_inst: register_file_1w_1r_port_with_registers
				generic map (name => name & ":regs", g_addr_width => g_addr_width,
						g_data_width => g_data_width)
			        port map (
					datain_0 => datain_0, 
					addrin_0 => addrin_0,
					enable_0 => enable_0, 
					dataout_1 => dataout_1, 
					addrin_1 => addrin_1,
					enable_1 => enable_1, 
					clk => clk,
					reset => reset);
	end generate noCutFound;

	cutFound: if (best_cut_info(1) > 0) generate

           mb: block
		-- declare array access signals.
		constant array_addr_width : integer := g_addr_width;
		constant array_data_width : integer := best_cut_data_width*best_cut_ncols;

		signal array_datain_0: std_logic_vector(array_data_width-1 downto 0);
		signal array_dataout_1: std_logic_vector(array_data_width-1 downto 0);

		signal latch_dataout_1: std_logic;
		
		signal dataout_1_sig, dataout_1_reg: std_logic_vector(g_data_width-1 downto 0);
           begin

		array_datain_0 <= datain_0(g_data_width-1 downto (g_data_width - array_data_width));
		dataout_1_sig (g_data_width-1 downto (g_data_width - array_data_width)) <= array_dataout_1;


		-- selector array..
		arrayInst: register_file_1w_1r_selector_array 
				generic map (name =>  name & ":marray",
						g_addr_width => array_addr_width,
						g_data_width => array_data_width,
						g_base_addr_width => best_cut_address_width,
						g_base_data_width => best_cut_data_width)
				port map (
					datain_0   =>  array_datain_0,
					addrin_0   =>  addrin_0,
					enable_0   =>  enable_0,
					dataout_1  =>  array_dataout_1,
					addrin_1   =>  addrin_1,
					enable_1   =>  enable_1,
					clk => clk,
					reset => reset);


		genSideStrip : if use_side_strip generate
		  sb: block
			signal sstrip_datain_0: std_logic_vector((g_data_width - array_data_width)-1 downto 0);
			signal sstrip_dataout_1: std_logic_vector((g_data_width - array_data_width)-1 downto 0);
		  begin

			sstrip_datain_0 <= datain_0((g_data_width-array_data_width)-1 downto 0);
			dataout_1_sig((g_data_width-array_data_width)-1 downto 0) <= sstrip_dataout_1;

			side_strip_inst: component register_file_1w_1r_port_r_wrap
				generic map (name => name & ":sstrip", 
						g_addr_width => g_addr_width,
						g_data_width => (g_data_width - array_data_width))
			        port map (
					datain_0 => sstrip_datain_0, 
					addrin_0 => addrin_0,
					enable_0 => enable_0, 
					dataout_1 => sstrip_dataout_1, 
					addrin_1 => addrin_1,
					enable_1 => enable_1, 
					clk => clk,
					reset => reset);
		   end block sb;
		end generate genSideStrip;

  	    	process(clk, reset)
  	    	begin
			if(clk'event and clk = '1') then
				if(reset = '1') then
					latch_dataout_1 <= '0';
				else
					latch_dataout_1 <= enable_1;
				end if;
			end if;
  	    	end process;
	
      	    	process (clk, latch_dataout_1, dataout_1_sig)
  	    	begin
			if(clk'event and clk = '1') then
				if(latch_dataout_1 = '1') then
					dataout_1_reg <= dataout_1_sig;
				end if;
			end if;
  	    	end process;
	
            	dataout_1 <= dataout_1_reg when (latch_dataout_1 = '0') else dataout_1_sig;
            
          end block mb;
	end generate cutFound;

end improved_struct;
