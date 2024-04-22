library ieee;
use ieee.std_logic_1164.all;
use work.encode_pkg.all;
use work.common.all;
use work.csr_pkg.all;

package test_config is

    constant pipeline_tb_test_vector_input_filename : string := "sim/test3.vec";

    -- arrays of instructions
    type ram_t is array (natural range 0 to 256) of word;

    -- Test 3 (TODO): WAW, WAR, RAW, reads/writes to register 0,
    -- incorrectly-predicted-taken backwards branch,
    -- data dependency between load then store
    constant test3 : ram_t := (0      => encode_i_type(I_ADDI, "000000001000", 0, 0),
                               4      => encode_i_type(I_ADDI, "000000000100", 0, 1),
                               8      => encode_r_type(R_ADD, 0, 1, 2),
                               12     => encode_r_type(R_ADD, 1, 2, 3),
                               16     => encode_sb_type(SB_BEQ, "111111111000", 1, 2),
                               20     => encode_i_type(I_ADDI, "000000000001", 0, 1),  -- ADDI x0, x1, 1
                               24     => encode_i_type(I_ADDI, "000000000011", 0, 1),  -- ADDI x0, x1, 3
                               28     => encode_i_type(I_ADDI, "000000000111", 0, 1),  -- ADDI x0, x1, 7
                               32     => encode_i_type(I_ADDI, "000000000001", 0, 1),  -- ADDI x0, x1, 1
                               36     => encode_i_type(I_ADDI, "000000011111", 1, 11),  -- ADDI x1, x11, 20
                               40     => encode_r_type(R_ADD, 1, 11, 13),
                               -- load value at address -33(x13) into x4
                               44     => encode_i_type(I_LB, "111111011111", 13, 4),
                               -- store to address 12(x2) the value in x4
                               48     => encode_s_type(S_SW, "000000001100", 2, 4),
                               -- retired instruction count
                               52     => encode_i_csr(CSR_INSTRET, 12),
                               -- load value at 12(x2) into x1
                               56     => encode_i_type(I_LW, "000000001100", 2, 1),
                               -- x1 - x12 goes into x4
                               60     => encode_r_type(R_SUB, 1, 12, 4),
                               -- x1 and x13 goes into x6
                               64     => encode_r_type(R_AND, 1, 13, 6),
                               
                               68     => encode_r_type(R_OR, 1, 13, 8),
                               others => NOP);

    type test_config_t is record
        filename : string(1 to 13);
        test     : ram_t;
    end record test_config_t;

    constant test_configuration : test_config_t := ("sim/test3.vec", test3);

end package test_config;
