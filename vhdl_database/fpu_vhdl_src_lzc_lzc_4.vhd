-- args: --std=08 --ieee=synopsys

library ieee;
use ieee.std_logic_1164.all;

use work.lzc_lib.all;

entity lzc_4 is
	port(
		A : in  std_logic_vector(3 downto 0);
		Z : out std_logic_vector(1 downto 0);
		V : out std_logic
	);
end lzc_4;

architecture behavior of lzc_4 is

	signal A0 : std_logic := '0';
	signal A1 : std_logic := '0';
	signal A2 : std_logic := '0';
	signal A3 : std_logic := '0';

	signal S0 : std_logic;
	signal S1 : std_logic;
	signal S2 : std_logic;
	signal S3 : std_logic;
	signal S4 : std_logic;

begin

	A0 <= A(0);
	A1 <= A(1);
	A2 <= A(2);
	A3 <= A(3);

	S0 <= A3 or A2;
	S1 <= A1 or A0;
	S2 <= S1 or S0;
	S3 <= (not S0) and A1;
	S4 <= A3 or S3;

	V <= S2;
	Z(0)   <= S4;
	Z(1)   <= S0;

end behavior;
