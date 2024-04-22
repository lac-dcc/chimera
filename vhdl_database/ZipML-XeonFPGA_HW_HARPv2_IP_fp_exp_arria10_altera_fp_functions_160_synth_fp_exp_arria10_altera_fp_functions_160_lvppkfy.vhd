-- ------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 16.0
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2016 Altera Corporation.  All rights reserved.
-- Your use of  Altera  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Altera Program License Subscription Agreement,
-- Altera  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Altera and sold by
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fp_exp_arria10_altera_fp_functions_160_lvppkfy
-- VHDL created on Tue Oct  9 10:15:38 2018


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

library twentynm;
use twentynm.twentynm_components.twentynm_fp_mac;

entity fp_exp_arria10_altera_fp_functions_160_lvppkfy is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_exp_arria10_altera_fp_functions_160_lvppkfy;

architecture normal of fp_exp_arria10_altera_fp_functions_160_lvppkfy is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBias_uid9_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstBiasM1_uid10_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWE_uid14_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllOWE_uid17_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid18_fpExpETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal maxInput_uid32_fpExpETest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal minInput_uid36_fpExpETest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal cstBiasPCstShift_uid42_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal maxExpCond_uid62_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal maxExpCond_uid62_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal maxExpCond_uid62_fpExpETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal maxExpCond_uid62_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cste128h_uid71_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cste128l_uid74_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cstUdfA_uid104_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal udfA_uid105_fpExpETest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal udfA_uid105_fpExpETest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal udfA_uid105_fpExpETest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal udfA_uid105_fpExpETest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal oneFP_uid106_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal cst16z_uid111_fpExpETest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal cstHalfFP_uid121_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal biasM2_uid129_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal biasP1_uid130_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excREnc_uid142_fpExpETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal oneFracRPostExc2_uid143_fpExpETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage0Idx1Pad2_uid181_fxpXRed_uid47_fpExpETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0Idx2Pad4_uid184_fxpXRed_uid47_fpExpETest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx3Pad6_uid187_fxpXRed_uid47_fpExpETest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_reset0 : std_logic;
    signal floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_ir : STD_LOGIC_VECTOR (31 downto 0);
    signal floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_r : STD_LOGIC_VECTOR (31 downto 0);
    signal floatTable_kPPreZLow_uid67_fpExpETest_lutmem_reset0 : std_logic;
    signal floatTable_kPPreZLow_uid67_fpExpETest_lutmem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal floatTable_kPPreZLow_uid67_fpExpETest_lutmem_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal floatTable_kPPreZLow_uid67_fpExpETest_lutmem_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal floatTable_kPPreZLow_uid67_fpExpETest_lutmem_ir : STD_LOGIC_VECTOR (31 downto 0);
    signal floatTable_kPPreZLow_uid67_fpExpETest_lutmem_r : STD_LOGIC_VECTOR (31 downto 0);
    signal yP0_uid82_fpExpETest_impl_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal yP0_uid82_fpExpETest_impl_reset0 : std_logic;
    signal yP_uid88_fpExpETest_impl_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal yP_uid88_fpExpETest_impl_reset0 : std_logic;
    signal rightShiftStage1Idx3Pad3_uid217_fxpA_uid98_fpExpETest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal floatTable_eA_uid100_fpExpETest_lutmem_reset0 : std_logic;
    signal floatTable_eA_uid100_fpExpETest_lutmem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal floatTable_eA_uid100_fpExpETest_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal floatTable_eA_uid100_fpExpETest_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal floatTable_eA_uid100_fpExpETest_lutmem_ir : STD_LOGIC_VECTOR (31 downto 0);
    signal floatTable_eA_uid100_fpExpETest_lutmem_r : STD_LOGIC_VECTOR (31 downto 0);
    signal b_uid120_fpExpETest_impl_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal b_uid120_fpExpETest_impl_reset0 : std_logic;
    signal oPBo2_uid123_fpExpETest_impl_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal oPBo2_uid123_fpExpETest_impl_reset0 : std_logic;
    signal eB_uid124_fpExpETest_impl_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal eB_uid124_fpExpETest_impl_reset0 : std_logic;
    signal eY_uid125_fpExpETest_impl_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal eY_uid125_fpExpETest_impl_reset0 : std_logic;
    signal redist1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_mem_reset0 : std_logic;
    signal redist0_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_mem_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_mem_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_rdcnt_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_rdcnt_i : UNSIGNED (1 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist0_rdcnt_i : signal is true;
    signal redist0_rdcnt_eq : std_logic;
    attribute preserve of redist0_rdcnt_eq : signal is true;
    signal redist0_wraddr_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_mem_top_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist0_sticky_ena_q : signal is true;
    signal redist4_outputreg_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_mem_reset0 : std_logic;
    signal redist4_mem_ia : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_mem_iq : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_mem_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist4_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist4_rdcnt_i : signal is true;
    signal redist4_rdcnt_eq : std_logic;
    attribute preserve of redist4_rdcnt_eq : signal is true;
    signal redist4_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist4_mem_top_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist4_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist4_sticky_ena_q : signal is true;
    signal redist6_mem_reset0 : std_logic;
    signal redist6_mem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_mem_iq : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_mem_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist6_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist6_rdcnt_i : signal is true;
    signal redist6_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist6_mem_top_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist6_sticky_ena_q : signal is true;
    signal redist11_mem_reset0 : std_logic;
    signal redist11_mem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_mem_aa : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_mem_ab : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_mem_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_mem_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist11_rdcnt_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_rdcnt_i : UNSIGNED (4 downto 0);
    attribute preserve of redist11_rdcnt_i : signal is true;
    signal redist11_rdcnt_eq : std_logic;
    attribute preserve of redist11_rdcnt_eq : signal is true;
    signal redist11_wraddr_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist11_mem_top_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist11_sticky_ena_q : signal is true;
    signal redist13_mem_reset0 : std_logic;
    signal redist13_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist13_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist13_rdcnt_i : signal is true;
    signal redist13_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist13_sticky_ena_q : signal is true;
    signal kPZHigh_uid73_fpExpETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal kPZHigh_uid73_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal kPZLow_uid76_fpExpETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal kPZLow_uid76_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal shiftValFxpA_uid96_fpExpETest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValFxpA_uid96_fpExpETest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValFxpA_uid96_fpExpETest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValFxpA_uid96_fpExpETest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal eAPostUdfA_uid108_fpExpETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal eAPostUdfA_uid108_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal newExpA_uid113_fpExpETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal newExpA_uid113_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal p1_uid157_eP_uid50_fpExpETest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal p0_uid158_eP_uid50_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal Rnd2C_uid54_fpExpETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_cmp_a : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_cmp_b : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_cmp_a : STD_LOGIC_VECTOR (5 downto 0);
    signal redist4_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist4_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist4_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_cmp_a : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist6_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_cmp_a : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_cmp_b : STD_LOGIC_VECTOR (5 downto 0);
    signal redist11_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid6_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid7_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid7_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracX_uid8_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracX_uid8_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excZ_x_uid22_fpExpETest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid22_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid22_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid23_fpExpETest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid23_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid23_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid24_fpExpETest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid24_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid24_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftVal_uid43_fpExpETest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftVal_uid43_fpExpETest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftVal_uid43_fpExpETest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftVal_uid43_fpExpETest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal expYP_uid90_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expYP_uid90_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expEY_uid126_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expEY_uid126_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracEY_uid145_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracEY_uid145_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signEY_uid152_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signEY_uid152_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYP_uid89_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracYP_uid89_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signYP_uid91_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signYP_uid91_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expYPBottom_uid92_fpExpETest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal expYPBottom_uid92_fpExpETest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal fracRPostExc_uid147_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid147_fpExpETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal ySign_uid77_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal ySign_uid77_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fraction_uid78_fpExpETest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fraction_uid78_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal exp_uid79_fpExpETest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_uid79_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ySign_uid83_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal ySign_uid83_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fraction_uid84_fpExpETest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fraction_uid84_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal exp_uid85_fpExpETest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_uid85_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftValFxpAR_uid97_fpExpETest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal shiftValFxpAR_uid97_fpExpETest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal lowRangeB_uid159_eP_uid50_fpExpETest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid159_eP_uid50_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid160_eP_uid50_fpExpETest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal highBBits_uid160_eP_uid50_fpExpETest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal expFracX_uid31_fpExpETest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal invSignX_uid34_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid34_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xFxpLow_uid39_fpExpETest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xFxpLow_uid39_fpExpETest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal InvExpXIsZero_uid29_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid29_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid28_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid28_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid25_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid25_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValPos_uid44_fpExpETest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal shiftValPos_uid44_fpExpETest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal expUdfRange_uid45_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expUdfRange_uid45_fpExpETest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal lowerBitOfeY_uid127_fpExpETest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowerBitOfeY_uid127_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal fracYPTop_uid93_fpExpETest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracYPTop_uid93_fpExpETest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal maskAFP_uid109_fpExpETest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal invYSign_uid80_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invYSign_uid80_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minusY_uid81_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal invYSign_uid86_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invYSign_uid86_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minusY_uid87_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStageSel3Dto2_uid208_fxpA_uid98_fpExpETest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStageSel3Dto2_uid208_fxpA_uid98_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel1Dto0_uid219_fxpA_uid98_fpExpETest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel1Dto0_uid219_fxpA_uid98_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal expMaxInput_uid33_fpExpETest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal expMaxInput_uid33_fpExpETest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal expMaxInput_uid33_fpExpETest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal expMaxInput_uid33_fpExpETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expMinInput_uid37_fpExpETest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal expMinInput_uid37_fpExpETest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal expMinInput_uid37_fpExpETest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal expMinInput_uid37_fpExpETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal inputOveflow_uid35_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal inputOveflow_uid35_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal inputOveflow_uid35_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal posInf_uid139_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal posInf_uid139_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal posInf_uid139_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oXLow_uid41_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excR_x_uid30_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid30_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid30_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal negInf_uid134_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal negInf_uid134_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal negInf_uid134_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStageSel2Dto1_uid189_fxpXRed_uid47_fpExpETest_in : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStageSel2Dto1_uid189_fxpXRed_uid47_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel0Dto0_uid194_fxpXRed_uid47_fpExpETest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStageSel0Dto0_uid194_fxpXRed_uid47_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftUdf_uid46_fpExpETest_a : STD_LOGIC_VECTOR (4 downto 0);
    signal shiftUdf_uid46_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expUpdateVal_uid131_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expUpdateVal_uid131_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fxpAPreAlign_uid95_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracYPTopPostMask_uid110_fpExpETest_a : STD_LOGIC_VECTOR (6 downto 0);
    signal fracYPTopPostMask_uid110_fpExpETest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal fracYPTopPostMask_uid110_fpExpETest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal lev1_a0_uid162_eP_uid50_fpExpETest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal inputUndeflow_uid38_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal inputUndeflow_uid38_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal inputUndeflow_uid38_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndPos_uid137_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndPos_uid137_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndPos_uid137_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid140_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid140_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid140_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng2_uid180_fxpXRed_uid47_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng2_uid180_fxpXRed_uid47_fpExpETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage0Idx2Rng4_uid183_fxpXRed_uid47_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx2Rng4_uid183_fxpXRed_uid47_fpExpETest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStage0Idx3Rng6_uid186_fxpXRed_uid47_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3Rng6_uid186_fxpXRed_uid47_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal regXAndExpOverflowAndNeg_uid135_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndNeg_uid135_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndNeg_uid135_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid136_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid136_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid136_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal concExc_uid141_fpExpETest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal updatedExponent_uid132_fpExpETest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal updatedExponent_uid132_fpExpETest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal updatedExponent_uid132_fpExpETest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal updatedExponent_uid132_fpExpETest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0Idx1Rng4_uid203_fxpA_uid98_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1Rng4_uid203_fxpA_uid98_fpExpETest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal fracAFull_uid112_fpExpETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal sR_uid163_eP_uid50_fpExpETest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal sR_uid163_eP_uid50_fpExpETest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage0Idx1_uid182_fxpXRed_uid47_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx2_uid185_fxpXRed_uid47_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx3_uid188_fxpXRed_uid47_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid133_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid133_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0Idx1_uid205_fxpA_uid98_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal a_uid114_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zEp_uid51_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expRPostExc_uid151_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid151_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage0_uid209_fxpA_uid98_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal ySign_uid115_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal ySign_uid115_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fraction_uid116_fpExpETest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fraction_uid116_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal exp_uid117_fpExpETest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal exp_uid117_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal ePOC_uid52_fpExpETest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal ePOC_uid52_fpExpETest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ePOC_uid52_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx1Rng1_uid191_fxpXRed_uid47_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx1Rng1_uid191_fxpXRed_uid47_fpExpETest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal finalResult_uid153_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage1Idx1Rng1_uid210_fxpA_uid98_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx1Rng1_uid210_fxpA_uid98_fpExpETest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage1Idx2Rng2_uid213_fxpA_uid98_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx2Rng2_uid213_fxpA_uid98_fpExpETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStage1Idx3Rng3_uid216_fxpA_uid98_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx3Rng3_uid216_fxpA_uid98_fpExpETest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal invYSign_uid118_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invYSign_uid118_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal minusY_uid119_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal eP2CWRnd_uid57_fpExpETest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal eP2CWRnd_uid57_fpExpETest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal eP2CWRnd_uid57_fpExpETest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal eP2CWRnd_uid57_fpExpETest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal rightShiftStage1Idx1_uid193_fxpXRed_uid47_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx1_uid212_fxpA_uid98_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx2_uid215_fxpA_uid98_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1Idx3_uid218_fxpA_uid98_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expTmp_uid58_fpExpETest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal expTmp_uid58_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal bit7_uid59_fpExpETest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal bit7_uid59_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bit8_uid61_fpExpETest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal bit8_uid61_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage1_uid220_fxpA_uid98_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid220_fxpA_uid98_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal invBit7_uid60_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invBit7_uid60_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpXRedForCstMult_uid49_fpExpETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fxpXRedForCstMult_uid49_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal addrEATable_uid99_fpExpETest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal xv0_uid155_eP_uid50_fpExpETest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid155_eP_uid50_fpExpETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid156_eP_uid50_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal xv1_uid156_eP_uid50_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);

begin


    -- oneFP_uid106_fpExpETest(CONSTANT,105)
    oneFP_uid106_fpExpETest_q <= "00111111100000000000000000000000";

    -- redist6_notEnable(LOGICAL,267)
    redist6_notEnable_a <= STD_LOGIC_VECTOR(VCC_q);
    redist6_notEnable_q <= not (redist6_notEnable_a);

    -- redist6_nor(LOGICAL,268)
    redist6_nor_a <= STD_LOGIC_VECTOR(redist6_notEnable_q);
    redist6_nor_b <= STD_LOGIC_VECTOR(redist6_sticky_ena_q);
    redist6_nor_q <= not (redist6_nor_a or redist6_nor_b);

    -- redist6_mem_top(CONSTANT,264)
    redist6_mem_top_q <= "0111";

    -- redist6_cmp(LOGICAL,265)
    redist6_cmp_a <= redist6_mem_top_q;
    redist6_cmp_b <= STD_LOGIC_VECTOR("0" & redist6_rdcnt_q);
    redist6_cmp_q <= "1" WHEN redist6_cmp_a = redist6_cmp_b ELSE "0";

    -- redist6_cmpReg(REG,266)
    redist6_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist6_cmpReg_q <= STD_LOGIC_VECTOR(redist6_cmp_q);
        END IF;
    END PROCESS;

    -- redist6_sticky_ena(REG,269)
    redist6_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist6_nor_q = "1") THEN
                redist6_sticky_ena_q <= STD_LOGIC_VECTOR(redist6_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist6_enaAnd(LOGICAL,270)
    redist6_enaAnd_a <= STD_LOGIC_VECTOR(redist6_sticky_ena_q);
    redist6_enaAnd_b <= STD_LOGIC_VECTOR(VCC_q);
    redist6_enaAnd_q <= redist6_enaAnd_a and redist6_enaAnd_b;

    -- redist6_rdcnt(COUNTER,262)
    -- low=0, high=7, step=1, init=1
    redist6_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_rdcnt_i <= TO_UNSIGNED(1, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist6_rdcnt_i <= redist6_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist6_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist6_rdcnt_i, 3)));

    -- redist13_notEnable(LOGICAL,285)
    redist13_notEnable_a <= STD_LOGIC_VECTOR(VCC_q);
    redist13_notEnable_q <= not (redist13_notEnable_a);

    -- redist13_nor(LOGICAL,286)
    redist13_nor_a <= STD_LOGIC_VECTOR(redist13_notEnable_q);
    redist13_nor_b <= STD_LOGIC_VECTOR(redist13_sticky_ena_q);
    redist13_nor_q <= not (redist13_nor_a or redist13_nor_b);

    -- redist13_cmpReg(REG,284)
    redist13_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist13_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist13_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist13_sticky_ena(REG,287)
    redist13_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist13_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist13_nor_q = "1") THEN
                redist13_sticky_ena_q <= STD_LOGIC_VECTOR(redist13_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist13_enaAnd(LOGICAL,288)
    redist13_enaAnd_a <= STD_LOGIC_VECTOR(redist13_sticky_ena_q);
    redist13_enaAnd_b <= STD_LOGIC_VECTOR(VCC_q);
    redist13_enaAnd_q <= redist13_enaAnd_a and redist13_enaAnd_b;

    -- redist13_rdcnt(COUNTER,282)
    -- low=0, high=1, step=1, init=1
    redist13_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist13_rdcnt_i <= TO_UNSIGNED(1, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist13_rdcnt_i <= redist13_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist13_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist13_rdcnt_i, 1)));

    -- xIn(GPIN,3)@0

    -- redist13_wraddr(REG,283)
    redist13_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist13_wraddr_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist13_wraddr_q <= STD_LOGIC_VECTOR(redist13_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist13_mem(DUALMEM,281)
    redist13_mem_ia <= STD_LOGIC_VECTOR(a);
    redist13_mem_aa <= redist13_wraddr_q;
    redist13_mem_ab <= redist13_rdcnt_q;
    redist13_mem_reset0 <= areset;
    redist13_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 32,
        widthad_b => 1,
        numwords_b => 2,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist13_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist13_mem_reset0,
        clock1 => clk,
        address_a => redist13_mem_aa,
        data_a => redist13_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist13_mem_ab,
        q_b => redist13_mem_iq
    );
    redist13_mem_q <= redist13_mem_iq(31 downto 0);

    -- cste128h_uid71_fpExpETest(CONSTANT,70)
    cste128h_uid71_fpExpETest_q <= "01000010101100010111001000010111";

    -- signX_uid7_fpExpETest(BITSELECT,6)@0
    signX_uid7_fpExpETest_in <= STD_LOGIC_VECTOR(a);
    signX_uid7_fpExpETest_b <= STD_LOGIC_VECTOR(signX_uid7_fpExpETest_in(31 downto 31));

    -- redist12(DELAY,238)
    redist12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid7_fpExpETest_b, xout => redist12_q, clk => clk, aclr => areset );

    -- Rnd2C_uid54_fpExpETest(BITJOIN,53)@1
    Rnd2C_uid54_fpExpETest_q <= VCC_q & redist12_q;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstZeroWE_uid14_fpExpETest(CONSTANT,13)
    cstZeroWE_uid14_fpExpETest_q <= "00000000";

    -- rightShiftStage1Idx1Rng1_uid191_fxpXRed_uid47_fpExpETest(BITSELECT,190)@0
    rightShiftStage1Idx1Rng1_uid191_fxpXRed_uid47_fpExpETest_in <= rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_q;
    rightShiftStage1Idx1Rng1_uid191_fxpXRed_uid47_fpExpETest_b <= rightShiftStage1Idx1Rng1_uid191_fxpXRed_uid47_fpExpETest_in(7 downto 1);

    -- rightShiftStage1Idx1_uid193_fxpXRed_uid47_fpExpETest(BITJOIN,192)@0
    rightShiftStage1Idx1_uid193_fxpXRed_uid47_fpExpETest_q <= GND_q & rightShiftStage1Idx1Rng1_uid191_fxpXRed_uid47_fpExpETest_b;

    -- rightShiftStage0Idx3Pad6_uid187_fxpXRed_uid47_fpExpETest(CONSTANT,186)
    rightShiftStage0Idx3Pad6_uid187_fxpXRed_uid47_fpExpETest_q <= "000000";

    -- rightShiftStage0Idx3Rng6_uid186_fxpXRed_uid47_fpExpETest(BITSELECT,185)@0
    rightShiftStage0Idx3Rng6_uid186_fxpXRed_uid47_fpExpETest_in <= oXLow_uid41_fpExpETest_q;
    rightShiftStage0Idx3Rng6_uid186_fxpXRed_uid47_fpExpETest_b <= rightShiftStage0Idx3Rng6_uid186_fxpXRed_uid47_fpExpETest_in(7 downto 6);

    -- rightShiftStage0Idx3_uid188_fxpXRed_uid47_fpExpETest(BITJOIN,187)@0
    rightShiftStage0Idx3_uid188_fxpXRed_uid47_fpExpETest_q <= rightShiftStage0Idx3Pad6_uid187_fxpXRed_uid47_fpExpETest_q & rightShiftStage0Idx3Rng6_uid186_fxpXRed_uid47_fpExpETest_b;

    -- rightShiftStage0Idx2Pad4_uid184_fxpXRed_uid47_fpExpETest(CONSTANT,183)
    rightShiftStage0Idx2Pad4_uid184_fxpXRed_uid47_fpExpETest_q <= "0000";

    -- rightShiftStage0Idx2Rng4_uid183_fxpXRed_uid47_fpExpETest(BITSELECT,182)@0
    rightShiftStage0Idx2Rng4_uid183_fxpXRed_uid47_fpExpETest_in <= oXLow_uid41_fpExpETest_q;
    rightShiftStage0Idx2Rng4_uid183_fxpXRed_uid47_fpExpETest_b <= rightShiftStage0Idx2Rng4_uid183_fxpXRed_uid47_fpExpETest_in(7 downto 4);

    -- rightShiftStage0Idx2_uid185_fxpXRed_uid47_fpExpETest(BITJOIN,184)@0
    rightShiftStage0Idx2_uid185_fxpXRed_uid47_fpExpETest_q <= rightShiftStage0Idx2Pad4_uid184_fxpXRed_uid47_fpExpETest_q & rightShiftStage0Idx2Rng4_uid183_fxpXRed_uid47_fpExpETest_b;

    -- rightShiftStage0Idx1Pad2_uid181_fxpXRed_uid47_fpExpETest(CONSTANT,180)
    rightShiftStage0Idx1Pad2_uid181_fxpXRed_uid47_fpExpETest_q <= "00";

    -- rightShiftStage0Idx1Rng2_uid180_fxpXRed_uid47_fpExpETest(BITSELECT,179)@0
    rightShiftStage0Idx1Rng2_uid180_fxpXRed_uid47_fpExpETest_in <= oXLow_uid41_fpExpETest_q;
    rightShiftStage0Idx1Rng2_uid180_fxpXRed_uid47_fpExpETest_b <= rightShiftStage0Idx1Rng2_uid180_fxpXRed_uid47_fpExpETest_in(7 downto 2);

    -- rightShiftStage0Idx1_uid182_fxpXRed_uid47_fpExpETest(BITJOIN,181)@0
    rightShiftStage0Idx1_uid182_fxpXRed_uid47_fpExpETest_q <= rightShiftStage0Idx1Pad2_uid181_fxpXRed_uid47_fpExpETest_q & rightShiftStage0Idx1Rng2_uid180_fxpXRed_uid47_fpExpETest_b;

    -- fracX_uid8_fpExpETest(BITSELECT,7)@0
    fracX_uid8_fpExpETest_in <= a;
    fracX_uid8_fpExpETest_b <= fracX_uid8_fpExpETest_in(22 downto 0);

    -- xFxpLow_uid39_fpExpETest(BITSELECT,38)@0
    xFxpLow_uid39_fpExpETest_in <= fracX_uid8_fpExpETest_b;
    xFxpLow_uid39_fpExpETest_b <= xFxpLow_uid39_fpExpETest_in(22 downto 16);

    -- oXLow_uid41_fpExpETest(BITJOIN,40)@0
    oXLow_uid41_fpExpETest_q <= VCC_q & xFxpLow_uid39_fpExpETest_b;

    -- expX_uid6_fpExpETest(BITSELECT,5)@0
    expX_uid6_fpExpETest_in <= a;
    expX_uid6_fpExpETest_b <= expX_uid6_fpExpETest_in(30 downto 23);

    -- cstBiasPCstShift_uid42_fpExpETest(CONSTANT,41)
    cstBiasPCstShift_uid42_fpExpETest_q <= "10000101";

    -- shiftVal_uid43_fpExpETest(SUB,42)@0
    shiftVal_uid43_fpExpETest_a <= STD_LOGIC_VECTOR("0" & cstBiasPCstShift_uid42_fpExpETest_q);
    shiftVal_uid43_fpExpETest_b <= STD_LOGIC_VECTOR("0" & expX_uid6_fpExpETest_b);
    shiftVal_uid43_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftVal_uid43_fpExpETest_a) - UNSIGNED(shiftVal_uid43_fpExpETest_b));
    shiftVal_uid43_fpExpETest_q <= shiftVal_uid43_fpExpETest_o(8 downto 0);

    -- shiftValPos_uid44_fpExpETest(BITSELECT,43)@0
    shiftValPos_uid44_fpExpETest_in <= shiftVal_uid43_fpExpETest_q(2 downto 0);
    shiftValPos_uid44_fpExpETest_b <= shiftValPos_uid44_fpExpETest_in(2 downto 0);

    -- rightShiftStageSel2Dto1_uid189_fxpXRed_uid47_fpExpETest(BITSELECT,188)@0
    rightShiftStageSel2Dto1_uid189_fxpXRed_uid47_fpExpETest_in <= shiftValPos_uid44_fpExpETest_b;
    rightShiftStageSel2Dto1_uid189_fxpXRed_uid47_fpExpETest_b <= rightShiftStageSel2Dto1_uid189_fxpXRed_uid47_fpExpETest_in(2 downto 1);

    -- rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest(MUX,189)@0
    rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_s <= rightShiftStageSel2Dto1_uid189_fxpXRed_uid47_fpExpETest_b;
    rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_combproc: PROCESS (rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_s, oXLow_uid41_fpExpETest_q, rightShiftStage0Idx1_uid182_fxpXRed_uid47_fpExpETest_q, rightShiftStage0Idx2_uid185_fxpXRed_uid47_fpExpETest_q, rightShiftStage0Idx3_uid188_fxpXRed_uid47_fpExpETest_q)
    BEGIN
        CASE (rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_s) IS
            WHEN "00" => rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_q <= oXLow_uid41_fpExpETest_q;
            WHEN "01" => rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_q <= rightShiftStage0Idx1_uid182_fxpXRed_uid47_fpExpETest_q;
            WHEN "10" => rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_q <= rightShiftStage0Idx2_uid185_fxpXRed_uid47_fpExpETest_q;
            WHEN "11" => rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_q <= rightShiftStage0Idx3_uid188_fxpXRed_uid47_fpExpETest_q;
            WHEN OTHERS => rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel0Dto0_uid194_fxpXRed_uid47_fpExpETest(BITSELECT,193)@0
    rightShiftStageSel0Dto0_uid194_fxpXRed_uid47_fpExpETest_in <= shiftValPos_uid44_fpExpETest_b(0 downto 0);
    rightShiftStageSel0Dto0_uid194_fxpXRed_uid47_fpExpETest_b <= rightShiftStageSel0Dto0_uid194_fxpXRed_uid47_fpExpETest_in(0 downto 0);

    -- rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest(MUX,194)@0
    rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_s <= rightShiftStageSel0Dto0_uid194_fxpXRed_uid47_fpExpETest_b;
    rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_combproc: PROCESS (rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_s, rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_q, rightShiftStage1Idx1_uid193_fxpXRed_uid47_fpExpETest_q)
    BEGIN
        CASE (rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_s) IS
            WHEN "0" => rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_q <= rightShiftStage0_uid190_fxpXRed_uid47_fpExpETest_q;
            WHEN "1" => rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_q <= rightShiftStage1Idx1_uid193_fxpXRed_uid47_fpExpETest_q;
            WHEN OTHERS => rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expUdfRange_uid45_fpExpETest(BITSELECT,44)@0
    expUdfRange_uid45_fpExpETest_in <= shiftVal_uid43_fpExpETest_q(7 downto 0);
    expUdfRange_uid45_fpExpETest_b <= expUdfRange_uid45_fpExpETest_in(7 downto 3);

    -- shiftUdf_uid46_fpExpETest(LOGICAL,45)@0
    shiftUdf_uid46_fpExpETest_a <= expUdfRange_uid45_fpExpETest_b;
    shiftUdf_uid46_fpExpETest_q <= "1" WHEN shiftUdf_uid46_fpExpETest_a /= "00000" ELSE "0";

    -- fxpXRedForCstMult_uid49_fpExpETest(MUX,48)@0
    fxpXRedForCstMult_uid49_fpExpETest_s <= shiftUdf_uid46_fpExpETest_q;
    fxpXRedForCstMult_uid49_fpExpETest_combproc: PROCESS (fxpXRedForCstMult_uid49_fpExpETest_s, rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_q, cstZeroWE_uid14_fpExpETest_q)
    BEGIN
        CASE (fxpXRedForCstMult_uid49_fpExpETest_s) IS
            WHEN "0" => fxpXRedForCstMult_uid49_fpExpETest_q <= rightShiftStage1_uid195_fxpXRed_uid47_fpExpETest_q;
            WHEN "1" => fxpXRedForCstMult_uid49_fpExpETest_q <= cstZeroWE_uid14_fpExpETest_q;
            WHEN OTHERS => fxpXRedForCstMult_uid49_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xv0_uid155_eP_uid50_fpExpETest(BITSELECT,154)@0
    xv0_uid155_eP_uid50_fpExpETest_in <= fxpXRedForCstMult_uid49_fpExpETest_q(5 downto 0);
    xv0_uid155_eP_uid50_fpExpETest_b <= xv0_uid155_eP_uid50_fpExpETest_in(5 downto 0);

    -- redist3(DELAY,229)
    redist3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv0_uid155_eP_uid50_fpExpETest_b, xout => redist3_q, clk => clk, aclr => areset );

    -- p0_uid158_eP_uid50_fpExpETest(LOOKUP,157)@1
    p0_uid158_eP_uid50_fpExpETest_combproc: PROCESS (redist3_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist3_q) IS
            WHEN "000000" => p0_uid158_eP_uid50_fpExpETest_q <= "00000000000";
            WHEN "000001" => p0_uid158_eP_uid50_fpExpETest_q <= "00000010111";
            WHEN "000010" => p0_uid158_eP_uid50_fpExpETest_q <= "00000101110";
            WHEN "000011" => p0_uid158_eP_uid50_fpExpETest_q <= "00001000101";
            WHEN "000100" => p0_uid158_eP_uid50_fpExpETest_q <= "00001011100";
            WHEN "000101" => p0_uid158_eP_uid50_fpExpETest_q <= "00001110011";
            WHEN "000110" => p0_uid158_eP_uid50_fpExpETest_q <= "00010001010";
            WHEN "000111" => p0_uid158_eP_uid50_fpExpETest_q <= "00010100001";
            WHEN "001000" => p0_uid158_eP_uid50_fpExpETest_q <= "00010111000";
            WHEN "001001" => p0_uid158_eP_uid50_fpExpETest_q <= "00011001111";
            WHEN "001010" => p0_uid158_eP_uid50_fpExpETest_q <= "00011100110";
            WHEN "001011" => p0_uid158_eP_uid50_fpExpETest_q <= "00011111101";
            WHEN "001100" => p0_uid158_eP_uid50_fpExpETest_q <= "00100010100";
            WHEN "001101" => p0_uid158_eP_uid50_fpExpETest_q <= "00100101100";
            WHEN "001110" => p0_uid158_eP_uid50_fpExpETest_q <= "00101000011";
            WHEN "001111" => p0_uid158_eP_uid50_fpExpETest_q <= "00101011010";
            WHEN "010000" => p0_uid158_eP_uid50_fpExpETest_q <= "00101110001";
            WHEN "010001" => p0_uid158_eP_uid50_fpExpETest_q <= "00110001000";
            WHEN "010010" => p0_uid158_eP_uid50_fpExpETest_q <= "00110011111";
            WHEN "010011" => p0_uid158_eP_uid50_fpExpETest_q <= "00110110110";
            WHEN "010100" => p0_uid158_eP_uid50_fpExpETest_q <= "00111001101";
            WHEN "010101" => p0_uid158_eP_uid50_fpExpETest_q <= "00111100100";
            WHEN "010110" => p0_uid158_eP_uid50_fpExpETest_q <= "00111111011";
            WHEN "010111" => p0_uid158_eP_uid50_fpExpETest_q <= "01000010010";
            WHEN "011000" => p0_uid158_eP_uid50_fpExpETest_q <= "01000101001";
            WHEN "011001" => p0_uid158_eP_uid50_fpExpETest_q <= "01001000001";
            WHEN "011010" => p0_uid158_eP_uid50_fpExpETest_q <= "01001011000";
            WHEN "011011" => p0_uid158_eP_uid50_fpExpETest_q <= "01001101111";
            WHEN "011100" => p0_uid158_eP_uid50_fpExpETest_q <= "01010000110";
            WHEN "011101" => p0_uid158_eP_uid50_fpExpETest_q <= "01010011101";
            WHEN "011110" => p0_uid158_eP_uid50_fpExpETest_q <= "01010110100";
            WHEN "011111" => p0_uid158_eP_uid50_fpExpETest_q <= "01011001011";
            WHEN "100000" => p0_uid158_eP_uid50_fpExpETest_q <= "01011100010";
            WHEN "100001" => p0_uid158_eP_uid50_fpExpETest_q <= "01011111001";
            WHEN "100010" => p0_uid158_eP_uid50_fpExpETest_q <= "01100010000";
            WHEN "100011" => p0_uid158_eP_uid50_fpExpETest_q <= "01100100111";
            WHEN "100100" => p0_uid158_eP_uid50_fpExpETest_q <= "01100111110";
            WHEN "100101" => p0_uid158_eP_uid50_fpExpETest_q <= "01101010110";
            WHEN "100110" => p0_uid158_eP_uid50_fpExpETest_q <= "01101101101";
            WHEN "100111" => p0_uid158_eP_uid50_fpExpETest_q <= "01110000100";
            WHEN "101000" => p0_uid158_eP_uid50_fpExpETest_q <= "01110011011";
            WHEN "101001" => p0_uid158_eP_uid50_fpExpETest_q <= "01110110010";
            WHEN "101010" => p0_uid158_eP_uid50_fpExpETest_q <= "01111001001";
            WHEN "101011" => p0_uid158_eP_uid50_fpExpETest_q <= "01111100000";
            WHEN "101100" => p0_uid158_eP_uid50_fpExpETest_q <= "01111110111";
            WHEN "101101" => p0_uid158_eP_uid50_fpExpETest_q <= "10000001110";
            WHEN "101110" => p0_uid158_eP_uid50_fpExpETest_q <= "10000100101";
            WHEN "101111" => p0_uid158_eP_uid50_fpExpETest_q <= "10000111100";
            WHEN "110000" => p0_uid158_eP_uid50_fpExpETest_q <= "10001010011";
            WHEN "110001" => p0_uid158_eP_uid50_fpExpETest_q <= "10001101011";
            WHEN "110010" => p0_uid158_eP_uid50_fpExpETest_q <= "10010000010";
            WHEN "110011" => p0_uid158_eP_uid50_fpExpETest_q <= "10010011001";
            WHEN "110100" => p0_uid158_eP_uid50_fpExpETest_q <= "10010110000";
            WHEN "110101" => p0_uid158_eP_uid50_fpExpETest_q <= "10011000111";
            WHEN "110110" => p0_uid158_eP_uid50_fpExpETest_q <= "10011011110";
            WHEN "110111" => p0_uid158_eP_uid50_fpExpETest_q <= "10011110101";
            WHEN "111000" => p0_uid158_eP_uid50_fpExpETest_q <= "10100001100";
            WHEN "111001" => p0_uid158_eP_uid50_fpExpETest_q <= "10100100011";
            WHEN "111010" => p0_uid158_eP_uid50_fpExpETest_q <= "10100111010";
            WHEN "111011" => p0_uid158_eP_uid50_fpExpETest_q <= "10101010001";
            WHEN "111100" => p0_uid158_eP_uid50_fpExpETest_q <= "10101101000";
            WHEN "111101" => p0_uid158_eP_uid50_fpExpETest_q <= "10110000000";
            WHEN "111110" => p0_uid158_eP_uid50_fpExpETest_q <= "10110010111";
            WHEN "111111" => p0_uid158_eP_uid50_fpExpETest_q <= "10110101110";
            WHEN OTHERS => -- unreachable
                           p0_uid158_eP_uid50_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- highBBits_uid160_eP_uid50_fpExpETest(BITSELECT,159)@1
    highBBits_uid160_eP_uid50_fpExpETest_in <= p0_uid158_eP_uid50_fpExpETest_q;
    highBBits_uid160_eP_uid50_fpExpETest_b <= highBBits_uid160_eP_uid50_fpExpETest_in(10 downto 1);

    -- xv1_uid156_eP_uid50_fpExpETest(BITSELECT,155)@0
    xv1_uid156_eP_uid50_fpExpETest_in <= fxpXRedForCstMult_uid49_fpExpETest_q;
    xv1_uid156_eP_uid50_fpExpETest_b <= xv1_uid156_eP_uid50_fpExpETest_in(7 downto 6);

    -- redist2(DELAY,228)
    redist2 : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv1_uid156_eP_uid50_fpExpETest_b, xout => redist2_q, clk => clk, aclr => areset );

    -- p1_uid157_eP_uid50_fpExpETest(LOOKUP,156)@1
    p1_uid157_eP_uid50_fpExpETest_combproc: PROCESS (redist2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist2_q) IS
            WHEN "00" => p1_uid157_eP_uid50_fpExpETest_q <= "0000000000010";
            WHEN "01" => p1_uid157_eP_uid50_fpExpETest_q <= "0001011100100";
            WHEN "10" => p1_uid157_eP_uid50_fpExpETest_q <= "0010111000111";
            WHEN "11" => p1_uid157_eP_uid50_fpExpETest_q <= "0100010101001";
            WHEN OTHERS => -- unreachable
                           p1_uid157_eP_uid50_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest(ADD,160)@1
    lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_a <= STD_LOGIC_VECTOR("0" & p1_uid157_eP_uid50_fpExpETest_q);
    lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_b <= STD_LOGIC_VECTOR("0000" & highBBits_uid160_eP_uid50_fpExpETest_b);
    lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_a) + UNSIGNED(lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_b));
    lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_q <= lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_o(13 downto 0);

    -- lowRangeB_uid159_eP_uid50_fpExpETest(BITSELECT,158)@1
    lowRangeB_uid159_eP_uid50_fpExpETest_in <= p0_uid158_eP_uid50_fpExpETest_q(0 downto 0);
    lowRangeB_uid159_eP_uid50_fpExpETest_b <= lowRangeB_uid159_eP_uid50_fpExpETest_in(0 downto 0);

    -- lev1_a0_uid162_eP_uid50_fpExpETest(BITJOIN,161)@1
    lev1_a0_uid162_eP_uid50_fpExpETest_q <= lev1_a0sumAHighB_uid161_eP_uid50_fpExpETest_q & lowRangeB_uid159_eP_uid50_fpExpETest_b;

    -- sR_uid163_eP_uid50_fpExpETest(BITSELECT,162)@1
    sR_uid163_eP_uid50_fpExpETest_in <= lev1_a0_uid162_eP_uid50_fpExpETest_q(12 downto 0);
    sR_uid163_eP_uid50_fpExpETest_b <= sR_uid163_eP_uid50_fpExpETest_in(12 downto 3);

    -- zEp_uid51_fpExpETest(BITJOIN,50)@1
    zEp_uid51_fpExpETest_q <= GND_q & sR_uid163_eP_uid50_fpExpETest_b;

    -- ePOC_uid52_fpExpETest(LOGICAL,51)@1
    ePOC_uid52_fpExpETest_a <= zEp_uid51_fpExpETest_q;
    ePOC_uid52_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 1 => redist12_q(0)) & redist12_q));
    ePOC_uid52_fpExpETest_q <= ePOC_uid52_fpExpETest_a xor ePOC_uid52_fpExpETest_b;

    -- eP2CWRnd_uid57_fpExpETest(ADD,56)@1
    eP2CWRnd_uid57_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => ePOC_uid52_fpExpETest_q(10)) & ePOC_uid52_fpExpETest_q));
    eP2CWRnd_uid57_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "0000000000" & Rnd2C_uid54_fpExpETest_q));
    eP2CWRnd_uid57_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(eP2CWRnd_uid57_fpExpETest_a) + SIGNED(eP2CWRnd_uid57_fpExpETest_b));
    eP2CWRnd_uid57_fpExpETest_q <= eP2CWRnd_uid57_fpExpETest_o(11 downto 0);

    -- expTmp_uid58_fpExpETest(BITSELECT,57)@1
    expTmp_uid58_fpExpETest_in <= STD_LOGIC_VECTOR(eP2CWRnd_uid57_fpExpETest_q(9 downto 0));
    expTmp_uid58_fpExpETest_b <= STD_LOGIC_VECTOR(expTmp_uid58_fpExpETest_in(9 downto 2));

    -- floatTable_kPPreZHigh_uid63_fpExpETest_lutmem(DUALMEM,196)@1 + 2
    floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_aa <= expTmp_uid58_fpExpETest_b;
    floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_reset0 <= areset;
    floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 32,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_exp_arria10_altera_fp_functions_160_lvppkfy_floatTable_kPPreZHigh_uid63_fpExpETest_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_reset0,
        clock0 => clk,
        address_a => floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_aa,
        q_a => floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_ir
    );
    floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_r <= floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_ir(31 downto 0);

    -- bit7_uid59_fpExpETest(BITSELECT,58)@1
    bit7_uid59_fpExpETest_in <= STD_LOGIC_VECTOR(eP2CWRnd_uid57_fpExpETest_q(10 downto 0));
    bit7_uid59_fpExpETest_b <= STD_LOGIC_VECTOR(bit7_uid59_fpExpETest_in(10 downto 10));

    -- invBit7_uid60_fpExpETest(LOGICAL,59)@1
    invBit7_uid60_fpExpETest_a <= bit7_uid59_fpExpETest_b;
    invBit7_uid60_fpExpETest_q <= not (invBit7_uid60_fpExpETest_a);

    -- bit8_uid61_fpExpETest(BITSELECT,60)@1
    bit8_uid61_fpExpETest_in <= STD_LOGIC_VECTOR(eP2CWRnd_uid57_fpExpETest_q(9 downto 0));
    bit8_uid61_fpExpETest_b <= STD_LOGIC_VECTOR(bit8_uid61_fpExpETest_in(9 downto 9));

    -- maxExpCond_uid62_fpExpETest(LOGICAL,61)@1 + 1
    maxExpCond_uid62_fpExpETest_a <= STD_LOGIC_VECTOR(bit8_uid61_fpExpETest_b);
    maxExpCond_uid62_fpExpETest_b <= STD_LOGIC_VECTOR(invBit7_uid60_fpExpETest_q);
    maxExpCond_uid62_fpExpETest_qi <= maxExpCond_uid62_fpExpETest_a and maxExpCond_uid62_fpExpETest_b;
    maxExpCond_uid62_fpExpETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => maxExpCond_uid62_fpExpETest_qi, xout => maxExpCond_uid62_fpExpETest_q, clk => clk, aclr => areset );

    -- redist8(DELAY,234)
    redist8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => maxExpCond_uid62_fpExpETest_q, xout => redist8_q, clk => clk, aclr => areset );

    -- kPZHigh_uid73_fpExpETest(MUX,72)@3
    kPZHigh_uid73_fpExpETest_s <= redist8_q;
    kPZHigh_uid73_fpExpETest_combproc: PROCESS (kPZHigh_uid73_fpExpETest_s, floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_r, cste128h_uid71_fpExpETest_q)
    BEGIN
        CASE (kPZHigh_uid73_fpExpETest_s) IS
            WHEN "0" => kPZHigh_uid73_fpExpETest_q <= floatTable_kPPreZHigh_uid63_fpExpETest_lutmem_r;
            WHEN "1" => kPZHigh_uid73_fpExpETest_q <= cste128h_uid71_fpExpETest_q;
            WHEN OTHERS => kPZHigh_uid73_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- ySign_uid77_fpExpETest(BITSELECT,76)@3
    ySign_uid77_fpExpETest_in <= STD_LOGIC_VECTOR(kPZHigh_uid73_fpExpETest_q);
    ySign_uid77_fpExpETest_b <= STD_LOGIC_VECTOR(ySign_uid77_fpExpETest_in(31 downto 31));

    -- invYSign_uid80_fpExpETest(LOGICAL,79)@3
    invYSign_uid80_fpExpETest_a <= ySign_uid77_fpExpETest_b;
    invYSign_uid80_fpExpETest_q <= not (invYSign_uid80_fpExpETest_a);

    -- exp_uid79_fpExpETest(BITSELECT,78)@3
    exp_uid79_fpExpETest_in <= kPZHigh_uid73_fpExpETest_q(30 downto 0);
    exp_uid79_fpExpETest_b <= exp_uid79_fpExpETest_in(30 downto 23);

    -- fraction_uid78_fpExpETest(BITSELECT,77)@3
    fraction_uid78_fpExpETest_in <= kPZHigh_uid73_fpExpETest_q(22 downto 0);
    fraction_uid78_fpExpETest_b <= fraction_uid78_fpExpETest_in(22 downto 0);

    -- minusY_uid81_fpExpETest(BITJOIN,80)@3
    minusY_uid81_fpExpETest_q <= invYSign_uid80_fpExpETest_q & exp_uid79_fpExpETest_b & fraction_uid78_fpExpETest_b;

    -- yP0_uid82_fpExpETest_impl(FPCOLUMN,198)@3
    -- out q0@6
    yP0_uid82_fpExpETest_impl_reset0 <= areset;
    yP0_uid82_fpExpETest_impl_DSP0 : twentynm_fp_mac
    GENERIC MAP (
        operation_mode => "sp_add",
        ax_clock => "0",
        ay_clock => "0",
        adder_input_clock => "0",
        output_clock => "0"
    )
    PORT MAP (
        aclr(0) => yP0_uid82_fpExpETest_impl_reset0,
        aclr(1) => yP0_uid82_fpExpETest_impl_reset0,
        clk(0) => clk,
        clk(1) => '0',
        clk(2) => '0',
        ena(0) => '1',
        ena(1) => '0',
        ena(2) => '0',
        ax => minusY_uid81_fpExpETest_q,
        ay => redist13_mem_q,
        resulta => yP0_uid82_fpExpETest_impl_q0
    );

    -- cste128l_uid74_fpExpETest(CONSTANT,73)
    cste128l_uid74_fpExpETest_q <= "00110110111101111101000111001111";

    -- redist10(DELAY,236)
    redist10 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => expTmp_uid58_fpExpETest_b, xout => redist10_q, clk => clk, aclr => areset );

    -- floatTable_kPPreZLow_uid67_fpExpETest_lutmem(DUALMEM,197)@4 + 2
    floatTable_kPPreZLow_uid67_fpExpETest_lutmem_aa <= redist10_q;
    floatTable_kPPreZLow_uid67_fpExpETest_lutmem_reset0 <= areset;
    floatTable_kPPreZLow_uid67_fpExpETest_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 32,
        widthad_a => 8,
        numwords_a => 256,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_exp_arria10_altera_fp_functions_160_lvppkfy_floatTable_kPPreZLow_uid67_fpExpETest_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => floatTable_kPPreZLow_uid67_fpExpETest_lutmem_reset0,
        clock0 => clk,
        address_a => floatTable_kPPreZLow_uid67_fpExpETest_lutmem_aa,
        q_a => floatTable_kPPreZLow_uid67_fpExpETest_lutmem_ir
    );
    floatTable_kPPreZLow_uid67_fpExpETest_lutmem_r <= floatTable_kPPreZLow_uid67_fpExpETest_lutmem_ir(31 downto 0);

    -- redist9(DELAY,235)
    redist9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist8_q, xout => redist9_q, clk => clk, aclr => areset );

    -- kPZLow_uid76_fpExpETest(MUX,75)@6
    kPZLow_uid76_fpExpETest_s <= redist9_q;
    kPZLow_uid76_fpExpETest_combproc: PROCESS (kPZLow_uid76_fpExpETest_s, floatTable_kPPreZLow_uid67_fpExpETest_lutmem_r, cste128l_uid74_fpExpETest_q)
    BEGIN
        CASE (kPZLow_uid76_fpExpETest_s) IS
            WHEN "0" => kPZLow_uid76_fpExpETest_q <= floatTable_kPPreZLow_uid67_fpExpETest_lutmem_r;
            WHEN "1" => kPZLow_uid76_fpExpETest_q <= cste128l_uid74_fpExpETest_q;
            WHEN OTHERS => kPZLow_uid76_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- ySign_uid83_fpExpETest(BITSELECT,82)@6
    ySign_uid83_fpExpETest_in <= STD_LOGIC_VECTOR(kPZLow_uid76_fpExpETest_q);
    ySign_uid83_fpExpETest_b <= STD_LOGIC_VECTOR(ySign_uid83_fpExpETest_in(31 downto 31));

    -- invYSign_uid86_fpExpETest(LOGICAL,85)@6
    invYSign_uid86_fpExpETest_a <= ySign_uid83_fpExpETest_b;
    invYSign_uid86_fpExpETest_q <= not (invYSign_uid86_fpExpETest_a);

    -- exp_uid85_fpExpETest(BITSELECT,84)@6
    exp_uid85_fpExpETest_in <= kPZLow_uid76_fpExpETest_q(30 downto 0);
    exp_uid85_fpExpETest_b <= exp_uid85_fpExpETest_in(30 downto 23);

    -- fraction_uid84_fpExpETest(BITSELECT,83)@6
    fraction_uid84_fpExpETest_in <= kPZLow_uid76_fpExpETest_q(22 downto 0);
    fraction_uid84_fpExpETest_b <= fraction_uid84_fpExpETest_in(22 downto 0);

    -- minusY_uid87_fpExpETest(BITJOIN,86)@6
    minusY_uid87_fpExpETest_q <= invYSign_uid86_fpExpETest_q & exp_uid85_fpExpETest_b & fraction_uid84_fpExpETest_b;

    -- yP_uid88_fpExpETest_impl(FPCOLUMN,199)@6
    -- out q0@9
    yP_uid88_fpExpETest_impl_reset0 <= areset;
    yP_uid88_fpExpETest_impl_DSP0 : twentynm_fp_mac
    GENERIC MAP (
        operation_mode => "sp_add",
        ax_clock => "0",
        ay_clock => "0",
        adder_input_clock => "0",
        output_clock => "0"
    )
    PORT MAP (
        aclr(0) => yP_uid88_fpExpETest_impl_reset0,
        aclr(1) => yP_uid88_fpExpETest_impl_reset0,
        clk(0) => clk,
        clk(1) => '0',
        clk(2) => '0',
        ena(0) => '1',
        ena(1) => '0',
        ena(2) => '0',
        ax => minusY_uid87_fpExpETest_q,
        ay => yP0_uid82_fpExpETest_impl_q0,
        resulta => yP_uid88_fpExpETest_impl_q0
    );

    -- redist1(DELAY,227)
    redist1 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yP_uid88_fpExpETest_impl_q0, xout => redist1_q, clk => clk, aclr => areset );

    -- signYP_uid91_fpExpETest(BITSELECT,90)@10
    signYP_uid91_fpExpETest_in <= STD_LOGIC_VECTOR(redist1_q);
    signYP_uid91_fpExpETest_b <= STD_LOGIC_VECTOR(signYP_uid91_fpExpETest_in(31 downto 31));

    -- rightShiftStage1Idx3Pad3_uid217_fxpA_uid98_fpExpETest(CONSTANT,216)
    rightShiftStage1Idx3Pad3_uid217_fxpA_uid98_fpExpETest_q <= "000";

    -- rightShiftStage1Idx3Rng3_uid216_fxpA_uid98_fpExpETest(BITSELECT,215)@10
    rightShiftStage1Idx3Rng3_uid216_fxpA_uid98_fpExpETest_in <= rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q;
    rightShiftStage1Idx3Rng3_uid216_fxpA_uid98_fpExpETest_b <= rightShiftStage1Idx3Rng3_uid216_fxpA_uid98_fpExpETest_in(7 downto 3);

    -- rightShiftStage1Idx3_uid218_fxpA_uid98_fpExpETest(BITJOIN,217)@10
    rightShiftStage1Idx3_uid218_fxpA_uid98_fpExpETest_q <= rightShiftStage1Idx3Pad3_uid217_fxpA_uid98_fpExpETest_q & rightShiftStage1Idx3Rng3_uid216_fxpA_uid98_fpExpETest_b;

    -- rightShiftStage1Idx2Rng2_uid213_fxpA_uid98_fpExpETest(BITSELECT,212)@10
    rightShiftStage1Idx2Rng2_uid213_fxpA_uid98_fpExpETest_in <= rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q;
    rightShiftStage1Idx2Rng2_uid213_fxpA_uid98_fpExpETest_b <= rightShiftStage1Idx2Rng2_uid213_fxpA_uid98_fpExpETest_in(7 downto 2);

    -- rightShiftStage1Idx2_uid215_fxpA_uid98_fpExpETest(BITJOIN,214)@10
    rightShiftStage1Idx2_uid215_fxpA_uid98_fpExpETest_q <= rightShiftStage0Idx1Pad2_uid181_fxpXRed_uid47_fpExpETest_q & rightShiftStage1Idx2Rng2_uid213_fxpA_uid98_fpExpETest_b;

    -- rightShiftStage1Idx1Rng1_uid210_fxpA_uid98_fpExpETest(BITSELECT,209)@10
    rightShiftStage1Idx1Rng1_uid210_fxpA_uid98_fpExpETest_in <= rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q;
    rightShiftStage1Idx1Rng1_uid210_fxpA_uid98_fpExpETest_b <= rightShiftStage1Idx1Rng1_uid210_fxpA_uid98_fpExpETest_in(7 downto 1);

    -- rightShiftStage1Idx1_uid212_fxpA_uid98_fpExpETest(BITJOIN,211)@10
    rightShiftStage1Idx1_uid212_fxpA_uid98_fpExpETest_q <= GND_q & rightShiftStage1Idx1Rng1_uid210_fxpA_uid98_fpExpETest_b;

    -- rightShiftStage0Idx1Rng4_uid203_fxpA_uid98_fpExpETest(BITSELECT,202)@10
    rightShiftStage0Idx1Rng4_uid203_fxpA_uid98_fpExpETest_in <= fxpAPreAlign_uid95_fpExpETest_q;
    rightShiftStage0Idx1Rng4_uid203_fxpA_uid98_fpExpETest_b <= rightShiftStage0Idx1Rng4_uid203_fxpA_uid98_fpExpETest_in(7 downto 4);

    -- rightShiftStage0Idx1_uid205_fxpA_uid98_fpExpETest(BITJOIN,204)@10
    rightShiftStage0Idx1_uid205_fxpA_uid98_fpExpETest_q <= rightShiftStage0Idx2Pad4_uid184_fxpXRed_uid47_fpExpETest_q & rightShiftStage0Idx1Rng4_uid203_fxpA_uid98_fpExpETest_b;

    -- fracYP_uid89_fpExpETest(BITSELECT,88)@10
    fracYP_uid89_fpExpETest_in <= redist1_q;
    fracYP_uid89_fpExpETest_b <= fracYP_uid89_fpExpETest_in(22 downto 0);

    -- fracYPTop_uid93_fpExpETest(BITSELECT,92)@10
    fracYPTop_uid93_fpExpETest_in <= fracYP_uid89_fpExpETest_b;
    fracYPTop_uid93_fpExpETest_b <= fracYPTop_uid93_fpExpETest_in(22 downto 16);

    -- fxpAPreAlign_uid95_fpExpETest(BITJOIN,94)@10
    fxpAPreAlign_uid95_fpExpETest_q <= VCC_q & fracYPTop_uid93_fpExpETest_b;

    -- expYP_uid90_fpExpETest(BITSELECT,89)@9
    expYP_uid90_fpExpETest_in <= yP_uid88_fpExpETest_impl_q0;
    expYP_uid90_fpExpETest_b <= expYP_uid90_fpExpETest_in(30 downto 23);

    -- redist7(DELAY,233)
    redist7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expYP_uid90_fpExpETest_b, xout => redist7_q, clk => clk, aclr => areset );

    -- cstBiasM1_uid10_fpExpETest(CONSTANT,9)
    cstBiasM1_uid10_fpExpETest_q <= "01111110";

    -- shiftValFxpA_uid96_fpExpETest(SUB,95)@10
    shiftValFxpA_uid96_fpExpETest_a <= STD_LOGIC_VECTOR("0" & cstBiasM1_uid10_fpExpETest_q);
    shiftValFxpA_uid96_fpExpETest_b <= STD_LOGIC_VECTOR("0" & redist7_q);
    shiftValFxpA_uid96_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValFxpA_uid96_fpExpETest_a) - UNSIGNED(shiftValFxpA_uid96_fpExpETest_b));
    shiftValFxpA_uid96_fpExpETest_q <= shiftValFxpA_uid96_fpExpETest_o(8 downto 0);

    -- shiftValFxpAR_uid97_fpExpETest(BITSELECT,96)@10
    shiftValFxpAR_uid97_fpExpETest_in <= shiftValFxpA_uid96_fpExpETest_q(3 downto 0);
    shiftValFxpAR_uid97_fpExpETest_b <= shiftValFxpAR_uid97_fpExpETest_in(3 downto 0);

    -- rightShiftStageSel3Dto2_uid208_fxpA_uid98_fpExpETest(BITSELECT,207)@10
    rightShiftStageSel3Dto2_uid208_fxpA_uid98_fpExpETest_in <= shiftValFxpAR_uid97_fpExpETest_b;
    rightShiftStageSel3Dto2_uid208_fxpA_uid98_fpExpETest_b <= rightShiftStageSel3Dto2_uid208_fxpA_uid98_fpExpETest_in(3 downto 2);

    -- rightShiftStage0_uid209_fxpA_uid98_fpExpETest(MUX,208)@10
    rightShiftStage0_uid209_fxpA_uid98_fpExpETest_s <= rightShiftStageSel3Dto2_uid208_fxpA_uid98_fpExpETest_b;
    rightShiftStage0_uid209_fxpA_uid98_fpExpETest_combproc: PROCESS (rightShiftStage0_uid209_fxpA_uid98_fpExpETest_s, fxpAPreAlign_uid95_fpExpETest_q, rightShiftStage0Idx1_uid205_fxpA_uid98_fpExpETest_q, cstZeroWE_uid14_fpExpETest_q)
    BEGIN
        CASE (rightShiftStage0_uid209_fxpA_uid98_fpExpETest_s) IS
            WHEN "00" => rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q <= fxpAPreAlign_uid95_fpExpETest_q;
            WHEN "01" => rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q <= rightShiftStage0Idx1_uid205_fxpA_uid98_fpExpETest_q;
            WHEN "10" => rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q <= cstZeroWE_uid14_fpExpETest_q;
            WHEN "11" => rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q <= cstZeroWE_uid14_fpExpETest_q;
            WHEN OTHERS => rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel1Dto0_uid219_fxpA_uid98_fpExpETest(BITSELECT,218)@10
    rightShiftStageSel1Dto0_uid219_fxpA_uid98_fpExpETest_in <= shiftValFxpAR_uid97_fpExpETest_b(1 downto 0);
    rightShiftStageSel1Dto0_uid219_fxpA_uid98_fpExpETest_b <= rightShiftStageSel1Dto0_uid219_fxpA_uid98_fpExpETest_in(1 downto 0);

    -- rightShiftStage1_uid220_fxpA_uid98_fpExpETest(MUX,219)@10
    rightShiftStage1_uid220_fxpA_uid98_fpExpETest_s <= rightShiftStageSel1Dto0_uid219_fxpA_uid98_fpExpETest_b;
    rightShiftStage1_uid220_fxpA_uid98_fpExpETest_combproc: PROCESS (rightShiftStage1_uid220_fxpA_uid98_fpExpETest_s, rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q, rightShiftStage1Idx1_uid212_fxpA_uid98_fpExpETest_q, rightShiftStage1Idx2_uid215_fxpA_uid98_fpExpETest_q, rightShiftStage1Idx3_uid218_fxpA_uid98_fpExpETest_q)
    BEGIN
        CASE (rightShiftStage1_uid220_fxpA_uid98_fpExpETest_s) IS
            WHEN "00" => rightShiftStage1_uid220_fxpA_uid98_fpExpETest_q <= rightShiftStage0_uid209_fxpA_uid98_fpExpETest_q;
            WHEN "01" => rightShiftStage1_uid220_fxpA_uid98_fpExpETest_q <= rightShiftStage1Idx1_uid212_fxpA_uid98_fpExpETest_q;
            WHEN "10" => rightShiftStage1_uid220_fxpA_uid98_fpExpETest_q <= rightShiftStage1Idx2_uid215_fxpA_uid98_fpExpETest_q;
            WHEN "11" => rightShiftStage1_uid220_fxpA_uid98_fpExpETest_q <= rightShiftStage1Idx3_uid218_fxpA_uid98_fpExpETest_q;
            WHEN OTHERS => rightShiftStage1_uid220_fxpA_uid98_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- addrEATable_uid99_fpExpETest(BITJOIN,98)@10
    addrEATable_uid99_fpExpETest_q <= signYP_uid91_fpExpETest_b & rightShiftStage1_uid220_fxpA_uid98_fpExpETest_q;

    -- redist6_wraddr(REG,263)
    redist6_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_wraddr_q <= "000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist6_wraddr_q <= STD_LOGIC_VECTOR(redist6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist6_mem(DUALMEM,261)
    redist6_mem_ia <= STD_LOGIC_VECTOR(addrEATable_uid99_fpExpETest_q);
    redist6_mem_aa <= redist6_wraddr_q;
    redist6_mem_ab <= redist6_rdcnt_q;
    redist6_mem_reset0 <= areset;
    redist6_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 9,
        widthad_a => 3,
        numwords_a => 8,
        width_b => 9,
        widthad_b => 3,
        numwords_b => 8,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist6_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist6_mem_reset0,
        clock1 => clk,
        address_a => redist6_mem_aa,
        data_a => redist6_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist6_mem_ab,
        q_b => redist6_mem_iq
    );
    redist6_mem_q <= redist6_mem_iq(8 downto 0);

    -- floatTable_eA_uid100_fpExpETest_lutmem(DUALMEM,221)@19 + 2
    floatTable_eA_uid100_fpExpETest_lutmem_aa <= redist6_mem_q;
    floatTable_eA_uid100_fpExpETest_lutmem_reset0 <= areset;
    floatTable_eA_uid100_fpExpETest_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 32,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_exp_arria10_altera_fp_functions_160_lvppkfy_floatTable_eA_uid100_fpExpETest_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => floatTable_eA_uid100_fpExpETest_lutmem_reset0,
        clock0 => clk,
        address_a => floatTable_eA_uid100_fpExpETest_lutmem_aa,
        q_a => floatTable_eA_uid100_fpExpETest_lutmem_ir
    );
    floatTable_eA_uid100_fpExpETest_lutmem_r <= floatTable_eA_uid100_fpExpETest_lutmem_ir(31 downto 0);

    -- cstUdfA_uid104_fpExpETest(CONSTANT,103)
    cstUdfA_uid104_fpExpETest_q <= "01110111";

    -- udfA_uid105_fpExpETest(COMPARE,104)@9 + 1
    udfA_uid105_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => cstUdfA_uid104_fpExpETest_q(7)) & cstUdfA_uid104_fpExpETest_q));
    udfA_uid105_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & expYP_uid90_fpExpETest_b));
    udfA_uid105_fpExpETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            udfA_uid105_fpExpETest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            udfA_uid105_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(udfA_uid105_fpExpETest_a) - SIGNED(udfA_uid105_fpExpETest_b));
        END IF;
    END PROCESS;
    udfA_uid105_fpExpETest_n(0) <= not (udfA_uid105_fpExpETest_o(10));

    -- redist5(DELAY,231)
    redist5 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => udfA_uid105_fpExpETest_n, xout => redist5_q, clk => clk, aclr => areset );

    -- eAPostUdfA_uid108_fpExpETest(MUX,107)@21
    eAPostUdfA_uid108_fpExpETest_s <= redist5_q;
    eAPostUdfA_uid108_fpExpETest_combproc: PROCESS (eAPostUdfA_uid108_fpExpETest_s, floatTable_eA_uid100_fpExpETest_lutmem_r, oneFP_uid106_fpExpETest_q)
    BEGIN
        CASE (eAPostUdfA_uid108_fpExpETest_s) IS
            WHEN "0" => eAPostUdfA_uid108_fpExpETest_q <= floatTable_eA_uid100_fpExpETest_lutmem_r;
            WHEN "1" => eAPostUdfA_uid108_fpExpETest_q <= oneFP_uid106_fpExpETest_q;
            WHEN OTHERS => eAPostUdfA_uid108_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist0_notEnable(LOGICAL,246)
    redist0_notEnable_a <= STD_LOGIC_VECTOR(VCC_q);
    redist0_notEnable_q <= not (redist0_notEnable_a);

    -- redist0_nor(LOGICAL,247)
    redist0_nor_a <= STD_LOGIC_VECTOR(redist0_notEnable_q);
    redist0_nor_b <= STD_LOGIC_VECTOR(redist0_sticky_ena_q);
    redist0_nor_q <= not (redist0_nor_a or redist0_nor_b);

    -- redist0_mem_top(CONSTANT,243)
    redist0_mem_top_q <= "010";

    -- redist0_cmp(LOGICAL,244)
    redist0_cmp_a <= redist0_mem_top_q;
    redist0_cmp_b <= STD_LOGIC_VECTOR("0" & redist0_rdcnt_q);
    redist0_cmp_q <= "1" WHEN redist0_cmp_a = redist0_cmp_b ELSE "0";

    -- redist0_cmpReg(REG,245)
    redist0_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist0_cmpReg_q <= STD_LOGIC_VECTOR(redist0_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_sticky_ena(REG,248)
    redist0_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist0_nor_q = "1") THEN
                redist0_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_enaAnd(LOGICAL,249)
    redist0_enaAnd_a <= STD_LOGIC_VECTOR(redist0_sticky_ena_q);
    redist0_enaAnd_b <= STD_LOGIC_VECTOR(VCC_q);
    redist0_enaAnd_q <= redist0_enaAnd_a and redist0_enaAnd_b;

    -- redist0_rdcnt(COUNTER,241)
    -- low=0, high=2, step=1, init=1
    redist0_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_rdcnt_i <= TO_UNSIGNED(1, 2);
            redist0_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist0_rdcnt_i = TO_UNSIGNED(1, 2)) THEN
                redist0_rdcnt_eq <= '1';
            ELSE
                redist0_rdcnt_eq <= '0';
            END IF;
            IF (redist0_rdcnt_eq = '1') THEN
                redist0_rdcnt_i <= redist0_rdcnt_i - 2;
            ELSE
                redist0_rdcnt_i <= redist0_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_rdcnt_i, 2)));

    -- newExpA_uid113_fpExpETest(MUX,112)@10
    newExpA_uid113_fpExpETest_s <= udfA_uid105_fpExpETest_n;
    newExpA_uid113_fpExpETest_combproc: PROCESS (newExpA_uid113_fpExpETest_s, redist7_q, cstZeroWE_uid14_fpExpETest_q)
    BEGIN
        CASE (newExpA_uid113_fpExpETest_s) IS
            WHEN "0" => newExpA_uid113_fpExpETest_q <= redist7_q;
            WHEN "1" => newExpA_uid113_fpExpETest_q <= cstZeroWE_uid14_fpExpETest_q;
            WHEN OTHERS => newExpA_uid113_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expYPBottom_uid92_fpExpETest(BITSELECT,91)@10
    expYPBottom_uid92_fpExpETest_in <= redist7_q(2 downto 0);
    expYPBottom_uid92_fpExpETest_b <= expYPBottom_uid92_fpExpETest_in(2 downto 0);

    -- maskAFP_uid109_fpExpETest(LOOKUP,108)@10
    maskAFP_uid109_fpExpETest_combproc: PROCESS (expYPBottom_uid92_fpExpETest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (expYPBottom_uid92_fpExpETest_b) IS
            WHEN "000" => maskAFP_uid109_fpExpETest_q <= "1000000";
            WHEN "001" => maskAFP_uid109_fpExpETest_q <= "1100000";
            WHEN "010" => maskAFP_uid109_fpExpETest_q <= "1110000";
            WHEN "011" => maskAFP_uid109_fpExpETest_q <= "1111000";
            WHEN "100" => maskAFP_uid109_fpExpETest_q <= "1111100";
            WHEN "101" => maskAFP_uid109_fpExpETest_q <= "1111110";
            WHEN "110" => maskAFP_uid109_fpExpETest_q <= "1111111";
            WHEN "111" => maskAFP_uid109_fpExpETest_q <= "0000000";
            WHEN OTHERS => -- unreachable
                           maskAFP_uid109_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- fracYPTopPostMask_uid110_fpExpETest(LOGICAL,109)@10
    fracYPTopPostMask_uid110_fpExpETest_a <= fracYPTop_uid93_fpExpETest_b;
    fracYPTopPostMask_uid110_fpExpETest_b <= maskAFP_uid109_fpExpETest_q;
    fracYPTopPostMask_uid110_fpExpETest_q <= fracYPTopPostMask_uid110_fpExpETest_a and fracYPTopPostMask_uid110_fpExpETest_b;

    -- cst16z_uid111_fpExpETest(CONSTANT,110)
    cst16z_uid111_fpExpETest_q <= "0000000000000000";

    -- fracAFull_uid112_fpExpETest(BITJOIN,111)@10
    fracAFull_uid112_fpExpETest_q <= fracYPTopPostMask_uid110_fpExpETest_q & cst16z_uid111_fpExpETest_q;

    -- a_uid114_fpExpETest(BITJOIN,113)@10
    a_uid114_fpExpETest_q <= signYP_uid91_fpExpETest_b & newExpA_uid113_fpExpETest_q & fracAFull_uid112_fpExpETest_q;

    -- ySign_uid115_fpExpETest(BITSELECT,114)@10
    ySign_uid115_fpExpETest_in <= STD_LOGIC_VECTOR(a_uid114_fpExpETest_q);
    ySign_uid115_fpExpETest_b <= STD_LOGIC_VECTOR(ySign_uid115_fpExpETest_in(31 downto 31));

    -- invYSign_uid118_fpExpETest(LOGICAL,117)@10
    invYSign_uid118_fpExpETest_a <= ySign_uid115_fpExpETest_b;
    invYSign_uid118_fpExpETest_q <= not (invYSign_uid118_fpExpETest_a);

    -- exp_uid117_fpExpETest(BITSELECT,116)@10
    exp_uid117_fpExpETest_in <= a_uid114_fpExpETest_q(30 downto 0);
    exp_uid117_fpExpETest_b <= exp_uid117_fpExpETest_in(30 downto 23);

    -- fraction_uid116_fpExpETest(BITSELECT,115)@10
    fraction_uid116_fpExpETest_in <= a_uid114_fpExpETest_q(22 downto 0);
    fraction_uid116_fpExpETest_b <= fraction_uid116_fpExpETest_in(22 downto 0);

    -- minusY_uid119_fpExpETest(BITJOIN,118)@10
    minusY_uid119_fpExpETest_q <= invYSign_uid118_fpExpETest_q & exp_uid117_fpExpETest_b & fraction_uid116_fpExpETest_b;

    -- b_uid120_fpExpETest_impl(FPCOLUMN,222)@10
    -- out q0@13
    b_uid120_fpExpETest_impl_reset0 <= areset;
    b_uid120_fpExpETest_impl_DSP0 : twentynm_fp_mac
    GENERIC MAP (
        operation_mode => "sp_add",
        ax_clock => "0",
        ay_clock => "0",
        adder_input_clock => "0",
        output_clock => "0"
    )
    PORT MAP (
        aclr(0) => b_uid120_fpExpETest_impl_reset0,
        aclr(1) => b_uid120_fpExpETest_impl_reset0,
        clk(0) => clk,
        clk(1) => '0',
        clk(2) => '0',
        ena(0) => '1',
        ena(1) => '0',
        ena(2) => '0',
        ax => minusY_uid119_fpExpETest_q,
        ay => redist1_q,
        resulta => b_uid120_fpExpETest_impl_q0
    );

    -- redist0_wraddr(REG,242)
    redist0_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_wraddr_q <= "00";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist0_wraddr_q <= STD_LOGIC_VECTOR(redist0_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_mem(DUALMEM,240)
    redist0_mem_ia <= STD_LOGIC_VECTOR(b_uid120_fpExpETest_impl_q0);
    redist0_mem_aa <= redist0_wraddr_q;
    redist0_mem_ab <= redist0_rdcnt_q;
    redist0_mem_reset0 <= areset;
    redist0_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 32,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist0_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist0_mem_reset0,
        clock1 => clk,
        address_a => redist0_mem_aa,
        data_a => redist0_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_mem_ab,
        q_b => redist0_mem_iq
    );
    redist0_mem_q <= redist0_mem_iq(31 downto 0);

    -- cstHalfFP_uid121_fpExpETest(CONSTANT,120)
    cstHalfFP_uid121_fpExpETest_q <= "00111111000000000000000000000000";

    -- oPBo2_uid123_fpExpETest_impl(FPCOLUMN,223)@13
    -- out q0@17
    oPBo2_uid123_fpExpETest_impl_reset0 <= areset;
    oPBo2_uid123_fpExpETest_impl_DSP0 : twentynm_fp_mac
    GENERIC MAP (
        operation_mode => "sp_mult_add",
        use_chainin => "false",
        ax_clock => "0",
        ay_clock => "0",
        az_clock => "0",
        mult_pipeline_clock => "0",
        adder_input_clock => "0",
        ax_chainin_pl_clock => "0",
        output_clock => "0"
    )
    PORT MAP (
        aclr(0) => oPBo2_uid123_fpExpETest_impl_reset0,
        aclr(1) => oPBo2_uid123_fpExpETest_impl_reset0,
        clk(0) => clk,
        clk(1) => '0',
        clk(2) => '0',
        ena(0) => '1',
        ena(1) => '0',
        ena(2) => '0',
        ax => oneFP_uid106_fpExpETest_q,
        ay => cstHalfFP_uid121_fpExpETest_q,
        az => b_uid120_fpExpETest_impl_q0,
        resulta => oPBo2_uid123_fpExpETest_impl_q0
    );

    -- eB_uid124_fpExpETest_impl(FPCOLUMN,224)@17
    -- out q0@21
    eB_uid124_fpExpETest_impl_reset0 <= areset;
    eB_uid124_fpExpETest_impl_DSP0 : twentynm_fp_mac
    GENERIC MAP (
        operation_mode => "sp_mult_add",
        use_chainin => "false",
        ax_clock => "0",
        ay_clock => "0",
        az_clock => "0",
        mult_pipeline_clock => "0",
        adder_input_clock => "0",
        ax_chainin_pl_clock => "0",
        output_clock => "0"
    )
    PORT MAP (
        aclr(0) => eB_uid124_fpExpETest_impl_reset0,
        aclr(1) => eB_uid124_fpExpETest_impl_reset0,
        clk(0) => clk,
        clk(1) => '0',
        clk(2) => '0',
        ena(0) => '1',
        ena(1) => '0',
        ena(2) => '0',
        ax => oneFP_uid106_fpExpETest_q,
        ay => oPBo2_uid123_fpExpETest_impl_q0,
        az => redist0_mem_q,
        resulta => eB_uid124_fpExpETest_impl_q0
    );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- eY_uid125_fpExpETest_impl(FPCOLUMN,225)@21
    -- out q0@24
    eY_uid125_fpExpETest_impl_reset0 <= areset;
    eY_uid125_fpExpETest_impl_DSP0 : twentynm_fp_mac
    GENERIC MAP (
        operation_mode => "sp_mult",
        ay_clock => "0",
        az_clock => "0",
        mult_pipeline_clock => "0",
        output_clock => "0"
    )
    PORT MAP (
        aclr(0) => eY_uid125_fpExpETest_impl_reset0,
        aclr(1) => eY_uid125_fpExpETest_impl_reset0,
        clk(0) => clk,
        clk(1) => '0',
        clk(2) => '0',
        ena(0) => '1',
        ena(1) => '0',
        ena(2) => '0',
        ay => eB_uid124_fpExpETest_impl_q0,
        az => eAPostUdfA_uid108_fpExpETest_q,
        resulta => eY_uid125_fpExpETest_impl_q0
    );

    -- signEY_uid152_fpExpETest(BITSELECT,151)@24
    signEY_uid152_fpExpETest_in <= STD_LOGIC_VECTOR(eY_uid125_fpExpETest_impl_q0);
    signEY_uid152_fpExpETest_b <= STD_LOGIC_VECTOR(signEY_uid152_fpExpETest_in(31 downto 31));

    -- cstAllOWE_uid17_fpExpETest(CONSTANT,16)
    cstAllOWE_uid17_fpExpETest_q <= "11111111";

    -- cstBias_uid9_fpExpETest(CONSTANT,8)
    cstBias_uid9_fpExpETest_q <= "01111111";

    -- biasM2_uid129_fpExpETest(CONSTANT,128)
    biasM2_uid129_fpExpETest_q <= "01111101";

    -- biasP1_uid130_fpExpETest(CONSTANT,129)
    biasP1_uid130_fpExpETest_q <= "10000000";

    -- expEY_uid126_fpExpETest(BITSELECT,125)@24
    expEY_uid126_fpExpETest_in <= eY_uid125_fpExpETest_impl_q0;
    expEY_uid126_fpExpETest_b <= expEY_uid126_fpExpETest_in(30 downto 23);

    -- lowerBitOfeY_uid127_fpExpETest(BITSELECT,126)@24
    lowerBitOfeY_uid127_fpExpETest_in <= expEY_uid126_fpExpETest_b(1 downto 0);
    lowerBitOfeY_uid127_fpExpETest_b <= lowerBitOfeY_uid127_fpExpETest_in(1 downto 0);

    -- expUpdateVal_uid131_fpExpETest(MUX,130)@24
    expUpdateVal_uid131_fpExpETest_s <= lowerBitOfeY_uid127_fpExpETest_b;
    expUpdateVal_uid131_fpExpETest_combproc: PROCESS (expUpdateVal_uid131_fpExpETest_s, biasP1_uid130_fpExpETest_q, biasM2_uid129_fpExpETest_q, cstBiasM1_uid10_fpExpETest_q, cstBias_uid9_fpExpETest_q)
    BEGIN
        CASE (expUpdateVal_uid131_fpExpETest_s) IS
            WHEN "00" => expUpdateVal_uid131_fpExpETest_q <= biasP1_uid130_fpExpETest_q;
            WHEN "01" => expUpdateVal_uid131_fpExpETest_q <= biasM2_uid129_fpExpETest_q;
            WHEN "10" => expUpdateVal_uid131_fpExpETest_q <= cstBiasM1_uid10_fpExpETest_q;
            WHEN "11" => expUpdateVal_uid131_fpExpETest_q <= cstBias_uid9_fpExpETest_q;
            WHEN OTHERS => expUpdateVal_uid131_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- redist11_notEnable(LOGICAL,277)
    redist11_notEnable_a <= STD_LOGIC_VECTOR(VCC_q);
    redist11_notEnable_q <= not (redist11_notEnable_a);

    -- redist11_nor(LOGICAL,278)
    redist11_nor_a <= STD_LOGIC_VECTOR(redist11_notEnable_q);
    redist11_nor_b <= STD_LOGIC_VECTOR(redist11_sticky_ena_q);
    redist11_nor_q <= not (redist11_nor_a or redist11_nor_b);

    -- redist11_mem_top(CONSTANT,274)
    redist11_mem_top_q <= "010010";

    -- redist11_cmp(LOGICAL,275)
    redist11_cmp_a <= redist11_mem_top_q;
    redist11_cmp_b <= STD_LOGIC_VECTOR("0" & redist11_rdcnt_q);
    redist11_cmp_q <= "1" WHEN redist11_cmp_a = redist11_cmp_b ELSE "0";

    -- redist11_cmpReg(REG,276)
    redist11_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist11_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist11_cmpReg_q <= STD_LOGIC_VECTOR(redist11_cmp_q);
        END IF;
    END PROCESS;

    -- redist11_sticky_ena(REG,279)
    redist11_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist11_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist11_nor_q = "1") THEN
                redist11_sticky_ena_q <= STD_LOGIC_VECTOR(redist11_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist11_enaAnd(LOGICAL,280)
    redist11_enaAnd_a <= STD_LOGIC_VECTOR(redist11_sticky_ena_q);
    redist11_enaAnd_b <= STD_LOGIC_VECTOR(VCC_q);
    redist11_enaAnd_q <= redist11_enaAnd_a and redist11_enaAnd_b;

    -- redist11_rdcnt(COUNTER,272)
    -- low=0, high=18, step=1, init=1
    redist11_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist11_rdcnt_i <= TO_UNSIGNED(1, 5);
            redist11_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist11_rdcnt_i = TO_UNSIGNED(17, 5)) THEN
                redist11_rdcnt_eq <= '1';
            ELSE
                redist11_rdcnt_eq <= '0';
            END IF;
            IF (redist11_rdcnt_eq = '1') THEN
                redist11_rdcnt_i <= redist11_rdcnt_i - 18;
            ELSE
                redist11_rdcnt_i <= redist11_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist11_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist11_rdcnt_i, 5)));

    -- redist11_wraddr(REG,273)
    redist11_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist11_wraddr_q <= "00000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist11_wraddr_q <= STD_LOGIC_VECTOR(redist11_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist11_mem(DUALMEM,271)
    redist11_mem_ia <= STD_LOGIC_VECTOR(redist10_q);
    redist11_mem_aa <= redist11_wraddr_q;
    redist11_mem_ab <= redist11_rdcnt_q;
    redist11_mem_reset0 <= areset;
    redist11_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 5,
        numwords_a => 19,
        width_b => 8,
        widthad_b => 5,
        numwords_b => 19,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist11_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist11_mem_reset0,
        clock1 => clk,
        address_a => redist11_mem_aa,
        data_a => redist11_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist11_mem_ab,
        q_b => redist11_mem_iq
    );
    redist11_mem_q <= redist11_mem_iq(7 downto 0);

    -- updatedExponent_uid132_fpExpETest(ADD,131)@24
    updatedExponent_uid132_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => redist11_mem_q(7)) & redist11_mem_q));
    updatedExponent_uid132_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & expUpdateVal_uid131_fpExpETest_q));
    updatedExponent_uid132_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(updatedExponent_uid132_fpExpETest_a) + SIGNED(updatedExponent_uid132_fpExpETest_b));
    updatedExponent_uid132_fpExpETest_q <= updatedExponent_uid132_fpExpETest_o(9 downto 0);

    -- expR_uid133_fpExpETest(BITSELECT,132)@24
    expR_uid133_fpExpETest_in <= updatedExponent_uid132_fpExpETest_q(7 downto 0);
    expR_uid133_fpExpETest_b <= expR_uid133_fpExpETest_in(7 downto 0);

    -- redist4_notEnable(LOGICAL,257)
    redist4_notEnable_a <= STD_LOGIC_VECTOR(VCC_q);
    redist4_notEnable_q <= not (redist4_notEnable_a);

    -- redist4_nor(LOGICAL,258)
    redist4_nor_a <= STD_LOGIC_VECTOR(redist4_notEnable_q);
    redist4_nor_b <= STD_LOGIC_VECTOR(redist4_sticky_ena_q);
    redist4_nor_q <= not (redist4_nor_a or redist4_nor_b);

    -- redist4_mem_top(CONSTANT,254)
    redist4_mem_top_q <= "010100";

    -- redist4_cmp(LOGICAL,255)
    redist4_cmp_a <= redist4_mem_top_q;
    redist4_cmp_b <= STD_LOGIC_VECTOR("0" & redist4_rdcnt_q);
    redist4_cmp_q <= "1" WHEN redist4_cmp_a = redist4_cmp_b ELSE "0";

    -- redist4_cmpReg(REG,256)
    redist4_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist4_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist4_cmpReg_q <= STD_LOGIC_VECTOR(redist4_cmp_q);
        END IF;
    END PROCESS;

    -- redist4_sticky_ena(REG,259)
    redist4_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist4_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist4_nor_q = "1") THEN
                redist4_sticky_ena_q <= STD_LOGIC_VECTOR(redist4_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist4_enaAnd(LOGICAL,260)
    redist4_enaAnd_a <= STD_LOGIC_VECTOR(redist4_sticky_ena_q);
    redist4_enaAnd_b <= STD_LOGIC_VECTOR(VCC_q);
    redist4_enaAnd_q <= redist4_enaAnd_a and redist4_enaAnd_b;

    -- redist4_rdcnt(COUNTER,252)
    -- low=0, high=20, step=1, init=1
    redist4_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist4_rdcnt_i <= TO_UNSIGNED(1, 5);
            redist4_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist4_rdcnt_i = TO_UNSIGNED(19, 5)) THEN
                redist4_rdcnt_eq <= '1';
            ELSE
                redist4_rdcnt_eq <= '0';
            END IF;
            IF (redist4_rdcnt_eq = '1') THEN
                redist4_rdcnt_i <= redist4_rdcnt_i - 20;
            ELSE
                redist4_rdcnt_i <= redist4_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist4_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist4_rdcnt_i, 5)));

    -- cstZeroWF_uid18_fpExpETest(CONSTANT,17)
    cstZeroWF_uid18_fpExpETest_q <= "00000000000000000000000";

    -- fracXIsZero_uid24_fpExpETest(LOGICAL,23)@0
    fracXIsZero_uid24_fpExpETest_a <= cstZeroWF_uid18_fpExpETest_q;
    fracXIsZero_uid24_fpExpETest_b <= fracX_uid8_fpExpETest_b;
    fracXIsZero_uid24_fpExpETest_q <= "1" WHEN fracXIsZero_uid24_fpExpETest_a = fracXIsZero_uid24_fpExpETest_b ELSE "0";

    -- fracXIsNotZero_uid25_fpExpETest(LOGICAL,24)@0
    fracXIsNotZero_uid25_fpExpETest_a <= fracXIsZero_uid24_fpExpETest_q;
    fracXIsNotZero_uid25_fpExpETest_q <= not (fracXIsNotZero_uid25_fpExpETest_a);

    -- expXIsMax_uid23_fpExpETest(LOGICAL,22)@0
    expXIsMax_uid23_fpExpETest_a <= expX_uid6_fpExpETest_b;
    expXIsMax_uid23_fpExpETest_b <= cstAllOWE_uid17_fpExpETest_q;
    expXIsMax_uid23_fpExpETest_q <= "1" WHEN expXIsMax_uid23_fpExpETest_a = expXIsMax_uid23_fpExpETest_b ELSE "0";

    -- excN_x_uid27_fpExpETest(LOGICAL,26)@0
    excN_x_uid27_fpExpETest_a <= expXIsMax_uid23_fpExpETest_q;
    excN_x_uid27_fpExpETest_b <= fracXIsNotZero_uid25_fpExpETest_q;
    excN_x_uid27_fpExpETest_q <= excN_x_uid27_fpExpETest_a and excN_x_uid27_fpExpETest_b;

    -- expFracX_uid31_fpExpETest(BITJOIN,30)@0
    expFracX_uid31_fpExpETest_q <= expX_uid6_fpExpETest_b & fracX_uid8_fpExpETest_b;

    -- maxInput_uid32_fpExpETest(CONSTANT,31)
    maxInput_uid32_fpExpETest_q <= "1000010101100010111001000010111";

    -- expMaxInput_uid33_fpExpETest(COMPARE,32)@0
    expMaxInput_uid33_fpExpETest_a <= STD_LOGIC_VECTOR("00" & maxInput_uid32_fpExpETest_q);
    expMaxInput_uid33_fpExpETest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid31_fpExpETest_q);
    expMaxInput_uid33_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expMaxInput_uid33_fpExpETest_a) - UNSIGNED(expMaxInput_uid33_fpExpETest_b));
    expMaxInput_uid33_fpExpETest_c(0) <= expMaxInput_uid33_fpExpETest_o(32);

    -- invSignX_uid34_fpExpETest(LOGICAL,33)@0
    invSignX_uid34_fpExpETest_a <= signX_uid7_fpExpETest_b;
    invSignX_uid34_fpExpETest_q <= not (invSignX_uid34_fpExpETest_a);

    -- inputOveflow_uid35_fpExpETest(LOGICAL,34)@0
    inputOveflow_uid35_fpExpETest_a <= invSignX_uid34_fpExpETest_q;
    inputOveflow_uid35_fpExpETest_b <= expMaxInput_uid33_fpExpETest_c;
    inputOveflow_uid35_fpExpETest_q <= inputOveflow_uid35_fpExpETest_a and inputOveflow_uid35_fpExpETest_b;

    -- invExpXIsMax_uid28_fpExpETest(LOGICAL,27)@0
    invExpXIsMax_uid28_fpExpETest_a <= expXIsMax_uid23_fpExpETest_q;
    invExpXIsMax_uid28_fpExpETest_q <= not (invExpXIsMax_uid28_fpExpETest_a);

    -- excZ_x_uid22_fpExpETest(LOGICAL,21)@0
    excZ_x_uid22_fpExpETest_a <= expX_uid6_fpExpETest_b;
    excZ_x_uid22_fpExpETest_b <= cstZeroWE_uid14_fpExpETest_q;
    excZ_x_uid22_fpExpETest_q <= "1" WHEN excZ_x_uid22_fpExpETest_a = excZ_x_uid22_fpExpETest_b ELSE "0";

    -- InvExpXIsZero_uid29_fpExpETest(LOGICAL,28)@0
    InvExpXIsZero_uid29_fpExpETest_a <= excZ_x_uid22_fpExpETest_q;
    InvExpXIsZero_uid29_fpExpETest_q <= not (InvExpXIsZero_uid29_fpExpETest_a);

    -- excR_x_uid30_fpExpETest(LOGICAL,29)@0
    excR_x_uid30_fpExpETest_a <= InvExpXIsZero_uid29_fpExpETest_q;
    excR_x_uid30_fpExpETest_b <= invExpXIsMax_uid28_fpExpETest_q;
    excR_x_uid30_fpExpETest_q <= excR_x_uid30_fpExpETest_a and excR_x_uid30_fpExpETest_b;

    -- regXAndExpOverflowAndPos_uid137_fpExpETest(LOGICAL,136)@0
    regXAndExpOverflowAndPos_uid137_fpExpETest_a <= excR_x_uid30_fpExpETest_q;
    regXAndExpOverflowAndPos_uid137_fpExpETest_b <= inputOveflow_uid35_fpExpETest_q;
    regXAndExpOverflowAndPos_uid137_fpExpETest_q <= regXAndExpOverflowAndPos_uid137_fpExpETest_a and regXAndExpOverflowAndPos_uid137_fpExpETest_b;

    -- excI_x_uid26_fpExpETest(LOGICAL,25)@0
    excI_x_uid26_fpExpETest_a <= expXIsMax_uid23_fpExpETest_q;
    excI_x_uid26_fpExpETest_b <= fracXIsZero_uid24_fpExpETest_q;
    excI_x_uid26_fpExpETest_q <= excI_x_uid26_fpExpETest_a and excI_x_uid26_fpExpETest_b;

    -- posInf_uid139_fpExpETest(LOGICAL,138)@0
    posInf_uid139_fpExpETest_a <= excI_x_uid26_fpExpETest_q;
    posInf_uid139_fpExpETest_b <= invSignX_uid34_fpExpETest_q;
    posInf_uid139_fpExpETest_q <= posInf_uid139_fpExpETest_a and posInf_uid139_fpExpETest_b;

    -- excRInf_uid140_fpExpETest(LOGICAL,139)@0
    excRInf_uid140_fpExpETest_a <= posInf_uid139_fpExpETest_q;
    excRInf_uid140_fpExpETest_b <= regXAndExpOverflowAndPos_uid137_fpExpETest_q;
    excRInf_uid140_fpExpETest_q <= excRInf_uid140_fpExpETest_a or excRInf_uid140_fpExpETest_b;

    -- negInf_uid134_fpExpETest(LOGICAL,133)@0
    negInf_uid134_fpExpETest_a <= excI_x_uid26_fpExpETest_q;
    negInf_uid134_fpExpETest_b <= signX_uid7_fpExpETest_b;
    negInf_uid134_fpExpETest_q <= negInf_uid134_fpExpETest_a and negInf_uid134_fpExpETest_b;

    -- minInput_uid36_fpExpETest(CONSTANT,35)
    minInput_uid36_fpExpETest_q <= "1000010101100000000111100110011";

    -- expMinInput_uid37_fpExpETest(COMPARE,36)@0
    expMinInput_uid37_fpExpETest_a <= STD_LOGIC_VECTOR("00" & minInput_uid36_fpExpETest_q);
    expMinInput_uid37_fpExpETest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid31_fpExpETest_q);
    expMinInput_uid37_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(expMinInput_uid37_fpExpETest_a) - UNSIGNED(expMinInput_uid37_fpExpETest_b));
    expMinInput_uid37_fpExpETest_c(0) <= expMinInput_uid37_fpExpETest_o(32);

    -- inputUndeflow_uid38_fpExpETest(LOGICAL,37)@0
    inputUndeflow_uid38_fpExpETest_a <= signX_uid7_fpExpETest_b;
    inputUndeflow_uid38_fpExpETest_b <= expMinInput_uid37_fpExpETest_c;
    inputUndeflow_uid38_fpExpETest_q <= inputUndeflow_uid38_fpExpETest_a and inputUndeflow_uid38_fpExpETest_b;

    -- regXAndExpOverflowAndNeg_uid135_fpExpETest(LOGICAL,134)@0
    regXAndExpOverflowAndNeg_uid135_fpExpETest_a <= excR_x_uid30_fpExpETest_q;
    regXAndExpOverflowAndNeg_uid135_fpExpETest_b <= inputUndeflow_uid38_fpExpETest_q;
    regXAndExpOverflowAndNeg_uid135_fpExpETest_q <= regXAndExpOverflowAndNeg_uid135_fpExpETest_a and regXAndExpOverflowAndNeg_uid135_fpExpETest_b;

    -- excRZero_uid136_fpExpETest(LOGICAL,135)@0
    excRZero_uid136_fpExpETest_a <= regXAndExpOverflowAndNeg_uid135_fpExpETest_q;
    excRZero_uid136_fpExpETest_b <= negInf_uid134_fpExpETest_q;
    excRZero_uid136_fpExpETest_q <= excRZero_uid136_fpExpETest_a or excRZero_uid136_fpExpETest_b;

    -- concExc_uid141_fpExpETest(BITJOIN,140)@0
    concExc_uid141_fpExpETest_q <= excN_x_uid27_fpExpETest_q & excRInf_uid140_fpExpETest_q & excRZero_uid136_fpExpETest_q;

    -- excREnc_uid142_fpExpETest(LOOKUP,141)@0 + 1
    excREnc_uid142_fpExpETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            excREnc_uid142_fpExpETest_q <= "01";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (concExc_uid141_fpExpETest_q) IS
                WHEN "000" => excREnc_uid142_fpExpETest_q <= "01";
                WHEN "001" => excREnc_uid142_fpExpETest_q <= "00";
                WHEN "010" => excREnc_uid142_fpExpETest_q <= "10";
                WHEN "011" => excREnc_uid142_fpExpETest_q <= "00";
                WHEN "100" => excREnc_uid142_fpExpETest_q <= "11";
                WHEN "101" => excREnc_uid142_fpExpETest_q <= "00";
                WHEN "110" => excREnc_uid142_fpExpETest_q <= "00";
                WHEN "111" => excREnc_uid142_fpExpETest_q <= "00";
                WHEN OTHERS => -- unreachable
                               excREnc_uid142_fpExpETest_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- redist4_wraddr(REG,253)
    redist4_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist4_wraddr_q <= "00000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist4_wraddr_q <= STD_LOGIC_VECTOR(redist4_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist4_mem(DUALMEM,251)
    redist4_mem_ia <= STD_LOGIC_VECTOR(excREnc_uid142_fpExpETest_q);
    redist4_mem_aa <= redist4_wraddr_q;
    redist4_mem_ab <= redist4_rdcnt_q;
    redist4_mem_reset0 <= areset;
    redist4_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 2,
        widthad_a => 5,
        numwords_a => 21,
        width_b => 2,
        widthad_b => 5,
        numwords_b => 21,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken1 => redist4_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist4_mem_reset0,
        clock1 => clk,
        address_a => redist4_mem_aa,
        data_a => redist4_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist4_mem_ab,
        q_b => redist4_mem_iq
    );
    redist4_mem_q <= redist4_mem_iq(1 downto 0);

    -- redist4_outputreg(DELAY,250)
    redist4_outputreg : dspba_delay
    GENERIC MAP ( width => 2, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist4_mem_q, xout => redist4_outputreg_q, clk => clk, aclr => areset );

    -- expRPostExc_uid151_fpExpETest(MUX,150)@24
    expRPostExc_uid151_fpExpETest_s <= redist4_outputreg_q;
    expRPostExc_uid151_fpExpETest_combproc: PROCESS (expRPostExc_uid151_fpExpETest_s, cstZeroWE_uid14_fpExpETest_q, expR_uid133_fpExpETest_b, cstAllOWE_uid17_fpExpETest_q)
    BEGIN
        CASE (expRPostExc_uid151_fpExpETest_s) IS
            WHEN "00" => expRPostExc_uid151_fpExpETest_q <= cstZeroWE_uid14_fpExpETest_q;
            WHEN "01" => expRPostExc_uid151_fpExpETest_q <= expR_uid133_fpExpETest_b;
            WHEN "10" => expRPostExc_uid151_fpExpETest_q <= cstAllOWE_uid17_fpExpETest_q;
            WHEN "11" => expRPostExc_uid151_fpExpETest_q <= cstAllOWE_uid17_fpExpETest_q;
            WHEN OTHERS => expRPostExc_uid151_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid143_fpExpETest(CONSTANT,142)
    oneFracRPostExc2_uid143_fpExpETest_q <= "00000000000000000000001";

    -- fracEY_uid145_fpExpETest(BITSELECT,144)@24
    fracEY_uid145_fpExpETest_in <= eY_uid125_fpExpETest_impl_q0;
    fracEY_uid145_fpExpETest_b <= fracEY_uid145_fpExpETest_in(22 downto 0);

    -- fracRPostExc_uid147_fpExpETest(MUX,146)@24
    fracRPostExc_uid147_fpExpETest_s <= redist4_outputreg_q;
    fracRPostExc_uid147_fpExpETest_combproc: PROCESS (fracRPostExc_uid147_fpExpETest_s, cstZeroWF_uid18_fpExpETest_q, fracEY_uid145_fpExpETest_b, oneFracRPostExc2_uid143_fpExpETest_q)
    BEGIN
        CASE (fracRPostExc_uid147_fpExpETest_s) IS
            WHEN "00" => fracRPostExc_uid147_fpExpETest_q <= cstZeroWF_uid18_fpExpETest_q;
            WHEN "01" => fracRPostExc_uid147_fpExpETest_q <= fracEY_uid145_fpExpETest_b;
            WHEN "10" => fracRPostExc_uid147_fpExpETest_q <= cstZeroWF_uid18_fpExpETest_q;
            WHEN "11" => fracRPostExc_uid147_fpExpETest_q <= oneFracRPostExc2_uid143_fpExpETest_q;
            WHEN OTHERS => fracRPostExc_uid147_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- finalResult_uid153_fpExpETest(BITJOIN,152)@24
    finalResult_uid153_fpExpETest_q <= signEY_uid152_fpExpETest_b & expRPostExc_uid151_fpExpETest_q & fracRPostExc_uid147_fpExpETest_q;

    -- xOut(GPOUT,4)@24
    q <= finalResult_uid153_fpExpETest_q;

END normal;
