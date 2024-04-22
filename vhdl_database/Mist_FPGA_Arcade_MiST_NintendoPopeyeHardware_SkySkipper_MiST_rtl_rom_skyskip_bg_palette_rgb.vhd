library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity skyskip_bg_palette_rgb is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of skyskip_bg_palette_rgb is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"BF",X"BF",X"FD",X"FE",X"F4",X"EC",X"F5",X"E7",X"F7",X"D1",X"F2",X"AD",X"B8",X"64",X"27",X"BF",
		X"FF",X"FF",X"6F",X"FA",X"09",X"AD",X"D6",X"7F",X"F3",X"C9",X"F5",X"FD",X"EC",X"F4",X"1D",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
