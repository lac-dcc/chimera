----------------------------------------------------------------------------------------------------
-- brief: True dual port ram		
-- file: tdpRAM.vhd
-- author: Lukas Leuenberger
----------------------------------------------------------------------------------------------------
-- Copyright (c) 2020 by OST – Eastern Switzerland University of Applied Sciences (www.ost.ch)
-- This code is licensed under the MIT license (see LICENSE for details)
----------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author             | Remarks
-- -------------------------------------------------------------------------------------------------
-- 0.1	   | 08.04.2020 | L. Leuenberger     | Created
----------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- Library declarations
------------------------------------------------------------------------------------------------
-- Standard library ieee	
library ieee;
-- This package defines the basic std_logic data types and a few functions.								
use ieee.std_logic_1164.all;
-- This package provides arithmetic functions for vectors.		
use ieee.numeric_std.all;
-- This package provides functions for the calcualtion with real values.
use ieee.math_real.all;
-- This package provides file specific functions.
use std.textio.all;
-- This package provides file specific functions for the std_logic types.
use ieee.std_logic_textio.all;

------------------------------------------------------------------------------------------------
-- Entity declarations
------------------------------------------------------------------------------------------------
entity tdpRAM is
	generic(
		addr_width_g : integer range 1 to 64 := 1; -- Determines how many entries are availabe in the RAM
		data_width_g : integer range 1 to 64 := 1 -- Determines the width of the data	
	);
	port(
		-- Port A
		a_clk      : in  std_logic;
		a_wr_en_in : in  std_logic;
		a_addr_in  : in  std_logic_vector(addr_width_g - 1 downto 0);
		a_data_in  : in  std_logic_vector(data_width_g - 1 downto 0);
		a_data_out : out std_logic_vector(data_width_g - 1 downto 0);
		-- Port B
		b_clk      : in  std_logic;
		b_wr_en_in : in  std_logic;
		b_addr_in  : in  std_logic_vector(addr_width_g - 1 downto 0);
		b_data_in  : in  std_logic_vector(data_width_g - 1 downto 0);
		b_data_out : out std_logic_vector(data_width_g - 1 downto 0)
	);
end;

------------------------------------------------------------------------------------------------
-- Architecture declarations
------------------------------------------------------------------------------------------------
architecture RTL of tdpRAM is
	------------------------------------------------------------------------------------------------
	-- internal types
	------------------------------------------------------------------------------------------------
	type ram_type is array (0 to (2 ** addr_width_g) - 1) of std_logic_vector(data_width_g - 1 downto 0);

	------------------------------------------------------------------------------------------------
	-- Internal variables
	------------------------------------------------------------------------------------------------
	shared variable ram : ram_type := (others => (others => '0')); -- Contains the block ram;

	------------------------------------------------------------------------------------------------
	-- Attributes
	------------------------------------------------------------------------------------------------
	attribute ram_style : string;
	attribute ram_style of ram : variable is "block";
begin
	------------------------------------------------------------------------------------------------
	-- Port A
	------------------------------------------------------------------------------------------------
	process(a_clk)
	begin
		-- Wait till the next rising edge occures
		if (rising_edge(a_clk)) then
			-- Check if data shall be written
			if (a_wr_en_in = '1') then
				-- Write the data
				ram(to_integer(unsigned(a_addr_in))) := a_data_in;
			end if;

			-- Read the data
			a_data_out <= ram(to_integer(unsigned(a_addr_in)));
		end if;
	end process;

	------------------------------------------------------------------------------------------------
	-- Port B
	------------------------------------------------------------------------------------------------
	process(b_clk)
	begin
		-- Wait till the next rising edge occures
		if (rising_edge(b_clk)) then
			-- Check if data shall be written
			if (b_wr_en_in = '1') then
				-- Write the data
				ram(to_integer(unsigned(b_addr_in))) := b_data_in;
			end if;

			-- Read the data
			b_data_out <= ram(to_integer(unsigned(b_addr_in)));
		end if;
	end process;

end RTL;
