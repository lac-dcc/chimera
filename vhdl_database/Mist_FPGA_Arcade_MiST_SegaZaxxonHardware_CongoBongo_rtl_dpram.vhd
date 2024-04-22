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
-- dpram.vhd
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

entity dpram is
	generic (
		dWidth : integer := 8;
		aWidth : integer := 10
	);
	port (
		clk_a : in std_logic;
		we_a : in std_logic := '0';
		addr_a : in std_logic_vector((aWidth-1) downto 0);
		d_a : in std_logic_vector((dWidth-1) downto 0) := (others => '0');
		q_a : out std_logic_vector((dWidth-1) downto 0);

		clk_b : in std_logic;
		we_b : in std_logic := '0';
		addr_b : in std_logic_vector((aWidth-1) downto 0);
		d_b : in std_logic_vector((dWidth-1) downto 0) := (others => '0');
		q_b : out std_logic_vector((dWidth-1) downto 0)
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of dpram is
	subtype addressRange is integer range 0 to ((2**aWidth)-1);
	type ramDef is array(addressRange) of std_logic_vector((dWidth-1) downto 0);
	signal ram: ramDef;
	ATTRIBUTE ramstyle : string;
	ATTRIBUTE ramstyle OF ram : SIGNAL IS "no_rw_check";
	signal addr_a_reg: std_logic_vector((aWidth-1) downto 0);
	signal addr_b_reg: std_logic_vector((aWidth-1) downto 0);
begin

-- -----------------------------------------------------------------------
	process(clk_a)
	begin
		if rising_edge(clk_a) then
			if we_a = '1' then
				ram(to_integer(unsigned(addr_a))) <= d_a;
				q_a <= d_a;
			else
				q_a <= ram(to_integer(unsigned(addr_a)));
			end if;
		end if;
	end process;

	process(clk_b)
	begin
		if rising_edge(clk_b) then
			if we_b = '1' then
				ram(to_integer(unsigned(addr_b))) <= d_b;
				q_b <= d_b;
			else
				q_b <= ram(to_integer(unsigned(addr_b)));
			end if;
		end if;
	end process;
	
end architecture;

