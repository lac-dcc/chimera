library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity popeye_ch_palette_rgb is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of popeye_ch_palette_rgb is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"87",X"0F",X"09",X"5B",X"F8",X"2F",X"D0",X"52",X"00",X"C9",X"C0",X"8C",X"00",X"50",X"2F",X"FF",
		X"87",X"0F",X"09",X"5B",X"F8",X"2F",X"D0",X"52",X"00",X"C9",X"C0",X"8C",X"00",X"50",X"2F",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
