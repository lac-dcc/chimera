library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_10_2 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of prom_10_2 is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"FF",X"BB",X"4E",X"21",X"9E",X"DB",X"DE",X"1E",X"9E",X"4F",X"DE",X"10",X"00",X"FF",X"90",X"FF",
		X"21",X"21",X"21",X"21",X"90",X"00",X"00",X"00",X"90",X"DE",X"9E",X"00",X"DE",X"BB",X"1E",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
