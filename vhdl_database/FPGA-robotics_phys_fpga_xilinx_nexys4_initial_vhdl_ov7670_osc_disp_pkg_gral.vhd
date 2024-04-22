----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package GRAL_PKG is


  function log2 (x : positive) return natural;

  
end GRAL_PKG;

package body GRAL_PKG is

  function log2 (x : positive) return natural is
    variable temp, log: natural;
  begin
    temp := x / 2;
    log := 0;
    while (temp /= 0) loop
      temp := temp/2;
      log := log + 1;
    end loop;
    return log;
  end function log2;
  
end GRAL_PKG;
