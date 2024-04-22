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
ENTITY StateMachine IS
    PORT ( CLK          : IN  STD_LOGIC;
           RESET        : IN  STD_LOGIC;
		   INIT			: IN  STD_LOGIC;
		   GO			: IN  STD_LOGIC;
           DONE         : OUT STD_LOGIC;
           RESET_RF     : OUT STD_LOGIC;
           -- LOAD_RF      : OUT STD_LOGIC;
           ENABLE_RF    : OUT STD_LOGIC;
           CONST        : OUT STD_LOGIC_VECTOR(63 DOWNTO 0));
END StateMachine;



-- ARCHITECTURE : FSM
----------------------------------------------------------------------------------
ARCHITECTURE FSM OF StateMachine IS

    -- STATES --------------------------------------------------------------------
    TYPE STATES IS (S_RESET, S_INIT, S_ROUND, S_DONE);
    SIGNAL STATE, NEXT_STATE : STATES;

    -- SIGNALS -------------------------------------------------------------------
    SIGNAL RESET_LFSR, ENABLE_LFSR  : STD_LOGIC;
    SIGNAL LFSR                     : STD_LOGIC_VECTOR(7 DOWNTO 0);
    
BEGIN

    -- LFSR ----------------------------------------------------------------------
    PROCESS(CLK)
    BEGIN
        IF RISING_EDGE(CLK) THEN
            IF (RESET_LFSR = '1') THEN
                LFSR <= (0 => '1', OTHERS => '0');
            ELSIF (ENABLE_LFSR = '1') THEN
                LFSR <= LFSR(6 DOWNTO 0) & (LFSR(7) XOR LFSR(5) XOR LFSR(4) XOR LFSR(3));
            END IF;
        END IF;
    END PROCESS;
    
    PROCESS(LFSR)
    BEGIN
        CASE LFSR IS
            WHEN X"01"  => CONST <= X"0000000000000001";
            WHEN X"02"  => CONST <= X"0000000000008082";
            WHEN X"04"  => CONST <= X"800000000000808A";
            WHEN X"08"  => CONST <= X"8000000080008000";
            WHEN X"11"  => CONST <= X"000000000000808B";
            WHEN X"23"  => CONST <= X"0000000080000001";
            WHEN X"47"  => CONST <= X"8000000080008081";
            WHEN X"8E"  => CONST <= X"8000000000008009";
            WHEN X"1C"  => CONST <= X"000000000000008A";
            WHEN X"38"  => CONST <= X"0000000000000088";
            WHEN X"71"  => CONST <= X"0000000080008009";
            WHEN X"E2"  => CONST <= X"000000008000000A";
            WHEN X"C4"  => CONST <= X"000000008000808B";
            WHEN X"89"  => CONST <= X"800000000000008B";
            WHEN X"12"  => CONST <= X"8000000000008089";
            WHEN X"25"  => CONST <= X"8000000000008003";
            WHEN X"4B"  => CONST <= X"8000000000008002";
            WHEN X"97"  => CONST <= X"8000000000000080";
            WHEN X"2E"  => CONST <= X"000000000000800A";
            WHEN X"5C"  => CONST <= X"800000008000000A";
            WHEN X"B8"  => CONST <= X"8000000080008081";
            WHEN X"70"  => CONST <= X"8000000000008080";
            WHEN X"E0"  => CONST <= X"0000000080000001";
            WHEN X"C0"  => CONST <= X"8000000080008008";                
            WHEN OTHERS => CONST <= X"0000000000000000";
        END CASE;
    END PROCESS;
    ------------------------------------------------------------------------------
    
    -- STATE REGISTER PROCESS ----------------------------------------------------
    StateRegister : PROCESS(CLK)
    BEGIN
        IF RISING_EDGE(CLK) THEN
            IF (RESET = '1') THEN
                STATE    <= S_RESET;
            ELSE
                STATE <= NEXT_STATE;
            END IF;
        END IF;
    END PROCESS;
    ------------------------------------------------------------------------------
    
    
    -- OUTPUT SIGNALS AND STATE TRANSITION PROCESS -------------------------------
    OutputAndTransition : PROCESS(STATE, INIT, GO, LFSR)
    BEGIN
        -- DEFAULT ASSIGNMENTS  --------------------------------------------------
        RESET_RF        <= '0';
        -- LOAD_RF         <= '0';        
        ENABLE_RF       <= '0';
             
        RESET_LFSR      <= '0';
        ENABLE_LFSR     <= '0';
           
        DONE            <= '0';
        
        NEXT_STATE        <= STATE;
        --------------------------------------------------------------------------
        -- IF(ENABLE = '1') THEN
            -- CASE EVALUATION -------------------------------------------------------
            CASE STATE IS
                ----------------------------------------------------------------------
                WHEN S_RESET    =>  RESET_RF        <= '1';
                                    RESET_LFSR      <= '1';
                                    IF (INIT = '1') THEN
                                        NEXT_STATE  <= S_INIT;
                                    END IF;
                ----------------------------------------------------------------------
                WHEN S_INIT     =>  ENABLE_RF       <= '0';
                                    -- LOAD_RF         <= '1';
                                    ENABLE_LFSR     <= '0';
                                    DONE            <= '0';
                                    IF (GO = '1') THEN
										NEXT_STATE      <= S_ROUND;
									END IF;
                ----------------------------------------------------------------------
                WHEN S_ROUND    =>  ENABLE_RF       <= '1';
                                    ENABLE_LFSR     <= '1';
                                    IF (LFSR = X"C0") THEN
                                        NEXT_STATE  <= S_DONE;
									END IF;
                ----------------------------------------------------------------------
                WHEN S_DONE     =>  DONE            <= '1';
                                    RESET_LFSR      <= '1';
                                    NEXT_STATE      <= S_INIT;
            END CASE;        
            --------------------------------------------------------------------------
        -- END IF;
    END PROCESS;
    ------------------------------------------------------------------------------

END FSM;
