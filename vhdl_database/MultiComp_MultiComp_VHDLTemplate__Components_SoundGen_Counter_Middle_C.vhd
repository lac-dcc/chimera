----------------------------------------------------
-- VHDL code for Middle C counter
-- 50 MHz divided by 261.6265 Hz = 191,112.13 counts
-- 2^18 = 262,144
-- Count up to Terminal count and then reload counter
-- Starting count = 262,144 – 191,112 = 72032 (0x11578)
-- 0x11578 = 01 0001 0101 0111 1000
----------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity Counter_Middle_C is
port(	
	clock:		in std_logic;	-- 50 MHz clock
	selectTap:	in std_logic_vector(2 downto 0);
	soundOut:	out std_logic			-- Most Signif Bit of counter
);
end Counter_Middle_C;

----------------------------------------------------

architecture behv of Counter_Middle_C is		 	  
	
	signal Pre_Q: std_logic_vector(17 downto 0);	-- 18-bits

begin

    -- behavior describes the a Middle C counter

    process(clock, Pre_Q)
    begin
		if rising_edge(clock) then
			if Pre_Q =    "111111111111111111" then
				Pre_Q <=  "010001010101111000";	-- Starting over count
			else
				Pre_Q <= Pre_Q + 1;		-- Increment counter
			end if;
		end if;
    end process;	
	
    -- concurrent assignment statement
	soundOut <= Pre_Q(17) and selectTap(0);

end behv;
