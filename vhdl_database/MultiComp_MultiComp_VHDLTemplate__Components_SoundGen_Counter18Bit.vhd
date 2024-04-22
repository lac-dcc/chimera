----------------------------------------------------
-- VHDL code for 16-bit counter
-- 50 MHz divided by 2^16 = 762.93 Hz
----------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity Counter18Bit is

port(	
	clock:		in std_logic;	-- 50 MHz clock
	selectTap:	in std_logic_vector(2 downto 0);
	Q:				out std_logic			-- Most Signif Bit of counter
);
end Counter18Bit;

----------------------------------------------------

architecture behv of Counter18Bit is		 	  
	
	signal Pre_Q: std_logic_vector(17 downto 0);
	

begin

    -- behavior describes the Counter18Bit

    process(clock, Pre_Q)
    begin
		if rising_edge(clock) then
				Pre_Q <= Pre_Q + 1;
		end if;
    end process;	
	
    -- concurrent assignment statement
    Q <= ((Pre_Q(15) and selectTap(2)) or (Pre_Q(16) and selectTap(1)) or (Pre_Q(17) and selectTap(0)));

end behv;
