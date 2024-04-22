library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity rgb is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of rgb is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"F6",X"07",X"3F",X"27",X"2F",X"C7",X"F8",X"ED",X"16",X"38",X"21",X"D8",X"C4",X"C0",X"A0",X"00",
		X"F6",X"07",X"3F",X"27",X"00",X"C7",X"F8",X"E8",X"00",X"38",X"00",X"D8",X"C5",X"C0",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
