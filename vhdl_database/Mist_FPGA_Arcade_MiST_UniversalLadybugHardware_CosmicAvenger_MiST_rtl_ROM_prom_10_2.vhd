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
		X"F5",X"C4",X"D0",X"B1",X"D4",X"90",X"45",X"44",X"00",X"54",X"91",X"94",X"25",X"21",X"65",X"F5",
		X"21",X"00",X"25",X"D0",X"B1",X"90",X"D4",X"D4",X"25",X"B1",X"C4",X"90",X"65",X"D4",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
