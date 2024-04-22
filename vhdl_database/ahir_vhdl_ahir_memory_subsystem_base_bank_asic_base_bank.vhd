------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai, Ch. V. Kalyani
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
-- modified base-bank implementation by Kalyani
-------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.mem_component_pack.all;
entity base_bank_r_wrap  is
   generic ( name: string:="mem"; g_addr_width: natural := 5; 
	     g_data_width : natural := 20);
   port (datain : in std_logic_vector(g_data_width-1 downto 0);
         dataout: out std_logic_vector(g_data_width-1 downto 0);
         addrin: in std_logic_vector(g_addr_width-1 downto 0);
         enable: in std_logic;
         writebar : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity;

architecture WrapRec of base_bank_r_wrap is
begin
 ci: base_bank
	generic map (name => name, g_addr_width => g_addr_width, g_data_width => g_data_width)
	port map (
			datain => datain, dataout => dataout, addrin => addrin,
			enable => enable, writebar => writebar, clk => clk, reset => reset
		 );
end WrapRec;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;	
use ahir.Types.all;	
use ahir.Subprograms.all;	
use ahir.mem_function_pack.all;
use ahir.memory_subsystem_package.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;

library ahir;
use ahir.Types.all;
use ahir.MemCutsPackage.all;
use ahir.mem_ASIC_components.all;
use ahir.MemcutDescriptionPackage.all;
use ahir.mem_component_pack.all;

entity base_bank is
   generic ( name: string:="mem"; g_addr_width: natural := 5; 
	     g_data_width : natural := 20);
   port (datain : in std_logic_vector(g_data_width-1 downto 0);
         dataout: out std_logic_vector(g_data_width-1 downto 0);
         addrin: in std_logic_vector(g_addr_width-1 downto 0);
         enable: in std_logic;
         writebar : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity base_bank;


architecture improved_struct of base_bank is

   component base_bank_r_wrap  is
   generic ( name: string:="mem"; g_addr_width: natural := 5; 
	     g_data_width : natural := 20);
   port (datain : in std_logic_vector(g_data_width-1 downto 0);
         dataout: out std_logic_vector(g_data_width-1 downto 0);
         addrin: in std_logic_vector(g_addr_width-1 downto 0);
         enable: in std_logic;
         writebar : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
   end component;

	constant best_cut_info: IntegerArray(1 to 5) :=
			find_best_cut (spmem_cut_address_widths, 
					spmem_cut_data_widths,
					spmem_cut_row_heights,
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
		regbb_inst: base_bank_with_registers
				generic map (name => name & ":regs", g_addr_width => g_addr_width,
						g_data_width => g_data_width)
			        port map (
					datain => datain, dataout => dataout, addrin => addrin,
						enable => enable, writebar => writebar, clk => clk,
							reset => reset);
	end generate noCutFound;

	cutFound: if (best_cut_info(1) > 0) generate

           mb: block
		-- declare array access signals.
		constant array_addr_width : integer := g_addr_width;
		constant array_data_width : integer := best_cut_data_width*best_cut_ncols;

		signal array_datain: std_logic_vector(array_data_width-1 downto 0);
		signal array_dataout: std_logic_vector(array_data_width-1 downto 0);

		signal latch_dataout: std_logic;
		signal dataout_sig, dataout_reg: std_logic_vector(g_data_width-1 downto 0);	
           begin

		array_datain <= datain (g_data_width-1 downto (g_data_width - array_data_width));
		dataout_sig (g_data_width-1 downto (g_data_width - array_data_width)) <= array_dataout;

		-- selector array..
		arrayInst: spmem_selector_array 
				generic map (name =>  name & ":marray",
						g_addr_width => array_addr_width,
						g_data_width => array_data_width,
						g_base_addr_width => best_cut_address_width,
						g_base_data_width => best_cut_data_width)
				port map (
					datain   =>  array_datain,
					dataout  =>  array_dataout,
					addrin   =>  addrin,
					enable   =>  enable,
				        writebar =>  writebar,
					clk => clk,
					reset => reset);


		genSideStrip : if use_side_strip generate
		  sb: block
			signal sstrip_datain: std_logic_vector((g_data_width - array_data_width)-1 downto 0);
			signal sstrip_dataout: std_logic_vector((g_data_width - array_data_width)-1 downto 0);
		  begin

			sstrip_datain <= datain((g_data_width-array_data_width)-1 downto 0);
			dataout_sig ((g_data_width-array_data_width)-1 downto 0) <= sstrip_dataout;

			side_strip_inst: component base_bank_r_wrap
				generic map (name => name & ":sstrip", 
						g_addr_width => g_addr_width,
						g_data_width => (g_data_width - array_data_width))
			        port map (
					datain => sstrip_datain, 
					dataout => sstrip_dataout, 
					addrin => addrin,
					enable => enable, 
					writebar => writebar, 
					clk => clk,
					reset => reset);

		   end block sb;
		end generate genSideStrip;

  	    	process(clk, reset)
  	    	begin
			if(clk'event and clk = '1') then
				if(reset = '1') then
					latch_dataout <= '0';
				else
					latch_dataout <= enable and writebar;
				end if;
			end if;
  	    	end process;
	
      	    	process (clk, latch_dataout, dataout_sig)
  	    	begin
			if(clk'event and clk = '1') then
				if(latch_dataout = '1') then
					dataout_reg <= dataout_sig(dataout'length-1 downto 0);
				end if;
			end if;
  	    	end process;
	
            	dataout <= dataout_reg when (latch_dataout = '0') else dataout_sig;
            
          end block mb;
	end generate cutFound;

end improved_struct;
