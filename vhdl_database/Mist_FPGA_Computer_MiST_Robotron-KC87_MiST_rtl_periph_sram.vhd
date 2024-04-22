-- einfacher blockram
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sram is
	generic(
		AddrWidth	: integer := 11;
		DataWidth	: integer := 8
	);
	port (
		clk	: in std_logic;
		addr	: in std_logic_vector(AddrWidth - 1 downto 0);
		din	: in std_logic_vector(DataWidth - 1 downto 0);
		dout	: out std_logic_vector(DataWidth - 1 downto 0);
		we_n	: in std_logic;
		ce_n	: in std_logic
	);
end sram;

architecture rtl of sram is
	type mem is array (natural range <>) of std_logic_vector(DataWidth - 1 downto 0);
	signal ram: mem(0 to 2 ** AddrWidth - 1) := (others => (others => '0'));
	
begin
	process
	begin
		wait until rising_edge(clk);
		
		if we_n = '0' and ce_n = '0' then
			ram(to_integer(unsigned(addr))) <= din;
		end if;
		dout <= ram(to_integer(unsigned(addr)));
		
	end process;
end rtl;
	