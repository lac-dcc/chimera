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

entity Counter_Middle_C_Symmetric is
port(	
	clock:		in std_logic;	-- 50 MHz clock
	selectTap:	in std_logic_vector(2 downto 0);
	soundOut:	out std_logic			-- Most Signif Bit of counter
);
end Counter_Middle_C_Symmetric;

----------------------------------------------------

architecture behv of Counter_Middle_C_Symmetric is		 	  
	
	signal Pre_Q: std_logic_vector(16 downto 0);	-- 18-bits
	signal toggleBit =: std_logic;

begin

    -- behavior describes the a Middle C counter

    process(clock, Pre_Q)
    begin
		if rising_edge(clock) then
			if Pre_Q =    "11111111111111111" then
				Pre_Q <=  "01000101010111100";	-- Starting over count
				toggleBit = not toggleBit;
			else
				Pre_Q <= Pre_Q + 1;		-- Increment counter
			end if;
		end if;
    end process;	
	
    -- concurrent assignment statement
	soundOut <= toggleBit and selectTap(0);

end behv;
