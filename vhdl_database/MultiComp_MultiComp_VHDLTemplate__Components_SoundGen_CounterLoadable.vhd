----------------------------------------------------
-- VHDL code for 19-bit counter
-- 50 MHz divided by 2^19 = 45 Hz (low end of the sound) 
----------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity counterLoadable is

port(	
	clock:	in std_logic;
	clear:   in std_logic;
	loadVal: in std_logic_vector(7 downto 0);
	soundOut: out std_logic;
	Q:	out std_logic_vector(18 downto 0)
);
end counterLoadable;

----------------------------------------------------

architecture behv of counterLoadable is		 	  
	
    signal Pre_Q: std_logic_vector(18 downto 0);
	 signal sound:	std_logic;

begin

    -- behavior describe the counterLoadable

    process(clock, loadVal, Pre_Q)
    begin
		if rising_edge(clock) then
			if clear = '1' then
				sound <= '0';
				Pre_Q <= "0000000000000000000";
			elsif Pre_Q = "1111111111110000000" then
				Pre_Q <= loadVal&"11110000000";
				sound <= not sound;
			else
				Pre_Q <= Pre_Q + 1;
			end if;
		end if;
    end process;	
	
    -- concurrent assignment statement
    Q <= Pre_Q;
	 soundOut <= sound;

end behv;
