library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity arbiter_dummy is
	Port(
		I_addr: in std_logic_vector(31 downto 0);
		I_clk: in std_logic;
		I_data: in std_logic_vector(31 downto 0);
		I_en: in std_logic;
		I_write: in std_logic;
		O_busy: out std_logic;
		O_data: out std_logic_vector(31 downto 0)
	);
end arbiter_dummy;


architecture Behavioral of arbiter_dummy is
begin
	O_busy <= '0';
	O_data <= X"00000000";
end Behavioral;