library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity midssio_82s123 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of midssio_82s123 is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"FF",X"FF",X"FE",X"FF",X"FF",X"FD",X"FF",X"FE",X"FF",X"F7",
		X"FB",X"EF",X"6D",X"07",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
