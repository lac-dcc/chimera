----------------------------------------------------
-- VHDL code for 16-bit counter
-- 50 MHz divided by 2^16 = 762.93 Hz
----------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity Counter16Bit is

port(	
	clock:	in std_logic;	-- 50 MHz clock
	Q:	out std_logic			-- Most Signif Bit of counter
);
end Counter16Bit;

----------------------------------------------------

architecture behv of Counter16Bit is		 	  
	
	signal Pre_Q: std_logic_vector(15 downto 0);
	

begin

    -- behavior describes the Counter16Bit

    process(clock, Pre_Q)
    begin
		if rising_edge(clock) then
				Pre_Q <= Pre_Q + 1;
		end if;
    end process;	
	
    -- concurrent assignment statement
    Q <= Pre_Q(15);

end behv;
