library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;

package csr_pkg is

    subtype csr_addr_t is std_logic_vector(11 downto 0);

    -- input record
    type csr_in_t is record
        csr_addr    : csr_addr_t;
        rs1         : word;
        imm         : word;
        system_type : system_type_t;
        valid  :  std_logic;  -- '1' if this was a valid cycle that the core was executing
        instret : std_logic;  -- '1' for instruction retired this cycle

    end record csr_in_t;
    
    ----------------------------------------------
    -- User-mode (U) CSRs
    ----------------------------------------------
    constant CSR_CYCLE    : csr_addr_t := X"C00";
    constant CSR_TIME     : csr_addr_t := X"C01";
    constant CSR_INSTRET  : csr_addr_t := X"C02";
    constant CSR_CYCLEH   : csr_addr_t := X"C80";
    constant CSR_TIMEH    : csr_addr_t := X"C81";
    constant CSR_INSTRETH : csr_addr_t := X"C82";

    ----------------------------------------------
    -- Machine-mode (M) CSRs
    ----------------------------------------------

    -- Machine Information Registers
    constant CSR_MCPUID  : csr_addr_t := X"F00";
    constant CSR_MIMPID  : csr_addr_t := X"F01";
    constant CSR_MHARTID : csr_addr_t := X"F10";

    -- Machine Trap Setup
    constant CSR_MSTATUS  : csr_addr_t := X"300";
    constant CSR_MTVEC    : csr_addr_t := X"301";
    constant CSR_MTDELEG  : csr_addr_t := X"302";
    constant CSR_MIE      : csr_addr_t := X"304";
    constant CSR_MTIMECMP : csr_addr_t := X"321";

    -- Machine Timers and Counters
    constant CSR_MTIME  : csr_addr_t := X"701";
    constant CSR_MTIMEH : csr_addr_t := X"741";

    -- Machine Trap Handling
    constant CSR_MSCRATCH : csr_addr_t := X"340";
    constant CSR_MEPC     : csr_addr_t := X"341";
    constant CSR_MCAUSE   : csr_addr_t := X"342";
    constant CSR_MBADADDR : csr_addr_t := X"343";
    constant CSR_MIP      : csr_addr_t := X"344";

    -- Machine Protection and Translation
    constant CSR_MBASE : csr_addr_t := X"380";
    constant CSR_MBOUND : csr_addr_t := X"381";
    constant CSR_MIBASE : csr_addr_t := X"382";
    constant CSR_MIBOUND : csr_addr_t := X"383";
    constant CSR_MDBASE : csr_addr_t := X"384";
    constant CSR_MDBOUND : csr_addr_t := X"385";
    
end package csr_pkg;
