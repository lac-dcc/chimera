library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_E2 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(3 downto 0)
);
end entity;

architecture prom of ROM_E2 is
	type rom is array(0 to  255) of std_logic_vector(3 downto 0);
	signal rom_data: rom := (
		X"4",X"1",X"3",X"6",X"5",X"4",X"5",X"4",X"5",X"4",X"4",X"4",X"4",X"4",X"5",X"4",
		X"5",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"5",X"5",X"5",X"5",X"4",
		X"5",X"4",X"5",X"5",X"5",X"4",X"5",X"5",X"4",X"5",X"5",X"4",X"4",X"4",X"4",X"4",
		X"4",X"5",X"5",X"4",X"5",X"4",X"5",X"4",X"5",X"5",X"4",X"5",X"5",X"4",X"4",X"4",
		X"4",X"4",X"4",X"4",X"5",X"5",X"4",X"4",X"5",X"4",X"5",X"4",X"4",X"4",X"4",X"5",
		X"4",X"5",X"4",X"4",X"4",X"4",X"5",X"4",X"4",X"4",X"4",X"4",X"5",X"4",X"5",X"5",
		X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"5",X"4",X"4",X"4",X"4",X"5",X"4",X"5",X"5",
		X"4",X"4",X"5",X"4",X"5",X"4",X"4",X"4",X"4",X"5",X"4",X"4",X"4",X"5",X"5",X"4",
		X"5",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"5",X"4",X"4",X"4",X"5",X"4",X"5",
		X"4",X"4",X"3",X"4",X"5",X"4",X"4",X"4",X"4",X"4",X"3",X"4",X"4",X"4",X"4",X"4",
		X"4",X"4",X"5",X"4",X"5",X"4",X"4",X"4",X"5",X"4",X"5",X"5",X"4",X"5",X"4",X"5",
		X"4",X"4",X"5",X"4",X"4",X"4",X"4",X"5",X"5",X"4",X"5",X"4",X"5",X"4",X"4",X"4",
		X"5",X"5",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"5",
		X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"5",X"5",X"5",X"4",X"5",X"5",X"4",X"5",
		X"4",X"5",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",
		X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"4",X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"0");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
