library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
generic (
N	: integer := 8
);
port (
SW		: in std_logic_vector (15 downto 0);
BTNL	: in std_logic;
LED		: out std_logic_vector (8 downto 0)
);
end top;

architecture Behavioral of top is

-- COMPONENT DECLERATION
component nbit_adder is
generic (
N	: integer := 8
); 
port (
a_i		: in std_logic_vector (N-1 downto 0);
b_i		: in std_logic_vector (N-1 downto 0);
carry_i	: in std_logic;
sum_o	: out std_logic_vector (N-1 downto 0);
carry_o	: out std_logic
);
end component;

begin

-- COMPONENT INSTANTIATION
nbit_adder_i : nbit_adder
generic map(
N	=> N
)
port map(
a_i		=> SW(7 downto 0),
b_i		=> SW(15 downto 8),
carry_i	=> BTNL,
sum_o	=> LED(7 downto 0),
carry_o	=> LED(8)
);

end Behavioral;