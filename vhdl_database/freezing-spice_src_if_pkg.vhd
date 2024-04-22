library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;

package if_pkg is

    -- The CPU will vector to this address
    --   when an IRQ is asserted and the pipeline
    --   is in a safe place to do so.
    constant IRQ_VECTOR_ADDRESS : word := X"00000200";
    
    -- inputs to Instruction Fetch stage
    type if_in is record
        insn    : word;
        load_pc : std_logic;
        next_pc : word;
        stall   : std_logic;
        irq     : std_logic;
    end record if_in;

    -- outputs from Instruction Fetch stage
    type if_out is record
        fetch_addr : word;
        pc : word;
    end record if_out;
    
end package if_pkg;
