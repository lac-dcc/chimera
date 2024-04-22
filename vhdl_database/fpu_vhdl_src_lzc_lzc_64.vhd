-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;

use work.lzc_lib.all;

entity lzc_64 is
	port(
		A : in  std_logic_vector(63 downto 0);
		Z : out std_logic_vector(5 downto 0);
		V : out std_logic
	);
end lzc_64;

architecture behavior of lzc_64 is

	signal Z0 : std_logic_vector(4 downto 0);
	signal Z1 : std_logic_vector(4 downto 0);

	signal V0 : std_logic;
	signal V1 : std_logic;

	signal S0  : std_logic;
	signal S1  : std_logic;
	signal S2  : std_logic;
	signal S3  : std_logic;
	signal S4  : std_logic;
	signal S5  : std_logic;
	signal S6  : std_logic;
	signal S7  : std_logic;
	signal S8  : std_logic;
	signal S9  : std_logic;
	signal S10 : std_logic;

begin

	lzc_32_comp_0 : lzc_32 port map(A => A(31 downto 0), Z => Z0, V => V0);
	lzc_32_comp_1 : lzc_32 port map(A => A(63 downto 32), Z => Z1, V => V1);

	S0  <= V1 or V0;
	S1  <= (not V1) and Z0(0);
	S2  <= Z1(0) or S1;
	S3  <= (not V1) and Z0(1);
	S4  <= Z1(1) or S3;
	S5  <= (not V1) and Z0(2);
	S6  <= Z1(2) or S5;
	S7  <= (not V1) and Z0(3);
	S8  <= Z1(3) or S7;
	S9  <= (not V1) and Z0(4);
	S10 <= Z1(4) or S9;

	V <= S0;
	Z(0)   <= S2;
	Z(1)   <= S4;
	Z(2)   <= S6;
	Z(3)   <= S8;
	Z(4)   <= S10;
	Z(5)   <= V1;

end behavior;
