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

-- VHDL created from FPAddSub
-- VHDL created on Thu Dec 06 10:21:36 2012


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
entity FPAddSub is
    port (
        x : in std_logic_vector(31 downto 0);
        y : in std_logic_vector(31 downto 0);
        opSel : in std_logic_vector(0 downto 0);
        r : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of FPAddSub is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid20_fpAddSubTest_ieeeAdd_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid21_fpAddSubTest_ieeeAdd_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid22_fpAddSubTest_ieeeAdd_q : std_logic_vector (7 downto 0);
    signal oWE_uid67_fpAddSubTest_ieeeAdd_q : std_logic_vector (8 downto 0);
    signal oFracBREX_uid72_fpAddSubTest_ieeeAdd_a : std_logic_vector(26 downto 0);
    signal oFracBREX_uid72_fpAddSubTest_ieeeAdd_b : std_logic_vector(26 downto 0);
    signal oFracBREX_uid72_fpAddSubTest_ieeeAdd_q : std_logic_vector(26 downto 0);
    signal cAmA_uid86_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal cWFP1_uid88_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal shiftOutConst_uid90_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal countValue_farPath11_uid102_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal countValue_farPath01_uid104_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal countValue_farPath00_uid105_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal wEP2AllOwE_uid112_fpAddSubTest_ieeeAdd_q : std_logic_vector (9 downto 0);
    signal rOvf_uid114_fpAddSubTest_ieeeAdd_a : std_logic_vector(9 downto 0);
    signal rOvf_uid114_fpAddSubTest_ieeeAdd_b : std_logic_vector(9 downto 0);
    signal rOvf_uid114_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal oneFracRPostExc2_uid140_fpAddSubTest_ieeeAdd_q : std_logic_vector (22 downto 0);
    signal zs_uid150_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (15 downto 0);
    signal mO_uid153_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal zs_uid164_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (3 downto 0);
    signal zs_uid170_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (1 downto 0);
    signal leftShiftStage0Idx3Pad12_uid188_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (11 downto 0);
    signal leftShiftStage0Idx5Pad20_uid194_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (19 downto 0);
    signal leftShiftStage0Idx6Pad24_uid197_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (23 downto 0);
    signal leftShiftStage0Idx7_uid200_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal leftShiftStage1Idx3Pad3_uid209_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (2 downto 0);
    signal rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_s : std_logic_vector (1 downto 0);
    signal rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal reg_oFracAE_uid70_fpAddSubTest_ieeeAdd_0_to_fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_0_q : std_logic_vector (26 downto 0);
    signal reg_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_0_to_vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_1_q : std_logic_vector (7 downto 0);
    signal reg_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_0_to_excRZero_uid120_fpAddSubTest_ieeeAdd_0_q : std_logic_vector (4 downto 0);
    signal reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1_q : std_logic_vector (0 downto 0);
    signal ld_xIn_v_to_xOut_v_q : std_logic_vector (0 downto 0);
    signal ld_xIn_c_to_xOut_c_q : std_logic_vector (7 downto 0);
    signal ld_frac_uid27_fpAddSubTest_ieeeAdd_b_to_oFracA_uid63_fpAddSubTest_ieeeAdd_a_q : std_logic_vector (22 downto 0);
    signal ld_closePathA_uid68_fpAddSubTest_ieeeAdd_n_to_closePath_uid69_fpAddSubTest_ieeeAdd_a_q : std_logic_vector (0 downto 0);
    signal ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_closePath_uid69_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (0 downto 0);
    signal ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (0 downto 0);
    signal ld_expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_b_to_oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (0 downto 0);
    signal ld_exp_uid23_fpAddSubTest_ieeeAdd_b_to_expInc_uid109_fpAddSubTest_ieeeAdd_a_q : std_logic_vector (7 downto 0);
    signal ld_expXIsZero_uid24_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_a_q : std_logic_vector (0 downto 0);
    signal ld_expXIsZero_uid40_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (0 downto 0);
    signal ld_regInputs_uid118_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_c_q : std_logic_vector (0 downto 0);
    signal ld_reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1_q_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_a_q : std_logic_vector (0 downto 0);
    signal ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid29_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (0 downto 0);
    signal ld_exc_I_uid45_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid31_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_d_q : std_logic_vector (0 downto 0);
    signal ld_exc_N_uid47_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_e_q : std_logic_vector (0 downto 0);
    signal ld_excRNaN_uid126_fpAddSubTest_ieeeAdd_q_to_concExc_uid127_fpAddSubTest_ieeeAdd_c_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid35_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_a_q : std_logic_vector (0 downto 0);
    signal ld_exc_R_uid51_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (0 downto 0);
    signal ld_sigA_uid56_fpAddSubTest_ieeeAdd_b_to_signRReg_uid130_fpAddSubTest_ieeeAdd_c_q : std_logic_vector (0 downto 0);
    signal ld_signRInf_uid133_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_a_q : std_logic_vector (0 downto 0);
    signal ld_signRZero_uid136_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (0 downto 0);
    signal ld_InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_q_to_signRPostExc_uid139_fpAddSubTest_ieeeAdd_a_q : std_logic_vector (0 downto 0);
    signal ld_fracRPreExc_uid116_fpAddSubTest_ieeeAdd_b_to_fracRPostExc_uid143_fpAddSubTest_ieeeAdd_d_q : std_logic_vector (22 downto 0);
    signal ld_expRPreExc_uid117_fpAddSubTest_ieeeAdd_b_to_expRPostExc_uid147_fpAddSubTest_ieeeAdd_d_q : std_logic_vector (7 downto 0);
    signal ld_signRPostExc_uid139_fpAddSubTest_ieeeAdd_q_to_R_uid148_fpAddSubTest_ieeeAdd_c_q : std_logic_vector (0 downto 0);
    signal ld_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_c_q : std_logic_vector (7 downto 0);
    signal ld_vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_d_q : std_logic_vector (7 downto 0);
    signal ld_vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q_to_r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_e_q : std_logic_vector (0 downto 0);
    signal ld_X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (22 downto 0);
    signal ld_X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (18 downto 0);
    signal ld_X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (14 downto 0);
    signal ld_vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (10 downto 0);
    signal ld_X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (6 downto 0);
    signal ld_X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (2 downto 0);
    signal ld_fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_c_q : std_logic_vector (26 downto 0);
    signal ld_rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (2 downto 0);
    signal ld_rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_q : std_logic_vector (1 downto 0);
    signal closePath_uid69_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal closePath_uid69_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal closePath_uid69_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_a : std_logic_vector(28 downto 0);
    signal oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_b : std_logic_vector(28 downto 0);
    signal oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_o : std_logic_vector (28 downto 0);
    signal oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_q : std_logic_vector (27 downto 0);
    signal fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_a : std_logic_vector(27 downto 0);
    signal fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_b : std_logic_vector(27 downto 0);
    signal fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_o : std_logic_vector (27 downto 0);
    signal fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_q : std_logic_vector (27 downto 0);
    signal expInc_uid109_fpAddSubTest_ieeeAdd_a : std_logic_vector(8 downto 0);
    signal expInc_uid109_fpAddSubTest_ieeeAdd_b : std_logic_vector(8 downto 0);
    signal expInc_uid109_fpAddSubTest_ieeeAdd_o : std_logic_vector (8 downto 0);
    signal expInc_uid109_fpAddSubTest_ieeeAdd_q : std_logic_vector (8 downto 0);
    signal excRZero_uid120_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal rInfOvf_uid121_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal rInfOvf_uid121_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal rInfOvf_uid121_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a : std_logic_vector(7 downto 0);
    signal vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector(7 downto 0);
    signal vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (7 downto 0);
    signal oFracA_uid63_fpAddSubTest_ieeeAdd_q : std_logic_vector (23 downto 0);
    signal expFracX_uid15_fpAddSubTest_ieeeAdd_in : std_logic_vector (30 downto 0);
    signal expFracX_uid15_fpAddSubTest_ieeeAdd_b : std_logic_vector (30 downto 0);
    signal signB_uid6_fpAddSubTest_in : std_logic_vector (31 downto 0);
    signal signB_uid6_fpAddSubTest_b : std_logic_vector (0 downto 0);
    signal restB_uid7_fpAddSubTest_in : std_logic_vector (30 downto 0);
    signal restB_uid7_fpAddSubTest_b : std_logic_vector (30 downto 0);
    signal leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal excRInfVInC_uid122_fpAddSubTest_ieeeAdd_q : std_logic_vector (5 downto 0);
    signal oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b : std_logic_vector (26 downto 0);
    signal oFracBREXC2_uid76_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal oFracBREXC2_uid76_fpAddSubTest_ieeeAdd_b : std_logic_vector (25 downto 0);
    signal oFracBREXC2Sig_uid77_fpAddSubTest_ieeeAdd_in : std_logic_vector (27 downto 0);
    signal oFracBREXC2Sig_uid77_fpAddSubTest_ieeeAdd_b : std_logic_vector (0 downto 0);
    signal fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd_b : std_logic_vector (26 downto 0);
    signal rVStage_uid165_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in : std_logic_vector (7 downto 0);
    signal rVStage_uid165_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector (3 downto 0);
    signal vStage_uid167_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in : std_logic_vector (3 downto 0);
    signal vStage_uid167_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector (3 downto 0);
    signal oFracAE_uid70_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal InvSignB_uid8_fpAddSubTest_a : std_logic_vector(0 downto 0);
    signal InvSignB_uid8_fpAddSubTest_q : std_logic_vector(0 downto 0);
    signal muxSignB_uid9_fpAddSubTest_s : std_logic_vector (0 downto 0);
    signal muxSignB_uid9_fpAddSubTest_q : std_logic_vector (0 downto 0);
    signal bOperand_uid10_fpAddSubTest_q : std_logic_vector (31 downto 0);
    signal excRInf_uid123_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (0 downto 0);
    signal X26dto4_uid218_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal X26dto4_uid218_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (22 downto 0);
    signal X26dto8_uid222_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal X26dto8_uid222_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (18 downto 0);
    signal X26dto12_uid226_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal X26dto12_uid226_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (14 downto 0);
    signal X26dto16_uid230_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal X26dto16_uid230_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (10 downto 0);
    signal X26dto20_uid234_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal X26dto20_uid234_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (6 downto 0);
    signal X26dto24_uid238_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal X26dto24_uid238_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (2 downto 0);
    signal secondOp_uid78_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal normBits_farPath_uid96_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal normBits_farPath_uid96_fpAddSubTest_ieeeAdd_b : std_logic_vector (1 downto 0);
    signal fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd_in : std_logic_vector (25 downto 0);
    signal fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd_b : std_logic_vector (23 downto 0);
    signal fracPostNorm_farPath01_uid99_fpAddSubTest_ieeeAdd_in : std_logic_vector (24 downto 0);
    signal fracPostNorm_farPath01_uid99_fpAddSubTest_ieeeAdd_b : std_logic_vector (23 downto 0);
    signal fracPostNorm_farPath00_uid100_fpAddSubTest_ieeeAdd_in : std_logic_vector (23 downto 0);
    signal fracPostNorm_farPath00_uid100_fpAddSubTest_ieeeAdd_b : std_logic_vector (23 downto 0);
    signal vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a : std_logic_vector(3 downto 0);
    signal vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector(3 downto 0);
    signal vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (3 downto 0);
    signal expFracY_uid16_fpAddSubTest_ieeeAdd_in : std_logic_vector (30 downto 0);
    signal expFracY_uid16_fpAddSubTest_ieeeAdd_b : std_logic_vector (30 downto 0);
    signal concExc_uid127_fpAddSubTest_ieeeAdd_q : std_logic_vector (2 downto 0);
    signal rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(3 downto 0);
    signal rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(3 downto 0);
    signal rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(3 downto 0);
    signal rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(7 downto 0);
    signal rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(7 downto 0);
    signal rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(7 downto 0);
    signal rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(11 downto 0);
    signal rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(11 downto 0);
    signal rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(11 downto 0);
    signal rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(15 downto 0);
    signal rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(19 downto 0);
    signal rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(19 downto 0);
    signal rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(19 downto 0);
    signal rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(23 downto 0);
    signal rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(23 downto 0);
    signal rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(23 downto 0);
    signal rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(26 downto 0);
    signal rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(26 downto 0);
    signal rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(26 downto 0);
    signal rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(1 downto 0);
    signal rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(1 downto 0);
    signal rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(1 downto 0);
    signal rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a : std_logic_vector(2 downto 0);
    signal rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector(2 downto 0);
    signal rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector(2 downto 0);
    signal rightShiftStage0Idx1_uid219_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal rightShiftStage0Idx2_uid223_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal rightShiftStage0Idx3_uid227_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal rightShiftStage0Idx4_uid231_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal rightShiftStage0Idx5_uid235_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal rightShiftStage0Idx6_uid239_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_s : std_logic_vector (1 downto 0);
    signal fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_q : std_logic_vector (23 downto 0);
    signal countValue_farPath_uid106_fpAddSubTest_ieeeAdd_s : std_logic_vector (1 downto 0);
    signal countValue_farPath_uid106_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal rVStage_uid171_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in : std_logic_vector (3 downto 0);
    signal rVStage_uid171_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector (1 downto 0);
    signal vStage_uid173_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in : std_logic_vector (1 downto 0);
    signal vStage_uid173_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector (1 downto 0);
    signal xGTEy_uid17_fpAddSubTest_ieeeAdd_a : std_logic_vector(33 downto 0);
    signal xGTEy_uid17_fpAddSubTest_ieeeAdd_b : std_logic_vector(33 downto 0);
    signal xGTEy_uid17_fpAddSubTest_ieeeAdd_o : std_logic_vector (33 downto 0);
    signal xGTEy_uid17_fpAddSubTest_ieeeAdd_cin : std_logic_vector (0 downto 0);
    signal xGTEy_uid17_fpAddSubTest_ieeeAdd_n : std_logic_vector (0 downto 0);
    signal excREnc_uid128_fpAddSubTest_ieeeAdd_q : std_logic_vector(1 downto 0);
    signal rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_s : std_logic_vector (2 downto 0);
    signal rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_a : std_logic_vector(27 downto 0);
    signal fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_b : std_logic_vector(27 downto 0);
    signal fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_o : std_logic_vector (27 downto 0);
    signal fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_q : std_logic_vector (27 downto 0);
    signal vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a : std_logic_vector(1 downto 0);
    signal vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector(1 downto 0);
    signal vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (1 downto 0);
    signal a_uid18_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal a_uid18_fpAddSubTest_ieeeAdd_q : std_logic_vector (31 downto 0);
    signal b_uid19_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal b_uid19_fpAddSubTest_ieeeAdd_q : std_logic_vector (31 downto 0);
    signal fracRPostExc_uid143_fpAddSubTest_ieeeAdd_s : std_logic_vector (1 downto 0);
    signal fracRPostExc_uid143_fpAddSubTest_ieeeAdd_q : std_logic_vector (22 downto 0);
    signal expRPostExc_uid147_fpAddSubTest_ieeeAdd_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid147_fpAddSubTest_ieeeAdd_q : std_logic_vector (7 downto 0);
    signal RightShiftStage026dto1_uid246_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal RightShiftStage026dto1_uid246_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (25 downto 0);
    signal RightShiftStage026dto2_uid250_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal RightShiftStage026dto2_uid250_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (24 downto 0);
    signal RightShiftStage026dto3_uid254_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal RightShiftStage026dto3_uid254_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (23 downto 0);
    signal fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b : std_logic_vector (26 downto 0);
    signal rVStage_uid177_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in : std_logic_vector (1 downto 0);
    signal rVStage_uid177_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector (0 downto 0);
    signal exp_uid23_fpAddSubTest_ieeeAdd_in : std_logic_vector (30 downto 0);
    signal exp_uid23_fpAddSubTest_ieeeAdd_b : std_logic_vector (7 downto 0);
    signal frac_uid27_fpAddSubTest_ieeeAdd_in : std_logic_vector (22 downto 0);
    signal frac_uid27_fpAddSubTest_ieeeAdd_b : std_logic_vector (22 downto 0);
    signal sigA_uid56_fpAddSubTest_ieeeAdd_in : std_logic_vector (31 downto 0);
    signal sigA_uid56_fpAddSubTest_ieeeAdd_b : std_logic_vector (0 downto 0);
    signal exp_uid39_fpAddSubTest_ieeeAdd_in : std_logic_vector (30 downto 0);
    signal exp_uid39_fpAddSubTest_ieeeAdd_b : std_logic_vector (7 downto 0);
    signal frac_uid43_fpAddSubTest_ieeeAdd_in : std_logic_vector (22 downto 0);
    signal frac_uid43_fpAddSubTest_ieeeAdd_b : std_logic_vector (22 downto 0);
    signal sigB_uid57_fpAddSubTest_ieeeAdd_in : std_logic_vector (31 downto 0);
    signal sigB_uid57_fpAddSubTest_ieeeAdd_b : std_logic_vector (0 downto 0);
    signal R_uid148_fpAddSubTest_ieeeAdd_q : std_logic_vector (31 downto 0);
    signal rightShiftStage1Idx1_uid247_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal rightShiftStage1Idx2_uid251_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal rightShiftStage1Idx3_uid255_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal rVStage_uid151_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in : std_logic_vector (26 downto 0);
    signal rVStage_uid151_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector (15 downto 0);
    signal vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in : std_logic_vector (10 downto 0);
    signal vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector (10 downto 0);
    signal X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (22 downto 0);
    signal X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (22 downto 0);
    signal X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (18 downto 0);
    signal X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (18 downto 0);
    signal X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (14 downto 0);
    signal X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (14 downto 0);
    signal X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (6 downto 0);
    signal X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (6 downto 0);
    signal X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (2 downto 0);
    signal X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (2 downto 0);
    signal vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid24_fpAddSubTest_ieeeAdd_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid24_fpAddSubTest_ieeeAdd_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid24_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid26_fpAddSubTest_ieeeAdd_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid26_fpAddSubTest_ieeeAdd_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid26_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal expAmExpB_uid66_fpAddSubTest_ieeeAdd_a : std_logic_vector(8 downto 0);
    signal expAmExpB_uid66_fpAddSubTest_ieeeAdd_b : std_logic_vector(8 downto 0);
    signal expAmExpB_uid66_fpAddSubTest_ieeeAdd_o : std_logic_vector (8 downto 0);
    signal expAmExpB_uid66_fpAddSubTest_ieeeAdd_q : std_logic_vector (8 downto 0);
    signal fracXIsZero_uid28_fpAddSubTest_ieeeAdd_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid28_fpAddSubTest_ieeeAdd_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid28_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal effSub_uid58_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal effSub_uid58_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal effSub_uid58_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid40_fpAddSubTest_ieeeAdd_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid40_fpAddSubTest_ieeeAdd_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid40_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid42_fpAddSubTest_ieeeAdd_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid42_fpAddSubTest_ieeeAdd_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid42_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid44_fpAddSubTest_ieeeAdd_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid44_fpAddSubTest_ieeeAdd_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid44_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal fracBz_uid62_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal fracBz_uid62_fpAddSubTest_ieeeAdd_q : std_logic_vector (22 downto 0);
    signal excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_c : std_logic_vector(0 downto 0);
    signal excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_d : std_logic_vector(0 downto 0);
    signal excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a : std_logic_vector(15 downto 0);
    signal vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector(15 downto 0);
    signal vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal cStage_uid155_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (15 downto 0);
    signal r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal InvExpXIsZero_uid34_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid34_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal exc_I_uid29_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal exc_I_uid29_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal exc_I_uid29_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal closePathA_uid68_fpAddSubTest_ieeeAdd_a : std_logic_vector(11 downto 0);
    signal closePathA_uid68_fpAddSubTest_ieeeAdd_b : std_logic_vector(11 downto 0);
    signal closePathA_uid68_fpAddSubTest_ieeeAdd_o : std_logic_vector (11 downto 0);
    signal closePathA_uid68_fpAddSubTest_ieeeAdd_cin : std_logic_vector (0 downto 0);
    signal closePathA_uid68_fpAddSubTest_ieeeAdd_n : std_logic_vector (0 downto 0);
    signal expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_in : std_logic_vector (0 downto 0);
    signal expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_b : std_logic_vector (0 downto 0);
    signal shiftedOut_uid89_fpAddSubTest_ieeeAdd_a : std_logic_vector(11 downto 0);
    signal shiftedOut_uid89_fpAddSubTest_ieeeAdd_b : std_logic_vector(11 downto 0);
    signal shiftedOut_uid89_fpAddSubTest_ieeeAdd_o : std_logic_vector (11 downto 0);
    signal shiftedOut_uid89_fpAddSubTest_ieeeAdd_cin : std_logic_vector (0 downto 0);
    signal shiftedOut_uid89_fpAddSubTest_ieeeAdd_c : std_logic_vector (0 downto 0);
    signal ExpAmExpB4dto0_uid91_fpAddSubTest_ieeeAdd_in : std_logic_vector (4 downto 0);
    signal ExpAmExpB4dto0_uid91_fpAddSubTest_ieeeAdd_b : std_logic_vector (4 downto 0);
    signal InvFracXIsZero_uid30_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid30_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid50_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvExpXIsZero_uid50_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal exc_I_uid45_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal exc_I_uid45_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal exc_I_uid45_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid46_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid46_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal oFracB_uid65_fpAddSubTest_ieeeAdd_q : std_logic_vector (23 downto 0);
    signal vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q : std_logic_vector (15 downto 0);
    signal aMinusA_uid87_fpAddSubTest_ieeeAdd_a : std_logic_vector(4 downto 0);
    signal aMinusA_uid87_fpAddSubTest_ieeeAdd_b : std_logic_vector(4 downto 0);
    signal aMinusA_uid87_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal countValue_uid107_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal countValue_uid107_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto2_uid201_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (4 downto 0);
    signal leftShiftStageSel4Dto2_uid201_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (2 downto 0);
    signal leftShiftStageSel1Dto0_uid212_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (1 downto 0);
    signal leftShiftStageSel1Dto0_uid212_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (1 downto 0);
    signal InvExc_I_uid33_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid33_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal excAIBISub_uid125_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal excAIBISub_uid125_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal excAIBISub_uid125_fpAddSubTest_ieeeAdd_c : std_logic_vector(0 downto 0);
    signal excAIBISub_uid125_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal sigAAInf_uid132_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal sigAAInf_uid132_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal sigAAInf_uid132_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
    signal exc_N_uid31_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal exc_N_uid31_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal exc_N_uid31_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal InvExc_I_uid49_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvExc_I_uid49_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal sigBBInf_uid131_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal sigBBInf_uid131_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal sigBBInf_uid131_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal exc_N_uid47_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal exc_N_uid47_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal exc_N_uid47_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal oFracBR_uid71_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in : std_logic_vector (15 downto 0);
    signal rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector (7 downto 0);
    signal vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in : std_logic_vector (7 downto 0);
    signal vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b : std_logic_vector (7 downto 0);
    signal InvAMinusA_uid129_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvAMinusA_uid129_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal expPostNorm_uid110_fpAddSubTest_ieeeAdd_a : std_logic_vector(9 downto 0);
    signal expPostNorm_uid110_fpAddSubTest_ieeeAdd_b : std_logic_vector(9 downto 0);
    signal expPostNorm_uid110_fpAddSubTest_ieeeAdd_o : std_logic_vector (9 downto 0);
    signal expPostNorm_uid110_fpAddSubTest_ieeeAdd_q : std_logic_vector (9 downto 0);
    signal leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_s : std_logic_vector (2 downto 0);
    signal leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal signRInf_uid133_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal signRInf_uid133_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal signRInf_uid133_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (4 downto 0);
    signal rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (2 downto 0);
    signal rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in : std_logic_vector (1 downto 0);
    signal rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : std_logic_vector (1 downto 0);
    signal InvExc_N_uid32_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid32_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal excRNaN2_uid124_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal excRNaN2_uid124_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal excRNaN2_uid124_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid48_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid48_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal signRReg_uid130_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal signRReg_uid130_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal signRReg_uid130_fpAddSubTest_ieeeAdd_c : std_logic_vector(0 downto 0);
    signal signRReg_uid130_fpAddSubTest_ieeeAdd_d : std_logic_vector(0 downto 0);
    signal signRReg_uid130_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal LeftShiftStage025dto0_uid204_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (25 downto 0);
    signal LeftShiftStage025dto0_uid204_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (25 downto 0);
    signal LeftShiftStage024dto0_uid207_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (24 downto 0);
    signal LeftShiftStage024dto0_uid207_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (24 downto 0);
    signal LeftShiftStage023dto0_uid210_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in : std_logic_vector (23 downto 0);
    signal LeftShiftStage023dto0_uid210_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : std_logic_vector (23 downto 0);
    signal exc_R_uid35_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal exc_R_uid35_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal exc_R_uid35_fpAddSubTest_ieeeAdd_c : std_logic_vector(0 downto 0);
    signal exc_R_uid35_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal excRNaN_uid126_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal excRNaN_uid126_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal excRNaN_uid126_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal exc_R_uid51_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal exc_R_uid51_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal exc_R_uid51_fpAddSubTest_ieeeAdd_c : std_logic_vector(0 downto 0);
    signal exc_R_uid51_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_c : std_logic_vector(0 downto 0);
    signal signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1Idx1_uid205_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal leftShiftStage1Idx2_uid208_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal leftShiftStage1Idx3_uid211_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal regInputs_uid118_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal regInputs_uid118_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal regInputs_uid118_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal excBZARSigA_uid135_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal excBZARSigA_uid135_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal excBZARSigA_uid135_fpAddSubTest_ieeeAdd_c : std_logic_vector(0 downto 0);
    signal excBZARSigA_uid135_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal signRPostExc_uid139_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal signRPostExc_uid139_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal signRPostExc_uid139_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_s : std_logic_vector (1 downto 0);
    signal leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q : std_logic_vector (26 downto 0);
    signal signRZero_uid136_fpAddSubTest_ieeeAdd_a : std_logic_vector(0 downto 0);
    signal signRZero_uid136_fpAddSubTest_ieeeAdd_b : std_logic_vector(0 downto 0);
    signal signRZero_uid136_fpAddSubTest_ieeeAdd_q : std_logic_vector(0 downto 0);
    signal fracPostNorm_closePath_uid85_fpAddSubTest_ieeeAdd_in : std_logic_vector (25 downto 0);
    signal fracPostNorm_closePath_uid85_fpAddSubTest_ieeeAdd_b : std_logic_vector (23 downto 0);
    signal fracPostNorm_uid108_fpAddSubTest_ieeeAdd_s : std_logic_vector (0 downto 0);
    signal fracPostNorm_uid108_fpAddSubTest_ieeeAdd_q : std_logic_vector (23 downto 0);
    signal expFracR_uid111_fpAddSubTest_ieeeAdd_q : std_logic_vector (33 downto 0);
    signal rndExp_uid113_fpAddSubTest_ieeeAdd_in : std_logic_vector (33 downto 0);
    signal rndExp_uid113_fpAddSubTest_ieeeAdd_b : std_logic_vector (9 downto 0);
    signal rUdf_uid115_fpAddSubTest_ieeeAdd_in : std_logic_vector (33 downto 0);
    signal rUdf_uid115_fpAddSubTest_ieeeAdd_b : std_logic_vector (0 downto 0);
    signal fracRPreExc_uid116_fpAddSubTest_ieeeAdd_in : std_logic_vector (23 downto 0);
    signal fracRPreExc_uid116_fpAddSubTest_ieeeAdd_b : std_logic_vector (22 downto 0);
    signal expRPreExc_uid117_fpAddSubTest_ieeeAdd_in : std_logic_vector (31 downto 0);
    signal expRPreExc_uid117_fpAddSubTest_ieeeAdd_b : std_logic_vector (7 downto 0);
    signal excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_q : std_logic_vector (4 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--cAmA_uid86_fpAddSubTest_ieeeAdd(CONSTANT,85)
    cAmA_uid86_fpAddSubTest_ieeeAdd_q <= "11011";

	--zs_uid150_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(CONSTANT,149)
    zs_uid150_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= "0000000000000000";

	--signB_uid6_fpAddSubTest(BITSELECT,5)@0
    signB_uid6_fpAddSubTest_in <= y;
    signB_uid6_fpAddSubTest_b <= signB_uid6_fpAddSubTest_in(31 downto 31);

	--InvSignB_uid8_fpAddSubTest(LOGICAL,7)@0
    InvSignB_uid8_fpAddSubTest_a <= signB_uid6_fpAddSubTest_b;
    InvSignB_uid8_fpAddSubTest_q <= not InvSignB_uid8_fpAddSubTest_a;

	--muxSignB_uid9_fpAddSubTest(MUX,8)@0
    muxSignB_uid9_fpAddSubTest_s <= opSel;
    muxSignB_uid9_fpAddSubTest: PROCESS (muxSignB_uid9_fpAddSubTest_s, InvSignB_uid8_fpAddSubTest_q, signB_uid6_fpAddSubTest_b)
    BEGIN
            CASE muxSignB_uid9_fpAddSubTest_s IS
                  WHEN "0" => muxSignB_uid9_fpAddSubTest_q <= InvSignB_uid8_fpAddSubTest_q;
                  WHEN "1" => muxSignB_uid9_fpAddSubTest_q <= signB_uid6_fpAddSubTest_b;
                  WHEN OTHERS => muxSignB_uid9_fpAddSubTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--restB_uid7_fpAddSubTest(BITSELECT,6)@0
    restB_uid7_fpAddSubTest_in <= y(30 downto 0);
    restB_uid7_fpAddSubTest_b <= restB_uid7_fpAddSubTest_in(30 downto 0);

	--bOperand_uid10_fpAddSubTest(BITJOIN,9)@0
    bOperand_uid10_fpAddSubTest_q <= muxSignB_uid9_fpAddSubTest_q & restB_uid7_fpAddSubTest_b;

	--xIn(PORTIN,3)@0

	--GND(CONSTANT,0)
    GND_q <= "0";

	--expFracY_uid16_fpAddSubTest_ieeeAdd(BITSELECT,15)@0
    expFracY_uid16_fpAddSubTest_ieeeAdd_in <= bOperand_uid10_fpAddSubTest_q(30 downto 0);
    expFracY_uid16_fpAddSubTest_ieeeAdd_b <= expFracY_uid16_fpAddSubTest_ieeeAdd_in(30 downto 0);

	--expFracX_uid15_fpAddSubTest_ieeeAdd(BITSELECT,14)@0
    expFracX_uid15_fpAddSubTest_ieeeAdd_in <= x(30 downto 0);
    expFracX_uid15_fpAddSubTest_ieeeAdd_b <= expFracX_uid15_fpAddSubTest_ieeeAdd_in(30 downto 0);

	--xGTEy_uid17_fpAddSubTest_ieeeAdd(COMPARE,16)@0
    xGTEy_uid17_fpAddSubTest_ieeeAdd_cin <= GND_q;
    xGTEy_uid17_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("00" & expFracX_uid15_fpAddSubTest_ieeeAdd_b) & '0';
    xGTEy_uid17_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("00" & expFracY_uid16_fpAddSubTest_ieeeAdd_b) & xGTEy_uid17_fpAddSubTest_ieeeAdd_cin(0);
            xGTEy_uid17_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(xGTEy_uid17_fpAddSubTest_ieeeAdd_a) - UNSIGNED(xGTEy_uid17_fpAddSubTest_ieeeAdd_b));
    xGTEy_uid17_fpAddSubTest_ieeeAdd_n(0) <= not xGTEy_uid17_fpAddSubTest_ieeeAdd_o(33);


	--b_uid19_fpAddSubTest_ieeeAdd(MUX,18)@0
    b_uid19_fpAddSubTest_ieeeAdd_s <= xGTEy_uid17_fpAddSubTest_ieeeAdd_n;
    b_uid19_fpAddSubTest_ieeeAdd: PROCESS (b_uid19_fpAddSubTest_ieeeAdd_s, x, bOperand_uid10_fpAddSubTest_q)
    BEGIN
            CASE b_uid19_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => b_uid19_fpAddSubTest_ieeeAdd_q <= x;
                  WHEN "1" => b_uid19_fpAddSubTest_ieeeAdd_q <= bOperand_uid10_fpAddSubTest_q;
                  WHEN OTHERS => b_uid19_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sigB_uid57_fpAddSubTest_ieeeAdd(BITSELECT,56)@0
    sigB_uid57_fpAddSubTest_ieeeAdd_in <= b_uid19_fpAddSubTest_ieeeAdd_q;
    sigB_uid57_fpAddSubTest_ieeeAdd_b <= sigB_uid57_fpAddSubTest_ieeeAdd_in(31 downto 31);

	--a_uid18_fpAddSubTest_ieeeAdd(MUX,17)@0
    a_uid18_fpAddSubTest_ieeeAdd_s <= xGTEy_uid17_fpAddSubTest_ieeeAdd_n;
    a_uid18_fpAddSubTest_ieeeAdd: PROCESS (a_uid18_fpAddSubTest_ieeeAdd_s, bOperand_uid10_fpAddSubTest_q, x)
    BEGIN
            CASE a_uid18_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => a_uid18_fpAddSubTest_ieeeAdd_q <= bOperand_uid10_fpAddSubTest_q;
                  WHEN "1" => a_uid18_fpAddSubTest_ieeeAdd_q <= x;
                  WHEN OTHERS => a_uid18_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sigA_uid56_fpAddSubTest_ieeeAdd(BITSELECT,55)@0
    sigA_uid56_fpAddSubTest_ieeeAdd_in <= a_uid18_fpAddSubTest_ieeeAdd_q;
    sigA_uid56_fpAddSubTest_ieeeAdd_b <= sigA_uid56_fpAddSubTest_ieeeAdd_in(31 downto 31);

	--effSub_uid58_fpAddSubTest_ieeeAdd(LOGICAL,57)@0
    effSub_uid58_fpAddSubTest_ieeeAdd_a <= sigA_uid56_fpAddSubTest_ieeeAdd_b;
    effSub_uid58_fpAddSubTest_ieeeAdd_b <= sigB_uid57_fpAddSubTest_ieeeAdd_b;
    effSub_uid58_fpAddSubTest_ieeeAdd_q <= effSub_uid58_fpAddSubTest_ieeeAdd_a xor effSub_uid58_fpAddSubTest_ieeeAdd_b;

	--ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_b(DELAY,334)@0
    ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => effSub_uid58_fpAddSubTest_ieeeAdd_q, xout => ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--cstAllZWE_uid22_fpAddSubTest_ieeeAdd(CONSTANT,21)
    cstAllZWE_uid22_fpAddSubTest_ieeeAdd_q <= "00000000";

	--exp_uid39_fpAddSubTest_ieeeAdd(BITSELECT,38)@0
    exp_uid39_fpAddSubTest_ieeeAdd_in <= b_uid19_fpAddSubTest_ieeeAdd_q(30 downto 0);
    exp_uid39_fpAddSubTest_ieeeAdd_b <= exp_uid39_fpAddSubTest_ieeeAdd_in(30 downto 23);

	--expXIsZero_uid40_fpAddSubTest_ieeeAdd(LOGICAL,39)@0
    expXIsZero_uid40_fpAddSubTest_ieeeAdd_a <= exp_uid39_fpAddSubTest_ieeeAdd_b;
    expXIsZero_uid40_fpAddSubTest_ieeeAdd_b <= cstAllZWE_uid22_fpAddSubTest_ieeeAdd_q;
    expXIsZero_uid40_fpAddSubTest_ieeeAdd_q <= "1" when expXIsZero_uid40_fpAddSubTest_ieeeAdd_a = expXIsZero_uid40_fpAddSubTest_ieeeAdd_b else "0";

	--InvExpXIsZero_uid50_fpAddSubTest_ieeeAdd(LOGICAL,49)@0
    InvExpXIsZero_uid50_fpAddSubTest_ieeeAdd_a <= expXIsZero_uid40_fpAddSubTest_ieeeAdd_q;
    InvExpXIsZero_uid50_fpAddSubTest_ieeeAdd_q <= not InvExpXIsZero_uid50_fpAddSubTest_ieeeAdd_a;

	--cstAllZWF_uid21_fpAddSubTest_ieeeAdd(CONSTANT,20)
    cstAllZWF_uid21_fpAddSubTest_ieeeAdd_q <= "00000000000000000000000";

	--frac_uid43_fpAddSubTest_ieeeAdd(BITSELECT,42)@0
    frac_uid43_fpAddSubTest_ieeeAdd_in <= b_uid19_fpAddSubTest_ieeeAdd_q(22 downto 0);
    frac_uid43_fpAddSubTest_ieeeAdd_b <= frac_uid43_fpAddSubTest_ieeeAdd_in(22 downto 0);

	--fracBz_uid62_fpAddSubTest_ieeeAdd(MUX,61)@0
    fracBz_uid62_fpAddSubTest_ieeeAdd_s <= expXIsZero_uid40_fpAddSubTest_ieeeAdd_q;
    fracBz_uid62_fpAddSubTest_ieeeAdd: PROCESS (fracBz_uid62_fpAddSubTest_ieeeAdd_s, frac_uid43_fpAddSubTest_ieeeAdd_b)
    BEGIN
            CASE fracBz_uid62_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => fracBz_uid62_fpAddSubTest_ieeeAdd_q <= frac_uid43_fpAddSubTest_ieeeAdd_b;
                  WHEN "1" => fracBz_uid62_fpAddSubTest_ieeeAdd_q <= cstAllZWF_uid21_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => fracBz_uid62_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oFracB_uid65_fpAddSubTest_ieeeAdd(BITJOIN,64)@0
    oFracB_uid65_fpAddSubTest_ieeeAdd_q <= InvExpXIsZero_uid50_fpAddSubTest_ieeeAdd_q & fracBz_uid62_fpAddSubTest_ieeeAdd_q;

	--oFracBR_uid71_fpAddSubTest_ieeeAdd(BITJOIN,70)@0
    oFracBR_uid71_fpAddSubTest_ieeeAdd_q <= GND_q & oFracB_uid65_fpAddSubTest_ieeeAdd_q & GND_q & GND_q;

	--oFracBREX_uid72_fpAddSubTest_ieeeAdd(LOGICAL,71)@0
    oFracBREX_uid72_fpAddSubTest_ieeeAdd_a <= oFracBR_uid71_fpAddSubTest_ieeeAdd_q;
    oFracBREX_uid72_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((26 downto 1 => effSub_uid58_fpAddSubTest_ieeeAdd_q(0)) & effSub_uid58_fpAddSubTest_ieeeAdd_q);
    oFracBREX_uid72_fpAddSubTest_ieeeAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            oFracBREX_uid72_fpAddSubTest_ieeeAdd_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            oFracBREX_uid72_fpAddSubTest_ieeeAdd_q <= oFracBREX_uid72_fpAddSubTest_ieeeAdd_a xor oFracBREX_uid72_fpAddSubTest_ieeeAdd_b;
        END IF;
    END PROCESS;



	--oFracBREXC2_uid73_fpAddSubTest_ieeeAdd(ADD,72)@1
    oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR((28 downto 27 => oFracBREX_uid72_fpAddSubTest_ieeeAdd_q(26)) & oFracBREX_uid72_fpAddSubTest_ieeeAdd_q);
    oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000" & ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_b_q);
            oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(SIGNED(oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_a) + SIGNED(oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_b));
    oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_q <= oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_o(27 downto 0);


	--oFracBREXC2Sig_uid77_fpAddSubTest_ieeeAdd(BITSELECT,76)@1
    oFracBREXC2Sig_uid77_fpAddSubTest_ieeeAdd_in <= oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_q;
    oFracBREXC2Sig_uid77_fpAddSubTest_ieeeAdd_b <= oFracBREXC2Sig_uid77_fpAddSubTest_ieeeAdd_in(27 downto 27);

	--oFracBREXC2_uid76_fpAddSubTest_ieeeAdd(BITSELECT,75)@1
    oFracBREXC2_uid76_fpAddSubTest_ieeeAdd_in <= oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_q(26 downto 0);
    oFracBREXC2_uid76_fpAddSubTest_ieeeAdd_b <= oFracBREXC2_uid76_fpAddSubTest_ieeeAdd_in(26 downto 1);

	--secondOp_uid78_fpAddSubTest_ieeeAdd(BITJOIN,77)@1
    secondOp_uid78_fpAddSubTest_ieeeAdd_q <= oFracBREXC2Sig_uid77_fpAddSubTest_ieeeAdd_b & oFracBREXC2_uid76_fpAddSubTest_ieeeAdd_b;

	--oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd(BITSELECT,73)@1
    oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_in <= oFracBREXC2_uid73_fpAddSubTest_ieeeAdd_q(26 downto 0);
    oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_in(26 downto 0);

	--exp_uid23_fpAddSubTest_ieeeAdd(BITSELECT,22)@0
    exp_uid23_fpAddSubTest_ieeeAdd_in <= a_uid18_fpAddSubTest_ieeeAdd_q(30 downto 0);
    exp_uid23_fpAddSubTest_ieeeAdd_b <= exp_uid23_fpAddSubTest_ieeeAdd_in(30 downto 23);

	--expAmExpB_uid66_fpAddSubTest_ieeeAdd(SUB,65)@0
    expAmExpB_uid66_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("0" & exp_uid23_fpAddSubTest_ieeeAdd_b);
    expAmExpB_uid66_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("0" & exp_uid39_fpAddSubTest_ieeeAdd_b);
            expAmExpB_uid66_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(expAmExpB_uid66_fpAddSubTest_ieeeAdd_a) - UNSIGNED(expAmExpB_uid66_fpAddSubTest_ieeeAdd_b));
    expAmExpB_uid66_fpAddSubTest_ieeeAdd_q <= expAmExpB_uid66_fpAddSubTest_ieeeAdd_o(8 downto 0);


	--expAmExpBZ_uid75_fpAddSubTest_ieeeAdd(BITSELECT,74)@0
    expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_in <= expAmExpB_uid66_fpAddSubTest_ieeeAdd_q(0 downto 0);
    expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_b <= expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_in(0 downto 0);

	--ld_expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_b_to_oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_b(DELAY,341)@0
    ld_expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_b_to_oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_b, xout => ld_expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_b_to_oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd(MUX,79)@1
    oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_s <= ld_expAmExpBZ_uid75_fpAddSubTest_ieeeAdd_b_to_oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_b_q;
    oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd: PROCESS (oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_s, oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b, secondOp_uid78_fpAddSubTest_ieeeAdd_q)
    BEGIN
            CASE oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_q <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b;
                  WHEN "1" => oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_q <= secondOp_uid78_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--frac_uid27_fpAddSubTest_ieeeAdd(BITSELECT,26)@0
    frac_uid27_fpAddSubTest_ieeeAdd_in <= a_uid18_fpAddSubTest_ieeeAdd_q(22 downto 0);
    frac_uid27_fpAddSubTest_ieeeAdd_b <= frac_uid27_fpAddSubTest_ieeeAdd_in(22 downto 0);

	--ld_frac_uid27_fpAddSubTest_ieeeAdd_b_to_oFracA_uid63_fpAddSubTest_ieeeAdd_a(DELAY,321)@0
    ld_frac_uid27_fpAddSubTest_ieeeAdd_b_to_oFracA_uid63_fpAddSubTest_ieeeAdd_a : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => frac_uid27_fpAddSubTest_ieeeAdd_b, xout => ld_frac_uid27_fpAddSubTest_ieeeAdd_b_to_oFracA_uid63_fpAddSubTest_ieeeAdd_a_q, clk => clk, aclr => areset );

	--oFracA_uid63_fpAddSubTest_ieeeAdd(BITJOIN,62)@1
    oFracA_uid63_fpAddSubTest_ieeeAdd_q <= VCC_q & ld_frac_uid27_fpAddSubTest_ieeeAdd_b_to_oFracA_uid63_fpAddSubTest_ieeeAdd_a_q;

	--oFracAE_uid70_fpAddSubTest_ieeeAdd(BITJOIN,69)@1
    oFracAE_uid70_fpAddSubTest_ieeeAdd_q <= GND_q & oFracA_uid63_fpAddSubTest_ieeeAdd_q & GND_q & GND_q;

	--fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd(ADD,80)@1
    fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR((27 downto 27 => oFracAE_uid70_fpAddSubTest_ieeeAdd_q(26)) & oFracAE_uid70_fpAddSubTest_ieeeAdd_q);
    fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((27 downto 27 => oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_q(26)) & oFracBREXC2SPostAlign_uid80_fpAddSubTest_ieeeAdd_q);
            fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(SIGNED(fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_a) + SIGNED(fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_b));
    fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_q <= fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_o(27 downto 0);


	--fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd(BITSELECT,81)@1
    fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_in <= fracAddResult_closePath_uid81_fpAddSubTest_ieeeAdd_q(26 downto 0);
    fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b <= fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_in(26 downto 0);

	--rVStage_uid151_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITSELECT,150)@1
    rVStage_uid151_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b;
    rVStage_uid151_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= rVStage_uid151_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in(26 downto 11);

	--vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(LOGICAL,151)@1
    vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a <= rVStage_uid151_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
    vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= zs_uid150_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= "1" when vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a = vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b else "0";

	--ld_vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q_to_r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_e(DELAY,474)@1
    ld_vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q_to_r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q, xout => ld_vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q_to_r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_e_q, clk => clk, aclr => areset );

	--vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITSELECT,153)@1
    vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b(10 downto 0);
    vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in(10 downto 0);

	--mO_uid153_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(CONSTANT,152)
    mO_uid153_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= "11111";

	--cStage_uid155_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITJOIN,154)@1
    cStage_uid155_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b & mO_uid153_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;

	--vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(MUX,156)@1
    vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s <= vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd: PROCESS (vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s, rVStage_uid151_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b, cStage_uid155_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q)
    BEGIN
            CASE vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= rVStage_uid151_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
                  WHEN "1" => vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= cStage_uid155_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITSELECT,158)@1
    rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in <= vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in(15 downto 8);

	--reg_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_0_to_vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_1(REG,259)@1
    reg_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_0_to_vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_0_to_vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            reg_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_0_to_vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_1_q <= rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
        END IF;
    END PROCESS;


	--vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(LOGICAL,159)@2
    vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a <= reg_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_0_to_vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_1_q;
    vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= cstAllZWE_uid22_fpAddSubTest_ieeeAdd_q;
    vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= "1" when vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a = vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b else "0";

	--zs_uid164_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(CONSTANT,163)
    zs_uid164_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= "0000";

	--vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITSELECT,160)@1
    vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in <= vStagei_uid157_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q(7 downto 0);
    vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in(7 downto 0);

	--ld_vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_d(DELAY,455)@1
    ld_vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b, xout => ld_vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_d_q, clk => clk, aclr => areset );

	--ld_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_c(DELAY,454)@1
    ld_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_c : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b, xout => ld_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_c_q, clk => clk, aclr => areset );

	--vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(MUX,162)@2
    vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s <= vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd: PROCESS (vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s, ld_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_c_q, ld_vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_d_q)
    BEGIN
            CASE vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= ld_rVStage_uid159_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_c_q;
                  WHEN "1" => vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= ld_vStage_uid161_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_d_q;
                  WHEN OTHERS => vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid165_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITSELECT,164)@2
    rVStage_uid165_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in <= vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    rVStage_uid165_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= rVStage_uid165_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in(7 downto 4);

	--vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(LOGICAL,165)@2
    vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a <= rVStage_uid165_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
    vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= zs_uid164_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= "1" when vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a = vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b else "0";

	--zs_uid170_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(CONSTANT,169)
    zs_uid170_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= "00";

	--vStage_uid167_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITSELECT,166)@2
    vStage_uid167_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in <= vStagei_uid163_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q(3 downto 0);
    vStage_uid167_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= vStage_uid167_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in(3 downto 0);

	--vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(MUX,168)@2
    vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s <= vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd: PROCESS (vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s, rVStage_uid165_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b, vStage_uid167_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b)
    BEGIN
            CASE vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= rVStage_uid165_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
                  WHEN "1" => vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= vStage_uid167_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
                  WHEN OTHERS => vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid171_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITSELECT,170)@2
    rVStage_uid171_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in <= vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    rVStage_uid171_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= rVStage_uid171_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in(3 downto 2);

	--vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(LOGICAL,171)@2
    vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a <= rVStage_uid171_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
    vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= zs_uid170_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= "1" when vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a = vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b else "0";

	--vStage_uid173_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITSELECT,172)@2
    vStage_uid173_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in <= vStagei_uid169_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q(1 downto 0);
    vStage_uid173_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= vStage_uid173_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in(1 downto 0);

	--vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(MUX,174)@2
    vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s <= vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd: PROCESS (vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s, rVStage_uid171_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b, vStage_uid173_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b)
    BEGIN
            CASE vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= rVStage_uid171_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
                  WHEN "1" => vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= vStage_uid173_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
                  WHEN OTHERS => vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid177_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITSELECT,176)@2
    rVStage_uid177_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in <= vStagei_uid175_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    rVStage_uid177_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= rVStage_uid177_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_in(1 downto 1);

	--vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(LOGICAL,177)@2
    vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a <= rVStage_uid177_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b;
    vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b <= GND_q;
    vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= "1" when vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_a = vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b else "0";

	--r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd(BITJOIN,178)@2
    r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q <= ld_vCount_uid152_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q_to_r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_e_q & vCount_uid160_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q & vCount_uid166_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q & vCount_uid172_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q & vCount_uid178_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;

	--aMinusA_uid87_fpAddSubTest_ieeeAdd(LOGICAL,86)@2
    aMinusA_uid87_fpAddSubTest_ieeeAdd_a <= r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    aMinusA_uid87_fpAddSubTest_ieeeAdd_b <= cAmA_uid86_fpAddSubTest_ieeeAdd_q;
    aMinusA_uid87_fpAddSubTest_ieeeAdd_q <= "1" when (aMinusA_uid87_fpAddSubTest_ieeeAdd_a = aMinusA_uid87_fpAddSubTest_ieeeAdd_b and closePath_uid69_fpAddSubTest_ieeeAdd_q = "1") else "0";

	--InvAMinusA_uid129_fpAddSubTest_ieeeAdd(LOGICAL,128)@2
    InvAMinusA_uid129_fpAddSubTest_ieeeAdd_a <= aMinusA_uid87_fpAddSubTest_ieeeAdd_q;
    InvAMinusA_uid129_fpAddSubTest_ieeeAdd_q <= not InvAMinusA_uid129_fpAddSubTest_ieeeAdd_a;

	--ld_sigA_uid56_fpAddSubTest_ieeeAdd_b_to_signRReg_uid130_fpAddSubTest_ieeeAdd_c(DELAY,413)@0
    ld_sigA_uid56_fpAddSubTest_ieeeAdd_b_to_signRReg_uid130_fpAddSubTest_ieeeAdd_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => sigA_uid56_fpAddSubTest_ieeeAdd_b, xout => ld_sigA_uid56_fpAddSubTest_ieeeAdd_b_to_signRReg_uid130_fpAddSubTest_ieeeAdd_c_q, clk => clk, aclr => areset );

	--fracXIsZero_uid44_fpAddSubTest_ieeeAdd(LOGICAL,43)@0
    fracXIsZero_uid44_fpAddSubTest_ieeeAdd_a <= frac_uid43_fpAddSubTest_ieeeAdd_b;
    fracXIsZero_uid44_fpAddSubTest_ieeeAdd_b <= cstAllZWF_uid21_fpAddSubTest_ieeeAdd_q;
    fracXIsZero_uid44_fpAddSubTest_ieeeAdd_q <= "1" when fracXIsZero_uid44_fpAddSubTest_ieeeAdd_a = fracXIsZero_uid44_fpAddSubTest_ieeeAdd_b else "0";

	--InvFracXIsZero_uid46_fpAddSubTest_ieeeAdd(LOGICAL,45)@0
    InvFracXIsZero_uid46_fpAddSubTest_ieeeAdd_a <= fracXIsZero_uid44_fpAddSubTest_ieeeAdd_q;
    InvFracXIsZero_uid46_fpAddSubTest_ieeeAdd_q <= not InvFracXIsZero_uid46_fpAddSubTest_ieeeAdd_a;

	--cstAllOWE_uid20_fpAddSubTest_ieeeAdd(CONSTANT,19)
    cstAllOWE_uid20_fpAddSubTest_ieeeAdd_q <= "11111111";

	--expXIsMax_uid42_fpAddSubTest_ieeeAdd(LOGICAL,41)@0
    expXIsMax_uid42_fpAddSubTest_ieeeAdd_a <= exp_uid39_fpAddSubTest_ieeeAdd_b;
    expXIsMax_uid42_fpAddSubTest_ieeeAdd_b <= cstAllOWE_uid20_fpAddSubTest_ieeeAdd_q;
    expXIsMax_uid42_fpAddSubTest_ieeeAdd_q <= "1" when expXIsMax_uid42_fpAddSubTest_ieeeAdd_a = expXIsMax_uid42_fpAddSubTest_ieeeAdd_b else "0";

	--exc_N_uid47_fpAddSubTest_ieeeAdd(LOGICAL,46)@0
    exc_N_uid47_fpAddSubTest_ieeeAdd_a <= expXIsMax_uid42_fpAddSubTest_ieeeAdd_q;
    exc_N_uid47_fpAddSubTest_ieeeAdd_b <= InvFracXIsZero_uid46_fpAddSubTest_ieeeAdd_q;
    exc_N_uid47_fpAddSubTest_ieeeAdd_q <= exc_N_uid47_fpAddSubTest_ieeeAdd_a and exc_N_uid47_fpAddSubTest_ieeeAdd_b;

	--InvExc_N_uid48_fpAddSubTest_ieeeAdd(LOGICAL,47)@0
    InvExc_N_uid48_fpAddSubTest_ieeeAdd_a <= exc_N_uid47_fpAddSubTest_ieeeAdd_q;
    InvExc_N_uid48_fpAddSubTest_ieeeAdd_q <= not InvExc_N_uid48_fpAddSubTest_ieeeAdd_a;

	--exc_I_uid45_fpAddSubTest_ieeeAdd(LOGICAL,44)@0
    exc_I_uid45_fpAddSubTest_ieeeAdd_a <= expXIsMax_uid42_fpAddSubTest_ieeeAdd_q;
    exc_I_uid45_fpAddSubTest_ieeeAdd_b <= fracXIsZero_uid44_fpAddSubTest_ieeeAdd_q;
    exc_I_uid45_fpAddSubTest_ieeeAdd_q <= exc_I_uid45_fpAddSubTest_ieeeAdd_a and exc_I_uid45_fpAddSubTest_ieeeAdd_b;

	--InvExc_I_uid49_fpAddSubTest_ieeeAdd(LOGICAL,48)@0
    InvExc_I_uid49_fpAddSubTest_ieeeAdd_a <= exc_I_uid45_fpAddSubTest_ieeeAdd_q;
    InvExc_I_uid49_fpAddSubTest_ieeeAdd_q <= not InvExc_I_uid49_fpAddSubTest_ieeeAdd_a;

	--exc_R_uid51_fpAddSubTest_ieeeAdd(LOGICAL,50)@0
    exc_R_uid51_fpAddSubTest_ieeeAdd_a <= InvExpXIsZero_uid50_fpAddSubTest_ieeeAdd_q;
    exc_R_uid51_fpAddSubTest_ieeeAdd_b <= InvExc_I_uid49_fpAddSubTest_ieeeAdd_q;
    exc_R_uid51_fpAddSubTest_ieeeAdd_c <= InvExc_N_uid48_fpAddSubTest_ieeeAdd_q;
    exc_R_uid51_fpAddSubTest_ieeeAdd_q <= exc_R_uid51_fpAddSubTest_ieeeAdd_a and exc_R_uid51_fpAddSubTest_ieeeAdd_b and exc_R_uid51_fpAddSubTest_ieeeAdd_c;

	--ld_exc_R_uid51_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_b(DELAY,412)@0
    ld_exc_R_uid51_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => exc_R_uid51_fpAddSubTest_ieeeAdd_q, xout => ld_exc_R_uid51_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--fracXIsZero_uid28_fpAddSubTest_ieeeAdd(LOGICAL,27)@0
    fracXIsZero_uid28_fpAddSubTest_ieeeAdd_a <= frac_uid27_fpAddSubTest_ieeeAdd_b;
    fracXIsZero_uid28_fpAddSubTest_ieeeAdd_b <= cstAllZWF_uid21_fpAddSubTest_ieeeAdd_q;
    fracXIsZero_uid28_fpAddSubTest_ieeeAdd_q <= "1" when fracXIsZero_uid28_fpAddSubTest_ieeeAdd_a = fracXIsZero_uid28_fpAddSubTest_ieeeAdd_b else "0";

	--InvFracXIsZero_uid30_fpAddSubTest_ieeeAdd(LOGICAL,29)@0
    InvFracXIsZero_uid30_fpAddSubTest_ieeeAdd_a <= fracXIsZero_uid28_fpAddSubTest_ieeeAdd_q;
    InvFracXIsZero_uid30_fpAddSubTest_ieeeAdd_q <= not InvFracXIsZero_uid30_fpAddSubTest_ieeeAdd_a;

	--expXIsMax_uid26_fpAddSubTest_ieeeAdd(LOGICAL,25)@0
    expXIsMax_uid26_fpAddSubTest_ieeeAdd_a <= exp_uid23_fpAddSubTest_ieeeAdd_b;
    expXIsMax_uid26_fpAddSubTest_ieeeAdd_b <= cstAllOWE_uid20_fpAddSubTest_ieeeAdd_q;
    expXIsMax_uid26_fpAddSubTest_ieeeAdd_q <= "1" when expXIsMax_uid26_fpAddSubTest_ieeeAdd_a = expXIsMax_uid26_fpAddSubTest_ieeeAdd_b else "0";

	--exc_N_uid31_fpAddSubTest_ieeeAdd(LOGICAL,30)@0
    exc_N_uid31_fpAddSubTest_ieeeAdd_a <= expXIsMax_uid26_fpAddSubTest_ieeeAdd_q;
    exc_N_uid31_fpAddSubTest_ieeeAdd_b <= InvFracXIsZero_uid30_fpAddSubTest_ieeeAdd_q;
    exc_N_uid31_fpAddSubTest_ieeeAdd_q <= exc_N_uid31_fpAddSubTest_ieeeAdd_a and exc_N_uid31_fpAddSubTest_ieeeAdd_b;

	--InvExc_N_uid32_fpAddSubTest_ieeeAdd(LOGICAL,31)@0
    InvExc_N_uid32_fpAddSubTest_ieeeAdd_a <= exc_N_uid31_fpAddSubTest_ieeeAdd_q;
    InvExc_N_uid32_fpAddSubTest_ieeeAdd_q <= not InvExc_N_uid32_fpAddSubTest_ieeeAdd_a;

	--exc_I_uid29_fpAddSubTest_ieeeAdd(LOGICAL,28)@0
    exc_I_uid29_fpAddSubTest_ieeeAdd_a <= expXIsMax_uid26_fpAddSubTest_ieeeAdd_q;
    exc_I_uid29_fpAddSubTest_ieeeAdd_b <= fracXIsZero_uid28_fpAddSubTest_ieeeAdd_q;
    exc_I_uid29_fpAddSubTest_ieeeAdd_q <= exc_I_uid29_fpAddSubTest_ieeeAdd_a and exc_I_uid29_fpAddSubTest_ieeeAdd_b;

	--InvExc_I_uid33_fpAddSubTest_ieeeAdd(LOGICAL,32)@0
    InvExc_I_uid33_fpAddSubTest_ieeeAdd_a <= exc_I_uid29_fpAddSubTest_ieeeAdd_q;
    InvExc_I_uid33_fpAddSubTest_ieeeAdd_q <= not InvExc_I_uid33_fpAddSubTest_ieeeAdd_a;

	--expXIsZero_uid24_fpAddSubTest_ieeeAdd(LOGICAL,23)@0
    expXIsZero_uid24_fpAddSubTest_ieeeAdd_a <= exp_uid23_fpAddSubTest_ieeeAdd_b;
    expXIsZero_uid24_fpAddSubTest_ieeeAdd_b <= cstAllZWE_uid22_fpAddSubTest_ieeeAdd_q;
    expXIsZero_uid24_fpAddSubTest_ieeeAdd_q <= "1" when expXIsZero_uid24_fpAddSubTest_ieeeAdd_a = expXIsZero_uid24_fpAddSubTest_ieeeAdd_b else "0";

	--InvExpXIsZero_uid34_fpAddSubTest_ieeeAdd(LOGICAL,33)@0
    InvExpXIsZero_uid34_fpAddSubTest_ieeeAdd_a <= expXIsZero_uid24_fpAddSubTest_ieeeAdd_q;
    InvExpXIsZero_uid34_fpAddSubTest_ieeeAdd_q <= not InvExpXIsZero_uid34_fpAddSubTest_ieeeAdd_a;

	--exc_R_uid35_fpAddSubTest_ieeeAdd(LOGICAL,34)@0
    exc_R_uid35_fpAddSubTest_ieeeAdd_a <= InvExpXIsZero_uid34_fpAddSubTest_ieeeAdd_q;
    exc_R_uid35_fpAddSubTest_ieeeAdd_b <= InvExc_I_uid33_fpAddSubTest_ieeeAdd_q;
    exc_R_uid35_fpAddSubTest_ieeeAdd_c <= InvExc_N_uid32_fpAddSubTest_ieeeAdd_q;
    exc_R_uid35_fpAddSubTest_ieeeAdd_q <= exc_R_uid35_fpAddSubTest_ieeeAdd_a and exc_R_uid35_fpAddSubTest_ieeeAdd_b and exc_R_uid35_fpAddSubTest_ieeeAdd_c;

	--ld_exc_R_uid35_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_a(DELAY,411)@0
    ld_exc_R_uid35_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => exc_R_uid35_fpAddSubTest_ieeeAdd_q, xout => ld_exc_R_uid35_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_a_q, clk => clk, aclr => areset );

	--signRReg_uid130_fpAddSubTest_ieeeAdd(LOGICAL,129)@2
    signRReg_uid130_fpAddSubTest_ieeeAdd_a <= ld_exc_R_uid35_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_a_q;
    signRReg_uid130_fpAddSubTest_ieeeAdd_b <= ld_exc_R_uid51_fpAddSubTest_ieeeAdd_q_to_signRReg_uid130_fpAddSubTest_ieeeAdd_b_q;
    signRReg_uid130_fpAddSubTest_ieeeAdd_c <= ld_sigA_uid56_fpAddSubTest_ieeeAdd_b_to_signRReg_uid130_fpAddSubTest_ieeeAdd_c_q;
    signRReg_uid130_fpAddSubTest_ieeeAdd_d <= InvAMinusA_uid129_fpAddSubTest_ieeeAdd_q;
    signRReg_uid130_fpAddSubTest_ieeeAdd_q <= signRReg_uid130_fpAddSubTest_ieeeAdd_a and signRReg_uid130_fpAddSubTest_ieeeAdd_b and signRReg_uid130_fpAddSubTest_ieeeAdd_c and signRReg_uid130_fpAddSubTest_ieeeAdd_d;

	--excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd(LOGICAL,133)@0
    excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_a <= expXIsZero_uid24_fpAddSubTest_ieeeAdd_q;
    excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_b <= expXIsZero_uid40_fpAddSubTest_ieeeAdd_q;
    excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_c <= sigA_uid56_fpAddSubTest_ieeeAdd_b;
    excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_d <= sigB_uid57_fpAddSubTest_ieeeAdd_b;
    excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_q <= excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_a and excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_b and excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_c and excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_d;

	--excBZARSigA_uid135_fpAddSubTest_ieeeAdd(LOGICAL,134)@0
    excBZARSigA_uid135_fpAddSubTest_ieeeAdd_a <= expXIsZero_uid40_fpAddSubTest_ieeeAdd_q;
    excBZARSigA_uid135_fpAddSubTest_ieeeAdd_b <= exc_R_uid35_fpAddSubTest_ieeeAdd_q;
    excBZARSigA_uid135_fpAddSubTest_ieeeAdd_c <= sigA_uid56_fpAddSubTest_ieeeAdd_b;
    excBZARSigA_uid135_fpAddSubTest_ieeeAdd_q <= excBZARSigA_uid135_fpAddSubTest_ieeeAdd_a and excBZARSigA_uid135_fpAddSubTest_ieeeAdd_b and excBZARSigA_uid135_fpAddSubTest_ieeeAdd_c;

	--signRZero_uid136_fpAddSubTest_ieeeAdd(LOGICAL,135)@0
    signRZero_uid136_fpAddSubTest_ieeeAdd_a <= excBZARSigA_uid135_fpAddSubTest_ieeeAdd_q;
    signRZero_uid136_fpAddSubTest_ieeeAdd_b <= excAZBZSigASigB_uid134_fpAddSubTest_ieeeAdd_q;
    signRZero_uid136_fpAddSubTest_ieeeAdd_q <= signRZero_uid136_fpAddSubTest_ieeeAdd_a or signRZero_uid136_fpAddSubTest_ieeeAdd_b;

	--ld_signRZero_uid136_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_b(DELAY,431)@0
    ld_signRZero_uid136_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => signRZero_uid136_fpAddSubTest_ieeeAdd_q, xout => ld_signRZero_uid136_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--sigBBInf_uid131_fpAddSubTest_ieeeAdd(LOGICAL,130)@0
    sigBBInf_uid131_fpAddSubTest_ieeeAdd_a <= sigB_uid57_fpAddSubTest_ieeeAdd_b;
    sigBBInf_uid131_fpAddSubTest_ieeeAdd_b <= exc_I_uid45_fpAddSubTest_ieeeAdd_q;
    sigBBInf_uid131_fpAddSubTest_ieeeAdd_q <= sigBBInf_uid131_fpAddSubTest_ieeeAdd_a and sigBBInf_uid131_fpAddSubTest_ieeeAdd_b;

	--sigAAInf_uid132_fpAddSubTest_ieeeAdd(LOGICAL,131)@0
    sigAAInf_uid132_fpAddSubTest_ieeeAdd_a <= sigA_uid56_fpAddSubTest_ieeeAdd_b;
    sigAAInf_uid132_fpAddSubTest_ieeeAdd_b <= exc_I_uid29_fpAddSubTest_ieeeAdd_q;
    sigAAInf_uid132_fpAddSubTest_ieeeAdd_q <= sigAAInf_uid132_fpAddSubTest_ieeeAdd_a and sigAAInf_uid132_fpAddSubTest_ieeeAdd_b;

	--signRInf_uid133_fpAddSubTest_ieeeAdd(LOGICAL,132)@0
    signRInf_uid133_fpAddSubTest_ieeeAdd_a <= sigAAInf_uid132_fpAddSubTest_ieeeAdd_q;
    signRInf_uid133_fpAddSubTest_ieeeAdd_b <= sigBBInf_uid131_fpAddSubTest_ieeeAdd_q;
    signRInf_uid133_fpAddSubTest_ieeeAdd_q <= signRInf_uid133_fpAddSubTest_ieeeAdd_a or signRInf_uid133_fpAddSubTest_ieeeAdd_b;

	--ld_signRInf_uid133_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_a(DELAY,430)@0
    ld_signRInf_uid133_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => signRInf_uid133_fpAddSubTest_ieeeAdd_q, xout => ld_signRInf_uid133_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_a_q, clk => clk, aclr => areset );

	--signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd(LOGICAL,136)@2
    signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_a <= ld_signRInf_uid133_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_a_q;
    signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_b <= ld_signRZero_uid136_fpAddSubTest_ieeeAdd_q_to_signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_b_q;
    signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_c <= signRReg_uid130_fpAddSubTest_ieeeAdd_q;
    signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_q <= signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_a or signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_b or signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_c;

	--excRNaN2_uid124_fpAddSubTest_ieeeAdd(LOGICAL,123)@0
    excRNaN2_uid124_fpAddSubTest_ieeeAdd_a <= exc_N_uid31_fpAddSubTest_ieeeAdd_q;
    excRNaN2_uid124_fpAddSubTest_ieeeAdd_b <= exc_N_uid47_fpAddSubTest_ieeeAdd_q;
    excRNaN2_uid124_fpAddSubTest_ieeeAdd_q <= excRNaN2_uid124_fpAddSubTest_ieeeAdd_a or excRNaN2_uid124_fpAddSubTest_ieeeAdd_b;

	--excAIBISub_uid125_fpAddSubTest_ieeeAdd(LOGICAL,124)@0
    excAIBISub_uid125_fpAddSubTest_ieeeAdd_a <= exc_I_uid29_fpAddSubTest_ieeeAdd_q;
    excAIBISub_uid125_fpAddSubTest_ieeeAdd_b <= exc_I_uid45_fpAddSubTest_ieeeAdd_q;
    excAIBISub_uid125_fpAddSubTest_ieeeAdd_c <= effSub_uid58_fpAddSubTest_ieeeAdd_q;
    excAIBISub_uid125_fpAddSubTest_ieeeAdd_q <= excAIBISub_uid125_fpAddSubTest_ieeeAdd_a and excAIBISub_uid125_fpAddSubTest_ieeeAdd_b and excAIBISub_uid125_fpAddSubTest_ieeeAdd_c;

	--excRNaN_uid126_fpAddSubTest_ieeeAdd(LOGICAL,125)@0
    excRNaN_uid126_fpAddSubTest_ieeeAdd_a <= excAIBISub_uid125_fpAddSubTest_ieeeAdd_q;
    excRNaN_uid126_fpAddSubTest_ieeeAdd_b <= excRNaN2_uid124_fpAddSubTest_ieeeAdd_q;
    excRNaN_uid126_fpAddSubTest_ieeeAdd_q <= excRNaN_uid126_fpAddSubTest_ieeeAdd_a or excRNaN_uid126_fpAddSubTest_ieeeAdd_b;

	--InvExcRNaN_uid138_fpAddSubTest_ieeeAdd(LOGICAL,137)@0
    InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_a <= excRNaN_uid126_fpAddSubTest_ieeeAdd_q;
    InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_q <= not InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_a;

	--ld_InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_q_to_signRPostExc_uid139_fpAddSubTest_ieeeAdd_a(DELAY,434)@0
    ld_InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_q_to_signRPostExc_uid139_fpAddSubTest_ieeeAdd_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_q, xout => ld_InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_q_to_signRPostExc_uid139_fpAddSubTest_ieeeAdd_a_q, clk => clk, aclr => areset );

	--signRPostExc_uid139_fpAddSubTest_ieeeAdd(LOGICAL,138)@2
    signRPostExc_uid139_fpAddSubTest_ieeeAdd_a <= ld_InvExcRNaN_uid138_fpAddSubTest_ieeeAdd_q_to_signRPostExc_uid139_fpAddSubTest_ieeeAdd_a_q;
    signRPostExc_uid139_fpAddSubTest_ieeeAdd_b <= signRInfRZRReg_uid137_fpAddSubTest_ieeeAdd_q;
    signRPostExc_uid139_fpAddSubTest_ieeeAdd_q <= signRPostExc_uid139_fpAddSubTest_ieeeAdd_a and signRPostExc_uid139_fpAddSubTest_ieeeAdd_b;

	--ld_signRPostExc_uid139_fpAddSubTest_ieeeAdd_q_to_R_uid148_fpAddSubTest_ieeeAdd_c(DELAY,442)@2
    ld_signRPostExc_uid139_fpAddSubTest_ieeeAdd_q_to_R_uid148_fpAddSubTest_ieeeAdd_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => signRPostExc_uid139_fpAddSubTest_ieeeAdd_q, xout => ld_signRPostExc_uid139_fpAddSubTest_ieeeAdd_q_to_R_uid148_fpAddSubTest_ieeeAdd_c_q, clk => clk, aclr => areset );

	--countValue_farPath11_uid102_fpAddSubTest_ieeeAdd(CONSTANT,101)
    countValue_farPath11_uid102_fpAddSubTest_ieeeAdd_q <= "00000";

	--countValue_farPath01_uid104_fpAddSubTest_ieeeAdd(CONSTANT,103)
    countValue_farPath01_uid104_fpAddSubTest_ieeeAdd_q <= "00001";

	--countValue_farPath00_uid105_fpAddSubTest_ieeeAdd(CONSTANT,104)
    countValue_farPath00_uid105_fpAddSubTest_ieeeAdd_q <= "00010";

	--msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,214)@1
    msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b;
    msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 26);

	--leftShiftStage1Idx3Pad3_uid209_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(CONSTANT,208)
    leftShiftStage1Idx3Pad3_uid209_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= "000";

	--rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,252)@1
    rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= leftShiftStage1Idx3Pad3_uid209_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
    rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((2 downto 1 => msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(0)) & msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b);
    rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--RightShiftStage026dto3_uid254_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,253)@1
    RightShiftStage026dto3_uid254_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
    RightShiftStage026dto3_uid254_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= RightShiftStage026dto3_uid254_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 3);

	--rightShiftStage1Idx3_uid255_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITJOIN,254)@1
    rightShiftStage1Idx3_uid255_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx3Pad3_uid253_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q & RightShiftStage026dto3_uid254_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,248)@1
    rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= zs_uid170_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((1 downto 1 => msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(0)) & msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b);
    rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--RightShiftStage026dto2_uid250_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,249)@1
    RightShiftStage026dto2_uid250_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
    RightShiftStage026dto2_uid250_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= RightShiftStage026dto2_uid250_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 2);

	--rightShiftStage1Idx2_uid251_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITJOIN,250)@1
    rightShiftStage1Idx2_uid251_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx2Pad2_uid249_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q & RightShiftStage026dto2_uid250_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,244)@1
    rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= GND_q;
    rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;
    rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--RightShiftStage026dto1_uid246_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,245)@1
    RightShiftStage026dto1_uid246_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
    RightShiftStage026dto1_uid246_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= RightShiftStage026dto1_uid246_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 1);

	--rightShiftStage1Idx1_uid247_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITJOIN,246)@1
    rightShiftStage1Idx1_uid247_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx1Pad1_uid245_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q & RightShiftStage026dto1_uid246_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--leftShiftStage0Idx7_uid200_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(CONSTANT,199)
    leftShiftStage0Idx7_uid200_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= "000000000000000000000000000";

	--rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,240)@1
    rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= leftShiftStage0Idx7_uid200_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
    rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((26 downto 1 => msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(0)) & msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b);
    rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--leftShiftStage0Idx6Pad24_uid197_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(CONSTANT,196)
    leftShiftStage0Idx6Pad24_uid197_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= "000000000000000000000000";

	--rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,236)@1
    rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= leftShiftStage0Idx6Pad24_uid197_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
    rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((23 downto 1 => msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(0)) & msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b);
    rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--X26dto24_uid238_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,237)@1
    X26dto24_uid238_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b;
    X26dto24_uid238_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= X26dto24_uid238_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 24);

	--rightShiftStage0Idx6_uid239_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITJOIN,238)@1
    rightShiftStage0Idx6_uid239_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx6Pad24_uid237_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q & X26dto24_uid238_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--leftShiftStage0Idx5Pad20_uid194_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(CONSTANT,193)
    leftShiftStage0Idx5Pad20_uid194_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= "00000000000000000000";

	--rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,232)@1
    rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= leftShiftStage0Idx5Pad20_uid194_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
    rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((19 downto 1 => msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(0)) & msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b);
    rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--X26dto20_uid234_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,233)@1
    X26dto20_uid234_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b;
    X26dto20_uid234_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= X26dto20_uid234_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 20);

	--rightShiftStage0Idx5_uid235_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITJOIN,234)@1
    rightShiftStage0Idx5_uid235_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx5Pad20_uid233_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q & X26dto20_uid234_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,228)@1
    rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= zs_uid150_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((15 downto 1 => msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(0)) & msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b);
    rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--X26dto16_uid230_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,229)@1
    X26dto16_uid230_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b;
    X26dto16_uid230_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= X26dto16_uid230_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 16);

	--rightShiftStage0Idx4_uid231_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITJOIN,230)@1
    rightShiftStage0Idx4_uid231_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx4Pad16_uid229_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q & X26dto16_uid230_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--leftShiftStage0Idx3Pad12_uid188_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(CONSTANT,187)
    leftShiftStage0Idx3Pad12_uid188_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= "000000000000";

	--rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,224)@1
    rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= leftShiftStage0Idx3Pad12_uid188_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
    rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((11 downto 1 => msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(0)) & msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b);
    rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--X26dto12_uid226_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,225)@1
    X26dto12_uid226_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b;
    X26dto12_uid226_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= X26dto12_uid226_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 12);

	--rightShiftStage0Idx3_uid227_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITJOIN,226)@1
    rightShiftStage0Idx3_uid227_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx3Pad12_uid225_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q & X26dto12_uid226_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,220)@1
    rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= cstAllZWE_uid22_fpAddSubTest_ieeeAdd_q;
    rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((7 downto 1 => msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(0)) & msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b);
    rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--X26dto8_uid222_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,221)@1
    X26dto8_uid222_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b;
    X26dto8_uid222_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= X26dto8_uid222_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 8);

	--rightShiftStage0Idx2_uid223_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITJOIN,222)@1
    rightShiftStage0Idx2_uid223_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx2Pad8_uid221_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q & X26dto8_uid222_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(LOGICAL,216)@1
    rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a <= zs_uid164_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((3 downto 1 => msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(0)) & msbx_uid215_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b);
    rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_a or rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--X26dto4_uid218_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,217)@1
    X26dto4_uid218_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b;
    X26dto4_uid218_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= X26dto4_uid218_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(26 downto 4);

	--rightShiftStage0Idx1_uid219_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITJOIN,218)@1
    rightShiftStage0Idx1_uid219_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx1Pad4_uid217_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q & X26dto4_uid218_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b;

	--shiftOutConst_uid90_fpAddSubTest_ieeeAdd(CONSTANT,89)
    shiftOutConst_uid90_fpAddSubTest_ieeeAdd_q <= "11001";

	--ExpAmExpB4dto0_uid91_fpAddSubTest_ieeeAdd(BITSELECT,90)@0
    ExpAmExpB4dto0_uid91_fpAddSubTest_ieeeAdd_in <= expAmExpB_uid66_fpAddSubTest_ieeeAdd_q(4 downto 0);
    ExpAmExpB4dto0_uid91_fpAddSubTest_ieeeAdd_b <= ExpAmExpB4dto0_uid91_fpAddSubTest_ieeeAdd_in(4 downto 0);

	--cWFP1_uid88_fpAddSubTest_ieeeAdd(CONSTANT,87)
    cWFP1_uid88_fpAddSubTest_ieeeAdd_q <= "11000";

	--shiftedOut_uid89_fpAddSubTest_ieeeAdd(COMPARE,88)@0
    shiftedOut_uid89_fpAddSubTest_ieeeAdd_cin <= GND_q;
    shiftedOut_uid89_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("000000" & cWFP1_uid88_fpAddSubTest_ieeeAdd_q) & '0';
    shiftedOut_uid89_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("00" & expAmExpB_uid66_fpAddSubTest_ieeeAdd_q) & shiftedOut_uid89_fpAddSubTest_ieeeAdd_cin(0);
            shiftedOut_uid89_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid89_fpAddSubTest_ieeeAdd_a) - UNSIGNED(shiftedOut_uid89_fpAddSubTest_ieeeAdd_b));
    shiftedOut_uid89_fpAddSubTest_ieeeAdd_c(0) <= shiftedOut_uid89_fpAddSubTest_ieeeAdd_o(11);


	--shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd(MUX,91)@0
    shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_s <= shiftedOut_uid89_fpAddSubTest_ieeeAdd_c;
    shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd: PROCESS (shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_s, ExpAmExpB4dto0_uid91_fpAddSubTest_ieeeAdd_b)
    BEGIN
            CASE shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_q <= ExpAmExpB4dto0_uid91_fpAddSubTest_ieeeAdd_b;
                  WHEN "1" => shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_q <= shiftOutConst_uid90_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,241)@0
    rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_q;
    rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(4 downto 2);

	--ld_rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(DELAY,534)@0
    ld_rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b, xout => ld_rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(MUX,242)@1
    rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_s <= ld_rightShiftStageSel4Dto2_uid242_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_q;
    rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd: PROCESS (rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_s, oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b, rightShiftStage0Idx1_uid219_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx2_uid223_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx3_uid227_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx4_uid231_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx5_uid235_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx6_uid239_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q, rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q)
    BEGIN
            CASE rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_s IS
                  WHEN "000" => rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= oFracBREXC2S_uid74_fpAddSubTest_ieeeAdd_b;
                  WHEN "001" => rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx1_uid219_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                  WHEN "010" => rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx2_uid223_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                  WHEN "011" => rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx3_uid227_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                  WHEN "100" => rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx4_uid231_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                  WHEN "101" => rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx5_uid235_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                  WHEN "110" => rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx6_uid239_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                  WHEN "111" => rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0Idx7_uid241_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(BITSELECT,255)@0
    rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in <= shiftValue_farPath_uid92_fpAddSubTest_ieeeAdd_q(1 downto 0);
    rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b <= rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_in(1 downto 0);

	--ld_rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b(DELAY,556)@0
    ld_rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 2, depth => 1 )
    PORT MAP ( xin => rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b, xout => ld_rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd(MUX,256)@1
    rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_s <= ld_rightShiftStageSel1Dto0_uid256_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_to_rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_b_q;
    rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
                CASE rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_s IS
                      WHEN "00" => rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage0_uid243_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                      WHEN "01" => rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx1_uid247_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                      WHEN "10" => rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx2_uid251_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                      WHEN "11" => rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= rightShiftStage1Idx3_uid255_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q;
                      WHEN OTHERS => rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q <= (others => '0');
                END CASE;
        END IF;
    END PROCESS;


	--reg_oFracAE_uid70_fpAddSubTest_ieeeAdd_0_to_fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_0(REG,258)@1
    reg_oFracAE_uid70_fpAddSubTest_ieeeAdd_0_to_fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_oFracAE_uid70_fpAddSubTest_ieeeAdd_0_to_fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_0_q <= "000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            reg_oFracAE_uid70_fpAddSubTest_ieeeAdd_0_to_fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_0_q <= oFracAE_uid70_fpAddSubTest_ieeeAdd_q;
        END IF;
    END PROCESS;


	--fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd(ADD,93)@2
    fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR((27 downto 27 => reg_oFracAE_uid70_fpAddSubTest_ieeeAdd_0_to_fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_0_q(26)) & reg_oFracAE_uid70_fpAddSubTest_ieeeAdd_0_to_fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_0_q);
    fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((27 downto 27 => rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q(26)) & rightShiftStage1_uid257_alignmentShifter_uid93_fpAddSubTest_ieeeAdd_q);
            fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(SIGNED(fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_a) + SIGNED(fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_b));
    fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_q <= fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_o(27 downto 0);


	--fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd(BITSELECT,94)@2
    fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd_in <= fracAddResult_farPath_uid94_fpAddSubTest_ieeeAdd_q(26 downto 0);
    fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd_b <= fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd_in(26 downto 0);

	--normBits_farPath_uid96_fpAddSubTest_ieeeAdd(BITSELECT,95)@2
    normBits_farPath_uid96_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd_b;
    normBits_farPath_uid96_fpAddSubTest_ieeeAdd_b <= normBits_farPath_uid96_fpAddSubTest_ieeeAdd_in(26 downto 25);

	--countValue_farPath_uid106_fpAddSubTest_ieeeAdd(MUX,105)@2
    countValue_farPath_uid106_fpAddSubTest_ieeeAdd_s <= normBits_farPath_uid96_fpAddSubTest_ieeeAdd_b;
    countValue_farPath_uid106_fpAddSubTest_ieeeAdd: PROCESS (countValue_farPath_uid106_fpAddSubTest_ieeeAdd_s)
    BEGIN
            CASE countValue_farPath_uid106_fpAddSubTest_ieeeAdd_s IS
                  WHEN "00" => countValue_farPath_uid106_fpAddSubTest_ieeeAdd_q <= countValue_farPath00_uid105_fpAddSubTest_ieeeAdd_q;
                  WHEN "01" => countValue_farPath_uid106_fpAddSubTest_ieeeAdd_q <= countValue_farPath01_uid104_fpAddSubTest_ieeeAdd_q;
                  WHEN "10" => countValue_farPath_uid106_fpAddSubTest_ieeeAdd_q <= countValue_farPath11_uid102_fpAddSubTest_ieeeAdd_q;
                  WHEN "11" => countValue_farPath_uid106_fpAddSubTest_ieeeAdd_q <= countValue_farPath11_uid102_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => countValue_farPath_uid106_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_closePath_uid69_fpAddSubTest_ieeeAdd_b(DELAY,328)@0
    ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_closePath_uid69_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => effSub_uid58_fpAddSubTest_ieeeAdd_q, xout => ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_closePath_uid69_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--oWE_uid67_fpAddSubTest_ieeeAdd(CONSTANT,66)
    oWE_uid67_fpAddSubTest_ieeeAdd_q <= "000000001";

	--closePathA_uid68_fpAddSubTest_ieeeAdd(COMPARE,67)@0
    closePathA_uid68_fpAddSubTest_ieeeAdd_cin <= GND_q;
    closePathA_uid68_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR((10 downto 9 => oWE_uid67_fpAddSubTest_ieeeAdd_q(8)) & oWE_uid67_fpAddSubTest_ieeeAdd_q) & '0';
    closePathA_uid68_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR((10 downto 9 => expAmExpB_uid66_fpAddSubTest_ieeeAdd_q(8)) & expAmExpB_uid66_fpAddSubTest_ieeeAdd_q) & closePathA_uid68_fpAddSubTest_ieeeAdd_cin(0);
            closePathA_uid68_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(SIGNED(closePathA_uid68_fpAddSubTest_ieeeAdd_a) - SIGNED(closePathA_uid68_fpAddSubTest_ieeeAdd_b));
    closePathA_uid68_fpAddSubTest_ieeeAdd_n(0) <= not closePathA_uid68_fpAddSubTest_ieeeAdd_o(11);


	--ld_closePathA_uid68_fpAddSubTest_ieeeAdd_n_to_closePath_uid69_fpAddSubTest_ieeeAdd_a(DELAY,327)@0
    ld_closePathA_uid68_fpAddSubTest_ieeeAdd_n_to_closePath_uid69_fpAddSubTest_ieeeAdd_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => closePathA_uid68_fpAddSubTest_ieeeAdd_n, xout => ld_closePathA_uid68_fpAddSubTest_ieeeAdd_n_to_closePath_uid69_fpAddSubTest_ieeeAdd_a_q, clk => clk, aclr => areset );

	--closePath_uid69_fpAddSubTest_ieeeAdd(LOGICAL,68)@2
    closePath_uid69_fpAddSubTest_ieeeAdd_a <= ld_closePathA_uid68_fpAddSubTest_ieeeAdd_n_to_closePath_uid69_fpAddSubTest_ieeeAdd_a_q;
    closePath_uid69_fpAddSubTest_ieeeAdd_b <= ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_closePath_uid69_fpAddSubTest_ieeeAdd_b_q;
    closePath_uid69_fpAddSubTest_ieeeAdd_q <= closePath_uid69_fpAddSubTest_ieeeAdd_a and closePath_uid69_fpAddSubTest_ieeeAdd_b;

	--countValue_uid107_fpAddSubTest_ieeeAdd(MUX,106)@2
    countValue_uid107_fpAddSubTest_ieeeAdd_s <= closePath_uid69_fpAddSubTest_ieeeAdd_q;
    countValue_uid107_fpAddSubTest_ieeeAdd: PROCESS (countValue_uid107_fpAddSubTest_ieeeAdd_s, countValue_farPath_uid106_fpAddSubTest_ieeeAdd_q, r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q)
    BEGIN
            CASE countValue_uid107_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => countValue_uid107_fpAddSubTest_ieeeAdd_q <= countValue_farPath_uid106_fpAddSubTest_ieeeAdd_q;
                  WHEN "1" => countValue_uid107_fpAddSubTest_ieeeAdd_q <= r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => countValue_uid107_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--ld_exp_uid23_fpAddSubTest_ieeeAdd_b_to_expInc_uid109_fpAddSubTest_ieeeAdd_a(DELAY,372)@0
    ld_exp_uid23_fpAddSubTest_ieeeAdd_b_to_expInc_uid109_fpAddSubTest_ieeeAdd_a : dspba_delay
    GENERIC MAP ( width => 8, depth => 2 )
    PORT MAP ( xin => exp_uid23_fpAddSubTest_ieeeAdd_b, xout => ld_exp_uid23_fpAddSubTest_ieeeAdd_b_to_expInc_uid109_fpAddSubTest_ieeeAdd_a_q, clk => clk, aclr => areset );

	--expInc_uid109_fpAddSubTest_ieeeAdd(ADD,108)@2
    expInc_uid109_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("0" & ld_exp_uid23_fpAddSubTest_ieeeAdd_b_to_expInc_uid109_fpAddSubTest_ieeeAdd_a_q);
    expInc_uid109_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("00000000" & VCC_q);
            expInc_uid109_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(expInc_uid109_fpAddSubTest_ieeeAdd_a) + UNSIGNED(expInc_uid109_fpAddSubTest_ieeeAdd_b));
    expInc_uid109_fpAddSubTest_ieeeAdd_q <= expInc_uid109_fpAddSubTest_ieeeAdd_o(8 downto 0);


	--expPostNorm_uid110_fpAddSubTest_ieeeAdd(SUB,109)@2
    expPostNorm_uid110_fpAddSubTest_ieeeAdd_a <= STD_LOGIC_VECTOR("0" & expInc_uid109_fpAddSubTest_ieeeAdd_q);
    expPostNorm_uid110_fpAddSubTest_ieeeAdd_b <= STD_LOGIC_VECTOR("00000" & countValue_uid107_fpAddSubTest_ieeeAdd_q);
            expPostNorm_uid110_fpAddSubTest_ieeeAdd_o <= STD_LOGIC_VECTOR(UNSIGNED(expPostNorm_uid110_fpAddSubTest_ieeeAdd_a) - UNSIGNED(expPostNorm_uid110_fpAddSubTest_ieeeAdd_b));
    expPostNorm_uid110_fpAddSubTest_ieeeAdd_q <= expPostNorm_uid110_fpAddSubTest_ieeeAdd_o(9 downto 0);


	--LeftShiftStage023dto0_uid210_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,209)@2
    LeftShiftStage023dto0_uid210_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q(23 downto 0);
    LeftShiftStage023dto0_uid210_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= LeftShiftStage023dto0_uid210_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(23 downto 0);

	--leftShiftStage1Idx3_uid211_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITJOIN,210)@2
    leftShiftStage1Idx3_uid211_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= LeftShiftStage023dto0_uid210_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b & leftShiftStage1Idx3Pad3_uid209_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;

	--LeftShiftStage024dto0_uid207_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,206)@2
    LeftShiftStage024dto0_uid207_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q(24 downto 0);
    LeftShiftStage024dto0_uid207_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= LeftShiftStage024dto0_uid207_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(24 downto 0);

	--leftShiftStage1Idx2_uid208_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITJOIN,207)@2
    leftShiftStage1Idx2_uid208_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= LeftShiftStage024dto0_uid207_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b & zs_uid170_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;

	--LeftShiftStage025dto0_uid204_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,203)@2
    LeftShiftStage025dto0_uid204_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q(25 downto 0);
    LeftShiftStage025dto0_uid204_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= LeftShiftStage025dto0_uid204_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(25 downto 0);

	--leftShiftStage1Idx1_uid205_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITJOIN,204)@2
    leftShiftStage1Idx1_uid205_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= LeftShiftStage025dto0_uid204_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b & GND_q;

	--X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,197)@1
    X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b(2 downto 0);
    X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(2 downto 0);

	--ld_X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b(DELAY,485)@1
    ld_X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 3, depth => 1 )
    PORT MAP ( xin => X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b, xout => ld_X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITJOIN,198)@2
    leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= ld_X2dto0_uid198_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q & leftShiftStage0Idx6Pad24_uid197_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;

	--X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,194)@1
    X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b(6 downto 0);
    X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(6 downto 0);

	--ld_X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b(DELAY,483)@1
    ld_X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 7, depth => 1 )
    PORT MAP ( xin => X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b, xout => ld_X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITJOIN,195)@2
    leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= ld_X6dto0_uid195_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q & leftShiftStage0Idx5Pad20_uid194_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;

	--ld_vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b(DELAY,481)@1
    ld_vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 11, depth => 1 )
    PORT MAP ( xin => vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b, xout => ld_vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITJOIN,192)@2
    leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= ld_vStage_uid154_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q & zs_uid150_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;

	--X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,188)@1
    X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b(14 downto 0);
    X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(14 downto 0);

	--ld_X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b(DELAY,480)@1
    ld_X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 15, depth => 1 )
    PORT MAP ( xin => X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b, xout => ld_X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITJOIN,189)@2
    leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= ld_X14dto0_uid189_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q & leftShiftStage0Idx3Pad12_uid188_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;

	--X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,185)@1
    X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b(18 downto 0);
    X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(18 downto 0);

	--ld_X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b(DELAY,478)@1
    ld_X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 19, depth => 1 )
    PORT MAP ( xin => X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b, xout => ld_X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITJOIN,186)@2
    leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= ld_X18dto0_uid186_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q & cstAllZWE_uid22_fpAddSubTest_ieeeAdd_q;

	--X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,182)@1
    X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b(22 downto 0);
    X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(22 downto 0);

	--ld_X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b(DELAY,476)@1
    ld_X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b, xout => ld_X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITJOIN,183)@2
    leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= ld_X22dto0_uid183_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b_q & zs_uid164_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;

	--ld_fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_c(DELAY,488)@1
    ld_fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_c : dspba_delay
    GENERIC MAP ( width => 27, depth => 1 )
    PORT MAP ( xin => fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b, xout => ld_fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_c_q, clk => clk, aclr => areset );

	--leftShiftStageSel4Dto2_uid201_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,200)@2
    leftShiftStageSel4Dto2_uid201_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q;
    leftShiftStageSel4Dto2_uid201_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= leftShiftStageSel4Dto2_uid201_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(4 downto 2);

	--leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(MUX,201)@2
    leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_s <= leftShiftStageSel4Dto2_uid201_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b;
    leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd: PROCESS (leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_s, ld_fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_c_q, leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q, leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q, leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q, leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q, leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q, leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q)
    BEGIN
            CASE leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_s IS
                  WHEN "000" => leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= ld_fracAddResultNoSignExt_closePath_uid82_fpAddSubTest_ieeeAdd_b_to_leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_c_q;
                  WHEN "001" => leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx1_uid184_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN "010" => leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx2_uid187_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN "011" => leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx3_uid190_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN "100" => leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx4_uid193_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN "101" => leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx5_uid196_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN "110" => leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx6_uid199_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN "111" => leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage0Idx7_uid200_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--leftShiftStageSel1Dto0_uid212_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(BITSELECT,211)@2
    leftShiftStageSel1Dto0_uid212_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in <= r_uid179_countValue_closePath_uid83_fpAddSubTest_ieeeAdd_q(1 downto 0);
    leftShiftStageSel1Dto0_uid212_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b <= leftShiftStageSel1Dto0_uid212_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_in(1 downto 0);

	--leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd(MUX,212)@2
    leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_s <= leftShiftStageSel1Dto0_uid212_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_b;
    leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd: PROCESS (leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_s, leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q, leftShiftStage1Idx1_uid205_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q, leftShiftStage1Idx2_uid208_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q, leftShiftStage1Idx3_uid211_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q)
    BEGIN
            CASE leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_s IS
                  WHEN "00" => leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage0_uid202_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN "01" => leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage1Idx1_uid205_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN "10" => leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage1Idx2_uid208_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN "11" => leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= leftShiftStage1Idx3_uid211_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracPostNorm_closePath_uid85_fpAddSubTest_ieeeAdd(BITSELECT,84)@2
    fracPostNorm_closePath_uid85_fpAddSubTest_ieeeAdd_in <= leftShiftStage1_uid213_fracPostNorm_closePathExt_uid84_fpAddSubTest_ieeeAdd_q(25 downto 0);
    fracPostNorm_closePath_uid85_fpAddSubTest_ieeeAdd_b <= fracPostNorm_closePath_uid85_fpAddSubTest_ieeeAdd_in(25 downto 2);

	--fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd(BITSELECT,96)@2
    fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd_b(25 downto 0);
    fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd_b <= fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd_in(25 downto 2);

	--fracPostNorm_farPath01_uid99_fpAddSubTest_ieeeAdd(BITSELECT,98)@2
    fracPostNorm_farPath01_uid99_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd_b(24 downto 0);
    fracPostNorm_farPath01_uid99_fpAddSubTest_ieeeAdd_b <= fracPostNorm_farPath01_uid99_fpAddSubTest_ieeeAdd_in(24 downto 1);

	--fracPostNorm_farPath00_uid100_fpAddSubTest_ieeeAdd(BITSELECT,99)@2
    fracPostNorm_farPath00_uid100_fpAddSubTest_ieeeAdd_in <= fracAddResultNoSignExt_farPath_uid95_fpAddSubTest_ieeeAdd_b(23 downto 0);
    fracPostNorm_farPath00_uid100_fpAddSubTest_ieeeAdd_b <= fracPostNorm_farPath00_uid100_fpAddSubTest_ieeeAdd_in(23 downto 0);

	--fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd(MUX,100)@2
    fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_s <= normBits_farPath_uid96_fpAddSubTest_ieeeAdd_b;
    fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd: PROCESS (fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_s, fracPostNorm_farPath00_uid100_fpAddSubTest_ieeeAdd_b, fracPostNorm_farPath01_uid99_fpAddSubTest_ieeeAdd_b, fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd_b, fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd_b)
    BEGIN
            CASE fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_s IS
                  WHEN "00" => fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_q <= fracPostNorm_farPath00_uid100_fpAddSubTest_ieeeAdd_b;
                  WHEN "01" => fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_q <= fracPostNorm_farPath01_uid99_fpAddSubTest_ieeeAdd_b;
                  WHEN "10" => fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_q <= fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd_b;
                  WHEN "11" => fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_q <= fracPostNorm_farPath11_uid97_fpAddSubTest_ieeeAdd_b;
                  WHEN OTHERS => fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracPostNorm_uid108_fpAddSubTest_ieeeAdd(MUX,107)@2
    fracPostNorm_uid108_fpAddSubTest_ieeeAdd_s <= closePath_uid69_fpAddSubTest_ieeeAdd_q;
    fracPostNorm_uid108_fpAddSubTest_ieeeAdd: PROCESS (fracPostNorm_uid108_fpAddSubTest_ieeeAdd_s, fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_q, fracPostNorm_closePath_uid85_fpAddSubTest_ieeeAdd_b)
    BEGIN
            CASE fracPostNorm_uid108_fpAddSubTest_ieeeAdd_s IS
                  WHEN "0" => fracPostNorm_uid108_fpAddSubTest_ieeeAdd_q <= fracPostNorm_farPath_uid101_fpAddSubTest_ieeeAdd_q;
                  WHEN "1" => fracPostNorm_uid108_fpAddSubTest_ieeeAdd_q <= fracPostNorm_closePath_uid85_fpAddSubTest_ieeeAdd_b;
                  WHEN OTHERS => fracPostNorm_uid108_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracR_uid111_fpAddSubTest_ieeeAdd(BITJOIN,110)@2
    expFracR_uid111_fpAddSubTest_ieeeAdd_q <= expPostNorm_uid110_fpAddSubTest_ieeeAdd_q & fracPostNorm_uid108_fpAddSubTest_ieeeAdd_q;

	--expRPreExc_uid117_fpAddSubTest_ieeeAdd(BITSELECT,116)@2
    expRPreExc_uid117_fpAddSubTest_ieeeAdd_in <= expFracR_uid111_fpAddSubTest_ieeeAdd_q(31 downto 0);
    expRPreExc_uid117_fpAddSubTest_ieeeAdd_b <= expRPreExc_uid117_fpAddSubTest_ieeeAdd_in(31 downto 24);

	--ld_expRPreExc_uid117_fpAddSubTest_ieeeAdd_b_to_expRPostExc_uid147_fpAddSubTest_ieeeAdd_d(DELAY,439)@2
    ld_expRPreExc_uid117_fpAddSubTest_ieeeAdd_b_to_expRPostExc_uid147_fpAddSubTest_ieeeAdd_d : dspba_delay
    GENERIC MAP ( width => 8, depth => 1 )
    PORT MAP ( xin => expRPreExc_uid117_fpAddSubTest_ieeeAdd_b, xout => ld_expRPreExc_uid117_fpAddSubTest_ieeeAdd_b_to_expRPostExc_uid147_fpAddSubTest_ieeeAdd_d_q, clk => clk, aclr => areset );

	--ld_excRNaN_uid126_fpAddSubTest_ieeeAdd_q_to_concExc_uid127_fpAddSubTest_ieeeAdd_c(DELAY,408)@0
    ld_excRNaN_uid126_fpAddSubTest_ieeeAdd_q_to_concExc_uid127_fpAddSubTest_ieeeAdd_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => excRNaN_uid126_fpAddSubTest_ieeeAdd_q, xout => ld_excRNaN_uid126_fpAddSubTest_ieeeAdd_q_to_concExc_uid127_fpAddSubTest_ieeeAdd_c_q, clk => clk, aclr => areset );

	--wEP2AllOwE_uid112_fpAddSubTest_ieeeAdd(CONSTANT,111)
    wEP2AllOwE_uid112_fpAddSubTest_ieeeAdd_q <= "0011111111";

	--rndExp_uid113_fpAddSubTest_ieeeAdd(BITSELECT,112)@2
    rndExp_uid113_fpAddSubTest_ieeeAdd_in <= expFracR_uid111_fpAddSubTest_ieeeAdd_q;
    rndExp_uid113_fpAddSubTest_ieeeAdd_b <= rndExp_uid113_fpAddSubTest_ieeeAdd_in(33 downto 24);

	--rOvf_uid114_fpAddSubTest_ieeeAdd(LOGICAL,113)@2
    rOvf_uid114_fpAddSubTest_ieeeAdd_a <= rndExp_uid113_fpAddSubTest_ieeeAdd_b;
    rOvf_uid114_fpAddSubTest_ieeeAdd_b <= wEP2AllOwE_uid112_fpAddSubTest_ieeeAdd_q;
    rOvf_uid114_fpAddSubTest_ieeeAdd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rOvf_uid114_fpAddSubTest_ieeeAdd_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1' AND VCC_q = "1") THEN
            IF (rOvf_uid114_fpAddSubTest_ieeeAdd_a = rOvf_uid114_fpAddSubTest_ieeeAdd_b) THEN
                rOvf_uid114_fpAddSubTest_ieeeAdd_q <= "1";
            ELSE
                rOvf_uid114_fpAddSubTest_ieeeAdd_q <= "0";
            END IF;
        END IF;
    END PROCESS;



	--regInputs_uid118_fpAddSubTest_ieeeAdd(LOGICAL,117)@0
    regInputs_uid118_fpAddSubTest_ieeeAdd_a <= exc_R_uid35_fpAddSubTest_ieeeAdd_q;
    regInputs_uid118_fpAddSubTest_ieeeAdd_b <= exc_R_uid51_fpAddSubTest_ieeeAdd_q;
    regInputs_uid118_fpAddSubTest_ieeeAdd_q <= regInputs_uid118_fpAddSubTest_ieeeAdd_a and regInputs_uid118_fpAddSubTest_ieeeAdd_b;

	--reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1(REG,261)@0
    reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1_q <= "0";
        ELSIF rising_edge(clk) THEN
            reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1_q <= regInputs_uid118_fpAddSubTest_ieeeAdd_q;
        END IF;
    END PROCESS;


	--ld_reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1_q_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_a(DELAY,390)@1
    ld_reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1_q_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1_q, xout => ld_reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1_q_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_a_q, clk => clk, aclr => areset );

	--rInfOvf_uid121_fpAddSubTest_ieeeAdd(LOGICAL,120)@3
    rInfOvf_uid121_fpAddSubTest_ieeeAdd_a <= ld_reg_regInputs_uid118_fpAddSubTest_ieeeAdd_0_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_1_q_to_rInfOvf_uid121_fpAddSubTest_ieeeAdd_a_q;
    rInfOvf_uid121_fpAddSubTest_ieeeAdd_b <= rOvf_uid114_fpAddSubTest_ieeeAdd_q;
    rInfOvf_uid121_fpAddSubTest_ieeeAdd_q <= rInfOvf_uid121_fpAddSubTest_ieeeAdd_a and rInfOvf_uid121_fpAddSubTest_ieeeAdd_b;

	--ld_exc_N_uid47_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_e(DELAY,396)@0
    ld_exc_N_uid47_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => exc_N_uid47_fpAddSubTest_ieeeAdd_q, xout => ld_exc_N_uid47_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_e_q, clk => clk, aclr => areset );

	--ld_exc_N_uid31_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_d(DELAY,395)@0
    ld_exc_N_uid31_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_d : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => exc_N_uid31_fpAddSubTest_ieeeAdd_q, xout => ld_exc_N_uid31_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_d_q, clk => clk, aclr => areset );

	--ld_exc_I_uid45_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_c(DELAY,394)@0
    ld_exc_I_uid45_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => exc_I_uid45_fpAddSubTest_ieeeAdd_q, xout => ld_exc_I_uid45_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_c_q, clk => clk, aclr => areset );

	--ld_exc_I_uid29_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_b(DELAY,393)@0
    ld_exc_I_uid29_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => exc_I_uid29_fpAddSubTest_ieeeAdd_q, xout => ld_exc_I_uid29_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_a(DELAY,392)@0
    ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 3 )
    PORT MAP ( xin => effSub_uid58_fpAddSubTest_ieeeAdd_q, xout => ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_a_q, clk => clk, aclr => areset );

	--excRInfVInC_uid122_fpAddSubTest_ieeeAdd(BITJOIN,121)@3
    excRInfVInC_uid122_fpAddSubTest_ieeeAdd_q <= rInfOvf_uid121_fpAddSubTest_ieeeAdd_q & ld_exc_N_uid47_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_e_q & ld_exc_N_uid31_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_d_q & ld_exc_I_uid45_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_c_q & ld_exc_I_uid29_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_b_q & ld_effSub_uid58_fpAddSubTest_ieeeAdd_q_to_excRInfVInC_uid122_fpAddSubTest_ieeeAdd_a_q;

	--excRInf_uid123_fpAddSubTest_ieeeAdd(LOOKUP,122)@3
    excRInf_uid123_fpAddSubTest_ieeeAdd: PROCESS (excRInfVInC_uid122_fpAddSubTest_ieeeAdd_q)
    BEGIN
        -- Begin reserved scope level
            CASE (excRInfVInC_uid122_fpAddSubTest_ieeeAdd_q) IS
                WHEN "000000" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "000001" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "000010" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "000011" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "000100" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "000101" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "000110" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "000111" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "001000" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "001001" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "001010" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "001011" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "001100" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "001101" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "001110" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "001111" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "010000" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "010001" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "010010" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "010011" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "010100" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "010101" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "010110" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "010111" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "011000" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "011001" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "011010" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "011011" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "011100" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "011101" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "011110" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "011111" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "100000" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "100001" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "100010" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "100011" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "100100" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "100101" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "100110" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "100111" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "101000" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "101001" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "101010" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "101011" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "101100" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "101101" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "101110" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "101111" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "110000" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "110001" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "110010" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "110011" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "110100" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "110101" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "110110" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "110111" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "111000" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "111001" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "111010" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "111011" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "111100" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "111101" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "111110" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "111111" =>  excRInf_uid123_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN OTHERS =>
                    excRInf_uid123_fpAddSubTest_ieeeAdd_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--rUdf_uid115_fpAddSubTest_ieeeAdd(BITSELECT,114)@2
    rUdf_uid115_fpAddSubTest_ieeeAdd_in <= expFracR_uid111_fpAddSubTest_ieeeAdd_q;
    rUdf_uid115_fpAddSubTest_ieeeAdd_b <= rUdf_uid115_fpAddSubTest_ieeeAdd_in(33 downto 33);

	--ld_regInputs_uid118_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_c(DELAY,386)@0
    ld_regInputs_uid118_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => regInputs_uid118_fpAddSubTest_ieeeAdd_q, xout => ld_regInputs_uid118_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_c_q, clk => clk, aclr => areset );

	--ld_expXIsZero_uid40_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_b(DELAY,385)@0
    ld_expXIsZero_uid40_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_b : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => expXIsZero_uid40_fpAddSubTest_ieeeAdd_q, xout => ld_expXIsZero_uid40_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_b_q, clk => clk, aclr => areset );

	--ld_expXIsZero_uid24_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_a(DELAY,384)@0
    ld_expXIsZero_uid24_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => expXIsZero_uid24_fpAddSubTest_ieeeAdd_q, xout => ld_expXIsZero_uid24_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_a_q, clk => clk, aclr => areset );

	--excRZeroVInC_uid119_fpAddSubTest_ieeeAdd(BITJOIN,118)@2
    excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_q <= aMinusA_uid87_fpAddSubTest_ieeeAdd_q & rUdf_uid115_fpAddSubTest_ieeeAdd_b & ld_regInputs_uid118_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_c_q & ld_expXIsZero_uid40_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_b_q & ld_expXIsZero_uid24_fpAddSubTest_ieeeAdd_q_to_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_a_q;

	--reg_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_0_to_excRZero_uid120_fpAddSubTest_ieeeAdd_0(REG,260)@2
    reg_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_0_to_excRZero_uid120_fpAddSubTest_ieeeAdd_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_0_to_excRZero_uid120_fpAddSubTest_ieeeAdd_0_q <= "00000";
        ELSIF rising_edge(clk) THEN
            reg_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_0_to_excRZero_uid120_fpAddSubTest_ieeeAdd_0_q <= excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_q;
        END IF;
    END PROCESS;


	--excRZero_uid120_fpAddSubTest_ieeeAdd(LOOKUP,119)@3
    excRZero_uid120_fpAddSubTest_ieeeAdd: PROCESS (reg_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_0_to_excRZero_uid120_fpAddSubTest_ieeeAdd_0_q)
    BEGIN
        -- Begin reserved scope level
            CASE (reg_excRZeroVInC_uid119_fpAddSubTest_ieeeAdd_0_to_excRZero_uid120_fpAddSubTest_ieeeAdd_0_q) IS
                WHEN "00000" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "00001" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "00010" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "00011" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "00100" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "00101" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "00110" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "00111" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "01000" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "01001" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "01010" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "01011" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "01100" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "01101" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "01110" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "01111" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "10000" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "10001" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "10010" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "10011" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "10100" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "10101" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "10110" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "10111" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "11000" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "11001" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "11010" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "11011" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "11100" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "1";
                WHEN "11101" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "11110" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN "11111" =>  excRZero_uid120_fpAddSubTest_ieeeAdd_q <= "0";
                WHEN OTHERS =>
                    excRZero_uid120_fpAddSubTest_ieeeAdd_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--concExc_uid127_fpAddSubTest_ieeeAdd(BITJOIN,126)@3
    concExc_uid127_fpAddSubTest_ieeeAdd_q <= ld_excRNaN_uid126_fpAddSubTest_ieeeAdd_q_to_concExc_uid127_fpAddSubTest_ieeeAdd_c_q & excRInf_uid123_fpAddSubTest_ieeeAdd_q & excRZero_uid120_fpAddSubTest_ieeeAdd_q;

	--excREnc_uid128_fpAddSubTest_ieeeAdd(LOOKUP,127)@3
    excREnc_uid128_fpAddSubTest_ieeeAdd: PROCESS (concExc_uid127_fpAddSubTest_ieeeAdd_q)
    BEGIN
        -- Begin reserved scope level
            CASE (concExc_uid127_fpAddSubTest_ieeeAdd_q) IS
                WHEN "000" =>  excREnc_uid128_fpAddSubTest_ieeeAdd_q <= "01";
                WHEN "001" =>  excREnc_uid128_fpAddSubTest_ieeeAdd_q <= "00";
                WHEN "010" =>  excREnc_uid128_fpAddSubTest_ieeeAdd_q <= "10";
                WHEN "011" =>  excREnc_uid128_fpAddSubTest_ieeeAdd_q <= "10";
                WHEN "100" =>  excREnc_uid128_fpAddSubTest_ieeeAdd_q <= "11";
                WHEN "101" =>  excREnc_uid128_fpAddSubTest_ieeeAdd_q <= "11";
                WHEN "110" =>  excREnc_uid128_fpAddSubTest_ieeeAdd_q <= "11";
                WHEN "111" =>  excREnc_uid128_fpAddSubTest_ieeeAdd_q <= "11";
                WHEN OTHERS =>
                    excREnc_uid128_fpAddSubTest_ieeeAdd_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--expRPostExc_uid147_fpAddSubTest_ieeeAdd(MUX,146)@3
    expRPostExc_uid147_fpAddSubTest_ieeeAdd_s <= excREnc_uid128_fpAddSubTest_ieeeAdd_q;
    expRPostExc_uid147_fpAddSubTest_ieeeAdd: PROCESS (expRPostExc_uid147_fpAddSubTest_ieeeAdd_s, ld_expRPreExc_uid117_fpAddSubTest_ieeeAdd_b_to_expRPostExc_uid147_fpAddSubTest_ieeeAdd_d_q)
    BEGIN
            CASE expRPostExc_uid147_fpAddSubTest_ieeeAdd_s IS
                  WHEN "00" => expRPostExc_uid147_fpAddSubTest_ieeeAdd_q <= cstAllZWE_uid22_fpAddSubTest_ieeeAdd_q;
                  WHEN "01" => expRPostExc_uid147_fpAddSubTest_ieeeAdd_q <= ld_expRPreExc_uid117_fpAddSubTest_ieeeAdd_b_to_expRPostExc_uid147_fpAddSubTest_ieeeAdd_d_q;
                  WHEN "10" => expRPostExc_uid147_fpAddSubTest_ieeeAdd_q <= cstAllOWE_uid20_fpAddSubTest_ieeeAdd_q;
                  WHEN "11" => expRPostExc_uid147_fpAddSubTest_ieeeAdd_q <= cstAllOWE_uid20_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => expRPostExc_uid147_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneFracRPostExc2_uid140_fpAddSubTest_ieeeAdd(CONSTANT,139)
    oneFracRPostExc2_uid140_fpAddSubTest_ieeeAdd_q <= "00000000000000000000001";

	--fracRPreExc_uid116_fpAddSubTest_ieeeAdd(BITSELECT,115)@2
    fracRPreExc_uid116_fpAddSubTest_ieeeAdd_in <= expFracR_uid111_fpAddSubTest_ieeeAdd_q(23 downto 0);
    fracRPreExc_uid116_fpAddSubTest_ieeeAdd_b <= fracRPreExc_uid116_fpAddSubTest_ieeeAdd_in(23 downto 1);

	--ld_fracRPreExc_uid116_fpAddSubTest_ieeeAdd_b_to_fracRPostExc_uid143_fpAddSubTest_ieeeAdd_d(DELAY,437)@2
    ld_fracRPreExc_uid116_fpAddSubTest_ieeeAdd_b_to_fracRPostExc_uid143_fpAddSubTest_ieeeAdd_d : dspba_delay
    GENERIC MAP ( width => 23, depth => 1 )
    PORT MAP ( xin => fracRPreExc_uid116_fpAddSubTest_ieeeAdd_b, xout => ld_fracRPreExc_uid116_fpAddSubTest_ieeeAdd_b_to_fracRPostExc_uid143_fpAddSubTest_ieeeAdd_d_q, clk => clk, aclr => areset );

	--fracRPostExc_uid143_fpAddSubTest_ieeeAdd(MUX,142)@3
    fracRPostExc_uid143_fpAddSubTest_ieeeAdd_s <= excREnc_uid128_fpAddSubTest_ieeeAdd_q;
    fracRPostExc_uid143_fpAddSubTest_ieeeAdd: PROCESS (fracRPostExc_uid143_fpAddSubTest_ieeeAdd_s, ld_fracRPreExc_uid116_fpAddSubTest_ieeeAdd_b_to_fracRPostExc_uid143_fpAddSubTest_ieeeAdd_d_q)
    BEGIN
            CASE fracRPostExc_uid143_fpAddSubTest_ieeeAdd_s IS
                  WHEN "00" => fracRPostExc_uid143_fpAddSubTest_ieeeAdd_q <= cstAllZWF_uid21_fpAddSubTest_ieeeAdd_q;
                  WHEN "01" => fracRPostExc_uid143_fpAddSubTest_ieeeAdd_q <= ld_fracRPreExc_uid116_fpAddSubTest_ieeeAdd_b_to_fracRPostExc_uid143_fpAddSubTest_ieeeAdd_d_q;
                  WHEN "10" => fracRPostExc_uid143_fpAddSubTest_ieeeAdd_q <= cstAllZWF_uid21_fpAddSubTest_ieeeAdd_q;
                  WHEN "11" => fracRPostExc_uid143_fpAddSubTest_ieeeAdd_q <= oneFracRPostExc2_uid140_fpAddSubTest_ieeeAdd_q;
                  WHEN OTHERS => fracRPostExc_uid143_fpAddSubTest_ieeeAdd_q <= (others => '0');
            END CASE;
    END PROCESS;


	--R_uid148_fpAddSubTest_ieeeAdd(BITJOIN,147)@3
    R_uid148_fpAddSubTest_ieeeAdd_q <= ld_signRPostExc_uid139_fpAddSubTest_ieeeAdd_q_to_R_uid148_fpAddSubTest_ieeeAdd_c_q & expRPostExc_uid147_fpAddSubTest_ieeeAdd_q & fracRPostExc_uid143_fpAddSubTest_ieeeAdd_q;

	--xOut(PORTOUT,4)@3
    r <= R_uid148_fpAddSubTest_ieeeAdd_q;
end normal;
