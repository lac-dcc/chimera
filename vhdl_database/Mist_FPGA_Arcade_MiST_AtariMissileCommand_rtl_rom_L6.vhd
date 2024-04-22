library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity L6 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of L6 is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"EE",X"DD",X"BB",X"77",X"EE",X"DD",X"BB",X"77",X"FE",X"FD",X"FB",X"F7",X"EF",X"DF",X"BF",X"7F");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
