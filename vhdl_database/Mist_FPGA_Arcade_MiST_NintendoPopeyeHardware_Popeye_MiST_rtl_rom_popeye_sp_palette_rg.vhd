library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity popeye_sp_palette_rg is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of popeye_sp_palette_rg is
	type rom is array(0 to  255) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"00",X"00",X"0F",X"08",X"00",X"05",X"0F",X"08",X"00",X"0F",
		X"0F",X"08",X"00",X"07",X"0F",X"03",X"08",X"0F",X"0F",X"09",X"07",X"0F",X"0F",X"0C",X"00",X"0B",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"00",X"00",X"0F",X"08",X"00",X"04",X"0F",X"08",X"00",X"00",
		X"0F",X"08",X"09",X"09",X"0F",X"0B",X"09",X"0F",X"0F",X"09",X"07",X"0F",X"0F",X"03",X"00",X"00",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"00",X"00",X"0F",X"08",X"00",X"04",X"0F",X"08",X"00",X"07",
		X"0F",X"07",X"0F",X"00",X"0F",X"0D",X"00",X"00",X"0F",X"09",X"07",X"0F",X"0F",X"0D",X"00",X"08",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"08",X"08",X"0F",X"0A",X"00",X"00",X"0F",X"08",X"0F",X"08",
		X"0F",X"08",X"00",X"0A",X"0F",X"00",X"00",X"00",X"0F",X"00",X"00",X"00",X"0F",X"00",X"00",X"00",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"00",X"00",X"0F",X"08",X"00",X"05",X"0F",X"08",X"00",X"0F",
		X"0F",X"08",X"00",X"07",X"0F",X"03",X"08",X"0F",X"0F",X"09",X"07",X"0F",X"0F",X"0C",X"00",X"0B",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"00",X"00",X"0F",X"08",X"00",X"04",X"0F",X"08",X"00",X"00",
		X"0F",X"08",X"09",X"09",X"0F",X"0B",X"09",X"0F",X"0F",X"09",X"07",X"0F",X"0F",X"03",X"00",X"00",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"00",X"00",X"0F",X"08",X"00",X"04",X"0F",X"08",X"00",X"07",
		X"0F",X"07",X"0F",X"00",X"0F",X"0D",X"00",X"00",X"0F",X"09",X"07",X"0F",X"0F",X"0D",X"00",X"08",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"08",X"08",X"0F",X"0A",X"00",X"00",X"0F",X"08",X"0F",X"08",
		X"0F",X"08",X"00",X"0A",X"0F",X"00",X"00",X"00",X"0F",X"00",X"00",X"00",X"0F",X"00",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
