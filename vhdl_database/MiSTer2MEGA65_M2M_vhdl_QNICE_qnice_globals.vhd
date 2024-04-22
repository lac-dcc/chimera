----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework  
--
-- QNICE globals based on QNICE's original env1_globals but
-- with optimized values for ROM/RAM usage
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2021 and licensed under GPL v3
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package env1_globals is

constant QNICE_CLK_SPEED      : natural   := 50_000_000;

-- size of lower register bank: needs to be 256 for standard QNICE
-- depending on the ROM/firmware we ca reduce it to save FPGA resources
-- for MiSTer2MEGA65 we assume that 32 is enough
constant SHADOW_REGFILE_SIZE  : natural   := 32;

-- size of the block RAM in 16bit words:
--   standard QNICE (development mode): 32768
--   embedded mode (m2m-rom.rom):       12288
constant BLOCK_RAM_SIZE       : natural   := 32768;
--constant BLOCK_RAM_SIZE       : natural   := 12288;

-- UART is in 8-N-1 mode
-- assuming a 100 MHz system clock, set the baud rate by selecting the following divisors according to this formula:
-- UART_DIVISOR = 100,000,000 / (16 x BAUD_RATE)
--    2400 -> 2604
--    9600 -> 651
--    19200 -> 326
--    115200 -> 54
--    1562500 -> 4
--    2083333 -> 3
constant UART_DIVISOR          : natural  := 27; -- above mentioned / 2, as long as we are using SLOW_CLOCK with 50 MHz
constant UART_FIFO_SIZE        : natural  := 32; -- size of the UART's FIFO buffer in bytes

-- Amount of CPU cycles, that the reset signal shall be active
constant RESET_DURATION        : natural  := 16;

end env1_globals;

package body env1_globals is
end env1_globals;
