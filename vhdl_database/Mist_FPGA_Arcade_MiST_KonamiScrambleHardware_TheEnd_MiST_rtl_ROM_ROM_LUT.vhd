library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_LUT is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of ROM_LUT is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"F6",X"00",X"16",X"C0",X"3F",X"00",X"D8",X"07",X"3F",X"00",X"C0",X"C4",X"07",
		X"00",X"C0",X"A0",X"0C",X"00",X"00",X"00",X"07",X"00",X"F6",X"07",X"F0",X"00",X"76",X"07",X"C6");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
