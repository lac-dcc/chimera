-- (C) 2001-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


----------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Debug Version 12.0
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2012 Altera Corporation.  All rights reserved.    
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
----------------------------------------------------------------------------- 

-- VHDL created from FPMult
-- VHDL created on Thu Dec 06 15:36:48 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/qshell64/p4/ip/aion/src/mip_common/hw_model.cpp:1246
entity FPMult is
    port (
        x : in std_logic_vector(31 downto 0);
        y : in std_logic_vector(31 downto 0);
        r : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of FPMult is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid14_fpMulTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid15_fpMulTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid16_fpMulTest_q : std_logic_vector (7 downto 0);
    signal biasInc_uid47_fpMulTest_q : std_logic_vector (9 downto 0);
    signal oneFracRPostExc2_uid81_fpMulTest_q : std_logic_vector (22 downto 0);
    signal topProd_uid96_prod_uid49_fpMulTest_a : std_logic_vector (17 downto 0);
    signal topProd_uid96_prod_uid49_fpMulTest_b : std_logic_vector (17 downto 0);
    signal topProd_uid96_prod_uid49_fpMulTest_s1 : std_logic_vector (35 downto 0);
    signal topProd_uid96_prod_uid49_fpMulTest_reset : std_logic;
    signal topProd_uid96_prod_uid49_fpMulTest_q : std_logic_vector (35 downto 0);
    signal sm0_uid99_prod_uid49_fpMulTest_a : std_logic_vector (5 downto 0);
    signal sm0_uid99_prod_uid49_fpMulTest_b : std_logic_vector (8 downto 0);
    signal sm0_uid99_prod_uid49_fpMulTest_s1 : std_logic_vector (14 downto 0);
    signal sm0_uid99_prod_uid49_fpMulTest_reset : std_logic;
    signal sm0_uid99_prod_uid49_fpMulTest_q : std_logic_vector (14 downto 0);
    signal sm1_uid102_prod_uid49_fpMulTest_a : std_logic_vector (8 downto 0);
    signal sm1_uid102_prod_uid49_fpMulTest_b : std_logic_vector (5 downto 0);
    signal sm1_uid102_prod_uid49_fpMulTest_s1 : std_logic_vector (14 downto 0);
    signal sm1_uid102_prod_uid49_fpMulTest_reset : std_logic;
    signal sm1_uid102_prod_uid49_fpMulTest_q : std_logic_vector (14 downto 0);
    signal reg_expFracPreRound_uid55_fpMulTest_0_to_expFracRPostRounding_uid58_fpMulTest_0_q : std_logic_vector (34 downto 0);
    signal ld_xIn_v_to_xOut_v_q : std_logic_vector (0 downto 0);
    signal ld_xIn_c_to_xOut_c_q : std_logic_vector (7 downto 0);
    signal ld_expSum_uid46_fpMulTest_q_to_expSumMBias_uid48_fpMulTest_a_q : std_logic_vector (8 downto 0);
    signal ld_normalizeBit_uid50_fpMulTest_b_to_roundBitAndNormalizationOp_uid57_fpMulTest_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid29_fpMulTest_q_to_excZC3_uid68_fpMulTest_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid45_fpMulTest_q_to_excZC3_uid68_fpMulTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYZ_uid65_fpMulTest_q_to_excRZero_uid69_fpMulTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXZAndExcYR_uid66_fpMulTest_q_to_excRZero_uid69_fpMulTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYZAndExcXR_uid67_fpMulTest_q_to_excRZero_uid69_fpMulTest_c_q : std_logic_vector (0 downto 0);
    signal ld_excXIAndExcYI_uid70_fpMulTest_q_to_excRInf_uid74_fpMulTest_a_q : std_logic_vector (0 downto 0);
    signal ld_excXRAndExcYI_uid71_fpMulTest_q_to_excRInf_uid74_fpMulTest_b_q : std_logic_vector (0 downto 0);
    signal ld_excYRAndExcXI_uid72_fpMulTest_q_to_excRInf_uid74_fpMulTest_c_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid78_fpMulTest_q_to_concExc_uid79_fpMulTest_c_q : std_logic_vector (0 downto 0);
    signal ld_signRPostExc_uid91_fpMulTest_q_to_R_uid92_fpMulTest_c_q : std_logic_vector (0 downto 0);
    signal roundBitAndNormalizationOp_uid57_fpMulTest_q : std_logic_vector (25 downto 0);
    signal expSumMBias_uid48_fpMulTest_a : std_logic_vector(11 downto 0);
    signal expSumMBias_uid48_fpMulTest_b : std_logic_vector(11 downto 0);
    signal expSumMBias_uid48_fpMulTest_o : std_logic_vector (11 downto 0);
    signal expSumMBias_uid48_fpMulTest_q : std_logic_vector (10 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_a : std_logic_vector(35 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_b : std_logic_vector(35 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_o : std_logic_vector (35 downto 0);
    signal expFracRPostRounding_uid58_fpMulTest_q : std_logic_vector (35 downto 0);
    signal addLowContrib_uid103_prod_uid49_fpMulTest_a : std_logic_vector(15 downto 0);
    signal addLowContrib_uid103_prod_uid49_fpMulTest_b : std_logic_vector(15 downto 0);
    signal addLowContrib_uid103_prod_uid49_fpMulTest_o : std_logic_vector (15 downto 0);
    signal addLowContrib_uid103_prod_uid49_fpMulTest_q : std_logic_vector (15 downto 0);
    signal expX_uid6_fpMulTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpMulTest_b : std_logic_vector (7 downto 0);
    signal signX_uid8_fpMulTest_in : std_logic_vector (31 downto 0);
    signal signX_uid8_fpMulTest_b : std_logic_vector (0 downto 0);
    signal fracX_uid10_fpMulTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid10_fpMulTest_b : std_logic_vector (22 downto 0);
    signal expY_uid7_fpMulTest_in : std_logic_vector (30 downto 0);
    signal expY_uid7_fpMulTest_b : std_logic_vector (7 downto 0);
    signal signY_uid9_fpMulTest_in : std_logic_vector (31 downto 0);
    signal signY_uid9_fpMulTest_b : std_logic_vector (0 downto 0);
    signal fracY_uid12_fpMulTest_in : std_logic_vector (22 downto 0);
    signal fracY_uid12_fpMulTest_b : std_logic_vector (22 downto 0);
    signal expXIsMax_uid20_fpMulTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid20_fpMulTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid20_fpMulTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid36_fpMulTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid36_fpMulTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid36_fpMulTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid22_fpMulTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid22_fpMulTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid22_fpMulTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid38_fpMulTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid38_fpMulTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid38_fpMulTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid18_fpMulTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid18_fpMulTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid18_fpMulTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid34_fpMulTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid34_fpMulTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid34_fpMulTest_q : std_logic_vector(0 downto 0);
    signal lowRangeA_uid104_prod_uid49_fpMulTest_in : std_logic_vector (2 downto 0);
    signal lowRangeA_uid104_prod_uid49_fpMulTest_b : std_logic_vector (2 downto 0);
    signal highABits_uid105_prod_uid49_fpMulTest_in : std_logic_vector (35 downto 0);
    signal highABits_uid105_prod_uid49_fpMulTest_b : std_logic_vector (32 downto 0);
    signal fracRPreExc_uid59_fpMulTest_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid59_fpMulTest_b : std_logic_vector (22 downto 0);
    signal expRPreExc_uid60_fpMulTest_in : std_logic_vector (33 downto 0);
    signal expRPreExc_uid60_fpMulTest_b : std_logic_vector (9 downto 0);
    signal sumHighA_B_uid106_prod_uid49_fpMulTest_a : std_logic_vector(33 downto 0);
    signal sumHighA_B_uid106_prod_uid49_fpMulTest_b : std_logic_vector(33 downto 0);
    signal sumHighA_B_uid106_prod_uid49_fpMulTest_o : std_logic_vector (33 downto 0);
    signal sumHighA_B_uid106_prod_uid49_fpMulTest_q : std_logic_vector (33 downto 0);
    signal expSum_uid46_fpMulTest_a : std_logic_vector(8 downto 0);
    signal expSum_uid46_fpMulTest_b : std_logic_vector(8 downto 0);
    signal expSum_uid46_fpMulTest_o : std_logic_vector (8 downto 0);
    signal expSum_uid46_fpMulTest_q : std_logic_vector (8 downto 0);
    signal signR_uid61_fpMulTest_a : std_logic_vector(0 downto 0);
    signal signR_uid61_fpMulTest_b : std_logic_vector(0 downto 0);
    signal signR_uid61_fpMulTest_q : std_logic_vector(0 downto 0);
    signal add_one_fracX_uid10_uid11_uid11_fpMulTest_q : std_logic_vector (23 downto 0);
    signal add_one_fracY_uid12_uid13_uid13_fpMulTest_q : std_logic_vector (23 downto 0);
    signal exc_I_uid23_fpMulTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid23_fpMulTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid23_fpMulTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid39_fpMulTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid39_fpMulTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid39_fpMulTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid24_fpMulTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid24_fpMulTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid40_fpMulTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid40_fpMulTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid28_fpMulTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid28_fpMulTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid65_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid65_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYZ_uid65_fpMulTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid76_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid76_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYI_uid76_fpMulTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid44_fpMulTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid44_fpMulTest_q : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid75_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid75_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXI_uid75_fpMulTest_q : std_logic_vector(0 downto 0);
    signal add0_uid104_uid107_prod_uid49_fpMulTest_q : std_logic_vector (36 downto 0);
    signal expUdf_uid62_fpMulTest_a : std_logic_vector(12 downto 0);
    signal expUdf_uid62_fpMulTest_b : std_logic_vector(12 downto 0);
    signal expUdf_uid62_fpMulTest_o : std_logic_vector (12 downto 0);
    signal expUdf_uid62_fpMulTest_cin : std_logic_vector (0 downto 0);
    signal expUdf_uid62_fpMulTest_n : std_logic_vector (0 downto 0);
    signal expOvf_uid64_fpMulTest_a : std_logic_vector(12 downto 0);
    signal expOvf_uid64_fpMulTest_b : std_logic_vector(12 downto 0);
    signal expOvf_uid64_fpMulTest_o : std_logic_vector (12 downto 0);
    signal expOvf_uid64_fpMulTest_cin : std_logic_vector (0 downto 0);
    signal expOvf_uid64_fpMulTest_n : std_logic_vector (0 downto 0);
    signal expRFinal_uid87_fpMulTest_in : std_logic_vector (7 downto 0);
    signal expRFinal_uid87_fpMulTest_b : std_logic_vector (7 downto 0);
    signal xTop9Bits_uid94_prod_uid49_fpMulTest_in : std_logic_vector (23 downto 0);
    signal xTop9Bits_uid94_prod_uid49_fpMulTest_b : std_logic_vector (17 downto 0);
    signal sSM0W_uid98_prod_uid49_fpMulTest_in : std_logic_vector (23 downto 0);
    signal sSM0W_uid98_prod_uid49_fpMulTest_b : std_logic_vector (8 downto 0);
    signal sSM1W_uid101_prod_uid49_fpMulTest_in : std_logic_vector (5 downto 0);
    signal sSM1W_uid101_prod_uid49_fpMulTest_b : std_logic_vector (5 downto 0);
    signal yTop9Bits_uid95_prod_uid49_fpMulTest_in : std_logic_vector (23 downto 0);
    signal yTop9Bits_uid95_prod_uid49_fpMulTest_b : std_logic_vector (17 downto 0);
    signal sSM0H_uid97_prod_uid49_fpMulTest_in : std_logic_vector (5 downto 0);
    signal sSM0H_uid97_prod_uid49_fpMulTest_b : std_logic_vector (5 downto 0);
    signal sSM1H_uid100_prod_uid49_fpMulTest_in : std_logic_vector (23 downto 0);
    signal sSM1H_uid100_prod_uid49_fpMulTest_b : std_logic_vector (8 downto 0);
    signal InvExc_I_uid27_fpMulTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid27_fpMulTest_q : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid70_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid70_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excXIAndExcYI_uid70_fpMulTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid43_fpMulTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid43_fpMulTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid25_fpMulTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid25_fpMulTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid25_fpMulTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid41_fpMulTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid41_fpMulTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid41_fpMulTest_q : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid77_fpMulTest_a : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid77_fpMulTest_b : std_logic_vector(0 downto 0);
    signal ZeroTimesInf_uid77_fpMulTest_q : std_logic_vector(0 downto 0);
    signal R_uid108_prod_uid49_fpMulTest_in : std_logic_vector (35 downto 0);
    signal R_uid108_prod_uid49_fpMulTest_b : std_logic_vector (26 downto 0);
    signal excZC3_uid68_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excZC3_uid68_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excZC3_uid68_fpMulTest_c : std_logic_vector(0 downto 0);
    signal excZC3_uid68_fpMulTest_q : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid73_fpMulTest_a : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid73_fpMulTest_b : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid73_fpMulTest_c : std_logic_vector(0 downto 0);
    signal ExcROvfAndInReg_uid73_fpMulTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid26_fpMulTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid26_fpMulTest_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid78_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid78_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid78_fpMulTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid78_fpMulTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid42_fpMulTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid42_fpMulTest_q : std_logic_vector(0 downto 0);
    signal normalizeBit_uid50_fpMulTest_in : std_logic_vector (26 downto 0);
    signal normalizeBit_uid50_fpMulTest_b : std_logic_vector (0 downto 0);
    signal fracRPostNormHigh_uid52_fpMulTest_in : std_logic_vector (25 downto 0);
    signal fracRPostNormHigh_uid52_fpMulTest_b : std_logic_vector (23 downto 0);
    signal fracRPostNormLow_uid53_fpMulTest_in : std_logic_vector (24 downto 0);
    signal fracRPostNormLow_uid53_fpMulTest_b : std_logic_vector (23 downto 0);
    signal excRZero_uid69_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excRZero_uid69_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excRZero_uid69_fpMulTest_c : std_logic_vector(0 downto 0);
    signal excRZero_uid69_fpMulTest_d : std_logic_vector(0 downto 0);
    signal excRZero_uid69_fpMulTest_q : std_logic_vector(0 downto 0);
    signal excRInf_uid74_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excRInf_uid74_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excRInf_uid74_fpMulTest_c : std_logic_vector(0 downto 0);
    signal excRInf_uid74_fpMulTest_d : std_logic_vector(0 downto 0);
    signal excRInf_uid74_fpMulTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid29_fpMulTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid29_fpMulTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid29_fpMulTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid29_fpMulTest_q : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid90_fpMulTest_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid90_fpMulTest_q : std_logic_vector(0 downto 0);
    signal exc_R_uid45_fpMulTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid45_fpMulTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid45_fpMulTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid45_fpMulTest_q : std_logic_vector(0 downto 0);
    signal fracRPostNorm_uid54_fpMulTest_s : std_logic_vector (0 downto 0);
    signal fracRPostNorm_uid54_fpMulTest_q : std_logic_vector (23 downto 0);
    signal concExc_uid79_fpMulTest_q : std_logic_vector (2 downto 0);
    signal excYZAndExcXR_uid67_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid67_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excYZAndExcXR_uid67_fpMulTest_q : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid71_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid71_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excXRAndExcYI_uid71_fpMulTest_q : std_logic_vector(0 downto 0);
    signal signRPostExc_uid91_fpMulTest_a : std_logic_vector(0 downto 0);
    signal signRPostExc_uid91_fpMulTest_b : std_logic_vector(0 downto 0);
    signal signRPostExc_uid91_fpMulTest_q : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid66_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid66_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excXZAndExcYR_uid66_fpMulTest_q : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid72_fpMulTest_a : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid72_fpMulTest_b : std_logic_vector(0 downto 0);
    signal excYRAndExcXI_uid72_fpMulTest_q : std_logic_vector(0 downto 0);
    signal expFracPreRound_uid55_fpMulTest_q : std_logic_vector (34 downto 0);
    signal excREnc_uid80_fpMulTest_q : std_logic_vector(1 downto 0);
    signal fracRPostExc_uid84_fpMulTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid84_fpMulTest_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid89_fpMulTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid89_fpMulTest_q : std_logic_vector (7 downto 0);
    signal R_uid92_fpMulTest_q : std_logic_vector (31 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--cstAllZWF_uid15_fpMulTest(CONSTANT,14)
    cstAllZWF_uid15_fpMulTest_q <= "00000000000000000000000";

	--xIn(PORTIN,3)@0

	--fracX_uid10_fpMulTest(BITSELECT,9)@0
    fracX_uid10_fpMulTest_in <= x(22 downto 0);
    fracX_uid10_fpMulTest_b <= fracX_uid10_fpMulTest_in(22 downto 0);

	--fracXIsZero_uid22_fpMulTest(LOGICAL,21)@0
    fracXIsZero_uid22_fpMulTest_a <= fracX_uid10_fpMulTest_b;
    fracXIsZero_uid22_fpMulTest_b <= cstAllZWF_uid15_fpMulTest_q;
    fracXIsZero_uid22_fpMulTest_q <= "1" when fracXIsZero_uid22_fpMulTest_a = fracXIsZero_uid22_fpMulTest_b else "0";

	--cstAllOWE_uid14_fpMulTest(CONSTANT,13)
    cstAllOWE_uid14_fpMulTest_q <= "11111111";

	--expX_uid6_fpMulTest(BITSELECT,5)@0
    expX_uid6_fpMulTest_in <= x(30 downto 0);
    expX_uid6_fpMulTest_b <= expX_uid6_fpMulTest_in(30 downto 23);

	--expXIsMax_uid20_fpMulTest(LOGICAL,19)@0
    expXIsMax_uid20_fpMulTest_a <= expX_uid6_fpMulTest_b;
    expXIsMax_uid20_fpMulTest_b <= cstAllOWE_uid14_fpMulTest_q;
    expXIsMax_uid20_fpMulTest_q <= "1" when expXIsMax_uid20_fpMulTest_a = expXIsMax_uid20_fpMulTest_b else "0";

	--exc_I_uid23_fpMulTest(LOGICAL,22)@0
    exc_I_uid23_fpMulTest_a <= expXIsMax_uid20_fpMulTest_q;
    exc_I_uid23_fpMulTest_b <= fracXIsZero_uid22_fpMulTest_q;
    exc_I_uid23_fpMulTest_q <= exc_I_uid23_fpMulTest_a and exc_I_uid23_fpMulTest_b;

	--cstAllZWE_uid16_fpMulTest(CONSTANT,15)
    cstAllZWE_uid16_fpMulTest_q <= "00000000";

	--expY_uid7_fpMulTest(BITSELECT,6)@0
    expY_uid7_fpMulTest_in <= y(30 downto 0);
    expY_uid7_fpMulTest_b <= expY_uid7_fpMulTest_in(30 downto 23);

	--expXIsZero_uid34_fpMulTest(LOGICAL,33)@0
    expXIsZero_uid34_fpMulTest_a <= expY_uid7_fpMulTest_b;
    expXIsZero_uid34_fpMulTest_b <= cstAllZWE_uid16_fpMulTest_q;
    expXIsZero_uid34_fpMulTest_q <= "1" when expXIsZero_uid34_fpMulTest_a = expXIsZero_uid34_fpMulTest_b else "0";

	--excYZAndExcXI_uid75_fpMulTest(LOGICAL,74)@0
    excYZAndExcXI_uid75_fpMulTest_a <= expXIsZero_uid34_fpMulTest_q;
    excYZAndExcXI_uid75_fpMulTest_b <= exc_I_uid23_fpMulTest_q;
    excYZAndExcXI_uid75_fpMulTest_q <= excYZAndExcXI_uid75_fpMulTest_a and excYZAndExcXI_uid75_fpMulTest_b;

	--fracY_uid12_fpMulTest(BITSELECT,11)@0
    fracY_uid12_fpMulTest_in <= y(22 downto 0);
    fracY_uid12_fpMulTest_b <= fracY_uid12_fpMulTest_in(22 downto 0);

	--fracXIsZero_uid38_fpMulTest(LOGICAL,37)@0
    fracXIsZero_uid38_fpMulTest_a <= fracY_uid12_fpMulTest_b;
    fracXIsZero_uid38_fpMulTest_b <= cstAllZWF_uid15_fpMulTest_q;
    fracXIsZero_uid38_fpMulTest_q <= "1" when fracXIsZero_uid38_fpMulTest_a = fracXIsZero_uid38_fpMulTest_b else "0";

	--expXIsMax_uid36_fpMulTest(LOGICAL,35)@0
    expXIsMax_uid36_fpMulTest_a <= expY_uid7_fpMulTest_b;
    expXIsMax_uid36_fpMulTest_b <= cstAllOWE_uid14_fpMulTest_q;
    expXIsMax_uid36_fpMulTest_q <= "1" when expXIsMax_uid36_fpMulTest_a = expXIsMax_uid36_fpMulTest_b else "0";

	--exc_I_uid39_fpMulTest(LOGICAL,38)@0
    exc_I_uid39_fpMulTest_a <= expXIsMax_uid36_fpMulTest_q;
    exc_I_uid39_fpMulTest_b <= fracXIsZero_uid38_fpMulTest_q;
    exc_I_uid39_fpMulTest_q <= exc_I_uid39_fpMulTest_a and exc_I_uid39_fpMulTest_b;

	--expXIsZero_uid18_fpMulTest(LOGICAL,17)@0
    expXIsZero_uid18_fpMulTest_a <= expX_uid6_fpMulTest_b;
    expXIsZero_uid18_fpMulTest_b <= cstAllZWE_uid16_fpMulTest_q;
    expXIsZero_uid18_fpMulTest_q <= "1" when expXIsZero_uid18_fpMulTest_a = expXIsZero_uid18_fpMulTest_b else "0";

	--excXZAndExcYI_uid76_fpMulTest(LOGICAL,75)@0
    excXZAndExcYI_uid76_fpMulTest_a <= expXIsZero_uid18_fpMulTest_q;
    excXZAndExcYI_uid76_fpMulTest_b <= exc_I_uid39_fpMulTest_q;
    excXZAndExcYI_uid76_fpMulTest_q <= excXZAndExcYI_uid76_fpMulTest_a and excXZAndExcYI_uid76_fpMulTest_b;

	--ZeroTimesInf_uid77_fpMulTest(LOGICAL,76)@0
    ZeroTimesInf_uid77_fpMulTest_a <= excXZAndExcYI_uid76_fpMulTest_q;
    ZeroTimesInf_uid77_fpMulTest_b <= excYZAndExcXI_uid75_fpMulTest_q;
    ZeroTimesInf_uid77_fpMulTest_q <= ZeroTimesInf_uid77_fpMulTest_a or ZeroTimesInf_uid77_fpMulTest_b;

	--InvFracXIsZero_uid40_fpMulTest(LOGICAL,39)@0
    InvFracXIsZero_uid40_fpMulTest_a <= fracXIsZero_uid38_fpMulTest_q;
    InvFracXIsZero_uid40_fpMulTest_q <= not InvFracXIsZero_uid40_fpMulTest_a;

	--exc_N_uid41_fpMulTest(LOGICAL,40)@0
    exc_N_uid41_fpMulTest_a <= expXIsMax_uid36_fpMulTest_q;
    exc_N_uid41_fpMulTest_b <= InvFracXIsZero_uid40_fpMulTest_q;
    exc_N_uid41_fpMulTest_q <= exc_N_uid41_fpMulTest_a and exc_N_uid41_fpMulTest_b;

	--InvFracXIsZero_uid24_fpMulTest(LOGICAL,23)@0
    InvFracXIsZero_uid24_fpMulTest_a <= fracXIsZero_uid22_fpMulTest_q;
    InvFracXIsZero_uid24_fpMulTest_q <= not InvFracXIsZero_uid24_fpMulTest_a;

	--exc_N_uid25_fpMulTest(LOGICAL,24)@0
    exc_N_uid25_fpMulTest_a <= expXIsMax_uid20_fpMulTest_q;
    exc_N_uid25_fpMulTest_b <= InvFracXIsZero_uid24_fpMulTest_q;
    exc_N_uid25_fpMulTest_q <= exc_N_uid25_fpMulTest_a and exc_N_uid25_fpMulTest_b;

	--excRNaN_uid78_fpMulTest(LOGICAL,77)@0
    excRNaN_uid78_fpMulTest_a <= exc_N_uid25_fpMulTest_q;
    excRNaN_uid78_fpMulTest_b <= exc_N_uid41_fpMulTest_q;
    excRNaN_uid78_fpMulTest_c <= ZeroTimesInf_uid77_fpMulTest_q;
    excRNaN_uid78_fpMulTest_q <= excRNaN_uid78_fpMulTest_a or excRNaN_uid78_fpMulTest_b or excRNaN_uid78_fpMulTest_c;

	--InvExcRNaN_uid90_fpMulTest(LOGICAL,89)@0
    InvExcRNaN_uid90_fpMulTest_a <= excRNaN_uid78_fpMulTest_q;
    InvExcRNaN_uid90_fpMulTest_q <= not InvExcRNaN_uid90_fpMulTest_a;

	--signY_uid9_fpMulTest(BITSELECT,8)@0
    signY_uid9_fpMulTest_in <= y;
    signY_uid9_fpMulTest_b <= signY_uid9_fpMulTest_in(31 downto 31);

	--signX_uid8_fpMulTest(BITSELECT,7)@0
    signX_uid8_fpMulTest_in <= x;
    signX_uid8_fpMulTest_b <= signX_uid8_fpMulTest_in(31 downto 31);

	--signR_uid61_fpMulTest(LOGICAL,60)@0
    signR_uid61_fpMulTest_a <= signX_uid8_fpMulTest_b;
    signR_uid61_fpMulTest_b <= signY_uid9_fpMulTest_b;
    signR_uid61_fpMulTest_q <= signR_uid61_fpMulTest_a xor signR_uid61_fpMulTest_b;

	--signRPostExc_uid91_fpMulTest(LOGICAL,90)@0
    signRPostExc_uid91_fpMulTest_a <= signR_uid61_fpMulTest_q;
    signRPostExc_uid91_fpMulTest_b <= InvExcRNaN_uid90_fpMulTest_q;
    signRPostExc_uid91_fpMulTest_q <= signRPostExc_uid91_fpMulTest_a and signRPostExc_uid91_fpMulTest_b;

	--ld_signRPostExc_uid91_fpMulTest_q_to_R_uid92_fpMulTest_c(DELAY,217)@0
    ld_signRPostExc_uid91_fpMulTest_q_to_R_uid92_fpMulTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => signRPostExc_uid91_fpMulTest_q, xout => ld_signRPostExc_uid91_fpMulTest_q_to_R_uid92_fpMulTest_c_q, clk => clk, aclr => areset );

	--GND(CONSTANT,0)
    GND_q <= "0";

	--add_one_fracX_uid10_uid11_uid11_fpMulTest(BITJOIN,10)@0
    add_one_fracX_uid10_uid11_uid11_fpMulTest_q <= VCC_q & fracX_uid10_fpMulTest_b;

	--sSM1W_uid101_prod_uid49_fpMulTest(BITSELECT,100)@0
    sSM1W_uid101_prod_uid49_fpMulTest_in <= add_one_fracX_uid10_uid11_uid11_fpMulTest_q(5 downto 0);
    sSM1W_uid101_prod_uid49_fpMulTest_b <= sSM1W_uid101_prod_uid49_fpMulTest_in(5 downto 0);

	--add_one_fracY_uid12_uid13_uid13_fpMulTest(BITJOIN,12)@0
    add_one_fracY_uid12_uid13_uid13_fpMulTest_q <= VCC_q & fracY_uid12_fpMulTest_b;

	--sSM1H_uid100_prod_uid49_fpMulTest(BITSELECT,99)@0
    sSM1H_uid100_prod_uid49_fpMulTest_in <= add_one_fracY_uid12_uid13_uid13_fpMulTest_q;
    sSM1H_uid100_prod_uid49_fpMulTest_b <= sSM1H_uid100_prod_uid49_fpMulTest_in(23 downto 15);

	--sm1_uid102_prod_uid49_fpMulTest(MULT,101)@0
    sm1_uid102_prod_uid49_fpMulTest_a <= sSM1H_uid100_prod_uid49_fpMulTest_b;
    sm1_uid102_prod_uid49_fpMulTest_b <= sSM1W_uid101_prod_uid49_fpMulTest_b;
    sm1_uid102_prod_uid49_fpMulTest_reset <= areset;

    sm1_uid102_prod_uid49_fpMulTest_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 9,
    lpm_widthb => 6,
    lpm_widthp => 15,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "UNSIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 1
    )
    PORT MAP (
    dataa => sm1_uid102_prod_uid49_fpMulTest_a,
    datab => sm1_uid102_prod_uid49_fpMulTest_b,
    clken => VCC_q(0),
    aclr => sm1_uid102_prod_uid49_fpMulTest_reset,
    clock => clk,
    result => sm1_uid102_prod_uid49_fpMulTest_s1
    );
    sm1_uid102_prod_uid49_fpMulTest_q <= sm1_uid102_prod_uid49_fpMulTest_s1;

	--sSM0W_uid98_prod_uid49_fpMulTest(BITSELECT,97)@0
    sSM0W_uid98_prod_uid49_fpMulTest_in <= add_one_fracX_uid10_uid11_uid11_fpMulTest_q;
    sSM0W_uid98_prod_uid49_fpMulTest_b <= sSM0W_uid98_prod_uid49_fpMulTest_in(23 downto 15);

	--sSM0H_uid97_prod_uid49_fpMulTest(BITSELECT,96)@0
    sSM0H_uid97_prod_uid49_fpMulTest_in <= add_one_fracY_uid12_uid13_uid13_fpMulTest_q(5 downto 0);
    sSM0H_uid97_prod_uid49_fpMulTest_b <= sSM0H_uid97_prod_uid49_fpMulTest_in(5 downto 0);

	--sm0_uid99_prod_uid49_fpMulTest(MULT,98)@0
    sm0_uid99_prod_uid49_fpMulTest_a <= sSM0H_uid97_prod_uid49_fpMulTest_b;
    sm0_uid99_prod_uid49_fpMulTest_b <= sSM0W_uid98_prod_uid49_fpMulTest_b;
    sm0_uid99_prod_uid49_fpMulTest_reset <= areset;

    sm0_uid99_prod_uid49_fpMulTest_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 6,
    lpm_widthb => 9,
    lpm_widthp => 15,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "UNSIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 1
    )
    PORT MAP (
    dataa => sm0_uid99_prod_uid49_fpMulTest_a,
    datab => sm0_uid99_prod_uid49_fpMulTest_b,
    clken => VCC_q(0),
    aclr => sm0_uid99_prod_uid49_fpMulTest_reset,
    clock => clk,
    result => sm0_uid99_prod_uid49_fpMulTest_s1
    );
    sm0_uid99_prod_uid49_fpMulTest_q <= sm0_uid99_prod_uid49_fpMulTest_s1;

	--addLowContrib_uid103_prod_uid49_fpMulTest(ADD,102)@1
    addLowContrib_uid103_prod_uid49_fpMulTest_a <= STD_LOGIC_VECTOR("0" & sm0_uid99_prod_uid49_fpMulTest_q);
    addLowContrib_uid103_prod_uid49_fpMulTest_b <= STD_LOGIC_VECTOR("0" & sm1_uid102_prod_uid49_fpMulTest_q);
            addLowContrib_uid103_prod_uid49_fpMulTest_o <= STD_LOGIC_VECTOR(UNSIGNED(addLowContrib_uid103_prod_uid49_fpMulTest_a) + UNSIGNED(addLowContrib_uid103_prod_uid49_fpMulTest_b));
    addLowContrib_uid103_prod_uid49_fpMulTest_q <= addLowContrib_uid103_prod_uid49_fpMulTest_o(15 downto 0);


	--yTop9Bits_uid95_prod_uid49_fpMulTest(BITSELECT,94)@0
    yTop9Bits_uid95_prod_uid49_fpMulTest_in <= add_one_fracY_uid12_uid13_uid13_fpMulTest_q;
    yTop9Bits_uid95_prod_uid49_fpMulTest_b <= yTop9Bits_uid95_prod_uid49_fpMulTest_in(23 downto 6);

	--xTop9Bits_uid94_prod_uid49_fpMulTest(BITSELECT,93)@0
    xTop9Bits_uid94_prod_uid49_fpMulTest_in <= add_one_fracX_uid10_uid11_uid11_fpMulTest_q;
    xTop9Bits_uid94_prod_uid49_fpMulTest_b <= xTop9Bits_uid94_prod_uid49_fpMulTest_in(23 downto 6);

	--topProd_uid96_prod_uid49_fpMulTest(MULT,95)@0
    topProd_uid96_prod_uid49_fpMulTest_a <= xTop9Bits_uid94_prod_uid49_fpMulTest_b;
    topProd_uid96_prod_uid49_fpMulTest_b <= yTop9Bits_uid95_prod_uid49_fpMulTest_b;
    topProd_uid96_prod_uid49_fpMulTest_reset <= areset;

    topProd_uid96_prod_uid49_fpMulTest_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 18,
    lpm_widthb => 18,
    lpm_widthp => 36,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "UNSIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 1
    )
    PORT MAP (
    dataa => topProd_uid96_prod_uid49_fpMulTest_a,
    datab => topProd_uid96_prod_uid49_fpMulTest_b,
    clken => VCC_q(0),
    aclr => topProd_uid96_prod_uid49_fpMulTest_reset,
    clock => clk,
    result => topProd_uid96_prod_uid49_fpMulTest_s1
    );
    topProd_uid96_prod_uid49_fpMulTest_q <= topProd_uid96_prod_uid49_fpMulTest_s1;

	--highABits_uid105_prod_uid49_fpMulTest(BITSELECT,104)@1
    highABits_uid105_prod_uid49_fpMulTest_in <= topProd_uid96_prod_uid49_fpMulTest_q;
    highABits_uid105_prod_uid49_fpMulTest_b <= highABits_uid105_prod_uid49_fpMulTest_in(35 downto 3);

	--sumHighA_B_uid106_prod_uid49_fpMulTest(ADD,105)@1
    sumHighA_B_uid106_prod_uid49_fpMulTest_a <= STD_LOGIC_VECTOR("0" & highABits_uid105_prod_uid49_fpMulTest_b);
    sumHighA_B_uid106_prod_uid49_fpMulTest_b <= STD_LOGIC_VECTOR("000000000000000000" & addLowContrib_uid103_prod_uid49_fpMulTest_q);
            sumHighA_B_uid106_prod_uid49_fpMulTest_o <= STD_LOGIC_VECTOR(UNSIGNED(sumHighA_B_uid106_prod_uid49_fpMulTest_a) + UNSIGNED(sumHighA_B_uid106_prod_uid49_fpMulTest_b));
    sumHighA_B_uid106_prod_uid49_fpMulTest_q <= sumHighA_B_uid106_prod_uid49_fpMulTest_o(33 downto 0);


	--lowRangeA_uid104_prod_uid49_fpMulTest(BITSELECT,103)@1
    lowRangeA_uid104_prod_uid49_fpMulTest_in <= topProd_uid96_prod_uid49_fpMulTest_q(2 downto 0);
    lowRangeA_uid104_prod_uid49_fpMulTest_b <= lowRangeA_uid104_prod_uid49_fpMulTest_in(2 downto 0);

	--add0_uid104_uid107_prod_uid49_fpMulTest(BITJOIN,106)@1
    add0_uid104_uid107_prod_uid49_fpMulTest_q <= sumHighA_B_uid106_prod_uid49_fpMulTest_q & lowRangeA_uid104_prod_uid49_fpMulTest_b;

	--R_uid108_prod_uid49_fpMulTest(BITSELECT,107)@1
    R_uid108_prod_uid49_fpMulTest_in <= add0_uid104_uid107_prod_uid49_fpMulTest_q(35 downto 0);
    R_uid108_prod_uid49_fpMulTest_b <= R_uid108_prod_uid49_fpMulTest_in(35 downto 9);

	--normalizeBit_uid50_fpMulTest(BITSELECT,49)@1
    normalizeBit_uid50_fpMulTest_in <= R_uid108_prod_uid49_fpMulTest_b;
    normalizeBit_uid50_fpMulTest_b <= normalizeBit_uid50_fpMulTest_in(26 downto 26);

	--ld_normalizeBit_uid50_fpMulTest_b_to_roundBitAndNormalizationOp_uid57_fpMulTest_c(DELAY,159)@1
    ld_normalizeBit_uid50_fpMulTest_b_to_roundBitAndNormalizationOp_uid57_fpMulTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => normalizeBit_uid50_fpMulTest_b, xout => ld_normalizeBit_uid50_fpMulTest_b_to_roundBitAndNormalizationOp_uid57_fpMulTest_c_q, clk => clk, aclr => areset );

	--roundBitAndNormalizationOp_uid57_fpMulTest(BITJOIN,56)@2
    roundBitAndNormalizationOp_uid57_fpMulTest_q <= GND_q & ld_normalizeBit_uid50_fpMulTest_b_to_roundBitAndNormalizationOp_uid57_fpMulTest_c_q & cstAllZWF_uid15_fpMulTest_q & VCC_q;

	--biasInc_uid47_fpMulTest(CONSTANT,46)
    biasInc_uid47_fpMulTest_q <= "0001111111";

	--expSum_uid46_fpMulTest(ADD,45)@0
    expSum_uid46_fpMulTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpMulTest_b);
    expSum_uid46_fpMulTest_b <= STD_LOGIC_VECTOR("0" & expY_uid7_fpMulTest_b);
            expSum_uid46_fpMulTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expSum_uid46_fpMulTest_a) + UNSIGNED(expSum_uid46_fpMulTest_b));
    expSum_uid46_fpMulTest_q <= expSum_uid46_fpMulTest_o(8 downto 0);


	--ld_expSum_uid46_fpMulTest_q_to_expSumMBias_uid48_fpMulTest_a(DELAY,150)@0
    ld_expSum_uid46_fpMulTest_q_to_expSumMBias_uid48_fpMulTest_a : dspba_delay
    GENERIC MAP ( width => 9, depth => 1 )
    PORT MAP ( xin => expSum_uid46_fpMulTest_q, xout => ld_expSum_uid46_fpMulTest_q_to_expSumMBias_uid48_fpMulTest_a_q, clk => clk, aclr => areset );

	--expSumMBias_uid48_fpMulTest(SUB,47)@1
    expSumMBias_uid48_fpMulTest_a <= STD_LOGIC_VECTOR('0' & "00" & ld_expSum_uid46_fpMulTest_q_to_expSumMBias_uid48_fpMulTest_a_q);
    expSumMBias_uid48_fpMulTest_b <= STD_LOGIC_VECTOR((11 downto 10 => biasInc_uid47_fpMulTest_q(9)) & biasInc_uid47_fpMulTest_q);
            expSumMBias_uid48_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expSumMBias_uid48_fpMulTest_a) - SIGNED(expSumMBias_uid48_fpMulTest_b));
    expSumMBias_uid48_fpMulTest_q <= expSumMBias_uid48_fpMulTest_o(10 downto 0);


	--fracRPostNormHigh_uid52_fpMulTest(BITSELECT,51)@1
    fracRPostNormHigh_uid52_fpMulTest_in <= R_uid108_prod_uid49_fpMulTest_b(25 downto 0);
    fracRPostNormHigh_uid52_fpMulTest_b <= fracRPostNormHigh_uid52_fpMulTest_in(25 downto 2);

	--fracRPostNormLow_uid53_fpMulTest(BITSELECT,52)@1
    fracRPostNormLow_uid53_fpMulTest_in <= R_uid108_prod_uid49_fpMulTest_b(24 downto 0);
    fracRPostNormLow_uid53_fpMulTest_b <= fracRPostNormLow_uid53_fpMulTest_in(24 downto 1);

	--fracRPostNorm_uid54_fpMulTest(MUX,53)@1
    fracRPostNorm_uid54_fpMulTest_s <= normalizeBit_uid50_fpMulTest_b;
    fracRPostNorm_uid54_fpMulTest: PROCESS (fracRPostNorm_uid54_fpMulTest_s, fracRPostNormLow_uid53_fpMulTest_b, fracRPostNormHigh_uid52_fpMulTest_b)
    BEGIN
            CASE fracRPostNorm_uid54_fpMulTest_s IS
                  WHEN "0" => fracRPostNorm_uid54_fpMulTest_q <= fracRPostNormLow_uid53_fpMulTest_b;
                  WHEN "1" => fracRPostNorm_uid54_fpMulTest_q <= fracRPostNormHigh_uid52_fpMulTest_b;
                  WHEN OTHERS => fracRPostNorm_uid54_fpMulTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracPreRound_uid55_fpMulTest(BITJOIN,54)@1
    expFracPreRound_uid55_fpMulTest_q <= expSumMBias_uid48_fpMulTest_q & fracRPostNorm_uid54_fpMulTest_q;

	--reg_expFracPreRound_uid55_fpMulTest_0_to_expFracRPostRounding_uid58_fpMulTest_0(REG,108)@1
    reg_expFracPreRound_uid55_fpMulTest_0_to_expFracRPostRounding_uid58_fpMulTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracPreRound_uid55_fpMulTest_0_to_expFracRPostRounding_uid58_fpMulTest_0_q <= "00000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            reg_expFracPreRound_uid55_fpMulTest_0_to_expFracRPostRounding_uid58_fpMulTest_0_q <= expFracPreRound_uid55_fpMulTest_q;
        END IF;
    END PROCESS;


	--expFracRPostRounding_uid58_fpMulTest(ADD,57)@2
    expFracRPostRounding_uid58_fpMulTest_a <= STD_LOGIC_VECTOR("0" & reg_expFracPreRound_uid55_fpMulTest_0_to_expFracRPostRounding_uid58_fpMulTest_0_q);
    expFracRPostRounding_uid58_fpMulTest_b <= STD_LOGIC_VECTOR("0000000000" & roundBitAndNormalizationOp_uid57_fpMulTest_q);
            expFracRPostRounding_uid58_fpMulTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expFracRPostRounding_uid58_fpMulTest_a) + UNSIGNED(expFracRPostRounding_uid58_fpMulTest_b));
    expFracRPostRounding_uid58_fpMulTest_q <= expFracRPostRounding_uid58_fpMulTest_o(35 downto 0);


	--expRPreExc_uid60_fpMulTest(BITSELECT,59)@2
    expRPreExc_uid60_fpMulTest_in <= expFracRPostRounding_uid58_fpMulTest_q(33 downto 0);
    expRPreExc_uid60_fpMulTest_b <= expRPreExc_uid60_fpMulTest_in(33 downto 24);

	--expRFinal_uid87_fpMulTest(BITSELECT,86)@2
    expRFinal_uid87_fpMulTest_in <= expRPreExc_uid60_fpMulTest_b(7 downto 0);
    expRFinal_uid87_fpMulTest_b <= expRFinal_uid87_fpMulTest_in(7 downto 0);

	--ld_excRNaN_uid78_fpMulTest_q_to_concExc_uid79_fpMulTest_c(DELAY,205)@0
    ld_excRNaN_uid78_fpMulTest_q_to_concExc_uid79_fpMulTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => excRNaN_uid78_fpMulTest_q, xout => ld_excRNaN_uid78_fpMulTest_q_to_concExc_uid79_fpMulTest_c_q, clk => clk, aclr => areset );

	--expOvf_uid64_fpMulTest(COMPARE,63)@2
    expOvf_uid64_fpMulTest_cin <= GND_q;
    expOvf_uid64_fpMulTest_a <= STD_LOGIC_VECTOR((11 downto 10 => expRPreExc_uid60_fpMulTest_b(9)) & expRPreExc_uid60_fpMulTest_b) & '0';
    expOvf_uid64_fpMulTest_b <= STD_LOGIC_VECTOR('0' & "000" & cstAllOWE_uid14_fpMulTest_q) & expOvf_uid64_fpMulTest_cin(0);
            expOvf_uid64_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid64_fpMulTest_a) - SIGNED(expOvf_uid64_fpMulTest_b));
    expOvf_uid64_fpMulTest_n(0) <= not expOvf_uid64_fpMulTest_o(12);


	--InvExc_N_uid42_fpMulTest(LOGICAL,41)@0
    InvExc_N_uid42_fpMulTest_a <= exc_N_uid41_fpMulTest_q;
    InvExc_N_uid42_fpMulTest_q <= not InvExc_N_uid42_fpMulTest_a;

	--InvExc_I_uid43_fpMulTest(LOGICAL,42)@0
    InvExc_I_uid43_fpMulTest_a <= exc_I_uid39_fpMulTest_q;
    InvExc_I_uid43_fpMulTest_q <= not InvExc_I_uid43_fpMulTest_a;

	--InvExpXIsZero_uid44_fpMulTest(LOGICAL,43)@0
    InvExpXIsZero_uid44_fpMulTest_a <= expXIsZero_uid34_fpMulTest_q;
    InvExpXIsZero_uid44_fpMulTest_q <= not InvExpXIsZero_uid44_fpMulTest_a;

	--exc_R_uid45_fpMulTest(LOGICAL,44)@0
    exc_R_uid45_fpMulTest_a <= InvExpXIsZero_uid44_fpMulTest_q;
    exc_R_uid45_fpMulTest_b <= InvExc_I_uid43_fpMulTest_q;
    exc_R_uid45_fpMulTest_c <= InvExc_N_uid42_fpMulTest_q;
    exc_R_uid45_fpMulTest_q <= exc_R_uid45_fpMulTest_a and exc_R_uid45_fpMulTest_b and exc_R_uid45_fpMulTest_c;

	--ld_exc_R_uid45_fpMulTest_q_to_excZC3_uid68_fpMulTest_b(DELAY,175)@0
    ld_exc_R_uid45_fpMulTest_q_to_excZC3_uid68_fpMulTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => exc_R_uid45_fpMulTest_q, xout => ld_exc_R_uid45_fpMulTest_q_to_excZC3_uid68_fpMulTest_b_q, clk => clk, aclr => areset );

	--InvExc_N_uid26_fpMulTest(LOGICAL,25)@0
    InvExc_N_uid26_fpMulTest_a <= exc_N_uid25_fpMulTest_q;
    InvExc_N_uid26_fpMulTest_q <= not InvExc_N_uid26_fpMulTest_a;

	--InvExc_I_uid27_fpMulTest(LOGICAL,26)@0
    InvExc_I_uid27_fpMulTest_a <= exc_I_uid23_fpMulTest_q;
    InvExc_I_uid27_fpMulTest_q <= not InvExc_I_uid27_fpMulTest_a;

	--InvExpXIsZero_uid28_fpMulTest(LOGICAL,27)@0
    InvExpXIsZero_uid28_fpMulTest_a <= expXIsZero_uid18_fpMulTest_q;
    InvExpXIsZero_uid28_fpMulTest_q <= not InvExpXIsZero_uid28_fpMulTest_a;

	--exc_R_uid29_fpMulTest(LOGICAL,28)@0
    exc_R_uid29_fpMulTest_a <= InvExpXIsZero_uid28_fpMulTest_q;
    exc_R_uid29_fpMulTest_b <= InvExc_I_uid27_fpMulTest_q;
    exc_R_uid29_fpMulTest_c <= InvExc_N_uid26_fpMulTest_q;
    exc_R_uid29_fpMulTest_q <= exc_R_uid29_fpMulTest_a and exc_R_uid29_fpMulTest_b and exc_R_uid29_fpMulTest_c;

	--ld_exc_R_uid29_fpMulTest_q_to_excZC3_uid68_fpMulTest_a(DELAY,174)@0
    ld_exc_R_uid29_fpMulTest_q_to_excZC3_uid68_fpMulTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => exc_R_uid29_fpMulTest_q, xout => ld_exc_R_uid29_fpMulTest_q_to_excZC3_uid68_fpMulTest_a_q, clk => clk, aclr => areset );

	--ExcROvfAndInReg_uid73_fpMulTest(LOGICAL,72)@2
    ExcROvfAndInReg_uid73_fpMulTest_a <= ld_exc_R_uid29_fpMulTest_q_to_excZC3_uid68_fpMulTest_a_q;
    ExcROvfAndInReg_uid73_fpMulTest_b <= ld_exc_R_uid45_fpMulTest_q_to_excZC3_uid68_fpMulTest_b_q;
    ExcROvfAndInReg_uid73_fpMulTest_c <= expOvf_uid64_fpMulTest_n;
    ExcROvfAndInReg_uid73_fpMulTest_q <= ExcROvfAndInReg_uid73_fpMulTest_a and ExcROvfAndInReg_uid73_fpMulTest_b and ExcROvfAndInReg_uid73_fpMulTest_c;

	--excYRAndExcXI_uid72_fpMulTest(LOGICAL,71)@0
    excYRAndExcXI_uid72_fpMulTest_a <= exc_R_uid45_fpMulTest_q;
    excYRAndExcXI_uid72_fpMulTest_b <= exc_I_uid23_fpMulTest_q;
    excYRAndExcXI_uid72_fpMulTest_q <= excYRAndExcXI_uid72_fpMulTest_a and excYRAndExcXI_uid72_fpMulTest_b;

	--ld_excYRAndExcXI_uid72_fpMulTest_q_to_excRInf_uid74_fpMulTest_c(DELAY,192)@0
    ld_excYRAndExcXI_uid72_fpMulTest_q_to_excRInf_uid74_fpMulTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => excYRAndExcXI_uid72_fpMulTest_q, xout => ld_excYRAndExcXI_uid72_fpMulTest_q_to_excRInf_uid74_fpMulTest_c_q, clk => clk, aclr => areset );

	--excXRAndExcYI_uid71_fpMulTest(LOGICAL,70)@0
    excXRAndExcYI_uid71_fpMulTest_a <= exc_R_uid29_fpMulTest_q;
    excXRAndExcYI_uid71_fpMulTest_b <= exc_I_uid39_fpMulTest_q;
    excXRAndExcYI_uid71_fpMulTest_q <= excXRAndExcYI_uid71_fpMulTest_a and excXRAndExcYI_uid71_fpMulTest_b;

	--ld_excXRAndExcYI_uid71_fpMulTest_q_to_excRInf_uid74_fpMulTest_b(DELAY,191)@0
    ld_excXRAndExcYI_uid71_fpMulTest_q_to_excRInf_uid74_fpMulTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => excXRAndExcYI_uid71_fpMulTest_q, xout => ld_excXRAndExcYI_uid71_fpMulTest_q_to_excRInf_uid74_fpMulTest_b_q, clk => clk, aclr => areset );

	--excXIAndExcYI_uid70_fpMulTest(LOGICAL,69)@0
    excXIAndExcYI_uid70_fpMulTest_a <= exc_I_uid23_fpMulTest_q;
    excXIAndExcYI_uid70_fpMulTest_b <= exc_I_uid39_fpMulTest_q;
    excXIAndExcYI_uid70_fpMulTest_q <= excXIAndExcYI_uid70_fpMulTest_a and excXIAndExcYI_uid70_fpMulTest_b;

	--ld_excXIAndExcYI_uid70_fpMulTest_q_to_excRInf_uid74_fpMulTest_a(DELAY,190)@0
    ld_excXIAndExcYI_uid70_fpMulTest_q_to_excRInf_uid74_fpMulTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => excXIAndExcYI_uid70_fpMulTest_q, xout => ld_excXIAndExcYI_uid70_fpMulTest_q_to_excRInf_uid74_fpMulTest_a_q, clk => clk, aclr => areset );

	--excRInf_uid74_fpMulTest(LOGICAL,73)@2
    excRInf_uid74_fpMulTest_a <= ld_excXIAndExcYI_uid70_fpMulTest_q_to_excRInf_uid74_fpMulTest_a_q;
    excRInf_uid74_fpMulTest_b <= ld_excXRAndExcYI_uid71_fpMulTest_q_to_excRInf_uid74_fpMulTest_b_q;
    excRInf_uid74_fpMulTest_c <= ld_excYRAndExcXI_uid72_fpMulTest_q_to_excRInf_uid74_fpMulTest_c_q;
    excRInf_uid74_fpMulTest_d <= ExcROvfAndInReg_uid73_fpMulTest_q;
    excRInf_uid74_fpMulTest_q <= excRInf_uid74_fpMulTest_a or excRInf_uid74_fpMulTest_b or excRInf_uid74_fpMulTest_c or excRInf_uid74_fpMulTest_d;

	--expUdf_uid62_fpMulTest(COMPARE,61)@2
    expUdf_uid62_fpMulTest_cin <= GND_q;
    expUdf_uid62_fpMulTest_a <= STD_LOGIC_VECTOR('0' & "0000000000" & GND_q) & '0';
    expUdf_uid62_fpMulTest_b <= STD_LOGIC_VECTOR((11 downto 10 => expRPreExc_uid60_fpMulTest_b(9)) & expRPreExc_uid60_fpMulTest_b) & expUdf_uid62_fpMulTest_cin(0);
            expUdf_uid62_fpMulTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid62_fpMulTest_a) - SIGNED(expUdf_uid62_fpMulTest_b));
    expUdf_uid62_fpMulTest_n(0) <= not expUdf_uid62_fpMulTest_o(12);


	--excZC3_uid68_fpMulTest(LOGICAL,67)@2
    excZC3_uid68_fpMulTest_a <= ld_exc_R_uid29_fpMulTest_q_to_excZC3_uid68_fpMulTest_a_q;
    excZC3_uid68_fpMulTest_b <= ld_exc_R_uid45_fpMulTest_q_to_excZC3_uid68_fpMulTest_b_q;
    excZC3_uid68_fpMulTest_c <= expUdf_uid62_fpMulTest_n;
    excZC3_uid68_fpMulTest_q <= excZC3_uid68_fpMulTest_a and excZC3_uid68_fpMulTest_b and excZC3_uid68_fpMulTest_c;

	--excYZAndExcXR_uid67_fpMulTest(LOGICAL,66)@0
    excYZAndExcXR_uid67_fpMulTest_a <= expXIsZero_uid34_fpMulTest_q;
    excYZAndExcXR_uid67_fpMulTest_b <= exc_R_uid29_fpMulTest_q;
    excYZAndExcXR_uid67_fpMulTest_q <= excYZAndExcXR_uid67_fpMulTest_a and excYZAndExcXR_uid67_fpMulTest_b;

	--ld_excYZAndExcXR_uid67_fpMulTest_q_to_excRZero_uid69_fpMulTest_c(DELAY,179)@0
    ld_excYZAndExcXR_uid67_fpMulTest_q_to_excRZero_uid69_fpMulTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => excYZAndExcXR_uid67_fpMulTest_q, xout => ld_excYZAndExcXR_uid67_fpMulTest_q_to_excRZero_uid69_fpMulTest_c_q, clk => clk, aclr => areset );

	--excXZAndExcYR_uid66_fpMulTest(LOGICAL,65)@0
    excXZAndExcYR_uid66_fpMulTest_a <= expXIsZero_uid18_fpMulTest_q;
    excXZAndExcYR_uid66_fpMulTest_b <= exc_R_uid45_fpMulTest_q;
    excXZAndExcYR_uid66_fpMulTest_q <= excXZAndExcYR_uid66_fpMulTest_a and excXZAndExcYR_uid66_fpMulTest_b;

	--ld_excXZAndExcYR_uid66_fpMulTest_q_to_excRZero_uid69_fpMulTest_b(DELAY,178)@0
    ld_excXZAndExcYR_uid66_fpMulTest_q_to_excRZero_uid69_fpMulTest_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => excXZAndExcYR_uid66_fpMulTest_q, xout => ld_excXZAndExcYR_uid66_fpMulTest_q_to_excRZero_uid69_fpMulTest_b_q, clk => clk, aclr => areset );

	--excXZAndExcYZ_uid65_fpMulTest(LOGICAL,64)@0
    excXZAndExcYZ_uid65_fpMulTest_a <= expXIsZero_uid18_fpMulTest_q;
    excXZAndExcYZ_uid65_fpMulTest_b <= expXIsZero_uid34_fpMulTest_q;
    excXZAndExcYZ_uid65_fpMulTest_q <= excXZAndExcYZ_uid65_fpMulTest_a and excXZAndExcYZ_uid65_fpMulTest_b;

	--ld_excXZAndExcYZ_uid65_fpMulTest_q_to_excRZero_uid69_fpMulTest_a(DELAY,177)@0
    ld_excXZAndExcYZ_uid65_fpMulTest_q_to_excRZero_uid69_fpMulTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => excXZAndExcYZ_uid65_fpMulTest_q, xout => ld_excXZAndExcYZ_uid65_fpMulTest_q_to_excRZero_uid69_fpMulTest_a_q, clk => clk, aclr => areset );

	--excRZero_uid69_fpMulTest(LOGICAL,68)@2
    excRZero_uid69_fpMulTest_a <= ld_excXZAndExcYZ_uid65_fpMulTest_q_to_excRZero_uid69_fpMulTest_a_q;
    excRZero_uid69_fpMulTest_b <= ld_excXZAndExcYR_uid66_fpMulTest_q_to_excRZero_uid69_fpMulTest_b_q;
    excRZero_uid69_fpMulTest_c <= ld_excYZAndExcXR_uid67_fpMulTest_q_to_excRZero_uid69_fpMulTest_c_q;
    excRZero_uid69_fpMulTest_d <= excZC3_uid68_fpMulTest_q;
    excRZero_uid69_fpMulTest_q <= excRZero_uid69_fpMulTest_a or excRZero_uid69_fpMulTest_b or excRZero_uid69_fpMulTest_c or excRZero_uid69_fpMulTest_d;

	--concExc_uid79_fpMulTest(BITJOIN,78)@2
    concExc_uid79_fpMulTest_q <= ld_excRNaN_uid78_fpMulTest_q_to_concExc_uid79_fpMulTest_c_q & excRInf_uid74_fpMulTest_q & excRZero_uid69_fpMulTest_q;

	--excREnc_uid80_fpMulTest(LOOKUP,79)@2
    excREnc_uid80_fpMulTest: PROCESS (concExc_uid79_fpMulTest_q)
    BEGIN
        -- Begin reserved scope level
            CASE (concExc_uid79_fpMulTest_q) IS
                WHEN "000" =>  excREnc_uid80_fpMulTest_q <= "01";
                WHEN "001" =>  excREnc_uid80_fpMulTest_q <= "00";
                WHEN "010" =>  excREnc_uid80_fpMulTest_q <= "10";
                WHEN "011" =>  excREnc_uid80_fpMulTest_q <= "00";
                WHEN "100" =>  excREnc_uid80_fpMulTest_q <= "11";
                WHEN "101" =>  excREnc_uid80_fpMulTest_q <= "00";
                WHEN "110" =>  excREnc_uid80_fpMulTest_q <= "00";
                WHEN "111" =>  excREnc_uid80_fpMulTest_q <= "00";
                WHEN OTHERS =>
                    excREnc_uid80_fpMulTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid89_fpMulTest(MUX,88)@2
    expRPostExc_uid89_fpMulTest_s <= excREnc_uid80_fpMulTest_q;
    expRPostExc_uid89_fpMulTest: PROCESS (expRPostExc_uid89_fpMulTest_s, expRFinal_uid87_fpMulTest_b)
    BEGIN
            CASE expRPostExc_uid89_fpMulTest_s IS
                  WHEN "00" => expRPostExc_uid89_fpMulTest_q <= cstAllZWE_uid16_fpMulTest_q;
                  WHEN "01" => expRPostExc_uid89_fpMulTest_q <= expRFinal_uid87_fpMulTest_b;
                  WHEN "10" => expRPostExc_uid89_fpMulTest_q <= cstAllOWE_uid14_fpMulTest_q;
                  WHEN "11" => expRPostExc_uid89_fpMulTest_q <= cstAllOWE_uid14_fpMulTest_q;
                  WHEN OTHERS => expRPostExc_uid89_fpMulTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid81_fpMulTest(CONSTANT,80)
    oneFracRPostExc2_uid81_fpMulTest_q <= "00000000000000000000001";

	--fracRPreExc_uid59_fpMulTest(BITSELECT,58)@2
    fracRPreExc_uid59_fpMulTest_in <= expFracRPostRounding_uid58_fpMulTest_q(23 downto 0);
    fracRPreExc_uid59_fpMulTest_b <= fracRPreExc_uid59_fpMulTest_in(23 downto 1);

	--fracRPostExc_uid84_fpMulTest(MUX,83)@2
    fracRPostExc_uid84_fpMulTest_s <= excREnc_uid80_fpMulTest_q;
    fracRPostExc_uid84_fpMulTest: PROCESS (fracRPostExc_uid84_fpMulTest_s, fracRPreExc_uid59_fpMulTest_b)
    BEGIN
            CASE fracRPostExc_uid84_fpMulTest_s IS
                  WHEN "00" => fracRPostExc_uid84_fpMulTest_q <= cstAllZWF_uid15_fpMulTest_q;
                  WHEN "01" => fracRPostExc_uid84_fpMulTest_q <= fracRPreExc_uid59_fpMulTest_b;
                  WHEN "10" => fracRPostExc_uid84_fpMulTest_q <= cstAllZWF_uid15_fpMulTest_q;
                  WHEN "11" => fracRPostExc_uid84_fpMulTest_q <= oneFracRPostExc2_uid81_fpMulTest_q;
                  WHEN OTHERS => fracRPostExc_uid84_fpMulTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid92_fpMulTest(BITJOIN,91)@2
    R_uid92_fpMulTest_q <= ld_signRPostExc_uid91_fpMulTest_q_to_R_uid92_fpMulTest_c_q & expRPostExc_uid89_fpMulTest_q & fracRPostExc_uid84_fpMulTest_q;

	--xOut(PORTOUT,4)@2
    r <= R_uid92_fpMulTest_q;
end normal;
