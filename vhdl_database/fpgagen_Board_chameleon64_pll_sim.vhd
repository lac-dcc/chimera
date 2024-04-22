LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY pll IS
	PORT
	(
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC;
		c1		: OUT STD_LOGIC;
		c2		: OUT STD_LOGIC
	);
END pll;

ARCHITECTURE sim OF pll IS
signal c0_ff	: std_logic;
signal c1_ff	: std_logic;
BEGIN

c0 <= c0_ff;
c1 <= c1_ff;
c2 <= not c1_ff;

process
begin
	c0_ff <= '0';
	wait for 11.63 ns;
	c0_ff <= '1';
	wait for 11.64 ns;
end process;

process
begin
	c1_ff <= '0';
	wait for 5 ns;
	-- wait for 4 ns;
	c1_ff <= '1';
	wait for 5 ns;
	-- wait for 4 ns;
end process;

END sim;
