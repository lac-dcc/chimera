library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity dec_315_5061 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(6 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of dec_315_5061 is
	type rom is array(0 to  127) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
	 x"28",x"08",x"20",x"00", x"28",x"08",x"20",x"00",
	 x"80",x"00",x"a0",x"20", x"08",x"88",x"00",x"80",
	 x"80",x"00",x"a0",x"20", x"08",x"88",x"00",x"80",
	 x"a0",x"80",x"20",x"00", x"20",x"28",x"a0",x"a8",
	 x"28",x"08",x"20",x"00", x"88",x"80",x"a8",x"a0",
	 x"80",x"00",x"a0",x"20", x"08",x"88",x"00",x"80",
	 x"80",x"00",x"a0",x"20", x"20",x"28",x"a0",x"a8",
	 x"20",x"28",x"a0",x"a8", x"08",x"88",x"00",x"80",
	 x"88",x"80",x"a8",x"a0", x"28",x"08",x"20",x"00",
	 x"80",x"00",x"a0",x"20", x"a0",x"80",x"20",x"00",
	 x"20",x"28",x"a0",x"a8", x"08",x"88",x"00",x"80",
	 x"80",x"00",x"a0",x"20", x"20",x"28",x"a0",x"a8",
	 x"88",x"80",x"a8",x"a0", x"88",x"80",x"a8",x"a0",
	 x"80",x"00",x"a0",x"20", x"08",x"88",x"00",x"80",
	 x"80",x"00",x"a0",x"20", x"28",x"08",x"20",x"00",
	 x"20",x"28",x"a0",x"a8", x"a0",x"80",x"20",x"00");

begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
