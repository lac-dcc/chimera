-- -----------------------------------------------------------------------
--
-- Syntiac's generic VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
--
-- Modified April 2016 by Dar (darfpga@aol.fr) 
-- http://darfpga.blogspot.fr
--   Remove address register when writing
--
-- -----------------------------------------------------------------------
--
-- spram.vhd
--
-- -----------------------------------------------------------------------
--
-- generic ram.
--
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity spram is
	generic (
		dWidth : integer := 8;
		aWidth : integer := 10
	);
	port (
		clk : in std_logic;
		we : in std_logic := '0';
		addr : in std_logic_vector((aWidth-1) downto 0);
		d : in std_logic_vector((dWidth-1) downto 0) := (others => '0');
		q : out std_logic_vector((dWidth-1) downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of spram is
	subtype addressRange is integer range 0 to ((2**aWidth)-1);
	type ramDef is array(addressRange) of std_logic_vector((dWidth-1) downto 0);
	signal ram: ramDef;
begin

-- -----------------------------------------------------------------------
	process(clk)
	begin
		if rising_edge(clk) then
			if we = '1' then
				ram(to_integer(unsigned(addr))) <= d;
			end if;
			q <= ram(to_integer(unsigned(addr)));
		end if;
	end process;

end architecture;

