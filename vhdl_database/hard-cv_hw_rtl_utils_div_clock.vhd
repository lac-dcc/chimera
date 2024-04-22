library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
        use work.all ;

entity div_clock is
	port(
 		clk : in std_logic; 
 		clk_2 : out std_logic
	); 
end div_clock;

architecture systemc of div_clock is
 
 
	begin
	
	
	-- div_clock_process
	process(clk)
		 begin
		 	if  clk'event and clk = '1'  then
		 	end if ;
		 end process;  
	
end systemc ;