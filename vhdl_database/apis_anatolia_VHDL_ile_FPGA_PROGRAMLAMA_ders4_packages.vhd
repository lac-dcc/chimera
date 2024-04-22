library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- commonly used packages
-- IEEE 1164 standard
--	use IEEE.STD_LOGIC_1164.ALL;
--  use IEEE.NUMERIC_STD.ALL;
--	-- SYNOPSYS extension to IEEE 1164
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
--	-- FOR SIMULATION
--	use IEEE.STD_LOGIC_TEXTIO.ALL;

entity packages is
Port ( 
s0_i	: in std_logic_vector (7 downto 0);
s1_i	: in std_logic_vector (7 downto 0);
s_o		: out STD_LOGIC
);
end packages;

architecture Behavioral of packages is

signal s0	: std_logic_vector (7 downto 0) := x"00";

begin

s0	<= s0_i + s1_i;

process (s0) begin

	if (s0 > 20) then
		s_o	<= '1';
	else
		s_o	<= '0';
	end if;

end process;

end Behavioral;