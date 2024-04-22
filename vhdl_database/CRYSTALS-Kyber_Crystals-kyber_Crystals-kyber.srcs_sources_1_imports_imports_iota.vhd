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
ENTITY iota is
    PORT ( X : IN  STD_LOGIC_VECTOR(1599 DOWNTO 0);
           C : IN  STD_LOGIC_VECTOR(  63 DOWNTO 0);
           Y : OUT STD_LOGIC_VECTOR(1599 DOWNTO 0));
END iota;



-- ARCHITECTURE : DATAFLOW
----------------------------------------------------------------------------------
ARCHITECTURE Dataflow OF iota IS

BEGIN
    
    Y <= X(1599 DOWNTO 64) & (X(63 DOWNTO 0) XOR C);
    
END Dataflow;
