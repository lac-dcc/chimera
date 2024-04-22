library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.common.all;
use work.id_pkg.all;
use work.csr_pkg.all;

package encode_pkg is

    subtype register_t is integer range 0 to 31;

    -- functions to encode the different types of instructions, organized by format
    function encode_r_type (insn_type    : r_insn_t;
                            rs1, rs2, rd : register_t)
        return word;

    function encode_i_type (insn_type : i_insn_t;
                            imm       : std_logic_vector(11 downto 0);
                            rs1, rd   : register_t)
        return word;

    function encode_s_type (insn_type : s_insn_t;
                            imm       : std_logic_vector(11 downto 0);
                            rs1, rs2  : register_t)
        return word;

    function encode_sb_type (insn_type : sb_insn_t;
                             imm       : std_logic_vector(12 downto 1);
                             rs1, rs2  : register_t)
        return word;
    
    function encode_u_type (insn_type : u_insn_t;
                            imm_31_12 : std_logic_vector(31 downto 12);
                            rd        : register_t)
        return word;

    function encode_uj_type (insn_type : uj_insn_t;
                             imm       : std_logic_vector(20 downto 1);
                             rd        : register_t)
        return word;

    function encode_i_shift (i_insn  : i_insn_t;
                             shamt   : std_logic_vector(4 downto 0);
                             rs1, rd : register_t)
        return word;

    function encode_i_csr (csr_addr : csr_addr_t;
                           rd       : register_t)
        return word;
    
end package encode_pkg;

package body encode_pkg is

    -- purpose: encode a U-type instruction
    function encode_u_type (insn_type : u_insn_t;
                            imm_31_12 : std_logic_vector(31 downto 12);
                            rd        : register_t) return word is
        variable result : word;
    begin  -- function encode_lui
        result(31 downto 12) := imm_31_12;
        result(11 downto 7)  := std_logic_vector(to_unsigned(rd, 5));
        case insn_type is
            when U_LUI   => result(6 downto 0) := c_op_lui;
            when U_AUIPC => result(6 downto 0) := c_op_auipc;
        end case;
        return result;
    end function encode_u_type;

    -- purpose: encode an R-type instruction
    function encode_r_type (insn_type    : r_insn_t;
                            rs1, rs2, rd : register_t)
        return word is
        variable result : word;
    begin  -- function encode_r_type
        result(24 downto 20) := std_logic_vector(to_unsigned(rs2, 5));
        result(19 downto 15) := std_logic_vector(to_unsigned(rs1, 5));
        result(11 downto 7)  := std_logic_vector(to_unsigned(rd, 5));
        result(6 downto 0)   := c_op_reg;
        case insn_type is
            when R_ADD =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "000";
            when R_SUB =>
                result(31 downto 25) := "0100000";
                result(14 downto 12) := "000";
            when R_SLL =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "001";
            when R_SLT =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "010";
            when R_SLTU =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "011";
            when R_XOR =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "100";
            when R_SRL =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "101";
            when R_SRA =>
                result(31 downto 25) := "0100000";
                result(14 downto 12) := "101";
            when R_OR =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "110";
            when R_AND =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "111";
        end case;
        return result;
    end function encode_r_type;

    -- purpose: encode a UJ-type instruction
    function encode_uj_type (
        insn_type : uj_insn_t;
        imm       : std_logic_vector(20 downto 1);
        rd        : register_t)
        return word is
        variable result : word;
    begin  -- function encode_uj_type
        result(31)           := imm(20);
        result(30 downto 21) := imm(10 downto 1);
        result(20)           := imm(11);
        result(19 downto 12) := imm(19 downto 12);
        result(11 downto 7)  := std_logic_vector(to_unsigned(rd, 5));
        case insn_type is
            when UJ_JAL => result(6 downto 0) := c_op_jal;
        end case;
        return result;
    end function encode_uj_type;

    -- purpose: encode an I-type instruction (for shifts only)
    function encode_i_shift (
        i_insn  : i_insn_t;
        shamt   : std_logic_vector(4 downto 0);
        rs1, rd : register_t)
        return word is
        variable result : word;
    begin  -- function encode_i_shift
        result(24 downto 20) := shamt;
        result(19 downto 15) := std_logic_vector(to_unsigned(rs1, 5));
        result(11 downto 7)  := std_logic_vector(to_unsigned(rd, 5));
        result(6 downto 0)   := c_op_imm;
        case (i_insn) is
            when I_SLLI =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "001";
            when I_SRLI =>
                result(31 downto 25) := "0000000";
                result(14 downto 12) := "101";
            when I_SRAI =>
                result(31 downto 25) := "0100000";
                result(14 downto 12) := "101";
            when others =>
                assert false report "Not an immediate shift instruction" severity error;
        end case;
        return result;
    end function encode_i_shift;

    -- encode a CSR access instruction
    function encode_i_csr (
        csr_addr : csr_addr_t;
        rd       : register_t)
        return word is
        variable result : word;
    begin
        case csr_addr is
            when CSR_CYCLE    => result(31 downto 20) := "110000000000";
            when CSR_CYCLEH   => result(31 downto 20) := "110010000000";
            when CSR_TIME     => result(31 downto 20) := "110000000001";
            when CSR_TIMEH    => result(31 downto 20) := "110010000001";
            when CSR_INSTRET  => result(31 downto 20) := "110000000010";
            when CSR_INSTRETH => result(31 downto 20) := "110010000010";
            when others       => null;
        end case;
        result(19 downto 15) := "00000";
        result(14 downto 12) := "010";
        result(11 downto 7)  := std_logic_vector(to_unsigned(rd, 5));
        result(6 downto 0)   := c_op_system;
        return result;
    end function encode_i_csr;

    -- purpose: encode an I-type instruction
    function encode_i_type (insn_type : i_insn_t;
                            imm       : std_logic_vector(11 downto 0);
                            rs1, rd   : register_t)
        return word is
        variable result : word;
    begin
        result(31 downto 20) := imm;
        result(19 downto 15) := std_logic_vector(to_unsigned(rs1, 5));
        result(11 downto 7)  := std_logic_vector(to_unsigned(rd, 5));
        case insn_type is
            when I_JALR =>
                result(14 downto 12) := "000";
                result(6 downto 0)   := c_op_jalr;
            when I_LB =>
                result(14 downto 12) := "000";
                result(6 downto 0)   := c_op_load;
            when I_LH =>
                result(14 downto 12) := "001";
                result(6 downto 0)   := c_op_load;
            when I_LW =>
                result(14 downto 12) := "010";
                result(6 downto 0)   := c_op_load;
            when I_LBU =>
                result(14 downto 12) := "100";
                result(6 downto 0)   := c_op_load;
            when I_LHU =>
                result(14 downto 12) := "101";
                result(6 downto 0)   := c_op_load;
            when I_ADDI =>
                result(14 downto 12) := "000";
                result(6 downto 0)   := c_op_imm;
            when I_SLTI =>
                result(14 downto 12) := "010";
                result(6 downto 0)   := c_op_imm;
            when I_SLTIU =>
                result(14 downto 12) := "011";
                result(6 downto 0)   := c_op_imm;
            when I_XORI =>
                result(14 downto 12) := "100";
                result(6 downto 0)   := c_op_imm;
            when I_ORI =>
                result(14 downto 12) := "110";
                result(6 downto 0)   := c_op_imm;
            when I_ANDI =>
                result(14 downto 12) := "111";
                result(6 downto 0)   := c_op_imm;
            when others =>
                assert false report "Use encode_i_shift" severity error;
        end case;
        return result;
    end function encode_i_type;

    -- purpose: encode an S-type instruction
    function encode_s_type (insn_type : s_insn_t;
                            imm       : std_logic_vector(11 downto 0);
                            rs1, rs2  : register_t)
        return word is
        variable result : word;
    begin  -- function encode_s_type
        result(31 downto 25) := imm(11 downto 5);
        result(24 downto 20) := std_logic_vector(to_unsigned(rs2, 5));
        result(19 downto 15) := std_logic_vector(to_unsigned(rs1, 5));
        result(11 downto 7)  := imm(4 downto 0);
        result(6 downto 0)   := c_op_store;
        case insn_type is
            when S_SB => result(14 downto 12) := "000";
            when S_SH => result(14 downto 12) := "001";
            when S_SW => result(14 downto 12) := "010";
        end case;
        return result;
    end function encode_s_type;

    -- encode an SB-type instruction
    function encode_sb_type (insn_type : sb_insn_t;
                             imm       : std_logic_vector(12 downto 1);
                             rs1, rs2  : register_t)
        return word is
        variable result : word;
    begin
        result(31)           := imm(12);
        result(30 downto 25) := imm(10 downto 5);
        result(24 downto 20) := std_logic_vector(to_unsigned(rs2, 5));
        result(19 downto 15) := std_logic_vector(to_unsigned(rs1, 5));
        result(11 downto 8)  := imm(4 downto 1);
        result(7)            := imm(11);
        result(6 downto 0)   := c_op_branch;
        case insn_type is
            when SB_BEQ  => result(14 downto 12) := "000";
            when SB_BNE  => result(14 downto 12) := "001";
            when SB_BLT  => result(14 downto 12) := "100";
            when SB_BGE  => result(14 downto 12) := "101";
            when SB_BLTU => result(14 downto 12) := "110";
            when SB_BGEU => result(14 downto 12) := "111";
        end case;
        return result;
    end function encode_sb_type;
    
end package body encode_pkg;
