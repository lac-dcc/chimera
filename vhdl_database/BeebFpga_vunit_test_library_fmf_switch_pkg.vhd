--------------------------------------------------------------------------------
--  File name : switch_pkg.vhd
--------------------------------------------------------------------------------
--  Copyright (C) 1999-2003 Free Model Foundry; http://www.FreeModelFoundry.com/
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License version 2 as
--  published by the Free Software Foundation.
--
--  MODIFICATION HISTORY :
--
--  version: | author: | mod date: | changes made
--     V1.0   R. Munden  99 JUN 21   Initial release based on work done by
--                                   James Holl
--     V1.1   R. Munden  03 MAR 22   Changed some signal types to satisfy
--                                   Cadence nc_vhdl
--
--  This file should be compiled into the FMF library.  It is for use with the
--  bus switch models in the STNDS library.
--------------------------------------------------------------------------------
LIBRARY IEEE;
USE     IEEE.Std_Logic_1164.ALL;

--------------------------------------------------------------------------------
PACKAGE switch_pkg IS

    COMPONENT bilateral
        PORT (  GATE: in std_logic;
            DRAIN: inout std_logic;
            SOURCE: inout std_logic;
            SUBSTRATE: inout std_logic;
            SUB_DRIVE_D: in std_logic;
            SUB_DRIVE_S: in std_logic;
            AUX_EN: in X01;
            SUSPEND: in boolean);
    END COMPONENT;

    COMPONENT tri_buf
        PORT (  X: in std_logic;
                OE: in std_ulogic;
                Q: out std_logic);
    END COMPONENT;

	FUNCTION Tri_Out_Buf(OE: X01; X: std_logic)
		RETURN std_logic;
	FUNCTION Equal(L: std_logic; R: std_logic)
		RETURN boolean;
	FUNCTION Same_Vals(S: std_logic_vector)
		RETURN boolean;
END switch_pkg;

--------------------------------------------------------------------------------
PACKAGE BODY switch_pkg IS
	TYPE asym_table IS ARRAY(X01, std_logic) of std_logic;

	CONSTANT tob_tab: asym_table := (
------------------------------------------------------------------------
--		 'U'  'X'  '0'  '1'  'Z'  'W'  'L'  'H'  '-'      |
------------------------------------------------------------------------
		('U', 'X', 'X', 'X', 'Z', 'W', 'W', 'W', '-'),  --| 'X'
		('Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z', 'Z'),  --| '0'
		('U', 'X', '0', '1', 'Z', 'W', 'L', 'H', '-')); --| '1'


	FUNCTION Tri_Out_Buf(OE: X01; X: std_logic)
		RETURN std_logic IS
	BEGIN
		RETURN tob_tab(OE, X);
	END Tri_Out_Buf;


	TYPE sym_table IS ARRAY(std_logic, std_logic) of boolean;

	CONSTANT eq_tab: sym_table := (
------------------------------------------------------------------------
--		  'U'   'X'   '0'   '1'   'Z'   'W'   'L'   'H'   '-'     
------------------------------------------------------------------------
		(TRUE, FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE),
		(FALSE,TRUE ,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE),
		(FALSE,FALSE,TRUE ,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE),
		(FALSE,FALSE,FALSE,TRUE ,FALSE,FALSE,FALSE,FALSE,FALSE),
		(FALSE,FALSE,FALSE,FALSE,TRUE ,FALSE,FALSE,FALSE,FALSE),
		(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE ,FALSE,FALSE,FALSE),
		(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE ,FALSE,FALSE),
		(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE ,FALSE),
		(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE ));


	FUNCTION equal(L: std_logic; R: std_logic)
		RETURN boolean IS
	BEGIN
		RETURN eq_tab(L, R);
	END equal;


	FUNCTION Same_Vals(S: std_logic_vector)
		RETURN boolean IS

		ALIAS X: std_logic_vector(S'LENGTH - 1 downto 0) is S;
		VARIABLE X0: std_logic;
	BEGIN
		IF (X'length = 1) THEN
			RETURN 	true;
		END IF;

		X0 := X(0);

		FOR i IN 1 TO X'length - 1 LOOP
			IF (not equal(X(i), X0)) THEN
				RETURN false;
			END IF;
		END LOOP;

		RETURN true;
	END Same_Vals;

END switch_pkg;

-- entity declaration and behavioral architecture of the tri-state buffer

library IEEE;
library FMF;
use IEEE.STD_LOGIC_1164.all;
use FMF.SWITCH_PKG.all;

entity TRI_BUF is
    port (  X: in std_logic;
        OE: in std_ulogic;
        Q: out std_logic);
end TRI_BUF;


architecture BEHAVIOR of TRI_BUF is
begin
    process (X, OE)
    begin
        Q <= TRI_OUT_BUF(OE, X);
    end process;
end BEHAVIOR;

-- entity declaration and behavioral architecture body for the
-- bilateral switch

library IEEE;
library FMF;
use IEEE.STD_LOGIC_1164.all;
use FMF.SWITCH_PKG.all;

entity BILATERAL is
    port (  GATE: in std_logic;
        DRAIN: inout std_logic;
        SOURCE: inout std_logic;
        SUBSTRATE: inout std_logic;
        SUB_DRIVE_D: in std_logic;
        SUB_DRIVE_S: in std_logic;
        AUX_EN: in X01;
        SUSPEND: in boolean);
end BILATERAL;


architecture MIXED of BILATERAL is

    signal ENABLE: X01 := '0';
    signal D1, D2, D3, D4, D5, D6, D7, D8, D9, D10: boolean;

begin
    substrate <= tri_out_buf(gate, drain);
    substrate <= tri_out_buf(gate, source);
    drain <= tri_out_buf(enable, substrate);
    source <= tri_out_buf(enable, substrate);


    SUBSTRATE <= SUB_DRIVE_D;
    SUBSTRATE <= SUB_DRIVE_S;

    CONTROL: process (GATE, DRAIN'TRANSACTION, SOURCE'TRANSACTION,
                D5, D10, SUSPEND, AUX_EN)
        variable PENDING: boolean;
    begin
        if (GATE'EVENT or AUX_EN'EVENT) then
            ENABLE <= To_X01(GATE and AUX_EN);
        end if;

        if (SUSPEND'EVENT and SUSPEND) then
            PENDING := FALSE;
        end if;

        if ((DRAIN'ACTIVE or SOURCE'ACTIVE) and not PENDING
                 and not SUSPEND and EQUAL(ENABLE, '1')) then
            ENABLE <= '0';
            PENDING := TRUE;
            D1 <= not D1;
        end if;

        if (D10'EVENT and PENDING) then
            PENDING := FALSE;

            if (not EQUAL(DRAIN,SOURCE) and
                    EQUAL(ENABLE, '1')) then
                ENABLE <= '0';
                PENDING := TRUE;
                D1 <= not D1;
            end if;

        elsif (D5'EVENT and PENDING and EQUAL(GATE, '1') and
           EQUAL(resolved(SUBSTRATE & DRAIN & SUB_DRIVE_D),
                 resolved(SUBSTRATE & SOURCE & SUB_DRIVE_S))) then
            ENABLE <= '1';

        end if;

    end process CONTROL;

    D2 <= D1;
    D3 <= D2;
    D4 <= D3;
    D5 <= D4;
    D6 <= D5;
    D7 <= D6;
    D8 <= D7;
    D9 <= D8;
    D10 <= D9;

end MIXED;

