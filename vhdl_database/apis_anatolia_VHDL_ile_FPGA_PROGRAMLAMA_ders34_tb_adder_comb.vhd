library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_adder_comb is
end tb_adder_comb;

architecture Behavioral of tb_adder_comb is

component adder_comb is
port (
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
end component;

signal A	: std_logic_vector (7 downto 0) := (others => '0');
signal B	: std_logic_vector (7 downto 0) := (others => '0');
signal C	: std_logic_vector (7 downto 0) := (others => '0');
signal D	: std_logic_vector (7 downto 0) := (others => '0');
signal E	: std_logic_vector (7 downto 0) := (others => '0');
signal F	: std_logic_vector (7 downto 0) := (others => '0');
signal G	: std_logic_vector (7 downto 0) := (others => '0');
signal H	: std_logic_vector (7 downto 0) := (others => '0');
signal sum	: std_logic_vector (10 downto 0);

begin


DUT : adder_comb
port map(
A	=> A	  ,
B	=> B	  ,
C	=> C	  ,
D	=> D	  ,
E	=> E	  ,
F	=> F	  ,
G	=> G	  ,
H	=> H	  ,
sum	=> sum	
);

process begin

wait for 10 ns;

A	<= x"11";
B	<= x"11";
C	<= x"11";
D	<= x"11";
E	<= x"11";
F	<= x"11";
G	<= x"11";
H	<= x"11";

wait for 10 ns;

assert false
report "SIM DONE"
severity failure;

end process;


end Behavioral;