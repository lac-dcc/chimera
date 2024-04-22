-- Note: Source contained in this file is not mine but was found online in a 
-- research document authored by Nursani Rahmatullah. Reference link:
-- http://read.pudn.com/downloads166/ebook/757199/full%20digital%20FM%20receiver.pdf
--
-- Use at your own risk!
--
-- This is the top-level module file for the Digital Phase-Locked Loop (PLL) module
-- as described in the document linked above

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.numeric_std.ALL;
ENTITY circuit IS
	PORT(clk : IN std_logic;
		reset : IN std_logic;
		fmin : IN std_logic_vector(7 downto 0);
		dmout : OUT std_logic_vector (11 DOWNTO 0)
	);
END circuit ;
ARCHITECTURE behavior OF circuit IS
	SIGNAL d1 : signed(11 DOWNTO 0);
	SIGNAL d2 : signed(11 DOWNTO 0);
	SIGNAL dout : signed(7 DOWNTO 0);
	SIGNAL output : signed(7 DOWNTO 0);
	
	COMPONENT multiplier
		PORT ( clk : IN std_logic ;
			reset : IN std_logic ;
			input1 : IN std_logic_vector (7 DOWNTO 0);
			input2 : IN signed (7 DOWNTO 0);
			output : OUT signed (7 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT fir
		PORT ( clock : IN std_logic ;
		reset : IN std_logic ;
		data_in : IN signed (11 DOWNTO 0);
		data_out : OUT std_logic_vector (11 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT loop_filter
		PORT (clk : IN std_logic ;
		reset : IN std_logic ;
		c : IN signed (7 DOWNTO 0);
		d1 : OUT signed (11 DOWNTO 0);
		d2 : OUT signed (11 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT nco
		PORT (clk : IN std_logic ;
		reset : IN std_logic ;
		din : IN signed (11 DOWNTO 0);
		dout : OUT signed (7 DOWNTO 0)
		);
	END COMPONENT;
	
BEGIN
I1 : multiplier
PORT MAP (
clk => clk,
reset => reset,
input1 => fmin,
input2 => dout,
output => output
);
I4 : fir
PORT MAP (
clock => clk,
reset => reset,
data_in => d1,
data_out => dmout
);
I3 : loop_filter
PORT MAP (
clk => clk,
reset => reset,
c => output,
d1 => d1,
d2 => d2
);
I2 : nco
PORT MAP (
clk => clk,
reset => reset,
din => d2,
dout => dout
);
END behavior;