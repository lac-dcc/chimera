--------------------------------------------------------------------------------
-- Felipe Machado Sanchez
-- Departameto de Tecnologia Electronica
-- Universidad Rey Juan Carlos
-- http://gtebim.es/~fmachado
--
-- Paquete de las funciones de la UART, del libro Diseno de sistemas digitale

library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- este paquete es para usar las funciones en el paquete UART_PKG_CTE
package PKG_FUN is

 --------------------------- function: log2i ----------------------------------
  -- Description: calculates the log2 of an positive integer number
  --    the result is rounded to the lower integer
  --    For example:
  --        log2i(7) = 2
  --        log2i(8) = 3
  -- Input:
  --    natural number we want to calculate the log2
  -- Output:
  --    log2 value truncated to the integer less or equal to the result
  function log2i (number : positive) return natural;


 --------------------------- funcion: div_round -------------------------------
  -- Description: calculates the integer division rounded to the closest integeo
  function div_round (dividendo, divisor: natural) return natural;

  function div_ceil (dividendo, divisor: natural) return natural;

  function to_text (arg : natural) return string;

end PKG_FUN;


Package body PKG_FUN is

 --------------------------- log2i ---------------------------------------
 -- Working examples (number = 6, 7, 8)
 --  * number = 6           |  * number = 7         |  * number = 8
 --      tmp = 6/2 = 3      |     tmp = 7/2 = 3     |     tmp = 8/2 = 4
 --      log2 = 0           |     log2 = 0          |     log2 = 0
 --    - loop 0: tmp 3 > 0  |   - loop 0: tmp 3>0   |   - loop 0: tmp 4>0
 --      tmp = 3/2 = 1      |     tmp = 3/2 = 1     |     tmp = 4/2 = 2
 --      log2 = 1           |     log2 = 1          |     log2 = 1
 --    - loop 1: tmp 1 > 0  |   - loop 1: tmp 1 > 0 |   - loop 1: tmp 2 > 0
 --      tmp = 1/2 = 0      |     tmp = 1/2 = 0     |     tmp = 2/2 = 1
 --      log2 = 2           |     log2 = 2          |     log2 = 2
 --    - end loop: tmp = 0  |   - end loop: tmp = 0 |   - loop 2: tmp 1 > 0
 --  * return log2 = 2      | * return log2 = 2     |     temp = 1/2 = 0
 --                                                 |     log2 = 3
 --                                                 |   - end loop: tmp = 0
 --                                                 | * return log2 = 3

  function log2i (number : positive) return natural is
    variable tmp, log2: natural;
  begin
    tmp := number / 2;  -- integer division, rounded to the lower integer
    log2 := 0;
    while (tmp /= 0) loop
      tmp := tmp/2;
      log2 := log2 + 1;
    end loop;
    return log2;
  end function log2i;
  
  function div_round (dividendo, divisor: natural)
    return natural is
      variable result : integer;
      variable resto  : integer;
  begin
    result := dividendo/divisor;
    resto    := dividendo rem divisor; -- rem: remainder
    if (resto > (divisor/2)) then
      result := result + 1;
    end if;
    return (result);
  end;

  -- integer division rounded to the ceil if it is not exact
  function div_ceil (dividendo, divisor: natural)
    return natural is
      variable result : integer;
      variable resto  : integer;
  begin
    result := dividendo/divisor;
    resto    := dividendo rem divisor; -- rem: remainder
    if (resto > 0) then
      result := result + 1;
    end if;
    return (result);
  end;

-- funtion to be used in assert

  function to_text (arg : natural) return string is
  begin
    case arg is
      when 0 => return "0";
      when 1 => return "1";
      when 2 => return "2";
      when 3 => return "3";
      when 4 => return "4";
      when 5 => return "5";
      when 6 => return "6";
      when 7 => return "7";
      when others => return "?";
    end case;
  end;

end PKG_FUN;

