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

-- VHDL created from FPSqrt
-- VHDL created on Mon Dec 03 14:15:37 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;
USE work.FPSqrt_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/qshell64/p4/ip/aion/src/mip_common/hw_model.cpp:1245
entity FPSqrt is
    port (
        x : in std_logic_vector(31 downto 0);
        r : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        reset_req : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of FPSqrt is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal VCC_q : std_logic_vector (0 downto 0);
    signal clocken : std_logic;
    signal cstAllOWE_uid9_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid10_fpSqrtTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid11_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal sBias_uid25_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal sBiasM1_uid28_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal fracNaN_uid52_fpSqrtTest_q : std_logic_vector (22 downto 0);
    signal rndBit_uid70_sqrtPolynomialEvaluator_q : std_logic_vector (2 downto 0);
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_a : std_logic_vector (12 downto 0);
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_s1 : std_logic_vector (24 downto 0);
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_reset : std_logic;
    signal prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_q : std_logic_vector (23 downto 0);
    signal topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_a : std_logic_vector (16 downto 0);
    signal topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (17 downto 0);
    signal topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_s1 : std_logic_vector (34 downto 0);
    signal topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_reset : std_logic;
    signal topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_q : std_logic_vector (33 downto 0);
    signal sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_a : std_logic_vector (4 downto 0);
    signal sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (7 downto 0);
    signal sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_s1 : std_logic_vector (12 downto 0);
    signal sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_reset : std_logic;
    signal sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_q : std_logic_vector (12 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_iq : std_logic_vector (28 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_ia : std_logic_vector (28 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_ir : std_logic_vector (28 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC0_uid59_sqrtTableGenerator_lutmem_q : std_logic_vector (28 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_iq : std_logic_vector (20 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_ia : std_logic_vector (20 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_ir : std_logic_vector (20 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC1_uid60_sqrtTableGenerator_lutmem_q : std_logic_vector (20 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_reset0 : std_logic;
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_iq : std_logic_vector (11 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_ia : std_logic_vector (11 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_ir : std_logic_vector (11 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_aa : std_logic_vector (7 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_ab : std_logic_vector (7 downto 0);
    signal memoryC2_uid61_sqrtTableGenerator_lutmem_q : std_logic_vector (11 downto 0);
    signal ld_xIn_v_to_xOut_v_q : std_logic_vector (0 downto 0);
    signal ld_xIn_c_to_xOut_c_q : std_logic_vector (7 downto 0);
    signal ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_q : std_logic_vector (22 downto 0);
    signal ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_q : std_logic_vector (1 downto 0);
    signal ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_q : std_logic_vector (7 downto 0);
    signal ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_q : std_logic_vector (0 downto 0);
    signal ld_FracX15dto0_uid37_fpSqrtTest_b_to_topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_a_q : std_logic_vector (15 downto 0);
    signal ld_sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_b_to_sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_b_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_memoryC0_uid59_sqrtTableGenerator_lutmem_a_q : std_logic_vector (7 downto 0);
    signal ld_addrTable_uid36_fpSqrtTest_q_to_memoryC1_uid60_sqrtTableGenerator_lutmem_a_q : std_logic_vector (7 downto 0);
    signal expX_uid6_fpSqrtTest_in : std_logic_vector (30 downto 0);
    signal expX_uid6_fpSqrtTest_b : std_logic_vector (7 downto 0);
    signal fracX_uid7_fpSqrtTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid7_fpSqrtTest_b : std_logic_vector (22 downto 0);
    signal signX_uid8_fpSqrtTest_in : std_logic_vector (31 downto 0);
    signal signX_uid8_fpSqrtTest_b : std_logic_vector (0 downto 0);
    signal expXIsMax_uid15_fpSqrtTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid15_fpSqrtTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid15_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid17_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid13_fpSqrtTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid13_fpSqrtTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid13_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_a : std_logic_vector(8 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_b : std_logic_vector(8 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_o : std_logic_vector (8 downto 0);
    signal expEvenSig_uid26_fpSqrtTest_q : std_logic_vector (8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_a : std_logic_vector(8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_b : std_logic_vector(8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_o : std_logic_vector (8 downto 0);
    signal expOddSig_uid29_fpSqrtTest_q : std_logic_vector (8 downto 0);
    signal cIncludingRoundingBit_uid71_sqrtPolynomialEvaluator_q : std_logic_vector (31 downto 0);
    signal prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_in : std_logic_vector (23 downto 0);
    signal prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_b : std_logic_vector (12 downto 0);
    signal lowRangeA_uid84_pT2_uid69_sqrtPolynomialEvaluator_in : std_logic_vector (2 downto 0);
    signal lowRangeA_uid84_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (2 downto 0);
    signal highABits_uid85_pT2_uid69_sqrtPolynomialEvaluator_in : std_logic_vector (33 downto 0);
    signal highABits_uid85_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (30 downto 0);
    signal sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_a : std_logic_vector(32 downto 0);
    signal sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector(32 downto 0);
    signal sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_o : std_logic_vector (32 downto 0);
    signal sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_q : std_logic_vector (31 downto 0);
    signal FracX15dto0_uid37_fpSqrtTest_in : std_logic_vector (15 downto 0);
    signal FracX15dto0_uid37_fpSqrtTest_b : std_logic_vector (15 downto 0);
    signal expX0_uid31_fpSqrtTest_in : std_logic_vector (0 downto 0);
    signal expX0_uid31_fpSqrtTest_b : std_logic_vector (0 downto 0);
    signal fracXAddr_uid35_fpSqrtTest_in : std_logic_vector (22 downto 0);
    signal fracXAddr_uid35_fpSqrtTest_b : std_logic_vector (6 downto 0);
    signal InvSignX_uid40_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvSignX_uid40_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal negZero_uid56_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal negZero_uid56_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal negZero_uid56_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal exc_I_uid18_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_I_uid18_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_I_uid18_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid19_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid19_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid23_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid23_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expREven_uid27_fpSqrtTest_in : std_logic_vector (8 downto 0);
    signal expREven_uid27_fpSqrtTest_b : std_logic_vector (7 downto 0);
    signal expROdd_uid30_fpSqrtTest_in : std_logic_vector (8 downto 0);
    signal expROdd_uid30_fpSqrtTest_b : std_logic_vector (7 downto 0);
    signal lowRangeB_uid64_sqrtPolynomialEvaluator_in : std_logic_vector (0 downto 0);
    signal lowRangeB_uid64_sqrtPolynomialEvaluator_b : std_logic_vector (0 downto 0);
    signal highBBits_uid65_sqrtPolynomialEvaluator_in : std_logic_vector (12 downto 0);
    signal highBBits_uid65_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal add0_uid84_uid87_pT2_uid69_sqrtPolynomialEvaluator_q : std_logic_vector (34 downto 0);
    signal yT1_uid62_sqrtPolynomialEvaluator_in : std_logic_vector (15 downto 0);
    signal yT1_uid62_sqrtPolynomialEvaluator_b : std_logic_vector (11 downto 0);
    signal sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_in : std_logic_vector (15 downto 0);
    signal sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (7 downto 0);
    signal expOddSelect_uid32_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal expOddSelect_uid32_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal addrTable_uid36_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal inInfAndNotNeg_uid41_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid22_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid22_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal minInf_uid43_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal minInf_uid43_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal minInf_uid43_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid20_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid20_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid20_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal expRMux_uid33_fpSqrtTest_s : std_logic_vector (0 downto 0);
    signal expRMux_uid33_fpSqrtTest_q : std_logic_vector (7 downto 0);
    signal sumAHighB_uid66_sqrtPolynomialEvaluator_a : std_logic_vector(21 downto 0);
    signal sumAHighB_uid66_sqrtPolynomialEvaluator_b : std_logic_vector(21 downto 0);
    signal sumAHighB_uid66_sqrtPolynomialEvaluator_o : std_logic_vector (21 downto 0);
    signal sumAHighB_uid66_sqrtPolynomialEvaluator_q : std_logic_vector (21 downto 0);
    signal R_uid88_pT2_uid69_sqrtPolynomialEvaluator_in : std_logic_vector (33 downto 0);
    signal R_uid88_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (24 downto 0);
    signal InvExc_N_uid21_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid21_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal s1_uid64_uid67_sqrtPolynomialEvaluator_q : std_logic_vector (22 downto 0);
    signal ts2_uid72_sqrtPolynomialEvaluator_a : std_logic_vector(32 downto 0);
    signal ts2_uid72_sqrtPolynomialEvaluator_b : std_logic_vector(32 downto 0);
    signal ts2_uid72_sqrtPolynomialEvaluator_o : std_logic_vector (32 downto 0);
    signal ts2_uid72_sqrtPolynomialEvaluator_q : std_logic_vector (32 downto 0);
    signal exc_R_uid24_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal exc_R_uid24_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal exc_R_uid24_fpSqrtTest_c : std_logic_vector(0 downto 0);
    signal exc_R_uid24_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal yTop9Bits_uid79_pT2_uid69_sqrtPolynomialEvaluator_in : std_logic_vector (22 downto 0);
    signal yTop9Bits_uid79_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (17 downto 0);
    signal sSM0H_uid81_pT2_uid69_sqrtPolynomialEvaluator_in : std_logic_vector (4 downto 0);
    signal sSM0H_uid81_pT2_uid69_sqrtPolynomialEvaluator_b : std_logic_vector (4 downto 0);
    signal s2_uid73_sqrtPolynomialEvaluator_in : std_logic_vector (32 downto 0);
    signal s2_uid73_sqrtPolynomialEvaluator_b : std_logic_vector (31 downto 0);
    signal minReg_uid42_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal minReg_uid42_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal minReg_uid42_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracR_uid39_fpSqrtTest_in : std_logic_vector (28 downto 0);
    signal fracR_uid39_fpSqrtTest_b : std_logic_vector (22 downto 0);
    signal excRNaN_uid44_fpSqrtTest_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid44_fpSqrtTest_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid44_fpSqrtTest_c : std_logic_vector(0 downto 0);
    signal excRNaN_uid44_fpSqrtTest_q : std_logic_vector(0 downto 0);
    signal fracRPostExc_uid55_fpSqrtTest_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid55_fpSqrtTest_q : std_logic_vector (22 downto 0);
    signal join_uid45_fpSqrtTest_q : std_logic_vector (2 downto 0);
    signal RSqrt_uid57_fpSqrtTest_q : std_logic_vector (31 downto 0);
    signal fracSelIn_uid46_fpSqrtTest_q : std_logic_vector (3 downto 0);
    signal fracSel_uid47_fpSqrtTest_q : std_logic_vector(1 downto 0);
    signal expRPostExc_uid51_fpSqrtTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid51_fpSqrtTest_q : std_logic_vector (7 downto 0);
begin


	--GND(CONSTANT,0)

	--VCC(CONSTANT,1)
    VCC_q <= "1";

    --clocken 
    clocken <= not reset_req;

	--xIn(PORTIN,3)@0

	--signX_uid8_fpSqrtTest(BITSELECT,7)@0
    signX_uid8_fpSqrtTest_in <= x;
    signX_uid8_fpSqrtTest_b <= signX_uid8_fpSqrtTest_in(31 downto 31);

	--cstAllZWE_uid11_fpSqrtTest(CONSTANT,10)
    cstAllZWE_uid11_fpSqrtTest_q <= "00000000";

	--expX_uid6_fpSqrtTest(BITSELECT,5)@0
    expX_uid6_fpSqrtTest_in <= x(30 downto 0);
    expX_uid6_fpSqrtTest_b <= expX_uid6_fpSqrtTest_in(30 downto 23);

	--expXIsZero_uid13_fpSqrtTest(LOGICAL,12)@0
    expXIsZero_uid13_fpSqrtTest_a <= expX_uid6_fpSqrtTest_b;
    expXIsZero_uid13_fpSqrtTest_b <= cstAllZWE_uid11_fpSqrtTest_q;
    expXIsZero_uid13_fpSqrtTest_q <= "1" when expXIsZero_uid13_fpSqrtTest_a = expXIsZero_uid13_fpSqrtTest_b else "0";

	--negZero_uid56_fpSqrtTest(LOGICAL,55)@0
    negZero_uid56_fpSqrtTest_a <= expXIsZero_uid13_fpSqrtTest_q;
    negZero_uid56_fpSqrtTest_b <= signX_uid8_fpSqrtTest_b;
    negZero_uid56_fpSqrtTest_q <= negZero_uid56_fpSqrtTest_a and negZero_uid56_fpSqrtTest_b;

	--ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c(DELAY,149)@0
    ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 6 )
    PORT MAP ( xin => negZero_uid56_fpSqrtTest_q, xout => ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_q, clk => clk, aclr => areset );

	--cstAllOWE_uid9_fpSqrtTest(CONSTANT,8)
    cstAllOWE_uid9_fpSqrtTest_q <= "11111111";

	--sBiasM1_uid28_fpSqrtTest(CONSTANT,27)
    sBiasM1_uid28_fpSqrtTest_q <= "01111110";

	--expOddSig_uid29_fpSqrtTest(ADD,28)@0
    expOddSig_uid29_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expOddSig_uid29_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBiasM1_uid28_fpSqrtTest_q);
            expOddSig_uid29_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expOddSig_uid29_fpSqrtTest_a) + UNSIGNED(expOddSig_uid29_fpSqrtTest_b));
    expOddSig_uid29_fpSqrtTest_q <= expOddSig_uid29_fpSqrtTest_o(8 downto 0);


	--expROdd_uid30_fpSqrtTest(BITSELECT,29)@0
    expROdd_uid30_fpSqrtTest_in <= expOddSig_uid29_fpSqrtTest_q;
    expROdd_uid30_fpSqrtTest_b <= expROdd_uid30_fpSqrtTest_in(8 downto 1);

	--sBias_uid25_fpSqrtTest(CONSTANT,24)
    sBias_uid25_fpSqrtTest_q <= "01111111";

	--expEvenSig_uid26_fpSqrtTest(ADD,25)@0
    expEvenSig_uid26_fpSqrtTest_a <= STD_LOGIC_VECTOR("0" & expX_uid6_fpSqrtTest_b);
    expEvenSig_uid26_fpSqrtTest_b <= STD_LOGIC_VECTOR("0" & sBias_uid25_fpSqrtTest_q);
            expEvenSig_uid26_fpSqrtTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expEvenSig_uid26_fpSqrtTest_a) + UNSIGNED(expEvenSig_uid26_fpSqrtTest_b));
    expEvenSig_uid26_fpSqrtTest_q <= expEvenSig_uid26_fpSqrtTest_o(8 downto 0);


	--expREven_uid27_fpSqrtTest(BITSELECT,26)@0
    expREven_uid27_fpSqrtTest_in <= expEvenSig_uid26_fpSqrtTest_q;
    expREven_uid27_fpSqrtTest_b <= expREven_uid27_fpSqrtTest_in(8 downto 1);

	--expX0_uid31_fpSqrtTest(BITSELECT,30)@0
    expX0_uid31_fpSqrtTest_in <= expX_uid6_fpSqrtTest_b(0 downto 0);
    expX0_uid31_fpSqrtTest_b <= expX0_uid31_fpSqrtTest_in(0 downto 0);

	--expOddSelect_uid32_fpSqrtTest(LOGICAL,31)@0
    expOddSelect_uid32_fpSqrtTest_a <= expX0_uid31_fpSqrtTest_b;
    expOddSelect_uid32_fpSqrtTest_q <= not expOddSelect_uid32_fpSqrtTest_a;

	--expRMux_uid33_fpSqrtTest(MUX,32)@0
    expRMux_uid33_fpSqrtTest_s <= expOddSelect_uid32_fpSqrtTest_q;
    expRMux_uid33_fpSqrtTest: PROCESS (expRMux_uid33_fpSqrtTest_s, expREven_uid27_fpSqrtTest_b, expROdd_uid30_fpSqrtTest_b)
    BEGIN
            CASE expRMux_uid33_fpSqrtTest_s IS
                  WHEN "0" => expRMux_uid33_fpSqrtTest_q <= expREven_uid27_fpSqrtTest_b;
                  WHEN "1" => expRMux_uid33_fpSqrtTest_q <= expROdd_uid30_fpSqrtTest_b;
                  WHEN OTHERS => expRMux_uid33_fpSqrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--InvExc_N_uid21_fpSqrtTest(LOGICAL,20)@0
    InvExc_N_uid21_fpSqrtTest_a <= exc_N_uid20_fpSqrtTest_q;
    InvExc_N_uid21_fpSqrtTest_q <= not InvExc_N_uid21_fpSqrtTest_a;

	--cstAllZWF_uid10_fpSqrtTest(CONSTANT,9)
    cstAllZWF_uid10_fpSqrtTest_q <= "00000000000000000000000";

	--fracX_uid7_fpSqrtTest(BITSELECT,6)@0
    fracX_uid7_fpSqrtTest_in <= x(22 downto 0);
    fracX_uid7_fpSqrtTest_b <= fracX_uid7_fpSqrtTest_in(22 downto 0);

	--fracXIsZero_uid17_fpSqrtTest(LOGICAL,16)@0
    fracXIsZero_uid17_fpSqrtTest_a <= fracX_uid7_fpSqrtTest_b;
    fracXIsZero_uid17_fpSqrtTest_b <= cstAllZWF_uid10_fpSqrtTest_q;
    fracXIsZero_uid17_fpSqrtTest_q <= "1" when fracXIsZero_uid17_fpSqrtTest_a = fracXIsZero_uid17_fpSqrtTest_b else "0";

	--expXIsMax_uid15_fpSqrtTest(LOGICAL,14)@0
    expXIsMax_uid15_fpSqrtTest_a <= expX_uid6_fpSqrtTest_b;
    expXIsMax_uid15_fpSqrtTest_b <= cstAllOWE_uid9_fpSqrtTest_q;
    expXIsMax_uid15_fpSqrtTest_q <= "1" when expXIsMax_uid15_fpSqrtTest_a = expXIsMax_uid15_fpSqrtTest_b else "0";

	--exc_I_uid18_fpSqrtTest(LOGICAL,17)@0
    exc_I_uid18_fpSqrtTest_a <= expXIsMax_uid15_fpSqrtTest_q;
    exc_I_uid18_fpSqrtTest_b <= fracXIsZero_uid17_fpSqrtTest_q;
    exc_I_uid18_fpSqrtTest_q <= exc_I_uid18_fpSqrtTest_a and exc_I_uid18_fpSqrtTest_b;

	--InvExc_I_uid22_fpSqrtTest(LOGICAL,21)@0
    InvExc_I_uid22_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    InvExc_I_uid22_fpSqrtTest_q <= not InvExc_I_uid22_fpSqrtTest_a;

	--InvExpXIsZero_uid23_fpSqrtTest(LOGICAL,22)@0
    InvExpXIsZero_uid23_fpSqrtTest_a <= expXIsZero_uid13_fpSqrtTest_q;
    InvExpXIsZero_uid23_fpSqrtTest_q <= not InvExpXIsZero_uid23_fpSqrtTest_a;

	--exc_R_uid24_fpSqrtTest(LOGICAL,23)@0
    exc_R_uid24_fpSqrtTest_a <= InvExpXIsZero_uid23_fpSqrtTest_q;
    exc_R_uid24_fpSqrtTest_b <= InvExc_I_uid22_fpSqrtTest_q;
    exc_R_uid24_fpSqrtTest_c <= InvExc_N_uid21_fpSqrtTest_q;
    exc_R_uid24_fpSqrtTest_q <= exc_R_uid24_fpSqrtTest_a and exc_R_uid24_fpSqrtTest_b and exc_R_uid24_fpSqrtTest_c;

	--minReg_uid42_fpSqrtTest(LOGICAL,41)@0
    minReg_uid42_fpSqrtTest_a <= exc_R_uid24_fpSqrtTest_q;
    minReg_uid42_fpSqrtTest_b <= signX_uid8_fpSqrtTest_b;
    minReg_uid42_fpSqrtTest_q <= minReg_uid42_fpSqrtTest_a and minReg_uid42_fpSqrtTest_b;

	--minInf_uid43_fpSqrtTest(LOGICAL,42)@0
    minInf_uid43_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    minInf_uid43_fpSqrtTest_b <= signX_uid8_fpSqrtTest_b;
    minInf_uid43_fpSqrtTest_q <= minInf_uid43_fpSqrtTest_a and minInf_uid43_fpSqrtTest_b;

	--InvFracXIsZero_uid19_fpSqrtTest(LOGICAL,18)@0
    InvFracXIsZero_uid19_fpSqrtTest_a <= fracXIsZero_uid17_fpSqrtTest_q;
    InvFracXIsZero_uid19_fpSqrtTest_q <= not InvFracXIsZero_uid19_fpSqrtTest_a;

	--exc_N_uid20_fpSqrtTest(LOGICAL,19)@0
    exc_N_uid20_fpSqrtTest_a <= expXIsMax_uid15_fpSqrtTest_q;
    exc_N_uid20_fpSqrtTest_b <= InvFracXIsZero_uid19_fpSqrtTest_q;
    exc_N_uid20_fpSqrtTest_q <= exc_N_uid20_fpSqrtTest_a and exc_N_uid20_fpSqrtTest_b;

	--excRNaN_uid44_fpSqrtTest(LOGICAL,43)@0
    excRNaN_uid44_fpSqrtTest_a <= exc_N_uid20_fpSqrtTest_q;
    excRNaN_uid44_fpSqrtTest_b <= minInf_uid43_fpSqrtTest_q;
    excRNaN_uid44_fpSqrtTest_c <= minReg_uid42_fpSqrtTest_q;
    excRNaN_uid44_fpSqrtTest_q <= excRNaN_uid44_fpSqrtTest_a or excRNaN_uid44_fpSqrtTest_b or excRNaN_uid44_fpSqrtTest_c;

	--InvSignX_uid40_fpSqrtTest(LOGICAL,39)@0
    InvSignX_uid40_fpSqrtTest_a <= signX_uid8_fpSqrtTest_b;
    InvSignX_uid40_fpSqrtTest_q <= not InvSignX_uid40_fpSqrtTest_a;

	--inInfAndNotNeg_uid41_fpSqrtTest(LOGICAL,40)@0
    inInfAndNotNeg_uid41_fpSqrtTest_a <= exc_I_uid18_fpSqrtTest_q;
    inInfAndNotNeg_uid41_fpSqrtTest_b <= InvSignX_uid40_fpSqrtTest_q;
    inInfAndNotNeg_uid41_fpSqrtTest_q <= inInfAndNotNeg_uid41_fpSqrtTest_a and inInfAndNotNeg_uid41_fpSqrtTest_b;

	--join_uid45_fpSqrtTest(BITJOIN,44)@0
    join_uid45_fpSqrtTest_q <= excRNaN_uid44_fpSqrtTest_q & inInfAndNotNeg_uid41_fpSqrtTest_q & expXIsZero_uid13_fpSqrtTest_q;

	--fracSelIn_uid46_fpSqrtTest(BITJOIN,45)@0
    fracSelIn_uid46_fpSqrtTest_q <= signX_uid8_fpSqrtTest_b & join_uid45_fpSqrtTest_q;

	--fracSel_uid47_fpSqrtTest(LOOKUP,46)@0
    fracSel_uid47_fpSqrtTest: PROCESS (fracSelIn_uid46_fpSqrtTest_q)
    BEGIN
        -- Begin reserved scope level
            CASE (fracSelIn_uid46_fpSqrtTest_q) IS
                WHEN "0000" =>  fracSel_uid47_fpSqrtTest_q <= "01";
                WHEN "0001" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "0010" =>  fracSel_uid47_fpSqrtTest_q <= "10";
                WHEN "0011" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "0100" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "0101" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "0110" =>  fracSel_uid47_fpSqrtTest_q <= "10";
                WHEN "0111" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "1000" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1001" =>  fracSel_uid47_fpSqrtTest_q <= "00";
                WHEN "1010" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1011" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1100" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1101" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1110" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN "1111" =>  fracSel_uid47_fpSqrtTest_q <= "11";
                WHEN OTHERS =>
                    fracSel_uid47_fpSqrtTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid51_fpSqrtTest(MUX,50)@0
    expRPostExc_uid51_fpSqrtTest_s <= fracSel_uid47_fpSqrtTest_q;
    expRPostExc_uid51_fpSqrtTest: PROCESS (expRPostExc_uid51_fpSqrtTest_s, expRMux_uid33_fpSqrtTest_q)
    BEGIN
            CASE expRPostExc_uid51_fpSqrtTest_s IS
                  WHEN "00" => expRPostExc_uid51_fpSqrtTest_q <= cstAllZWE_uid11_fpSqrtTest_q;
                  WHEN "01" => expRPostExc_uid51_fpSqrtTest_q <= expRMux_uid33_fpSqrtTest_q;
                  WHEN "10" => expRPostExc_uid51_fpSqrtTest_q <= cstAllOWE_uid9_fpSqrtTest_q;
                  WHEN "11" => expRPostExc_uid51_fpSqrtTest_q <= cstAllOWE_uid9_fpSqrtTest_q;
                  WHEN OTHERS => expRPostExc_uid51_fpSqrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b(DELAY,148)@0
    ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 6 )
    PORT MAP ( xin => expRPostExc_uid51_fpSqrtTest_q, xout => ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_q, clk => clk, aclr => areset );

	--fracNaN_uid52_fpSqrtTest(CONSTANT,51)
    fracNaN_uid52_fpSqrtTest_q <= "00000000000000000000001";

	--ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a(DELAY,123)@0
    ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 2 )
    PORT MAP ( xin => fracX_uid7_fpSqrtTest_b, xout => ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_q, clk => clk, aclr => areset );

	--FracX15dto0_uid37_fpSqrtTest(BITSELECT,36)@2
    FracX15dto0_uid37_fpSqrtTest_in <= ld_fracX_uid7_fpSqrtTest_b_to_FracX15dto0_uid37_fpSqrtTest_a_q(15 downto 0);
    FracX15dto0_uid37_fpSqrtTest_b <= FracX15dto0_uid37_fpSqrtTest_in(15 downto 0);

	--sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator(BITSELECT,81)@2
    sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_in <= FracX15dto0_uid37_fpSqrtTest_b;
    sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_b <= sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_in(15 downto 8);

	--ld_sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_b_to_sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_b(DELAY,170)@2
    ld_sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_b_to_sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_b : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_b, xout => ld_sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_b_to_sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_b_q, clk => clk, aclr => areset );

	--fracXAddr_uid35_fpSqrtTest(BITSELECT,34)@0
    fracXAddr_uid35_fpSqrtTest_in <= fracX_uid7_fpSqrtTest_b;
    fracXAddr_uid35_fpSqrtTest_b <= fracXAddr_uid35_fpSqrtTest_in(22 downto 16);

	--addrTable_uid36_fpSqrtTest(BITJOIN,35)@0
    addrTable_uid36_fpSqrtTest_q <= expOddSelect_uid32_fpSqrtTest_q & fracXAddr_uid35_fpSqrtTest_b;

	--memoryC2_uid61_sqrtTableGenerator_lutmem(DUALMEM,90)@0
    memoryC2_uid61_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC2_uid61_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC2_uid61_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC2_uid61_sqrtTableGenerator_lutmem_ab <= addrTable_uid36_fpSqrtTest_q;
    memoryC2_uid61_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "AUTO",
        operation_mode => "DUAL_PORT",
        width_a => 12,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 12,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("FPSqrt_memoryC2_uid61_sqrtTableGenerator_lutmem.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => ""
    )
    PORT MAP (
        clocken0 => clocken,
        wren_a => '0',
        aclr0 => memoryC2_uid61_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC2_uid61_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC2_uid61_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC2_uid61_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC2_uid61_sqrtTableGenerator_lutmem_ia
    );
        memoryC2_uid61_sqrtTableGenerator_lutmem_q <= memoryC2_uid61_sqrtTableGenerator_lutmem_iq(11 downto 0);

	--yT1_uid62_sqrtPolynomialEvaluator(BITSELECT,61)@2
    yT1_uid62_sqrtPolynomialEvaluator_in <= FracX15dto0_uid37_fpSqrtTest_b;
    yT1_uid62_sqrtPolynomialEvaluator_b <= yT1_uid62_sqrtPolynomialEvaluator_in(15 downto 4);

	--prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator(MULT,74)@2
    prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_a <= '0' & yT1_uid62_sqrtPolynomialEvaluator_b;
    prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_b <= memoryC2_uid61_sqrtTableGenerator_lutmem_q;
    prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_reset <= areset;

    prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 13,
    lpm_widthb => 12,
    lpm_widthp => 25,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_a,
    datab => prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_b,
    clken => VCC_q(0),
    aclr => prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_reset,
    clock => clk,
    result => prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_s1
    );
    prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_q <= prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_s1(23 downto 0);

	--prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator(BITSELECT,75)@4
    prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_in <= prodXY_uid75_pT1_uid63_sqrtPolynomialEvaluator_q;
    prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_b <= prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_in(23 downto 11);

	--highBBits_uid65_sqrtPolynomialEvaluator(BITSELECT,64)@4
    highBBits_uid65_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_b;
    highBBits_uid65_sqrtPolynomialEvaluator_b <= highBBits_uid65_sqrtPolynomialEvaluator_in(12 downto 1);

	--ld_addrTable_uid36_fpSqrtTest_q_to_memoryC1_uid60_sqrtTableGenerator_lutmem_a(DELAY,179)@0
    ld_addrTable_uid36_fpSqrtTest_q_to_memoryC1_uid60_sqrtTableGenerator_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => addrTable_uid36_fpSqrtTest_q, xout => ld_addrTable_uid36_fpSqrtTest_q_to_memoryC1_uid60_sqrtTableGenerator_lutmem_a_q, clk => clk, aclr => areset );

	--memoryC1_uid60_sqrtTableGenerator_lutmem(DUALMEM,89)@2
    memoryC1_uid60_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC1_uid60_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC1_uid60_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC1_uid60_sqrtTableGenerator_lutmem_ab <= ld_addrTable_uid36_fpSqrtTest_q_to_memoryC1_uid60_sqrtTableGenerator_lutmem_a_q;
    memoryC1_uid60_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "AUTO",
        operation_mode => "DUAL_PORT",
        width_a => 21,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 21,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("FPSqrt_memoryC1_uid60_sqrtTableGenerator_lutmem.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => ""
    )
    PORT MAP (
        clocken0 => clocken,
        wren_a => '0',
        aclr0 => memoryC1_uid60_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC1_uid60_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC1_uid60_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC1_uid60_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC1_uid60_sqrtTableGenerator_lutmem_ia
    );
        memoryC1_uid60_sqrtTableGenerator_lutmem_q <= memoryC1_uid60_sqrtTableGenerator_lutmem_iq(20 downto 0);

	--sumAHighB_uid66_sqrtPolynomialEvaluator(ADD,65)@4
    sumAHighB_uid66_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid60_sqrtTableGenerator_lutmem_q(20)) & memoryC1_uid60_sqrtTableGenerator_lutmem_q);
    sumAHighB_uid66_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid65_sqrtPolynomialEvaluator_b(11)) & highBBits_uid65_sqrtPolynomialEvaluator_b);
            sumAHighB_uid66_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumAHighB_uid66_sqrtPolynomialEvaluator_a) + SIGNED(sumAHighB_uid66_sqrtPolynomialEvaluator_b));
    sumAHighB_uid66_sqrtPolynomialEvaluator_q <= sumAHighB_uid66_sqrtPolynomialEvaluator_o(21 downto 0);


	--lowRangeB_uid64_sqrtPolynomialEvaluator(BITSELECT,63)@4
    lowRangeB_uid64_sqrtPolynomialEvaluator_in <= prodXYTruncFR_uid76_pT1_uid63_sqrtPolynomialEvaluator_b(0 downto 0);
    lowRangeB_uid64_sqrtPolynomialEvaluator_b <= lowRangeB_uid64_sqrtPolynomialEvaluator_in(0 downto 0);

	--s1_uid64_uid67_sqrtPolynomialEvaluator(BITJOIN,66)@4
    s1_uid64_uid67_sqrtPolynomialEvaluator_q <= sumAHighB_uid66_sqrtPolynomialEvaluator_q & lowRangeB_uid64_sqrtPolynomialEvaluator_b;

	--sSM0H_uid81_pT2_uid69_sqrtPolynomialEvaluator(BITSELECT,80)@4
    sSM0H_uid81_pT2_uid69_sqrtPolynomialEvaluator_in <= s1_uid64_uid67_sqrtPolynomialEvaluator_q(4 downto 0);
    sSM0H_uid81_pT2_uid69_sqrtPolynomialEvaluator_b <= sSM0H_uid81_pT2_uid69_sqrtPolynomialEvaluator_in(4 downto 0);

	--sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator(MULT,82)@4
    sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_a <= sSM0H_uid81_pT2_uid69_sqrtPolynomialEvaluator_b;
    sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_b <= ld_sSM0W_uid82_pT2_uid69_sqrtPolynomialEvaluator_b_to_sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_b_q;
    sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_reset <= areset;

    sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 5,
    lpm_widthb => 8,
    lpm_widthp => 13,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "UNSIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_a,
    datab => sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_b,
    clken => VCC_q(0),
    aclr => sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_reset,
    clock => clk,
    result => sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_s1
    );
    sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_q <= sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_s1;

	--yTop9Bits_uid79_pT2_uid69_sqrtPolynomialEvaluator(BITSELECT,78)@4
    yTop9Bits_uid79_pT2_uid69_sqrtPolynomialEvaluator_in <= s1_uid64_uid67_sqrtPolynomialEvaluator_q;
    yTop9Bits_uid79_pT2_uid69_sqrtPolynomialEvaluator_b <= yTop9Bits_uid79_pT2_uid69_sqrtPolynomialEvaluator_in(22 downto 5);

	--ld_FracX15dto0_uid37_fpSqrtTest_b_to_topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_a(DELAY,165)@2
    ld_FracX15dto0_uid37_fpSqrtTest_b_to_topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_a : dspba_delay
    GENERIC MAP ( width => 16, depth => 2 )
    PORT MAP ( xin => FracX15dto0_uid37_fpSqrtTest_b, xout => ld_FracX15dto0_uid37_fpSqrtTest_b_to_topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_a_q, clk => clk, aclr => areset );

	--topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator(MULT,79)@4
    topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_a <= '0' & ld_FracX15dto0_uid37_fpSqrtTest_b_to_topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_a_q;
    topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_b <= yTop9Bits_uid79_pT2_uid69_sqrtPolynomialEvaluator_b;
    topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_reset <= areset;

    topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_component : lpm_mult
    GENERIC MAP (
    lpm_widtha => 17,
    lpm_widthb => 18,
    lpm_widthp => 35,
    lpm_widths => 1,
    lpm_type => "LPM_MULT",
    lpm_representation => "SIGNED",
    lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5",
    lpm_pipeline => 2
    )
    PORT MAP (
    dataa => topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_a,
    datab => topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_b,
    clken => VCC_q(0),
    aclr => topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_reset,
    clock => clk,
    result => topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_s1
    );
    topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_q <= topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_s1(33 downto 0);

	--highABits_uid85_pT2_uid69_sqrtPolynomialEvaluator(BITSELECT,84)@6
    highABits_uid85_pT2_uid69_sqrtPolynomialEvaluator_in <= topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_q;
    highABits_uid85_pT2_uid69_sqrtPolynomialEvaluator_b <= highABits_uid85_pT2_uid69_sqrtPolynomialEvaluator_in(33 downto 3);

	--sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator(ADD,85)@6
    sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((32 downto 31 => highABits_uid85_pT2_uid69_sqrtPolynomialEvaluator_b(30)) & highABits_uid85_pT2_uid69_sqrtPolynomialEvaluator_b);
    sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR('0' & "0000000000000000000" & sm0_uid83_pT2_uid69_sqrtPolynomialEvaluator_q);
            sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_a) + SIGNED(sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_b));
    sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_q <= sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_o(31 downto 0);


	--lowRangeA_uid84_pT2_uid69_sqrtPolynomialEvaluator(BITSELECT,83)@6
    lowRangeA_uid84_pT2_uid69_sqrtPolynomialEvaluator_in <= topProd_uid80_pT2_uid69_sqrtPolynomialEvaluator_q(2 downto 0);
    lowRangeA_uid84_pT2_uid69_sqrtPolynomialEvaluator_b <= lowRangeA_uid84_pT2_uid69_sqrtPolynomialEvaluator_in(2 downto 0);

	--add0_uid84_uid87_pT2_uid69_sqrtPolynomialEvaluator(BITJOIN,86)@6
    add0_uid84_uid87_pT2_uid69_sqrtPolynomialEvaluator_q <= sumHighA_B_uid86_pT2_uid69_sqrtPolynomialEvaluator_q & lowRangeA_uid84_pT2_uid69_sqrtPolynomialEvaluator_b;

	--R_uid88_pT2_uid69_sqrtPolynomialEvaluator(BITSELECT,87)@6
    R_uid88_pT2_uid69_sqrtPolynomialEvaluator_in <= add0_uid84_uid87_pT2_uid69_sqrtPolynomialEvaluator_q(33 downto 0);
    R_uid88_pT2_uid69_sqrtPolynomialEvaluator_b <= R_uid88_pT2_uid69_sqrtPolynomialEvaluator_in(33 downto 9);

	--ld_addrTable_uid36_fpSqrtTest_q_to_memoryC0_uid59_sqrtTableGenerator_lutmem_a(DELAY,178)@0
    ld_addrTable_uid36_fpSqrtTest_q_to_memoryC0_uid59_sqrtTableGenerator_lutmem_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 4 )
    PORT MAP ( xin => addrTable_uid36_fpSqrtTest_q, xout => ld_addrTable_uid36_fpSqrtTest_q_to_memoryC0_uid59_sqrtTableGenerator_lutmem_a_q, clk => clk, aclr => areset );

	--memoryC0_uid59_sqrtTableGenerator_lutmem(DUALMEM,88)@4
    memoryC0_uid59_sqrtTableGenerator_lutmem_reset0 <= areset;
    memoryC0_uid59_sqrtTableGenerator_lutmem_ia <= (others => '0');
    memoryC0_uid59_sqrtTableGenerator_lutmem_aa <= (others => '0');
    memoryC0_uid59_sqrtTableGenerator_lutmem_ab <= ld_addrTable_uid36_fpSqrtTest_q_to_memoryC0_uid59_sqrtTableGenerator_lutmem_a_q;
    memoryC0_uid59_sqrtTableGenerator_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "AUTO",
        operation_mode => "DUAL_PORT",
        width_a => 29,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 29,
        widthad_b => 8,
        numwords_b => 256,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "CLEAR0",
        address_reg_b => "CLOCK0",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => safe_path("FPSqrt_memoryC0_uid59_sqrtTableGenerator_lutmem.hex"),
        init_file_layout         => "PORT_B",
        intended_device_family => ""
    )
    PORT MAP (
        clocken0 => clocken,
        wren_a => '0',
        aclr0 => memoryC0_uid59_sqrtTableGenerator_lutmem_reset0,
        clock0 => clk,
        address_b => memoryC0_uid59_sqrtTableGenerator_lutmem_ab,
        -- data_b => (others => '0'),
        q_b => memoryC0_uid59_sqrtTableGenerator_lutmem_iq,
        address_a => memoryC0_uid59_sqrtTableGenerator_lutmem_aa,
        data_a => memoryC0_uid59_sqrtTableGenerator_lutmem_ia
    );
        memoryC0_uid59_sqrtTableGenerator_lutmem_q <= memoryC0_uid59_sqrtTableGenerator_lutmem_iq(28 downto 0);

	--rndBit_uid70_sqrtPolynomialEvaluator(CONSTANT,69)
    rndBit_uid70_sqrtPolynomialEvaluator_q <= "001";

	--cIncludingRoundingBit_uid71_sqrtPolynomialEvaluator(BITJOIN,70)@6
    cIncludingRoundingBit_uid71_sqrtPolynomialEvaluator_q <= memoryC0_uid59_sqrtTableGenerator_lutmem_q & rndBit_uid70_sqrtPolynomialEvaluator_q;

	--ts2_uid72_sqrtPolynomialEvaluator(ADD,71)@6
    ts2_uid72_sqrtPolynomialEvaluator_a <= STD_LOGIC_VECTOR((32 downto 32 => cIncludingRoundingBit_uid71_sqrtPolynomialEvaluator_q(31)) & cIncludingRoundingBit_uid71_sqrtPolynomialEvaluator_q);
    ts2_uid72_sqrtPolynomialEvaluator_b <= STD_LOGIC_VECTOR((32 downto 25 => R_uid88_pT2_uid69_sqrtPolynomialEvaluator_b(24)) & R_uid88_pT2_uid69_sqrtPolynomialEvaluator_b);
            ts2_uid72_sqrtPolynomialEvaluator_o <= STD_LOGIC_VECTOR(SIGNED(ts2_uid72_sqrtPolynomialEvaluator_a) + SIGNED(ts2_uid72_sqrtPolynomialEvaluator_b));
    ts2_uid72_sqrtPolynomialEvaluator_q <= ts2_uid72_sqrtPolynomialEvaluator_o(32 downto 0);


	--s2_uid73_sqrtPolynomialEvaluator(BITSELECT,72)@6
    s2_uid73_sqrtPolynomialEvaluator_in <= ts2_uid72_sqrtPolynomialEvaluator_q;
    s2_uid73_sqrtPolynomialEvaluator_b <= s2_uid73_sqrtPolynomialEvaluator_in(32 downto 1);

	--fracR_uid39_fpSqrtTest(BITSELECT,38)@6
    fracR_uid39_fpSqrtTest_in <= s2_uid73_sqrtPolynomialEvaluator_b(28 downto 0);
    fracR_uid39_fpSqrtTest_b <= fracR_uid39_fpSqrtTest_in(28 downto 6);

	--ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b(DELAY,143)@0
    ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 6 )
    PORT MAP ( xin => fracSel_uid47_fpSqrtTest_q, xout => ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_q, clk => clk, aclr => areset );

	--fracRPostExc_uid55_fpSqrtTest(MUX,54)@6
    fracRPostExc_uid55_fpSqrtTest_s <= ld_fracSel_uid47_fpSqrtTest_q_to_fracRPostExc_uid55_fpSqrtTest_b_q;
    fracRPostExc_uid55_fpSqrtTest: PROCESS (fracRPostExc_uid55_fpSqrtTest_s, fracR_uid39_fpSqrtTest_b)
    BEGIN
            CASE fracRPostExc_uid55_fpSqrtTest_s IS
                  WHEN "00" => fracRPostExc_uid55_fpSqrtTest_q <= cstAllZWF_uid10_fpSqrtTest_q;
                  WHEN "01" => fracRPostExc_uid55_fpSqrtTest_q <= fracR_uid39_fpSqrtTest_b;
                  WHEN "10" => fracRPostExc_uid55_fpSqrtTest_q <= cstAllZWF_uid10_fpSqrtTest_q;
                  WHEN "11" => fracRPostExc_uid55_fpSqrtTest_q <= fracNaN_uid52_fpSqrtTest_q;
                  WHEN OTHERS => fracRPostExc_uid55_fpSqrtTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--RSqrt_uid57_fpSqrtTest(BITJOIN,56)@6
    RSqrt_uid57_fpSqrtTest_q <= ld_negZero_uid56_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_c_q & ld_expRPostExc_uid51_fpSqrtTest_q_to_RSqrt_uid57_fpSqrtTest_b_q & fracRPostExc_uid55_fpSqrtTest_q;

	--xOut(PORTOUT,4)@6
    r <= RSqrt_uid57_fpSqrtTest_q;
end normal;
