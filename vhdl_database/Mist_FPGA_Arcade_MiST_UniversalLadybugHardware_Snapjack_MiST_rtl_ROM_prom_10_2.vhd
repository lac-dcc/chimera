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
		X"F5",X"05",X"54",X"C1",X"C4",X"94",X"84",X"24",X"D0",X"90",X"A1",X"00",X"31",X"50",X"25",X"F5",
		X"90",X"31",X"05",X"25",X"05",X"94",X"30",X"41",X"05",X"94",X"61",X"30",X"94",X"50",X"05",X"A5");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
