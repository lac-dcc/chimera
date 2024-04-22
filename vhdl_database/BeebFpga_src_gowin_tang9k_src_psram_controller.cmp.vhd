-- VHDL component definition for psram_controller
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

package psram_pack is

component PsramController
generic (
    FREQ : positive := 81_000_000;	-- Actual clk frequency, to time 150us initialization delay
    LATENCY : positive := 3;       	-- tACC (Initial Latency) in W955D8MBYA datasheet:
                                    -- 3 (max 83Mhz), 4 (max 104Mhz), 5 (max 133Mhz) or 6 (max 166Mhz)
    CS_DELAY: boolean
);
port(
   clk            : in     std_logic;
   clk_p          : in     std_logic;                     -- 90 degree phase-shifted clock for driving O_psram_ck
   resetn         : in     std_logic;
   read           : in     std_logic;                     -- Set to 1 to read from RAM
   write          : in     std_logic;                     -- Set to 1 to write to RAM
   addr           : in     std_logic_vector(21 downto 0); -- Byte address to read / write
   din            : in     std_logic_vector(15 downto 0); -- Data word to write
   byte_write     : in     std_logic;                     -- When writing, only write one byte instead of the whole word.
                                                   -- addr[0]==1 means we write the upper half of din. lower half otherwise.
   dout           : out    std_logic_vector(15 downto 0);-- Last read data. Read is always word-based.
   busy           : out    std_logic;                    -- 1 while an operation is in progress

    -- HyperRAM physical interface. Gowin interface is for 2 dies.
    -- We currently only use the first die (4MB).
    O_psram_ck    : out    std_logic_vector(1 downto 0);
    O_psram_ck_n  : out    std_logic_vector(1 downto 0);
    IO_psram_rwds : inout  std_logic_vector(1 downto 0);
    IO_psram_dq   : inout  std_logic_vector(15 downto 0);
    O_psram_cs_n  : out    std_logic_vector(1 downto 0)
);
end component;

end package;
