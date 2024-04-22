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
--------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;	
use ahir.Types.all;	
use ahir.Subprograms.all;	
use ahir.mem_function_pack.all;
use ahir.memory_subsystem_package.all;

use ahir.MemcutDescriptionPackage.all;
use ahir.MemCutsPackage.all;
use ahir.mem_ASIC_components.all;
use ahir.mem_component_pack.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;

entity dpmem_column is
   generic (name: string:="dpmem_column"; 
	g_addr_width: natural := 2;
	g_base_bank_addr_width: natural:=4; 
	g_base_bank_data_width : natural := 4);
   port (datain_0 : in std_logic_vector(g_base_bank_data_width-1 downto 0);
         dataout_0: out std_logic_vector(g_base_bank_data_width-1 downto 0);
         addrin_0: in std_logic_vector(g_addr_width-1 downto 0);
         enable_0: in std_logic;
         writebar_0 : in std_logic;
	 datain_1 : in std_logic_vector(g_base_bank_data_width-1 downto 0);
         dataout_1: out std_logic_vector(g_base_bank_data_width-1 downto 0);
         addrin_1: in std_logic_vector(g_addr_width-1 downto 0);
         enable_1: in std_logic;
         writebar_1 : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity dpmem_column;


architecture struct of dpmem_column is

  --finding the number of row-replications in the column being build
  constant n_rows: integer := 2**(Maximum(0, g_addr_width - g_base_bank_addr_width));
  type WordArray is array  ( natural range <> ) of std_logic_vector (g_base_bank_data_width-1 downto 0);

  --fixing the size of address to maximum of addr_width, cut_width
  constant resized_addr_width: integer := Maximum (g_addr_width, g_base_bank_addr_width);
  
  signal resized_addrin_0: std_logic_vector(resized_addr_width-1 downto 0);  
  signal resized_addrin_1: std_logic_vector(resized_addr_width-1 downto 0);  

begin

  process (addrin_0, addrin_1)
	begin 
		resized_addrin_0 <= (others => '0');
		resized_addrin_1 <= (others => '0');
		resized_addrin_0(addrin_0'length-1 downto 0) <= addrin_0;
		resized_addrin_1(addrin_1'length-1 downto 0) <= addrin_1;
  end process;
	
  rowgen_block : block
	  signal decoded_CSB_0, decoded_CSB_0_d: std_logic_vector(n_rows-1 downto 0):= (others=>'1');
	  signal decoded_CSB_1, decoded_CSB_1_d: std_logic_vector(n_rows-1 downto 0):= (others=>'1');
	  
  	   signal dataout_array_0 : WordArray(n_rows-1 downto 0);
  	   signal dataout_array_1 : WordArray(n_rows-1 downto 0);

	begin
	  process(enable_0, resized_addrin_0, clk, reset)
	  	variable decoded_CSB_0_var: 
			std_logic_vector(2**Maximum(0, g_addr_width-g_base_bank_addr_width)-1 downto 0):= 
								(others=>'1');
	    begin
		if (enable_0 = '1' and reset = '0') then
		  decoded_CSB_0_var := MemDecoder(resized_addrin_0(resized_addr_width-1
		  downto resized_addr_width - Ceil_log2(n_rows)));
		else 
		  decoded_CSB_0_var := (others=>'1');
		end if;
		
		decoded_CSB_0 <= decoded_CSB_0_var;
		if(clk'event and clk = '1') then
			decoded_CSB_0_d <= decoded_CSB_0_var;
	 	end if;

	  end process;
	  
	  process(enable_1, resized_addrin_1,  clk, reset)
	  	variable decoded_CSB_1_var: 
			std_logic_vector(2**Maximum(0, g_addr_width-g_base_bank_addr_width)-1 downto 0)
										:= (others=>'1');
	    begin
		if (enable_1 = '1' and reset = '0') then
		  decoded_CSB_1_var := MemDecoder(resized_addrin_1(resized_addr_width-1
		  downto resized_addr_width - Ceil_log2(n_rows)));
		else 
		  decoded_CSB_1_var := (others=>'1');
		end if;
		decoded_CSB_1 <= decoded_CSB_1_var;
		if(clk'event and clk = '1') then
			decoded_CSB_1_d <= decoded_CSB_1_var;
	 	end if;
	  end process;

	  row_gen: for j in 0 to n_rows-1 generate
		mem_inst: dpmem_selector generic map(address_width => g_base_bank_addr_width,
					data_width => g_base_bank_data_width )
		port map(ADDR_0 => resized_addrin_0 (g_base_bank_addr_width-1 downto 0),
			 ADDR_1 => resized_addrin_1 (g_base_bank_addr_width-1 downto 0),
			 ENABLE_0_BAR => decoded_CSB_0(j),
			 ENABLE_1_BAR => decoded_CSB_1(j),
			 WRITE_0_BAR  => writebar_0,
			 WRITE_1_BAR  => writebar_1,
			 DATAIN_0 => datain_0,
			 DATAIN_1 => datain_1,
			 DATAOUT_0 => dataout_array_0(j),
			 DATAOUT_1 => dataout_array_1(j),
			 CLK => clk, RESET => reset );
	  end generate row_gen;

	-- muxes.
          process(dataout_array_0, decoded_CSB_0_d)
		variable sel_data_var: std_logic_vector(g_base_bank_data_width-1 downto 0);
	  begin
		sel_data_var := (others => '0');
		for I in 0 to n_rows-1 loop
			if(decoded_CSB_0_d(I) = '0') then
				sel_data_var := dataout_array_0(I);
			end if;
		end loop;
		dataout_0 <= sel_data_var;
	  end process;
          process(dataout_array_1, decoded_CSB_1_d)
		variable sel_data_var: std_logic_vector(g_base_bank_data_width-1 downto 0);
	  begin
		sel_data_var := (others => '0');
		for I in 0 to n_rows-1 loop
			if(decoded_CSB_1_d(I) = '0') then
				sel_data_var := dataout_array_1(I);
			end if;
		end loop;
		dataout_1 <= sel_data_var;
	  end process;
  end block rowgen_block;
end struct;
