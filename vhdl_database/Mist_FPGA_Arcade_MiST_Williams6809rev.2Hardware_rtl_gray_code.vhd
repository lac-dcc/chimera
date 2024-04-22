library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity gray_code is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(5 downto 0);
	data : out std_logic_vector(5 downto 0)
);
end entity;

architecture prom of gray_code is
	type rom is array(0 to  63) of std_logic_vector(5 downto 0);
	signal rom_data: rom := (
		"000000",
		"000001",
		"000011",
		"000010",
		"000110",
		"000111",
		"000101",
		"000100",

		"001100",
		"001101",
		"001111",
		"001110",
		"001010",
		"001011",
		"001001",
		"001000",

		"011000",
		"011001",
		"011011",
		"011010",
		"011110",
		"011111",
		"011101",
		"011100",

		"010100",
		"010101",
		"010111",
		"010110",
		"010010",
		"010011",
		"010001",
		"010000",

		"110000",
		"110001",
		"110011",
		"110010",
		"110110",
		"110111",
		"110101",
		"110100",

		"111100",
		"111101",
		"111111",
		"111110",
		"111010",
		"111011",
		"111001",
		"111000",

		"101000",
		"101001",
		"101011",
		"101010",
		"101110",
		"101111",
		"101101",
		"101100",

		"100100",
		"100101",
		"100111",
		"100110",
		"100010",
		"100011",
		"100001",
		"100000"
		
		);
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
