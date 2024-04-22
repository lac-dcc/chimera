library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity col is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(4 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of col is
	type rom is array(0 to  31) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"C7",X"F0",X"3F",X"00",X"DB",X"C6",X"38",X"00",X"F0",X"15",X"1F",X"00",X"F6",X"06",X"07",
		X"00",X"91",X"07",X"F6",X"00",X"F0",X"FE",X"07",X"00",X"38",X"07",X"FE",X"00",X"07",X"3F",X"FE");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
