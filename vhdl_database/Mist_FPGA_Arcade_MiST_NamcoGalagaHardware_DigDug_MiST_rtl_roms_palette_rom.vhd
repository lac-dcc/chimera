library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity palette_rom is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of palette_rom is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"2F",X"F6",X"1E",X"28",X"0D",X"36",X"04",X"80",X"5B",X"07",X"A4",X"52",X"5A",X"65",X"00",
		X"00",X"07",X"2F",X"28",X"E8",X"F6",X"36",X"1F",X"65",X"14",X"0A",X"DF",X"D8",X"D0",X"84",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
