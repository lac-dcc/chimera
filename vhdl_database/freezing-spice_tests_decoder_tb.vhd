library ieee;
use ieee.std_logic_1164.all;

use work.id_pkg.all;
use work.common.all;
use work.encode_pkg.all;

entity decoder_tb is
end entity decoder_tb;

architecture testbench of decoder_tb is
    -- inputs
    signal insn    : word;
    -- outputs
    signal decoded : decoded_t;

    procedure verify_r_type (insn_type   : in insn_type_t;
                             r_insn      : in r_insn_t;
                             rs1, rs2, d : in std_logic_vector(4 downto 0)) is
    begin
        print_insn(insn_type);
        assert decoded.insn_type = insn_type report "Invalid instruction type" severity error;
        case (r_insn) is
            when R_ADD  => assert decoded.alu_func = ALU_ADD report "Invalid ALU function" severity error;
            when R_SLT  => assert decoded.alu_func = ALU_SLT report "Invalid ALU function" severity error;
            when R_SLTU => assert decoded.alu_func = ALU_SLTU report "Invalid ALU function" severity error;
            when R_AND  => assert decoded.alu_func = ALU_AND report "Invalid ALU function" severity error;
            when R_OR   => assert decoded.alu_func = ALU_OR report "Invalid ALU function" severity error;
            when R_XOR  => assert decoded.alu_func = ALU_XOR report "Invalid ALU function" severity error;
            when R_SLL  => assert decoded.alu_func = ALU_SLL report "Invalid ALU function" severity error;
            when R_SRL  => assert decoded.alu_func = ALU_SRL report "Invalid ALU function" severity error;
            when R_SUB  => assert decoded.alu_func = ALU_SUB report "Invalid ALU function" severity error;
            when R_SRA  => assert decoded.alu_func = ALU_SRA report "Invalid ALU function" severity error;
        end case;
    end procedure verify_r_type;

    -- purpose: verify U-type instruction
    procedure verify_u_type (
        insn_type : in insn_type_t;
        imm       : in word;
        rd        : in std_logic_vector(4 downto 0)) is
    begin
        print_insn(insn_type);
        assert decoded.insn_type = insn_type report "Invalid instruction type" severity error;
        assert decoded.imm = imm report "Invalid Immediate Value" severity error;
        assert decoded.rd = rd report "Invalid Rd" severity error;
    end procedure verify_u_type;

    -- purpose: verify UJ-type instruction
    procedure verify_uj_type (
        insn_type : in insn_type_t;
        imm       : in word;
        rd        : in std_logic_vector(4 downto 0)) is
    begin  -- procedure verify_uj_type
        print_insn(insn_type);
        assert decoded.insn_type = insn_type report "Invalid instruction type" severity error;
        assert decoded.imm = imm report "Invalid immediate" severity error;
        assert decoded.rd = rd report "Invalid Rd" severity error;
    end procedure verify_uj_type;

    -- purpose: verify a decoded I-type instruction
    procedure verify_i_type (insn_type : in insn_type_t;
                             i_type    : in i_insn_t;
                             imm       : in word;
                             rs1, rd   : in std_logic_vector(4 downto 0)) is
    begin  -- procedure verify_i_type
        print_insn(insn_type);
        assert decoded.insn_type = insn_type report "Invalid instruction type" severity error;
        assert decoded.imm = imm report "Invalid immediate" severity error;
        assert decoded.rs1 = rs1 report "Invalid Rs1" severity error;
        assert decoded.rd = rd report "Invalid Rd" severity error;
        case (insn_type) is
            when OP_LOAD =>
                case i_type is
                    when I_LB   => assert decoded.load_type = LB report "Invalid load type" severity error;
                    when I_LH   => assert decoded.load_type = LH report "Invalid load type" severity error;
                    when I_LW   => assert decoded.load_type = LW report "Invalid load type" severity error;
                    when I_LBU  => assert decoded.load_type = LBU report "Invalid load type" severity error;
                    when I_LHU  => assert decoded.load_type = LHU report "Invalid load type" severity error;
                    when others => assert false report "Unexpected load type" severity error;
                end case;
            when OP_ALU =>
                case i_type is
                    when I_ADDI  => assert decoded.alu_func = ALU_ADD report "Invalid ALU function" severity error;
                    when I_SLTI  => assert decoded.alu_func = ALU_SLT report "Invalid ALU function" severity error;
                    when I_SLTIU => assert decoded.alu_func = ALU_SLTU report "Invalid ALU function" severity error;
                    when I_XORI  => assert decoded.alu_func = ALU_XOR report "Invalid ALU function" severity error;
                    when I_ORI   => assert decoded.alu_func = ALU_OR report "Invalid ALU function" severity error;
                    when I_ANDI  => assert decoded.alu_func = ALU_AND report "Invalid ALU function" severity error;
                    when others  => assert false report "Unexpected ALU function" severity error;
                end case;
            when OP_JALR => null;
            when others =>
                assert false report "Unexpected instruction type" severity error;
        end case;
    end procedure verify_i_type;

    procedure verify_s_type (insn_type : in insn_type_t;
                             s_type    : in s_insn_t;
                             imm       : in word;
                             rs1, rs2  : in std_logic_vector(4 downto 0)) is
    begin
        print_insn(insn_type);
        assert decoded.insn_type = insn_type report "Invalid instruction type" severity error;
        assert decoded.imm = imm report "" severity error;
        assert decoded.rs1 = rs1 report "Invalid Rs1" severity error;
        assert decoded.rs2 = rs2 report "Invalid Rs2" severity error;
        case s_type is
            when S_SB   => assert decoded.store_type = SB report "Invalid store type" severity error;
            when S_SH   => assert decoded.store_type = SH report "Invalid store type" severity error;
            when S_SW   => assert decoded.store_type = SW report "Invalid store type" severity error;
            when others => assert false report "Unexpected store type" severity error;
        end case;
    end procedure verify_s_type;

    -- purpose: verify a decoded SB-type instruction
    procedure verify_sb_type (
        insn_type   : in insn_type_t;
        imm         : in word;
        branch_type : in branch_type_t;
        rs1, rs2    : in std_logic_vector(4 downto 0)) is
    begin  -- procedure verify_sb_type
        print_insn(insn_type);
        assert decoded.insn_type = insn_type report "Invalid instruction type" severity error;
        assert decoded.imm = imm report "Invalid immediate" severity error;
        assert decoded.branch_type = branch_type report "Invalid branch type" severity error;
        assert decoded.rs1 = rs1 report "Invalid Rs1" severity error;
        assert decoded.rs2 = rs2 report "Invalid Rs2" severity error;
    end procedure verify_sb_type;

    -- purpose: verify a decoded I-type shift instruction
    procedure verify_i_shift (
        i_insn  : in i_insn_t;
        shamt   : in std_logic_vector(4 downto 0);
        rs1, rd : in std_logic_vector(4 downto 0)) is
    begin  -- procedure verify_i_shift
        println("Instruction type: ALU SHIFT");
        assert decoded.insn_type = OP_ALU report "Expected OP_ALU" severity error;
        case i_insn is
            when I_SLLI =>
                assert decoded.alu_func = ALU_SLL report "Invalid ALU type" severity error;
            when I_SRLI =>
                assert decoded.alu_func = ALU_SRL report "Invalid ALU type" severity error;
            when I_SRAI =>
                assert decoded.alu_func = ALU_SRA report "Invalid ALU type" severity error;
            when others =>
                assert false report "Invalid Shift type" severity error;
        end case;
        
    end procedure verify_i_shift;
    
begin  -- architecture test

    uut : entity work.instruction_decoder(behavioral)
        port map (d => insn,
                  q => decoded);

    -- purpose: provide stimulus and verification of the RISCV decoder
    -- type   : combinational
    -- inputs : 
    -- outputs: asserts
    stimulus_proc : process is
    begin  -- process stimulus_proc

        -- LUI
        insn <= encode_u_type(U_LUI, "01010101010101010101", 31);
        wait for 1 ns;
        verify_u_type(OP_LUI, "01010101010101010101000000000000", "11111");

        -- AUIPC
        insn <= encode_u_type(U_AUIPC, "10101010101010101010", 21);
        wait for 1 ns;
        verify_u_type(OP_AUIPC, "10101010101010101010000000000000", "10101");

        -- JAL
        insn <= encode_uj_type(UJ_JAL, "11010101001010101010", 10);
        wait for 1 ns;
        verify_uj_type(OP_JAL, "11111111111110101010010101010100", "01010");

        -- JALR
        insn <= encode_i_type(I_JALR, "110011001100", 6, 5);
        wait for 1 ns;
        verify_i_type(OP_JALR, I_JALR, "11111111111111111111110011001100", "00110", "00101");

        -- BEQ
        insn <= encode_sb_type(SB_BEQ, "101101101101", 20, 1);
        wait for 1 ns;
        verify_sb_type(OP_BRANCH, "11111111111111111111011011011010", BEQ, "10100", "00001");

        -- BNE
        insn <= encode_sb_type(SB_BNE, "000010000101", 16, 18);
        wait for 1 ns;
        verify_sb_type(OP_BRANCH, "00000000000000000000000100001010", BNE, "10000", "10010");

        -- BLT
        insn <= encode_sb_type(SB_BLT, "001011001110", 15, 14);
        wait for 1 ns;
        verify_sb_type(OP_BRANCH, "00000000000000000000010110011100", BLT, "01111", "01110");

        -- BGE
        insn <= encode_sb_type(SB_BGE, "001010101001", 13, 12);
        wait for 1 ns;
        verify_sb_type(OP_BRANCH, "00000000000000000000010101010010", BGE, "01101", "01100");

        -- BLTU
        insn <= encode_sb_type(SB_BLTU, "001010101001", 13, 12);
        wait for 1 ns;
        verify_sb_type(OP_BRANCH, "00000000000000000000010101010010", BLTU, "01101", "01100");

        -- BGEU
        insn <= encode_sb_type(SB_BGEU, "101111000110", 11, 10);
        wait for 1 ns;
        verify_sb_type(OP_BRANCH, "11111111111111111111011110001100", BGEU, "01011", "01010");

        -- LB
        insn <= encode_i_type(I_LB, "000111000111", 9, 8);
        wait for 1 ns;
        verify_i_type(OP_LOAD, I_LB, "00000000000000000000000111000111", "01001", "01000");

        -- LH
        insn <= encode_i_type(I_LH, "011011011011", 7, 6);
        wait for 1 ns;
        verify_i_type(OP_LOAD, I_LH, "00000000000000000000011011011011", "00111", "00110");

        -- LW
        insn <= encode_i_type(I_LW, "011011011010", 5, 4);
        wait for 1 ns;
        verify_i_type(OP_LOAD, I_LW, "00000000000000000000011011011010", "00101", "00100");

        -- LBU
        insn <= encode_i_type(I_LBU, "110110110110", 3, 2);
        wait for 1 ns;
        verify_i_type(OP_LOAD, I_LBU, "11111111111111111111110110110110", "00011", "00010");

        -- LHU
        insn <= encode_i_type(I_LHU, "111111111111", 1, 0);
        wait for 1 ns;
        verify_i_type(OP_LOAD, I_LHU, "11111111111111111111111111111111", "00001", "00000");

        -- SB
        insn <= encode_s_type(S_SB, "011111111110", 21, 22);
        wait for 1 ns;
        verify_s_type(OP_STORE, S_SB, "00000000000000000000011111111110", "10101", "10110");

        -- SH
        insn <= encode_s_type(S_SH, "011111111110", 21, 22);
        wait for 1 ns;
        verify_s_type(OP_STORE, S_SH, "00000000000000000000011111111110", "10101", "10110");

        -- SW
        insn <= encode_s_type(S_SW, "001111111110", 23, 24);
        wait for 1 ns;
        verify_s_type(OP_STORE, S_SW, "00000000000000000000001111111110", "10111", "11000");

        -- ADDI
        insn <= encode_i_type(I_ADDI, "111111111111", 25, 26);
        wait for 1 ns;
        verify_i_type(OP_ALU, I_ADDI, "11111111111111111111111111111111", "11001", "11010");

        -- SLTI
        insn <= encode_i_type(I_SLTI, "111111111110", 27, 28);
        wait for 1 ns;
        verify_i_type(OP_ALU, I_SLTI, "11111111111111111111111111111110", "11011", "11100");

        -- SLTIU
        insn <= encode_i_type(I_SLTIU, "111111111100", 29, 30);
        wait for 1 ns;
        verify_i_type(OP_ALU, I_SLTIU, "11111111111111111111111111111100", "11101", "11110");

        -- XORI
        insn <= encode_i_type(I_XORI, "111111111110", 31, 30);
        wait for 1 ns;
        verify_i_type(OP_ALU, I_XORI, "11111111111111111111111111111110", "11111", "11110");

        -- ORI
        insn <= encode_i_type(I_ORI, "111111111110", 1, 2);
        wait for 1 ns;
        verify_i_type(OP_ALU, I_ORI, "11111111111111111111111111111110", "00001", "00010");

        -- ANDI
        insn <= encode_i_type(I_ANDI, "111111111110", 3, 4);
        wait for 1 ns;
        verify_i_type(OP_ALU, I_ANDI, "11111111111111111111111111111110", "00011", "00100");

        -- SLLI
        insn <= encode_i_shift(I_SLLI, "11100", 5, 6);
        wait for 1 ns;
        verify_i_shift(I_SLLI, "11100", "00101", "00110");

        -- SRLI
        insn <= encode_i_shift(I_SRLI, "11101", 7, 8);
        wait for 1 ns;
        verify_i_shift(I_SRLI, "11101", "00101", "00110");

        -- SRAI
        insn <= encode_i_shift(I_SRAI, "11110", 9, 10);
        wait for 1 ns;
        verify_i_shift(I_SRAI, "11110", "00101", "00110");

        -- ADD
        insn <= encode_r_type(R_ADD, 2, 4, 8);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_ADD, "00010", "00100", "01000");

        -- SUB
        insn <= encode_r_type(R_SUB, 16, 31, 1);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_SUB, "10000", "11111", "00001");

        -- SLL
        insn <= encode_r_type(R_SLL, 0, 0, 0);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_SLL, "00000", "00000", "00000");

        -- SLT
        insn <= encode_r_type(R_SLT, 16, 8, 4);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_SLT, "10000", "01000", "00100");

        -- SLTU
        insn <= encode_r_type(R_SLTU, 24, 12, 6);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_SLTU, "11000", "01100", "00110");

        -- XOR
        insn <= encode_r_type(R_XOR, 0, 0, 0);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_XOR, "00000", "00000", "00000");

        -- SRL
        insn <= encode_r_type(R_SRL, 0, 0, 0);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_SRL, "00000", "00000", "00000");

        -- SRA
        insn <= encode_r_type(R_SRA, 0, 0, 0);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_SRA, "00000", "00000", "00000");

        -- OR
        insn <= encode_r_type(R_OR, 0, 0, 0);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_OR, "00000", "00000", "00000");

        -- AND
        insn <= encode_r_type(R_AND, 0, 0, 0);
        wait for 1 ns;
        verify_r_type(OP_ALU, R_AND, "00000", "00000", "00000");

        -- @todo others

        ----------------------------------------------------------------
        println("Verification complete");
        ----------------------------------------------------------------

        wait;
        
    end process stimulus_proc;
    
end architecture testbench;
