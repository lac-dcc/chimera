library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_10_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of prom_10_1 is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"59",X"33",X"B8",X"00",X"D4",X"A3",X"8D",X"00",X"2C",X"63",X"DD",X"00",X"22",X"38",X"1D",
		X"00",X"93",X"3A",X"DD",X"00",X"E2",X"38",X"DD",X"00",X"82",X"3A",X"D8",X"00",X"22",X"68",X"1D");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
