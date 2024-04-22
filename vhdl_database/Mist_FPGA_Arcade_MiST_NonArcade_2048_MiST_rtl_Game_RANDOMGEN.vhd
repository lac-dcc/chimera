LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.GAME_TYPES.ALL;

ENTITY GAME_RANDOMGEN IS
PORT
	(
		-- INPUT
		clk 		: IN  STD_LOGIC;
		
		-- OUTPUT
		random_num 	: OUT STD_LOGIC_VECTOR(3 downto 0)
	);
END GAME_RANDOMGEN;

ARCHITECTURE behavior of GAME_RANDOMGEN IS
BEGIN

PROCESS(clk)
	variable rand_temp 	: std_logic_vector(GRID_WIDTH-1 downto 0):=("1000");
	variable temp 		: std_logic := '0';
BEGIN
	if(rising_edge(clk)) then
		temp := rand_temp(GRID_WIDTH-1) xor rand_temp(GRID_WIDTH-2);
		rand_temp(GRID_WIDTH-1 downto 1) := rand_temp(GRID_WIDTH-2 downto 0);
		rand_temp(0) := temp;
	end if;
	random_num <= rand_temp;
END PROCESS;

END behavior;