-----------------------------------------------------------------------------
--	Filename:	gh_wdt_programmable.vhd
--
--	Description:
--		programmable watch dog timer
--
--	Copyright (c) 2009 by George Huber 
--		an OpenCores.org Project
--		free to use, but see documentation for conditions  
--
--	Revision 	History:
--	Revision 	Date       	Author    	Comment
--	-------- 	---------- 	---------	-----------
--	1.0      	01/25/09   	h lefevre	Initial revision
--
-----------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_arith.all;
use IEEE.std_logic_unsigned.all;


entity gh_wdt_programmable is 
	GENERIC (size : integer :=8); 
	 port(
		 clk      : in STD_LOGIC;
		 rst      : in STD_LOGIC;
		 T_en     : in STD_LOGIC; -- high will enable counting, low will load
		 t_time   : in STD_LOGIC_vector(size-1 downto 0);  -- timer time
		 Q        : out STD_LOGIC  -- high with time out
	     );
end entity;


architecture a of gh_wdt_programmable is  

	signal count : std_logic_vector(size-1 downto 0);
	signal t_out : std_logic_vector(size-1 downto 0);
	
begin

	t_out(size-1 DOWNTO 1) <= (others => '0');
	t_out(0) <= '1';
	
process(clk,rst)
begin -- 
	if (rst = '1') then	
		count <= (others => '0');
		Q <= '0';
	elsif (rising_edge(clk)) then 
		if (T_en = '0')then 
			count <= t_time;
			Q <= '0';
		elsif (count < "01") then  -- null count, no time out
			count <= count;
			Q <= '0';
		elsif (count = t_out) then
			count <= count;
			Q <= '1';
		else 
			count <= count - "01";
			Q <= '0';
		end if;
	end if;
end process;

end architecture;
