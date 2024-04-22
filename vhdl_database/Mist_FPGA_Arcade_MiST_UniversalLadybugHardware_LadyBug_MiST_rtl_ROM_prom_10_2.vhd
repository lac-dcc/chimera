library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_10_2 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of prom_10_2 is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"F5",X"90",X"41",X"54",X"94",X"11",X"80",X"65",X"05",X"D4",X"01",X"00",X"B1",X"A0",X"00",X"F5",
		X"04",X"B1",X"00",X"15",X"11",X"25",X"90",X"D0",X"A0",X"90",X"15",X"84",X"B5",X"04",X"04",X"04");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
