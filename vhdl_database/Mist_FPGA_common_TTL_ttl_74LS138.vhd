library IEEE;
use IEEE.std_logic_1164.all;
Use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ttl_74ls138 is
	port
  (
  	-- input
  	a				: in std_logic;
  	b				: in std_logic;
  	c				: in std_logic;

		g1			: in std_logic;
		g2a_n		: in std_logic;
		g2b_n		: in std_logic;
		
  	-- output
  	y_n			: out std_logic_vector(7 downto 0)
	);
end ttl_74ls138;

architecture SYN of ttl_74ls138 is

	signal enabled	: std_logic;
	
begin

	enabled <= g1 and not g2a_n and not g2b_n;

	y_n(0) <= '1' when enabled = '0' else
						not (not a and not b and not c);
	y_n(1) <= '1' when enabled = '0' else
						not (a and not b and not c);
	y_n(2) <= '1' when enabled = '0' else
						not (not a and b and not c);
	y_n(3) <= '1' when enabled = '0' else
						not (a and b and not c);
	y_n(4) <= '1' when enabled = '0' else
						not (not a and not b and c);
	y_n(5) <= '1' when enabled = '0' else
						not (a and not b and c);
	y_n(6) <= '1' when enabled = '0' else
						not (not a and b and c);
	y_n(7) <= '1' when enabled = '0' else
						not (a and b and c);

end SYN;

library IEEE;
use IEEE.std_logic_1164.all;
Use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ttl_74ls138_p is
	port
  (
  	-- input
  	a				: in std_logic;
  	b				: in std_logic;
  	c				: in std_logic;

		g1			: in std_logic;
		g2a			: in std_logic;
		g2b			: in std_logic;
		
  	-- output
  	y				: out std_logic_vector(7 downto 0)
	);
end ttl_74ls138_p;

architecture SYN of ttl_74ls138_p is

	signal g2a_n	: std_logic;
	signal g2b_n	: std_logic;
	signal y_n		: std_logic_vector(7 downto 0);
	
begin

	g2a_n <= not g2a;
	g2b_n <= not g2b;
	y <= not y_n;
	
	ttl_74ls138_inst : entity work.ttl_74ls138
		port map
		(
			a				=> a,
			b				=> b,
			c				=> c,
			g1			=> g1,
			g2a_n		=> g2a_n,
			g2b_n		=> g2b_n,
			y_n			=> y_n
		);
		
end SYN;

