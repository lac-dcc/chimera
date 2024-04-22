-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;

use work.lzc_lib.all;

entity lzc_16 is
	port(
		A : in  std_logic_vector(15 downto 0);
		Z : out std_logic_vector(3 downto 0);
		V : out std_logic
	);
end lzc_16;

architecture behavior of lzc_16 is

	signal Z0 : std_logic_vector(2 downto 0);
	signal Z1 : std_logic_vector(2 downto 0);

	signal V0 : std_logic;
	signal V1 : std_logic;

	signal S0 : std_logic;
	signal S1 : std_logic;
	signal S2 : std_logic;
	signal S3 : std_logic;
	signal S4 : std_logic;
	signal S5 : std_logic;
	signal S6 : std_logic;

begin

	lzc_8_comp_0 : lzc_8 port map(A => A(7 downto 0), Z => Z0, V => V0);
	lzc_8_comp_1 : lzc_8 port map(A => A(15 downto 8), Z => Z1, V => V1);

	S0 <= V1 or V0;
	S1 <= (not V1) and Z0(0);
	S2 <= Z1(0) or S1;
	S3 <= (not V1) and Z0(1);
	S4 <= Z1(1) or S3;
	S5 <= (not V1) and Z0(2);
	S6 <= Z1(2) or S5;

	V <= S0;
	Z(0)   <= S2;
	Z(1)   <= S4;
	Z(2)   <= S6;
	Z(3)   <= V1;

end behavior;
