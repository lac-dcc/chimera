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
		X"00",X"94",X"83",X"A7",X"00",X"F3",X"FC",X"F4",X"00",X"D5",X"E3",X"28",X"00",X"67",X"D3",X"15",
		X"00",X"3F",X"CF",X"7F",X"00",X"F7",X"FA",X"F8",X"00",X"F1",X"F8",X"FA",X"00",X"F8",X"F3",X"F2");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
