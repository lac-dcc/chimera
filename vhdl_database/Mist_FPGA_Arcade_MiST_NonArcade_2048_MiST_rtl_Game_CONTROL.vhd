LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.GAME_TYPES.ALL;

ENTITY GAME_CONTROL IS
PORT
	(   
		-- INPUT
		clk			: IN STD_LOGIC;		
		keyboardData: IN STD_LOGIC_VECTOR (7 downto 0);
		goingReady	: IN STD_LOGIC;
		isgameover	: IN STD_LOGIC;
		isvictory	: IN STD_LOGIC;
		
		-- OUTPUT
		boot		: OUT STD_LOGIC;
		lost		: OUT STD_LOGIC;
		won			: OUT STD_LOGIC;
		-- usiamo 4 bit anche se ne basterebbero 2 per descrivere le 4 direzioni
		movepadDirection : OUT STD_LOGIC_VECTOR(3 downto 0) 
	);
end  GAME_CONTROL;

ARCHITECTURE behavior of  GAME_CONTROL IS
BEGIN
PROCESS

variable state	: GAME_STATE := bootstrap;

constant keyRESET	: std_logic_vector(7 downto 0):=X"76";
constant keyRIGHT	: std_logic_vector(7 downto 0):=X"74";
constant keyLEFT	: std_logic_vector(7 downto 0):=X"6B";
constant keyUP 		: std_logic_vector(7 downto 0):=X"75";
constant keyDOWN 	: std_logic_vector(7 downto 0):=X"72";

constant dirUP 		: std_logic_vector(3 downto 0):="1000";
constant dirDOWN 	: std_logic_vector(3 downto 0):="0001";
constant dirLEFT 	: std_logic_vector(3 downto 0):="0100";
constant dirRIGHT 	: std_logic_vector(3 downto 0):="0010";

BEGIN
WAIT UNTIL(clk'EVENT) AND (clk = '1');
		
	case state IS
		when BOOTSTRAP => 
			boot <= '1';
			lost <= '0';
			won <= '0';
			IF(goingReady = '1') 
			THEN
				state := PLAYING;
				boot <= '0';
			END IF;
		
		when PLAYING =>
			if(isgameover = '1') 
			then
				state := GAMEOVER;
			end if;
			if(isvictory = '1')
			then
				state := VICTORY;
			end if;
			
			case keyboardData is
				when keyRIGHT => -- do move right
					movepadDirection <= dirRIGHT;
				when keyLEFT => -- do move left
					movepadDirection <= dirLEFT;
				when KEYUP => -- do move right
					movepadDirection <= dirUP;
				when KEYDOWN => -- do move left
					movepadDirection <= dirDOWN;
				when others => -- do nothing
					movepadDirection <= "0000";
			end case;				
			
		when GAMEOVER =>
			lost <= '1';
		
		when VICTORY =>
			won <= '1';
		when others =>
			NULL;

	END case;
	
	IF(keyboardData=keyRESET) 
	THEN
		boot <= '1';
		state := BOOTSTRAP;
	END IF;
	
END PROCESS;
END behavior;