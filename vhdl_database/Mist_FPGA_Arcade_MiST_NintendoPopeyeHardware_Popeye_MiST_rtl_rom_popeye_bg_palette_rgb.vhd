library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity popeye_bg_palette_rgb is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of popeye_bg_palette_rgb is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"FF",X"F5",X"D5",X"FE",X"EA",X"D8",X"FA",X"A4",X"BF",X"B7",X"64",X"51",X"AB",X"AC",X"48",X"B2",
		X"FF",X"76",X"FA",X"BF",X"00",X"F0",X"FE",X"E9",X"FF",X"F4",X"48",X"D0",X"FC",X"F8",X"12",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
