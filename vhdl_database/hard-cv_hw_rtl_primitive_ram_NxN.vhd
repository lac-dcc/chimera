library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
		  use ieee.math_real.log2;
		  use ieee.math_real.ceil;

entity ram_NxN is
	generic(SIZE : natural := 64 ; NBIT : natural := 8; ADDR_WIDTH : natural := 6);
	port(
 		clk : in std_logic; 
 		we, en : in std_logic; 
 		do : out std_logic_vector(NBIT-1 downto 0 ); 
 		di : in std_logic_vector(NBIT-1 downto 0 ); 
 		addr : in std_logic_vector((ADDR_WIDTH - 1) downto 0 )
	); 
end ram_NxN;

architecture read_first of ram_NxN is
 
	type array_N is array (0 to (SIZE - 1)) of std_logic_vector(NBIT-1 downto 0 ); 
	signal ram : array_N ;
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
	
end read_first ;
