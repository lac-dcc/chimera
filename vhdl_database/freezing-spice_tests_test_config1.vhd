library ieee;
use ieee.std_logic_1164.all;
use work.encode_pkg.all;
use work.common.all;
use work.csr_pkg.all;

package test_config is

    constant pipeline_tb_test_vector_input_filename : string := "sim/test1.vec";

    -- arrays of instructions
    type ram_t is array (natural range 0 to 256) of word;

    -- Test 1 : add, RAW hazard, WAR hazard, predicted-not-taken (incorrectly) forward branch,
    -- unconditional branch, store to memory, load from stored memory (stalls)
    constant test1 : ram_t := (0 => encode_i_type(I_ADDI, "000000000100", 0, 1),  -- ADDI x0, x1, 4
                               4 => encode_i_type(I_ADDI, "000000001000", 0, 2),  -- ADDI x0, x2, 8
                               8 => encode_r_type(R_ADD, 1, 2, 3),  -- ADD x1, x2, x3
                               12 => encode_u_type(U_LUI, "10000000000000000001", 4),  -- LUI 0x80001, x4
                               16 => encode_uj_type(UJ_JAL, "00000000000000010010", 6),  -- JAL 18, x6
                               20 => encode_i_type(I_ADDI, "000000000001", 0, 1),  -- ADDI x0, x1, 1      -- this should not get executed
                               24 => encode_i_type(I_ADDI, "000000000001", 0, 1),  -- ADDI x0, x1, 1      -- this should not get executed
                               28 => encode_i_type(I_ADDI, "000000000001", 0, 1),  -- ADDI x0, x1, 1      -- this should not get executed
                               32 => encode_i_type(I_ADDI, "000000000001", 0, 1),  -- ADDI x0, x1, 1      -- this should not get executed
                               36 => encode_i_type(I_ADDI, "000000000001", 0, 1),  -- ADDI x0, x1, 1      -- this should not get executed
                               40 => NOP,
                               44 => NOP,
                               48 => NOP,
                               52 => encode_r_type(R_ADD, 3, 4, 5),  -- ADD x3, x4, x5
                               56 => encode_u_type(U_AUIPC, "10000000000000000001", 8),  -- AUIPC 0x80001, x8
                               -- store the value in x8 into address 8 (offset 4 + value in x1 (4))
                               60 => encode_s_type(S_SW, "000000000100", 1, 8),  -- SW x1, x8, 4
                               -- load the halfword value that was just stored (into address 8) into register 9
                               64 => encode_i_type(I_LH, "000000001000", 0, 9),  -- LH x0, x9, 8
                               68 => encode_r_type(R_ADD, 8, 9, 10),  -- ADD x8, x9, x10
                               -- jump forward to instruction 88
                               72 => encode_sb_type(SB_BNE, "000000001000", 9, 8),  -- BNE x9, x8, 16
                               76 => encode_i_type(I_ADDI, "000000000001", 0, 1),  -- ADDI x0, x1, 1     -- this should not get executed
                               80 => encode_i_type(I_ADDI, "000000000011", 0, 1),  -- ADDI x0, x1, 3     -- this should not get executed
                               84 => encode_i_type(I_ADDI, "000000000111", 0, 1),  -- ADDI x0, x1, 3     -- this should not get executed
                               88 => encode_i_type(I_ADDI, "000000000001", 0, 1),  -- ADDI x0, x1, 3     -- this should not get executed
                               92 => encode_i_type(I_ADDI, "000000011111", 1, 11),  -- ADDI x0, x1, 3     -- this should not get executed
                               96 => encode_i_csr(CSR_CYCLE, 12), -- RDCYCLE x12
                               100 => encode_i_csr(CSR_INSTRET, 13),
                               others => (others => '0'));

    -- with current branch prediction scheme (backwards as taken, forwards as not-taken),
    -- these are the only 3 scenarios that can happen w/ regards to branches.
    
    type test_config_t is record
        filename : string(1 to 13);
        test     : ram_t;
    end record test_config_t;

    constant test_configuration : test_config_t := ( "sim/test1.vec", test1 );
    
end package test_config;
