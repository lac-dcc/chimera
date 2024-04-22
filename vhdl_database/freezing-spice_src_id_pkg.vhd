library ieee;
use ieee.std_logic_1164.all;
use std.textio.all;

use work.common.all;
use work.csr_pkg.all;

package id_pkg is
    -- decoder input
    type id_in is record
        instruction : word;
    end record id_in;

    -- opcode type
    subtype opcode_t is std_logic_vector(6 downto 0);
    
    -- structure for decoded instruction    
    type decoded_t is record
        alu_func    : alu_func_t;
        op2_src     : std_logic;
        insn_type   : insn_type_t;
        branch_type : branch_type_t;
        load_type   : load_type_t;
        store_type  : store_type_t;
        rs1         : reg_addr_t;
        rs2         : reg_addr_t;
        rd          : reg_addr_t;
        imm         : word;
        opcode      : opcode_t;
        rs1_rd      : std_logic;
        rs2_rd      : std_logic;
        use_imm     : std_logic;
        rf_we       : std_logic;
        csr_addr    : csr_addr_t;
        system_type : system_type_t;
    end record decoded_t;
    
    -- value of decoding after reset
    constant c_decoded_reset : decoded_t := (alu_func    => ALU_NONE,
                                             op2_src     => '0',
                                             insn_type   => OP_ILLEGAL,
                                             branch_type => BRANCH_NONE,
                                             load_type   => LOAD_NONE,
                                             store_type  => STORE_NONE,
                                             rs1         => "00000",
                                             rs2         => "00000",
                                             rd          => "00000",
                                             imm         => (others => '0'),
                                             opcode      => (others => '0'),
                                             rs1_rd      => '0',
                                             rs2_rd      => '0',
                                             use_imm     => '0',
                                             rf_we       => '0',
                                             csr_addr    => (others => '0'),
                                             system_type => SYSTEM_ECALL);

    -- Constants
    constant c_op_load     : opcode_t := "0000011";
    constant c_op_misc_mem : opcode_t := "0001111";
    constant c_op_imm      : opcode_t := "0010011";
    constant c_op_auipc    : opcode_t := "0010111";
    constant c_op_store    : opcode_t := "0100011";
    constant c_op_reg      : opcode_t := "0110011";
    constant c_op_lui      : opcode_t := "0110111";
    constant c_op_branch   : opcode_t := "1100011";
    constant c_op_jalr     : opcode_t := "1100111";
    constant c_op_jal      : opcode_t := "1101111";
    constant c_op_system   : opcode_t := "1110011";

    procedure print_insn (insn_type : in insn_type_t);
    
end package id_pkg;

package body id_pkg is

    procedure print_insn (insn_type : in insn_type_t) is
        variable l : line;
    begin
        write(l, string'("Instruction type: "));
        if insn_type = OP_LUI then
            write(l, string'("LUI"));
            writeline(output, l);
        elsif insn_type = OP_AUIPC then
            write(l, string'("AUIPC"));
            writeline(output, l);
        elsif insn_type = OP_JAL then
            write(l, string'("JAL"));
            writeline(output, l);
        elsif insn_type = OP_JALR then
            write(l, string'("JALR"));
            writeline(output, l);
        elsif insn_type = OP_BRANCH then
            write(l, string'("BRANCH"));
            writeline(output, l);
        elsif insn_type = OP_LOAD then
            write(l, string'("LOAD"));
            writeline(output, l);
        elsif insn_type = OP_STORE then
            write(l, string'("STORE"));
            writeline(output, l);
        elsif insn_type = OP_ALU then
            write(l, string'("ALU"));
            writeline(output, l);
        elsif insn_type = OP_STALL then
            write(l, string'("STALL"));
            writeline(output, l);
        elsif insn_type = OP_SYSTEM then
            write(l, string'("SYSTEM"));
            writeline(output, l);
        else
            write(l, string'("ILLEGAL"));
            writeline(output, l);
        end if;
    end procedure print_insn;

end package body id_pkg;
