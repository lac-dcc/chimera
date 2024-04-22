library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;

package ex_pkg is

    -- inputs to execution stage
    type ex_in is record
        insn_type : insn_type_t;
        npc : word;
        op1 : word;
        op2 : word;
        use_imm : std_logic;
        alu_func : alu_func_t;
        branch_type : branch_type_t;
        imm : word;
    end record ex_in;

    -- outputs from execution stage
    type ex_out is record
        alu_result : word;
        compare_result : std_logic;
        return_addr : word;
    end record ex_out;

end package ex_pkg;
