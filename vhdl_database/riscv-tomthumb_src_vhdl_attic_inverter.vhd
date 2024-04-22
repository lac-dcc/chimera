library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity inverter is
	Port(
		I_signal: in std_logic;
		O_inverted: out std_logic := '0'
	);
end inverter;


architecture Behavioral of inverter is
begin
	process(I_signal)
	begin
		O_inverted <= not I_signal;
	end process;
end Behavioral;