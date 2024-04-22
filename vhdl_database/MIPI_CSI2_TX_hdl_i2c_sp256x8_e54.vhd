--###############################
--# Project Name : I2C Slave
--# File         : ALTERA compatible
--# Project      : VHDL RAM model
--# Engineer     : Philippe THIRION
--# Modification History
--###############################

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sp256x8_e54 is
	port(
		address		: in	std_logic_vector(7 downto 0);
		clock		: in	std_logic;
		data		: in	std_logic_vector(7 downto 0);
		wren		: in	std_logic;
		q		    : out	std_logic_vector(7 downto 0)
	);
end sp256x8_e54;

architecture rtl of sp256x8_e54 is
	type memory is array(0 to 255) of std_logic_vector(7 downto 0); 
	signal mem : memory := (

     x"01",x"00",x"07",x"00",x"fe",x"0c",x"e8",x"03",x"01",x"4d",
     x"00",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"00",x"c0",x"06",
     x"36",x"39",x"39",x"2d",x"38",x"33",x"33",x"32",x"36",x"2d",
     x"31",x"30",x"30",x"30",x"2d",x"31",x"30",x"30",x"20",x"4d",
     x"2e",x"30",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",
     x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",
     x"ff",x"ff",x"ff",x"ff",x"30",x"33",x"32",x"30",x"39",x"31",
     x"37",x"30",x"35",x"31",x"37",x"32",x"38",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"46",x"46",x"46",x"46",x"ff",x"ff",x"46",x"46",x"ff",x"ff",
     x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",
     x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"ff",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
    
    
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",
     x"00",x"00",x"00",x"00",x"00",x"cc"  
     
     );
                
    
begin
	RAM : process(clock)
	begin
		if (clock'event and clock='1') then
			if (wren = '0') then
				q <= mem(to_integer(unsigned(address)));
			else
				mem(to_integer(unsigned(address))) <= data;
				q <= data;  -- ????
			end if;
		end if;
	end process RAM;
end rtl;

