----------------------------------------------------------------------------------
-- COPYRIGHT (c) 2015 ALL RIGHT RESERVED
--
-- KRYPTOGRAPHIE AUF PROGRAMMIERBARER HARDWARE: KECCAK 1600
----------------------------------------------------------------------------------



-- IMPORTS
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;



-- ENTITY
----------------------------------------------------------------------------------
ENTITY Round IS
    PORT ( CLK      : IN  STD_LOGIC;
           RESET    : IN  STD_LOGIC;
		   INIT		: IN  STD_LOGIC;
           -- LOAD     : IN  STD_LOGIC;
           ENABLE   : IN  STD_LOGIC;
		   SQUEEZE	: IN  STD_LOGIC;
		   ABSORB	: IN  STD_LOGIC;
		   -- LAST		: IN  STD_LOGIC;
		   EXTEND   : IN  STD_LOGIC;
           CONST    : IN  STD_LOGIC_VECTOR(  63 DOWNTO 0);
		   DIN 		: IN  STD_LOGIC_VECTOR(  31 DOWNTO 0);
           -- INPUT    : IN  STD_LOGIC_VECTOR(1599 DOWNTO 0);
           OUTPUT   : OUT STD_LOGIC_VECTOR(1599 DOWNTO 0));
END Round;



-- ARCHITECTURE : STRUCTURAL
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF Round IS

    -- COMPONENTS ----------------------------------------------------------------
    COMPONENT RegisterFDRE IS
        GENERIC (SIZE : POSITIVE := 1600);
        PORT ( CLK      : IN    STD_LOGIC;
               RESET    : IN    STD_LOGIC;
			   INIT		: IN	STD_LOGIC;
               ENABLE   : IN    STD_LOGIC;
			   -- LAST		: IN	STD_LOGIC;
               SQUEEZE  : IN    STD_LOGIC;
			   ABSORB	: IN	STD_LOGIC;
               EXTEND   : IN    STD_LOGIC;
			   DIN		: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
               D        : IN    STD_LOGIC_VECTOR((SIZE - 1) downto 0);
               Q        : OUT   STD_LOGIC_VECTOR((SIZE - 1) downto 0));
    END COMPONENT;

    COMPONENT theta IS
        PORT ( X : IN  STD_LOGIC_VECTOR(1599 DOWNTO 0);
               Y : OUT STD_LOGIC_VECTOR(1599 DOWNTO 0));
    END COMPONENT;

    COMPONENT rho IS
        PORT ( X : IN  STD_LOGIC_VECTOR(1599 DOWNTO 0);
               Y : OUT STD_LOGIC_VECTOR(1599 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT pi IS
        PORT ( X : IN  STD_LOGIC_VECTOR(1599 DOWNTO 0);
               Y : OUT STD_LOGIC_VECTOR(1599 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT chi IS
        PORT ( X : IN  STD_LOGIC_VECTOR(1599 DOWNTO 0);
               Y : OUT STD_LOGIC_VECTOR(1599 DOWNTO 0));
    END COMPONENT;
    
    COMPONENT iota IS
        PORT ( X : IN  STD_LOGIC_VECTOR(1599 DOWNTO 0);
               C : IN  STD_LOGIC_VECTOR(  63 DOWNTO 0);
               Y : OUT STD_LOGIC_VECTOR(1599 DOWNTO 0));
    END COMPONENT;

    -- SIGNALS -------------------------------------------------------------------
    SIGNAL MUX, STATE, TMP1, TMP2, TMP3, TMP4, TMP5 : STD_LOGIC_VECTOR(1599 DOWNTO 0);

BEGIN
        
    -- REGISTER ------------------------------------------------------------------
    Reg : RegisterFDRE
    GENERIC MAP (SIZE => 1600)
    PORT MAP (
        CLK     => CLK,
        RESET   => RESET,
		INIT	=> INIT,
        ENABLE  => ENABLE,
		SQUEEZE => SQUEEZE,
		ABSORB	=> ABSORB,
		-- LAST	=> LAST,
		EXTEND  => EXTEND,
		DIN		=> DIN,
        D       => TMP5,
        Q       => STATE
    );
    ------------------------------------------------------------------------------

    -- MULTIPLEXER ---------------------------------------------------------------
    -- MUX <= (STATE XOR INPUT) WHEN (LOAD = '1') ELSE STATE;
	MUX <= STATE;
    ------------------------------------------------------------------------------
        
    -- SUB-FUNCTIONS -------------------------------------------------------------
    T : theta PORT MAP (X => MUX,  Y => TMP1);
    R : rho   PORT MAP (X => TMP1, Y => TMP2);
    P : pi    PORT MAP (X => TMP2, Y => TMP3);
    C : chi   PORT MAP (X => TMP3, Y => TMP4);
    I : iota  PORT MAP (X => TMP4, C => CONST, Y => TMP5);
    ------------------------------------------------------------------------------
    
    -- RESULT --------------------------------------------------------------------
    OUTPUT <= STATE;
    ------------------------------------------------------------------------------
    
END Structural;
