library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity pooyan_palette is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of pooyan_palette is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"07",X"38",X"C0",X"3F",X"C7",X"26",X"03",X"0D",X"2F",X"D1",X"C3",X"F0",X"B8",X"D8",X"FE",
		X"00",X"07",X"38",X"80",X"3F",X"C7",X"26",X"03",X"0D",X"2F",X"34",X"20",X"F0",X"B8",X"D8",X"FE");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
