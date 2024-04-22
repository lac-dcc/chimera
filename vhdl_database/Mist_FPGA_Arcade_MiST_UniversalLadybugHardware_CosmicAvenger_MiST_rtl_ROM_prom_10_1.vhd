library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_10_1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of prom_10_1 is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"78",X"A3",X"B5",X"00",X"8C",X"79",X"64",X"00",X"C3",X"EE",X"DD",X"00",X"3C",X"A2",X"4A",
		X"00",X"87",X"BA",X"DE",X"00",X"2A",X"AE",X"BB",X"00",X"8C",X"C2",X"B7",X"00",X"AC",X"E2",X"1D");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
