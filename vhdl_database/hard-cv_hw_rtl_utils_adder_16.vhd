library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
        use work.all ;

entity adder_16 is
	port(
 		IN1, IN2 : in std_logic_vector(15 downto 0 ); 
 		OUT_1 : out std_logic_vector(15 downto 0 )
	); 
end adder_16;

architecture systemc of adder_16 is
 
 
	begin
	
	
	-- add_process
	process(IN1, IN2)
		 begin
		 	OUT_1 <= (conv_integer(IN1) + conv_integer(IN2)) ;
		 end process;  
	
end systemc ;
