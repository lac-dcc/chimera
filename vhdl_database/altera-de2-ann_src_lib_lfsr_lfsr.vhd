LIBRARY ieee;
USE ieee.std_logic_1164.all;

package lfsr_components is

component lfsr is
	PORT (
		reset, clock : IN STD_LOGIC;
		output : OUT STD_LOGIC_VECTOR(15 downto 0)
	);
end component;
end package;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY lfsr IS
	PORT (
		reset, clock : IN STD_LOGIC;
		output : OUT STD_LOGIC_VECTOR(15 downto 0)
	);
END ENTITY lfsr;

ARCHITECTURE lfsr OF lfsr IS
	SIGNAL data : STD_LOGIC_VECTOR(15 downto 0) := x"ACE1";
BEGIN

output <= data;

PROCESS(reset, clock) IS
BEGIN
	IF (reset = '1') THEN
		data <= x"ACE1";
	ELSIF (clock = '1' AND clock'event) THEN
		data(15 downto 0) <= data(0 downto 0) & data(15 downto 1);
		data(10) <= data(10) xor data(15);
		data(12) <= data(12) xor data(15);
		data(13) <= data(13) xor data(15);
	END IF;
END PROCESS;

output <= data;
END ARCHITECTURE lfsr;

