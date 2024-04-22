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
ENTITY Keccak1600 IS
    PORT ( CLK      : IN  STD_LOGIC;
           -- CONTROL SIGNAL PORTS ---------------------------
           RESET    : IN  STD_LOGIC;
           INIT   	: IN  STD_LOGIC;
		   GO		: IN  STD_LOGIC;
		   SQUEEZE	: IN  STD_LOGIC;
		   ABSORB	: IN  STD_LOGIC;
		   -- LAST		: IN  STD_LOGIC;
		   EXTEND   : IN  STD_LOGIC;
		   DIN		: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
           DONE     : OUT STD_LOGIC;
           -- DATA SIGNAL PORTS ------------------------------
           -- MESSAGE  : IN  STD_LOGIC_VECTOR( 255 DOWNTO 0);
           -- PADDING  : IN  STD_LOGIC_VECTOR(1343 DOWNTO 0);
           RESULT   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END Keccak1600;



-- ARCHITECTURE : STRUCTURAL
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF Keccak1600 IS

    -- COMPONENTS ----------------------------------------------------------------
    COMPONENT Round IS
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
			   DIN		: IN  STD_LOGIC_VECTOR(  31 DOWNTO 0);
               -- INPUT    : IN  STD_LOGIC_VECTOR(1599 DOWNTO 0);
               OUTPUT   : OUT STD_LOGIC_VECTOR(1599 DOWNTO 0));
    END COMPONENT;

    COMPONENT StateMachine IS
        PORT ( CLK          : IN  STD_LOGIC;
               RESET        : IN  STD_LOGIC;
			   INIT			: IN  STD_LOGIC;
               GO	        : IN  STD_LOGIC;
               DONE         : OUT STD_LOGIC;
               RESET_RF     : OUT STD_LOGIC;
               -- LOAD_RF      : OUT STD_LOGIC;
               ENABLE_RF    : OUT STD_LOGIC;
               CONST        : OUT STD_LOGIC_VECTOR(63 DOWNTO 0));
    END COMPONENT;

    -- SIGNALS -------------------------------------------------------------------
    SIGNAL RESET_RF, ENABLE_RF  : STD_LOGIC;
	-- SIGNAL LOAD_RF 			 : STD_LOGIC;
    SIGNAL DONE_INTERN       : STD_LOGIC;
    SIGNAL REORDER_OUT       : STD_LOGIC_VECTOR(1599 DOWNTO 0);
    SIGNAL CONST             : STD_LOGIC_VECTOR(  63 DOWNTO 0);

BEGIN
    
    -- REORDER_IN  <= PADDING & MESSAGE;
    RESULT      <= REORDER_OUT(31 DOWNTO 0); -- WHEN DONE_INTERN = '1' ELSE (OTHERS => '0');
    DONE        <= DONE_INTERN;
    
    RoundFunction : Round
    PORT MAP (
        CLK     => CLK,
        RESET   => RESET_RF,
		INIT	=> INIT,
        -- LOAD    => LOAD_RF,
        ENABLE  => ENABLE_RF,
		SQUEEZE => SQUEEZE,
		ABSORB	=> ABSORB,
		-- LAST	=> LAST,
		EXTEND  => EXTEND,
        CONST   => CONST,
		DIN		=> DIN,
        -- INPUT   => REORDER_IN,
        OUTPUT  => REORDER_OUT
    );

    FSM : StateMachine
    PORT MAP (
        CLK         => CLK,
        RESET       => RESET,
		INIT		=> INIT,
        GO	      	=> GO,
        DONE        => DONE_INTERN,
        RESET_RF    => RESET_RF,
        -- LOAD_RF     => LOAD_RF,
        ENABLE_RF   => ENABLE_RF,
        CONST       => CONST
    );
    
END Structural;
