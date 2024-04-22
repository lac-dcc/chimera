-- *****************************************************************************************
-- AVR synthesis control package
-- Version 1.32 (Special version for the JTAG OCD)
-- Modified 14.07.2005
-- Designed by Ruslan Lepetenok
-- *****************************************************************************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

package SynthCtrlPack is

-- Function f_log2 returns the number of bits required to express
-- an unsigned integer in binary. It is used, for example, to
-- returns the width of a memory address bus, given the memory
-- depth in words

-- Function definition
function f_log2 (x : positive) return natural;

-- Reset generator
constant CSecondClockUsed     : boolean := FALSE;

constant CImplClockSw         : boolean := FALSE;

-- Only for ASICs
constant CSynchLatchUsed      : boolean := FALSE;

-- Register file
constant CResetRegFile        : boolean := TRUE;

-- External multiplexer size
constant CExtMuxInSize        : positive := 16;

end SynthCtrlPack;

package body SynthCtrlPack is

-- Function body
function f_log2 (x : positive) return natural is
    variable i : natural;
begin
    i := 0;
    while (2**i < x) and i < 31 loop
        i := i + 1;
    end loop;
    return i;
end function;

end SynthCtrlPack;
