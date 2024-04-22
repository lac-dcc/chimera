library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
        use work.all ;

entity ram_8x64 is
	port(
 		clk : in std_logic; 
 		we, en : in std_logic; 
 		do : out std_logic_vector(7 downto 0 ); 
 		di : in std_logic_vector(7 downto 0 ); 
 		addr : in std_logic_vector(6 downto 0 )
	); 
end ram_8x64;

architecture systemc of ram_8x64 is
 
	type array_64 is array (0 to 127) of std_logic_vector(7 downto 0 ); 
	signal ram : array_64 ;
	begin
	
	
	-- ram_process
	process(clk)
		 begin
		 	if  clk'event and clk = '1'  then
		 		if  en = '1'  then
		 			if  we = '1'  then
		 				ram(conv_integer(addr)) <= di ; 
		 			end if ;
		 			do <= ram(conv_integer(addr)) ;
		 		end if ;
		 	end if ;
		 end process;  
	
end systemc ;