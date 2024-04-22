
LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY MULT18X18 IS
	PORT
	(
		A		: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
		B		: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
		P		: OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
	);
END MULT18X18;


ARCHITECTURE SYN OF mult18x18 IS

	COMPONENT lpm_mult
	GENERIC (
		lpm_hint		: STRING;
		lpm_representation		: STRING;
		lpm_type		: STRING;
		lpm_widtha		: NATURAL;
		lpm_widthb		: NATURAL;
		lpm_widthp		: NATURAL
	);
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (17 DOWNTO 0);
			result	: OUT STD_LOGIC_VECTOR (35 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	lpm_mult_component : lpm_mult
	GENERIC MAP (
		lpm_hint => "MAXIMIZE_SPEED=5",
		lpm_representation => "SIGNED",
		lpm_type => "LPM_MULT",
		lpm_widtha => 18,
		lpm_widthb => 18,
		lpm_widthp => 36
	)
	PORT MAP (
		dataa => A,
		datab => B,
		result => P
	);

END SYN;

