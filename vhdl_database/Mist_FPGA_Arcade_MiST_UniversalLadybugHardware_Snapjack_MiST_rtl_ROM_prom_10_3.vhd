library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_10_3 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of prom_10_3 is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"37",X"37",X"37",X"37",X"37",X"37",X"37",X"37",X"3A",X"3A",X"3A",X"3A",X"28",X"28",X"38",X"38",
		X"08",X"08",X"38",X"38",X"20",X"20",X"38",X"38",X"20",X"20",X"38",X"38",X"3E",X"3E",X"3E",X"3E");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
