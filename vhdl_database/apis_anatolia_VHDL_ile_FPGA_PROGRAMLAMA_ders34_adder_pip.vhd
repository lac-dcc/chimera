library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity adder_pip is
port (
clk	: in std_logic;
A	: in std_logic_vector (7 downto 0);
B	: in std_logic_vector (7 downto 0);
C	: in std_logic_vector (7 downto 0);
D	: in std_logic_vector (7 downto 0);
E	: in std_logic_vector (7 downto 0);
F	: in std_logic_vector (7 downto 0);
G	: in std_logic_vector (7 downto 0);
H	: in std_logic_vector (7 downto 0);
sum	: out std_logic_vector (10 downto 0)
);
end adder_pip;

architecture Behavioral of adder_pip is

signal sum1_L1	: std_logic_vector (8 downto 0) := (others => '0');
signal sum2_L1	: std_logic_vector (8 downto 0) := (others => '0');
signal sum3_L1	: std_logic_vector (8 downto 0) := (others => '0');
signal sum4_L1	: std_logic_vector (8 downto 0) := (others => '0');
signal sum1_L2	: std_logic_vector (9 downto 0) := (others => '0');
signal sum2_L2	: std_logic_vector (9 downto 0) := (others => '0');

begin

process (clk) begin
if (rising_edge(clk)) then

	-- L1 adders
	sum1_L1	<= ('0' & A) + ('0' & B);
	sum2_L1	<= ('0' & C) + ('0' & D);
	sum3_L1	<= ('0' & E) + ('0' & F);
	sum4_L1	<= ('0' & G) + ('0' & H);

	-- L2 adders
	sum1_L2	<= ('0' & sum1_L1) + ('0' & sum2_L1);
	sum2_L2	<= ('0' & sum3_L1) + ('0' & sum4_L1);
	
	-- L3 adder
	sum	<= ('0' & sum1_L2) + ('0' & sum2_L2);

end if;
end process;

end Behavioral;