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

entity sp64Kx8 is
	port(
		address		: in	std_logic_vector(15 downto 0);
		clock		: in	std_logic;
		data		: in	std_logic_vector(7 downto 0);
		wren		: in	std_logic;
		q		    : out	std_logic_vector(7 downto 0)
	);
end sp64Kx8;

--STABLE WORKING
--architecture rtl of sp64Kx8 is
--	type memory is array(0 to 2**16 -1) of std_logic_vector(7 downto 0); 
--	signal mem : memory;
	
--begin
--	RAM : process(clock)
--	begin
--		if (clock'event and clock='1') then
--			if (wren = '0') then
--				q <= mem(to_integer(unsigned(address)));
--			else
--				mem(to_integer(unsigned(address))) <= data;
--				q <= data;  -- ????
--			end if;
--		end if;
--	end process RAM;
--end rtl;


architecture rtl of sp64Kx8 is
	type memory is array(0 to 2**16 -1) of std_logic_vector(7 downto 0); 
	signal mem : memory;
	
begin
	RAM : process(clock)
	begin
		if (clock'event and clock='1') then
			if (wren = '0') then
			     --OV OTP
			    if ( address = x"3D00") then
			         q <= x"AB";
			     elsif ( address = x"3D01") then
			          q <= x"CD";
			     elsif ( address = x"3D02") then
			          q <= x"EF";
			     else
			     q <= mem(to_integer(unsigned(address)));
			     end if;
			else
				mem(to_integer(unsigned(address))) <= data;
				q <= data;  -- ????
			end if;
		end if;
	end process RAM;
end rtl;