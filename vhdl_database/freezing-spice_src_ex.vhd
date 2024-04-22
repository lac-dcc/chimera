library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;
use work.ex_pkg.all;

entity instruction_executor is
    port (ex_d : in  ex_in;
          ex_q : out ex_out);
end entity instruction_executor;

architecture Behavioral of instruction_executor is
    signal op1            : word;
    signal op2            : word;
    signal alu_out        : word;
    signal compare_result : std_logic;
    signal return_addr : unsigned(word'range);

    constant c_four : unsigned(2 downto 0) := to_unsigned(4, 3);
begin  -- architecture Behavioral

    -- assign modules outputs
    ex_q.alu_result     <= alu_out;
    ex_q.compare_result <= compare_result;
    ex_q.return_addr    <= std_logic_vector(return_addr);

    -- ALU operand 1 multiplexer
    op1 <= ex_d.npc when (ex_d.insn_type = OP_BRANCH or
                          ex_d.insn_type = OP_JAL or
                          ex_d.insn_type = OP_JALR or
                          ex_d.insn_type = OP_AUIPC)
           else ex_d.op1;

    -- ALU operand 2 multiplexer
    op2 <= ex_d.imm when ((ex_d.insn_type = OP_ALU and ex_d.use_imm = '1') or
                          ex_d.insn_type = OP_BRANCH or
                          ex_d.insn_type = OP_JAL or
                          ex_d.insn_type = OP_JALR or
                          ex_d.insn_type = OP_LOAD or
                          ex_d.insn_type = OP_STORE or
                          ex_d.insn_type = OP_AUIPC)
           else ex_d.op2;

    -- ALU
    arithmetic_logic_unit : entity work.alu(Behavioral)
        port map (alu_func => ex_d.alu_func,
                  op1      => op1,
                  op2      => op2,
                  result   => alu_out);

    -- compare unit
    conditionals : entity work.compare_unit(Behavioral)
        port map (branch_type    => ex_d.branch_type,
                  op1            => op1,
                  op2            => op2,
                  compare_result => compare_result);

    -- return address for JAL/JALR
    return_addr <= unsigned(ex_d.npc) + c_four;
    
end architecture Behavioral;
