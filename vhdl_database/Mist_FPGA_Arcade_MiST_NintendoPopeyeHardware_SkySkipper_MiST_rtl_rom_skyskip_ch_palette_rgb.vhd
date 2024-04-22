library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity skyskip_ch_palette_rgb is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of skyskip_ch_palette_rgb is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"C0",X"F8",X"39",X"5C",X"67",X"39",X"0F",X"09",X"B9",X"C2",X"97",X"C0",X"08",X"2F",X"CF",X"EC",
		X"C0",X"F8",X"39",X"5C",X"67",X"39",X"0F",X"09",X"B9",X"C2",X"97",X"C0",X"08",X"2F",X"CF",X"F5");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
