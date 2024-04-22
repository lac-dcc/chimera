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
ENTITY rho is
    PORT ( X : IN  STD_LOGIC_VECTOR(1599 DOWNTO 0);
           Y : OUT STD_LOGIC_VECTOR(1599 DOWNTO 0));
END rho;



-- ARCHITECTURE : DATAFLOW
----------------------------------------------------------------------------------
ARCHITECTURE Dataflow OF rho IS

BEGIN

    -- Y = 0
    Y(  63 DOWNTO    0) <= X(  63 DOWNTO    0);
    Y( 127 DOWNTO   64) <= X( 126 DOWNTO   64) & X( 127);
    Y( 191 DOWNTO  128) <= X( 129 DOWNTO  128) & X( 191 DOWNTO  130);
    Y( 255 DOWNTO  192) <= X( 227 DOWNTO  192) & X( 255 DOWNTO  228);
    Y( 319 DOWNTO  256) <= X( 292 DOWNTO  256) & X( 319 DOWNTO  293);
    
    -- Y = 1
    Y( 383 DOWNTO  320) <= X( 347 DOWNTO  320) & X( 383 DOWNTO  348);
    Y( 447 DOWNTO  384) <= X( 403 DOWNTO  384) & X( 447 DOWNTO  404);
    Y( 511 DOWNTO  448) <= X( 505 DOWNTO  448) & X( 511 DOWNTO  506);
    Y( 575 DOWNTO  512) <= X( 520 DOWNTO  512) & X( 575 DOWNTO  521);
    Y( 639 DOWNTO  576) <= X( 619 DOWNTO  576) & X( 639 DOWNTO  620);
    
    -- Y = 2
    Y( 703 DOWNTO  640) <= X( 700 DOWNTO  640) & X( 703 DOWNTO  701);
    Y( 767 DOWNTO  704) <= X( 757 DOWNTO  704) & X( 767 DOWNTO  758);
    Y( 831 DOWNTO  768) <= X( 788 DOWNTO  768) & X( 831 DOWNTO  789);
    Y( 895 DOWNTO  832) <= X( 870 DOWNTO  832) & X( 895 DOWNTO  871);
    Y( 959 DOWNTO  896) <= X( 920 DOWNTO  896) & X( 959 DOWNTO  921);   

    -- Y = 3
    Y(1023 DOWNTO  960) <= X( 982 DOWNTO  960) & X(1023 DOWNTO  983);
    Y(1087 DOWNTO 1024) <= X(1042 DOWNTO 1024) & X(1087 DOWNTO 1043);
    Y(1151 DOWNTO 1088) <= X(1136 DOWNTO 1088) & X(1151 DOWNTO 1137);
    Y(1215 DOWNTO 1152) <= X(1194 DOWNTO 1152) & X(1215 DOWNTO 1195);
    Y(1279 DOWNTO 1216) <= X(1271 DOWNTO 1216) & X(1279 DOWNTO 1272);   
    
    -- Y = 4
    Y(1343 DOWNTO 1280) <= X(1325 DOWNTO 1280) & X(1343 DOWNTO 1326);
    Y(1407 DOWNTO 1344) <= X(1405 DOWNTO 1344) & X(1407 DOWNTO 1406);
    Y(1471 DOWNTO 1408) <= X(1410 DOWNTO 1408) & X(1471 DOWNTO 1411);
    Y(1535 DOWNTO 1472) <= X(1479 DOWNTO 1472) & X(1535 DOWNTO 1480);
    Y(1599 DOWNTO 1536) <= X(1585 DOWNTO 1536) & X(1599 DOWNTO 1586);   
    
END Dataflow;
