--import std_logic from the IEEE library
library ieee;
use ieee.std_logic_1164.all;

--ENTITY DECLARATION: no inputs, no outputs
entity Boolean_Function_Data_Flow_tb is
end Boolean_Function_Data_Flow_tb;

-- Describe how to test the AND Gate
architecture tb of Boolean_Function_Data_Flow_tb is
   --pass andGate entity to the testbench as component
   component Boolean_Function_Data_Flow is	
     Port ( a1		: in  STD_LOGIC ;
            a0 	: in  STD_LOGIC ;
			   b1 	: in  STD_LOGIC ;
			   b0 	: in  STD_LOGIC ;
			  
            c2    : out STD_LOGIC ;
			   c1    : out STD_LOGIC ;
			   c0    : out STD_LOGIC);
  end component;
	
   signal  a1 : STD_LOGIC := '0';
	signal  a0 : STD_LOGIC := '0';
	signal  b1 : STD_LOGIC := '0';
	signal  b0 : STD_LOGIC := '0';
	signal  c2 : STD_LOGIC := '0';
	signal  c1 : STD_LOGIC := '0';
	signal  c0 : STD_LOGIC := '0';

	constant period : time := 50ns;

begin 


	uut: Boolean_Function_Data_Flow PORT MAP(
		a1 => a1,
		a0 => a0,
		b1 => b1,
		b0 => b0,
		c2 => c2,
		c1 => c1,
		c0 => c0
		);
		
	stimulus : process
	begin
	
	-- 0000
	a1 <= '0';
	a0 <= '0';
	b1 <= '0';
	b0 <= '0';
	wait for period;
	-- 0001
	a1 <= '0';
	a0 <= '0';
	b1 <= '0';
	b0 <= '1';
	wait for period;
	-- 0010
	a1 <= '0';
	a0 <= '0';
	b1 <= '1';
	b0 <= '0';
	wait for period;
	-- 0011
	a1 <= '0';
	a0 <= '0';
	b1 <= '1';
	b0 <= '1';
	wait for period;
	-- 0100
	a1 <= '0';
	a0 <= '1';
	b1 <= '0';
	b0 <= '0';
	wait for period;
	-- 0101
	a1 <= '0';
	a0 <= '1';
	b1 <= '0';
	b0 <= '1';
	wait for period;
	-- 0110
	a1 <= '0';
	a0 <= '1';
	b1 <= '1';
	b0 <= '0';
	wait for period;
	-- 0111
	a1 <= '0';
	a0 <= '1';
	b1 <= '1';
	b0 <= '1';
	wait for period;
	-- 1000
	a1 <= '1';
	a0 <= '0';
	b1 <= '0';
	b0 <= '0';
	wait for period;
	-- 1001
	a1 <= '1';
	a0 <= '0';
	b1 <= '0';
	b0 <= '1';
	wait for period;
	-- 1010
	a1 <= '1';
	a0 <= '0';
	b1 <= '1';
	b0 <= '0';
	wait for period;
	-- 1011
	a1 <= '1';
	a0 <= '0';
	b1 <= '1';
	b0 <= '1';
	wait for period;
	-- 1100
	a1 <= '1';
	a0 <= '1';
	b1 <= '0';
	b0 <= '0';
	wait for period;
	-- 1101
	a1 <= '1';
	a0 <= '1';
	b1 <= '0';
	b0 <= '1';
	wait for period;
	-- 1110
	a1 <= '1';
	a0 <= '1';
	b1 <= '1';
	b0 <= '0';
	wait for period;
	-- 1111
	a1 <= '1';
	a0 <= '1';
	b1 <= '1';
	b0 <= '1';
	wait for period;
	a1 <= '0';
	a0 <= '0';
	b1 <= '0';
	b0 <= '0';
	wait;
	

end process;	

 
end tb;
