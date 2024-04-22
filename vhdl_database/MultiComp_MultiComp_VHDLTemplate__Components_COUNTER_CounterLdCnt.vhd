----------------------------------------------------
-- VHDL code for n-bit counter
----------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------

entity counterLdInc is
generic(n: natural := 8);
port(	
	i_clock		:	in std_logic;
	i_dataIn	:	in std_logic_vector(n-1 downto 0);
	i_load		:	in std_logic;
	i_inc		:	in std_logic;
	o_dataOut	:	out std_logic_vector(n-1 downto 0)
);
end counterLdInc;

----------------------------------------------------

architecture behv of counterLdInc is		 	  
	
    signal Pre_Q: std_logic_vector(n-1 downto 0);

begin

    -- behavior describe the incer

process(i_clock, i_inc, i_load, Pre_Q, i_dataIn)
begin
	if rising_edge(i_clock) then
		if i_load = '1' then
			Pre_Q <= i_dataIn;
		elsif i_inc = '1' then
			Pre_Q <= Pre_Q + 1;
		end if;
	end if;
end process;	
	
    -- concurrent assignment statement
    o_dataOut <= Pre_Q;

end behv;
