----------------------------------------------------------------------------------
-- COPYRIGHT (c) 2015 ALL RIGHT RESERVED
--
-- KRYPTOGRAPHIE AUF PROGRAMMIERBARER HARDWARE: REGISTER-FDE
----------------------------------------------------------------------------------



-- IMPORTS
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;



-- ENTITY
----------------------------------------------------------------------------------
ENTITY RegisterFDRE IS
    GENERIC (SIZE : POSITIVE := 8);
    PORT ( CLK      : IN    STD_LOGIC;
           RESET    : IN    STD_LOGIC;
		   INIT		: IN	STD_LOGIC;
           ENABLE   : IN    STD_LOGIC;
		   SQUEEZE	: IN	STD_LOGIC;
		   ABSORB	: IN	STD_LOGIC;
		   -- LAST		: IN	STD_LOGIC;
		   EXTEND   : IN    STD_LOGIC;
		   DIN		: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
           D        : IN    STD_LOGIC_VECTOR((SIZE - 1) downto 0);
           Q        : OUT   STD_LOGIC_VECTOR((SIZE - 1) downto 0));
END RegisterFDRE;



-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF RegisterFDRE IS

signal Din_mux 	: STD_LOGIC_VECTOR(31 downto 0);
signal Q_buf 	: STD_LOGIC_VECTOR(1599 downto 0);
-- signal trunk	: STD_LOGIC_VECTOR(511 downto 0);

BEGIN
    -- REGISTER PROCESS ----------------------------------------------------------
	Q <= Q_buf;
	Din_mux <= Q_buf(31 downto 0) When EXTEND = '1' ELSE 
			   Q_buf(31 downto 0) xor Din When ABSORB = '1' ELSE
	           Din;
	-- trunk <= Q_buf(511 downto 0) When ABSORB = '1' ELSE
			 -- X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	
    PROCESS(CLK)
    BEGIN
        IF RISING_EDGE(CLK) THEN
            IF (RESET = '1') THEN
                Q_buf <= (OTHERS => '0');
			ELSIF(INIT = '1') THEN
				Q_buf <= (OTHERS => '0');
			-- ELSIF(LAST = '1') THEN
				-- Q_buf <= trunk & Q_buf(1599 DOWNTO 512);
			ELSIF(SQUEEZE = '1' or EXTEND = '1') THEN
				Q_buf <= DIN_mux & Q_buf(1599 DOWNTO 32);
            ELSIF(ENABLE = '1') THEN 
                Q_buf <= D;
            END IF;
        END IF;
    END PROCESS;
    ------------------------------------------------------------------------------

END Behavioral;
