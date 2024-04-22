-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;

use work.lzc_lib.all;

entity lzc_8 is
	port(
		A : in  std_logic_vector(7 downto 0);
		Z : out std_logic_vector(2 downto 0);
		V : out std_logic
	);
end lzc_8;

architecture behavior of lzc_8 is

	signal Z0 : std_logic_vector(1 downto 0);
	signal Z1 : std_logic_vector(1 downto 0);

	signal V0 : std_logic;
	signal V1 : std_logic;

	signal S0 : std_logic;
	signal S1 : std_logic;
	signal S2 : std_logic;
	signal S3 : std_logic;
	signal S4 : std_logic;

begin

	lzc_4_comp_0 : lzc_4 port map(A => A(3 downto 0), Z => Z0, V => V0);
	lzc_4_comp_1 : lzc_4 port map(A => A(7 downto 4), Z => Z1, V => V1);

	S0 <= V1 or V0;
	S1 <= (not V1) and Z0(0);
	S2 <= Z1(0) or S1;
	S3 <= (not V1) and Z0(1);
	S4 <= Z1(1) or S3;

	V <= S0;
	Z(0)   <= S2;
	Z(1)   <= S4;
	Z(2)   <= V1;

end behavior;
