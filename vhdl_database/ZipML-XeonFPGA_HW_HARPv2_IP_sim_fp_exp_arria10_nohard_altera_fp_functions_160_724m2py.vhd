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

-- VHDL created from fp_exp_arria10_nohard_altera_fp_functions_160_724m2py
-- VHDL created on Wed Oct 10 12:42:51 2018


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

entity fp_exp_arria10_nohard_altera_fp_functions_160_724m2py is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_exp_arria10_nohard_altera_fp_functions_160_724m2py;

architecture normal of fp_exp_arria10_nohard_altera_fp_functions_160_724m2py is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBias_uid9_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWE_uid14_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWEP1_uid15_fpExpETest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal cstBiasPWE_uid16_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllOWE_uid17_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid18_fpExpETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid24_fpExpETest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid24_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid24_fpExpETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid24_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_fpExpETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid26_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_fpExpETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid27_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid30_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid30_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid30_fpExpETest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid30_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasPWE_uid31_fpExpETest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftVal_uid45_fpExpETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftVal_uid45_fpExpETest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal zY_uid66_fpExpETest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expRPostBiasPreExc_uid76_fpExpETest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal expRPostBiasPreExc_uid76_fpExpETest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal expRPostBiasPreExc_uid76_fpExpETest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal expRPostBiasPreExc_uid76_fpExpETest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal oneFracRPostExc2_uid96_fpExpETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_a : STD_LOGIC_VECTOR (36 downto 0);
    signal lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_o : STD_LOGIC_VECTOR (36 downto 0);
    signal lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal memoryC0_uid185_expTables_q : STD_LOGIC_VECTOR (28 downto 0);
    signal wIntCst_uid218_fxpInPostAlign_uid47_fpExpETest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal r_uid242_fxpInPostAlign_uid47_fpExpETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid242_fxpInPostAlign_uid47_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    type prodXY_uid210_pT1_uid198_invPolyEval_cma_atype is array(0 to 0) of UNSIGNED(13 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_a0 : prodXY_uid210_pT1_uid198_invPolyEval_cma_atype;
    attribute preserve : boolean;
    attribute preserve of prodXY_uid210_pT1_uid198_invPolyEval_cma_a0 : signal is true;
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_a1 : prodXY_uid210_pT1_uid198_invPolyEval_cma_atype;
    attribute preserve of prodXY_uid210_pT1_uid198_invPolyEval_cma_a1 : signal is true;
    type prodXY_uid210_pT1_uid198_invPolyEval_cma_ctype is array(0 to 0) of SIGNED(13 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_c0 : prodXY_uid210_pT1_uid198_invPolyEval_cma_ctype;
    attribute preserve of prodXY_uid210_pT1_uid198_invPolyEval_cma_c0 : signal is true;
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_c1 : prodXY_uid210_pT1_uid198_invPolyEval_cma_ctype;
    attribute preserve of prodXY_uid210_pT1_uid198_invPolyEval_cma_c1 : signal is true;
    type prodXY_uid210_pT1_uid198_invPolyEval_cma_ltype is array(0 to 0) of SIGNED(14 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_l : prodXY_uid210_pT1_uid198_invPolyEval_cma_ltype;
    type prodXY_uid210_pT1_uid198_invPolyEval_cma_ptype is array(0 to 0) of SIGNED(28 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_p : prodXY_uid210_pT1_uid198_invPolyEval_cma_ptype;
    type prodXY_uid210_pT1_uid198_invPolyEval_cma_utype is array(0 to 0) of SIGNED(28 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_u : prodXY_uid210_pT1_uid198_invPolyEval_cma_utype;
    type prodXY_uid210_pT1_uid198_invPolyEval_cma_wtype is array(0 to 0) of SIGNED(28 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_w : prodXY_uid210_pT1_uid198_invPolyEval_cma_wtype;
    type prodXY_uid210_pT1_uid198_invPolyEval_cma_xtype is array(0 to 0) of SIGNED(28 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_x : prodXY_uid210_pT1_uid198_invPolyEval_cma_xtype;
    type prodXY_uid210_pT1_uid198_invPolyEval_cma_ytype is array(0 to 0) of SIGNED(28 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_y : prodXY_uid210_pT1_uid198_invPolyEval_cma_ytype;
    type prodXY_uid210_pT1_uid198_invPolyEval_cma_stype is array(0 to 0) of SIGNED(28 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_s : prodXY_uid210_pT1_uid198_invPolyEval_cma_stype;
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_qq : STD_LOGIC_VECTOR (27 downto 0);
    signal prodXY_uid210_pT1_uid198_invPolyEval_cma_q : STD_LOGIC_VECTOR (27 downto 0);
    type prodXY_uid213_pT2_uid204_invPolyEval_cma_atype is array(0 to 0) of UNSIGNED(18 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_a0 : prodXY_uid213_pT2_uid204_invPolyEval_cma_atype;
    attribute preserve of prodXY_uid213_pT2_uid204_invPolyEval_cma_a0 : signal is true;
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_a1 : prodXY_uid213_pT2_uid204_invPolyEval_cma_atype;
    attribute preserve of prodXY_uid213_pT2_uid204_invPolyEval_cma_a1 : signal is true;
    type prodXY_uid213_pT2_uid204_invPolyEval_cma_ctype is array(0 to 0) of SIGNED(23 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_c0 : prodXY_uid213_pT2_uid204_invPolyEval_cma_ctype;
    attribute preserve of prodXY_uid213_pT2_uid204_invPolyEval_cma_c0 : signal is true;
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_c1 : prodXY_uid213_pT2_uid204_invPolyEval_cma_ctype;
    attribute preserve of prodXY_uid213_pT2_uid204_invPolyEval_cma_c1 : signal is true;
    type prodXY_uid213_pT2_uid204_invPolyEval_cma_ltype is array(0 to 0) of SIGNED(19 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_l : prodXY_uid213_pT2_uid204_invPolyEval_cma_ltype;
    type prodXY_uid213_pT2_uid204_invPolyEval_cma_ptype is array(0 to 0) of SIGNED(43 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_p : prodXY_uid213_pT2_uid204_invPolyEval_cma_ptype;
    type prodXY_uid213_pT2_uid204_invPolyEval_cma_utype is array(0 to 0) of SIGNED(43 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_u : prodXY_uid213_pT2_uid204_invPolyEval_cma_utype;
    type prodXY_uid213_pT2_uid204_invPolyEval_cma_wtype is array(0 to 0) of SIGNED(43 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_w : prodXY_uid213_pT2_uid204_invPolyEval_cma_wtype;
    type prodXY_uid213_pT2_uid204_invPolyEval_cma_xtype is array(0 to 0) of SIGNED(43 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_x : prodXY_uid213_pT2_uid204_invPolyEval_cma_xtype;
    type prodXY_uid213_pT2_uid204_invPolyEval_cma_ytype is array(0 to 0) of SIGNED(43 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_y : prodXY_uid213_pT2_uid204_invPolyEval_cma_ytype;
    type prodXY_uid213_pT2_uid204_invPolyEval_cma_stype is array(0 to 0) of SIGNED(43 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_s : prodXY_uid213_pT2_uid204_invPolyEval_cma_stype;
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_qq : STD_LOGIC_VECTOR (42 downto 0);
    signal prodXY_uid213_pT2_uid204_invPolyEval_cma_q : STD_LOGIC_VECTOR (42 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist6_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist7_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist9_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist10_q : STD_LOGIC_VECTOR (6 downto 0);
    signal redist11_q : STD_LOGIC_VECTOR (25 downto 0);
    signal redist12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist18_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_q : STD_LOGIC_VECTOR (7 downto 0);
    signal redist0_outputreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist0_mem_reset0 : std_logic;
    signal redist0_mem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal redist0_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_mem_iq : STD_LOGIC_VECTOR (10 downto 0);
    signal redist0_mem_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist0_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist0_rdcnt_i : signal is true;
    signal redist0_rdcnt_eq : std_logic;
    attribute preserve of redist0_rdcnt_eq : signal is true;
    signal redist0_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist0_mem_top_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist0_sticky_ena_q : signal is true;
    signal redist8_inputreg_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist8_mem_reset0 : std_logic;
    signal redist8_mem_ia : STD_LOGIC_VECTOR (18 downto 0);
    signal redist8_mem_aa : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_mem_ab : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_mem_iq : STD_LOGIC_VECTOR (18 downto 0);
    signal redist8_mem_q : STD_LOGIC_VECTOR (18 downto 0);
    signal redist8_rdcnt_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_rdcnt_i : UNSIGNED (0 downto 0);
    attribute preserve of redist8_rdcnt_i : signal is true;
    signal redist8_wraddr_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist8_sticky_ena_q : signal is true;
    signal expUdf_uid78_fpExpETest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expUdf_uid78_fpExpETest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expUdf_uid78_fpExpETest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expUdf_uid78_fpExpETest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid80_fpExpETest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal expOvf_uid80_fpExpETest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal expOvf_uid80_fpExpETest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal expOvf_uid80_fpExpETest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_o : STD_LOGIC_VECTOR (7 downto 0);
    signal shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracXZwE_uid52_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal excZ_x_uid22_fpExpETest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid22_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid22_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid23_fpExpETest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid23_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid23_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid25_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid25_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid28_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid28_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid29_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid29_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValuePreSat_uid41_fpExpETest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValuePreSat_uid41_fpExpETest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValuePreSat_uid41_fpExpETest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftValuePreSat_uid41_fpExpETest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal shiftUdf_uid43_fpExpETest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftUdf_uid43_fpExpETest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftUdf_uid43_fpExpETest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal shiftUdf_uid43_fpExpETest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal onesCmpFxpIn_uid53_fpExpETest_a : STD_LOGIC_VECTOR (33 downto 0);
    signal onesCmpFxpIn_uid53_fpExpETest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal onesCmpFxpIn_uid53_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal fxpInExt_uid54_fpExpETest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpInExt_uid54_fpExpETest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpInExt_uid54_fpExpETest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal fxpInExt_uid54_fpExpETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal yRedPostMux_uid68_fpExpETest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yRedPostMux_uid68_fpExpETest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal expRPostBiasPreExc0_uid75_fpExpETest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expRPostBiasPreExc0_uid75_fpExpETest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expRPostBiasPreExc0_uid75_fpExpETest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expRPostBiasPreExc0_uid75_fpExpETest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal negInf_uid82_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal negInf_uid82_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal negInf_uid82_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndNeg_uid83_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndNeg_uid83_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndNeg_uid83_fpExpETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndNeg_uid83_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpOvfInitial_uid84_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpOvfInitial_uid84_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndUdf_uid85_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndUdf_uid85_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndUdf_uid85_fpExpETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndUdf_uid85_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid86_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid86_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid86_fpExpETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid86_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid87_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignX_uid87_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndPos_uid88_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndPos_uid88_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndPos_uid88_fpExpETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal regXAndExpOverflowAndPos_uid88_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regInAndOvf_uid90_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal regInAndOvf_uid90_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal regInAndOvf_uid90_fpExpETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal regInAndOvf_uid90_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal posInf_uid92_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal posInf_uid92_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal posInf_uid92_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid93_fpExpETest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid93_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid93_fpExpETest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid93_fpExpETest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal p4_uid111_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_a : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_o : STD_LOGIC_VECTOR (37 downto 0);
    signal lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal memoryC1_uid188_expTables_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist0_cmp_a : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid6_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid6_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal signX_uid7_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid7_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracX_uid8_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracX_uid8_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aPostPad_uid63_fpExpETest_q : STD_LOGIC_VECTOR (41 downto 0);
    signal rightShiftStageSel3Dto2_uid228_fxpInPostAlign_uid47_fpExpETest_in : STD_LOGIC_VECTOR (3 downto 0);
    signal rightShiftStageSel3Dto2_uid228_fxpInPostAlign_uid47_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel1Dto0_uid238_fxpInPostAlign_uid47_fpExpETest_in : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel1Dto0_uid238_fxpInPostAlign_uid47_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStageSel5Dto4_uid254_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal rightShiftStageSel5Dto4_uid254_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal expR_uid81_fpExpETest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid81_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal xv0_uid151_eRndXlog2_uid50_fpExpETest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid151_eRndXlog2_uid50_fpExpETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid152_eRndXlog2_uid50_fpExpETest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal xv1_uid152_eRndXlog2_uid50_fpExpETest_b : STD_LOGIC_VECTOR (4 downto 0);
    signal osig_uid211_pT1_uid198_invPolyEval_in : STD_LOGIC_VECTOR (27 downto 0);
    signal osig_uid211_pT1_uid198_invPolyEval_b : STD_LOGIC_VECTOR (14 downto 0);
    signal osig_uid214_pT2_uid204_invPolyEval_in : STD_LOGIC_VECTOR (42 downto 0);
    signal osig_uid214_pT2_uid204_invPolyEval_b : STD_LOGIC_VECTOR (24 downto 0);
    signal concExc_uid94_fpExpETest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal expOvfInitial_uid42_fpExpETest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal expOvfInitial_uid42_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal shiftValuePreSatRed_uid44_fpExpETest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal shiftValuePreSatRed_uid44_fpExpETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal fxpInPreAlign_uid55_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal fxpInPreAlign_uid55_fpExpETest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal yAddr_uid70_fpExpETest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal yAddr_uid70_fpExpETest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal yPPolyEval_uid71_fpExpETest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal yPPolyEval_uid71_fpExpETest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal lowRangeB_uid116_xTimesOOlog2Ext_uid37_fpExpETest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid116_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid117_xTimesOOlog2Ext_uid37_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal highBBits_uid117_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal sR_uid123_xTimesOOlog2Ext_uid37_fpExpETest_in : STD_LOGIC_VECTOR (32 downto 0);
    signal sR_uid123_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal oFracX_uid32_fpExpETest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal p0_uid154_eRndXlog2_uid50_fpExpETest_q : STD_LOGIC_VECTOR (40 downto 0);
    signal p1_uid153_eRndXlog2_uid50_fpExpETest_q : STD_LOGIC_VECTOR (45 downto 0);
    signal lowRangeB_uid199_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid199_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid200_invPolyEval_in : STD_LOGIC_VECTOR (14 downto 0);
    signal highBBits_uid200_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lowRangeB_uid205_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid205_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid206_invPolyEval_in : STD_LOGIC_VECTOR (24 downto 0);
    signal highBBits_uid206_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excREnc_uid95_fpExpETest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng16_uid247_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage0Idx1Rng16_uid247_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal rightShiftStage0Idx2Rng32_uid250_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage0Idx2Rng32_uid250_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal memoryC2_uid191_expTables_q : STD_LOGIC_VECTOR (13 downto 0);
    signal yT1_uid197_invPolyEval_in : STD_LOGIC_VECTOR (18 downto 0);
    signal yT1_uid197_invPolyEval_b : STD_LOGIC_VECTOR (13 downto 0);
    signal lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal oFracXZwE_uid39_fpExpETest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal oFracX_uid33_fpExpETest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal lowRangeB_uid155_eRndXlog2_uid50_fpExpETest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid155_eRndXlog2_uid50_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid156_eRndXlog2_uid50_fpExpETest_in : STD_LOGIC_VECTOR (40 downto 0);
    signal highBBits_uid156_eRndXlog2_uid50_fpExpETest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_a : STD_LOGIC_VECTOR (47 downto 0);
    signal lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_o : STD_LOGIC_VECTOR (47 downto 0);
    signal lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_q : STD_LOGIC_VECTOR (46 downto 0);
    signal s1sumAHighB_uid201_invPolyEval_a : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid201_invPolyEval_b : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid201_invPolyEval_o : STD_LOGIC_VECTOR (22 downto 0);
    signal s1sumAHighB_uid201_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal s2sumAHighB_uid207_invPolyEval_a : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid207_invPolyEval_b : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid207_invPolyEval_o : STD_LOGIC_VECTOR (29 downto 0);
    signal s2sumAHighB_uid207_invPolyEval_q : STD_LOGIC_VECTOR (29 downto 0);
    signal fracRPostExc_uid99_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid99_fpExpETest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid103_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid103_fpExpETest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to16_uid246_in : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to16_uid246_b : STD_LOGIC_VECTOR (15 downto 0);
    signal seMsb_to32_uid249_in : STD_LOGIC_VECTOR (31 downto 0);
    signal seMsb_to32_uid249_b : STD_LOGIC_VECTOR (31 downto 0);
    signal stageIndexName_to34_uid252_in : STD_LOGIC_VECTOR (33 downto 0);
    signal stageIndexName_to34_uid252_b : STD_LOGIC_VECTOR (33 downto 0);
    signal seMsb_to4_uid256_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid256_b : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to8_uid259_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid259_b : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to12_uid262_in : STD_LOGIC_VECTOR (11 downto 0);
    signal seMsb_to12_uid262_b : STD_LOGIC_VECTOR (11 downto 0);
    signal seMsb_to2_uid269_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid269_b : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to3_uid272_in : STD_LOGIC_VECTOR (2 downto 0);
    signal seMsb_to3_uid272_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx1_uid248_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage0Idx2_uid251_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal lev1_a0_uid119_xTimesOOlog2Ext_uid37_fpExpETest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal topRangeFxpEPreRnd_uid46_fpExpETest_in : STD_LOGIC_VECTOR (36 downto 0);
    signal topRangeFxpEPreRnd_uid46_fpExpETest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal onesCmpFxpInX_uid34_fpExpETest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal onesCmpFxpInX_uid34_fpExpETest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal onesCmpFxpInX_uid34_fpExpETest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal lev1_a0_uid158_eRndXlog2_uid50_fpExpETest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal s1_uid202_invPolyEval_q : STD_LOGIC_VECTOR (23 downto 0);
    signal s2_uid208_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal RExpE_uid104_fpExpETest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage0Idx1Rng4_uid221_fxpInPostAlign_uid47_fpExpETest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx1Rng4_uid221_fxpInPostAlign_uid47_fpExpETest_b : STD_LOGIC_VECTOR (6 downto 0);
    signal rightShiftStage0Idx2Rng8_uid224_fxpInPostAlign_uid47_fpExpETest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx2Rng8_uid224_fxpInPostAlign_uid47_fpExpETest_b : STD_LOGIC_VECTOR (2 downto 0);
    signal fxpInExtX_uid35_fpExpETest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInExtX_uid35_fpExpETest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInExtX_uid35_fpExpETest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal fxpInExtX_uid35_fpExpETest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal sR_uid159_eRndXlog2_uid50_fpExpETest_in : STD_LOGIC_VECTOR (45 downto 0);
    signal sR_uid159_eRndXlog2_uid50_fpExpETest_b : STD_LOGIC_VECTOR (42 downto 0);
    signal peOR_uid73_fpExpETest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal peOR_uid73_fpExpETest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal peORExpInc_uid74_fpExpETest_in : STD_LOGIC_VECTOR (29 downto 0);
    signal peORExpInc_uid74_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rightShiftStage1Idx1Rng4_uid257_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage1Idx1Rng4_uid257_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal rightShiftStage1Idx2Rng8_uid260_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage1Idx2Rng8_uid260_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1Idx3Rng12_uid263_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage1Idx3Rng12_uid263_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal seMsb_to4_uid220_in : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to4_uid220_b : STD_LOGIC_VECTOR (3 downto 0);
    signal seMsb_to8_uid223_in : STD_LOGIC_VECTOR (7 downto 0);
    signal seMsb_to8_uid223_b : STD_LOGIC_VECTOR (7 downto 0);
    signal stageIndexName_to11_uid226_in : STD_LOGIC_VECTOR (10 downto 0);
    signal stageIndexName_to11_uid226_b : STD_LOGIC_VECTOR (10 downto 0);
    signal seMsb_to2_uid232_in : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to2_uid232_b : STD_LOGIC_VECTOR (1 downto 0);
    signal seMsb_to3_uid235_in : STD_LOGIC_VECTOR (2 downto 0);
    signal seMsb_to3_uid235_b : STD_LOGIC_VECTOR (2 downto 0);
    signal rightShiftStage0Idx1_uid222_fxpInPostAlign_uid47_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage0Idx2_uid225_fxpInPostAlign_uid47_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal fxpInPreAlign_uid36_fpExpETest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal fxpInPreAlign_uid36_fpExpETest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yExt_uid64_fpExpETest_a : STD_LOGIC_VECTOR (43 downto 0);
    signal yExt_uid64_fpExpETest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal yExt_uid64_fpExpETest_o : STD_LOGIC_VECTOR (43 downto 0);
    signal yExt_uid64_fpExpETest_q : STD_LOGIC_VECTOR (43 downto 0);
    signal fracR_uid77_fpExpETest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal fracR_uid77_fpExpETest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal rightShiftStage1Idx1_uid258_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage1Idx2_uid261_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage1Idx3_uid264_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xv0_uid106_xTimesOOlog2Ext_uid37_fpExpETest_in : STD_LOGIC_VECTOR (5 downto 0);
    signal xv0_uid106_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv1_uid107_xTimesOOlog2Ext_uid37_fpExpETest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal xv1_uid107_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv2_uid108_xTimesOOlog2Ext_uid37_fpExpETest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal xv2_uid108_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv3_uid109_xTimesOOlog2Ext_uid37_fpExpETest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal xv3_uid109_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal xv4_uid110_xTimesOOlog2Ext_uid37_fpExpETest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal xv4_uid110_xTimesOOlog2Ext_uid37_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal msbUYExt_uid65_fpExpETest_in : STD_LOGIC_VECTOR (43 downto 0);
    signal msbUYExt_uid65_fpExpETest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yRed_uid67_fpExpETest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal yRed_uid67_fpExpETest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage1Idx1Rng1_uid230_fxpInPostAlign_uid47_fpExpETest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx1Rng1_uid230_fxpInPostAlign_uid47_fpExpETest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal rightShiftStage1Idx2Rng2_uid233_fxpInPostAlign_uid47_fpExpETest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx2Rng2_uid233_fxpInPostAlign_uid47_fpExpETest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal rightShiftStage1Idx3Rng3_uid236_fxpInPostAlign_uid47_fpExpETest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx3Rng3_uid236_fxpInPostAlign_uid47_fpExpETest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal rightShiftStage2Idx1Rng1_uid267_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage2Idx1Rng1_uid267_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal rightShiftStage2Idx2Rng2_uid270_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage2Idx2Rng2_uid270_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal rightShiftStage2Idx3Rng3_uid273_fxpInPostAlign_X_uid60_fpExpETest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage2Idx3Rng3_uid273_fxpInPostAlign_X_uid60_fpExpETest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal rightShiftStage1Idx1_uid231_fxpInPostAlign_uid47_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx2_uid234_fxpInPostAlign_uid47_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage1Idx3_uid237_fxpInPostAlign_uid47_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal rightShiftStage2Idx1_uid268_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage2Idx2_uid271_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage2Idx3_uid274_fxpInPostAlign_X_uid60_fpExpETest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_q : STD_LOGIC_VECTOR (10 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- cstAllOWE_uid17_fpExpETest(CONSTANT,16)
    cstAllOWE_uid17_fpExpETest_q <= "11111111";

    -- zY_uid66_fpExpETest(CONSTANT,65)
    zY_uid66_fpExpETest_q <= "00000000000000000000000000";

    -- xIn(GPIN,3)@0

    -- signX_uid7_fpExpETest(BITSELECT,6)@0
    signX_uid7_fpExpETest_in <= STD_LOGIC_VECTOR(a);
    signX_uid7_fpExpETest_b <= STD_LOGIC_VECTOR(signX_uid7_fpExpETest_in(31 downto 31));

    -- fracX_uid8_fpExpETest(BITSELECT,7)@0
    fracX_uid8_fpExpETest_in <= a;
    fracX_uid8_fpExpETest_b <= fracX_uid8_fpExpETest_in(22 downto 0);

    -- oFracX_uid32_fpExpETest(BITJOIN,31)@0
    oFracX_uid32_fpExpETest_q <= VCC_q & fracX_uid8_fpExpETest_b;

    -- oFracX_uid33_fpExpETest(BITJOIN,32)@0
    oFracX_uid33_fpExpETest_q <= GND_q & oFracX_uid32_fpExpETest_q;

    -- onesCmpFxpInX_uid34_fpExpETest(LOGICAL,33)@0
    onesCmpFxpInX_uid34_fpExpETest_a <= oFracX_uid33_fpExpETest_q;
    onesCmpFxpInX_uid34_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 1 => signX_uid7_fpExpETest_b(0)) & signX_uid7_fpExpETest_b));
    onesCmpFxpInX_uid34_fpExpETest_q <= onesCmpFxpInX_uid34_fpExpETest_a xor onesCmpFxpInX_uid34_fpExpETest_b;

    -- fxpInExtX_uid35_fpExpETest(ADD,34)@0
    fxpInExtX_uid35_fpExpETest_a <= STD_LOGIC_VECTOR("0" & onesCmpFxpInX_uid34_fpExpETest_q);
    fxpInExtX_uid35_fpExpETest_b <= STD_LOGIC_VECTOR("0000000000000000000000000" & signX_uid7_fpExpETest_b);
    fxpInExtX_uid35_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(fxpInExtX_uid35_fpExpETest_a) + UNSIGNED(fxpInExtX_uid35_fpExpETest_b));
    fxpInExtX_uid35_fpExpETest_q <= fxpInExtX_uid35_fpExpETest_o(25 downto 0);

    -- fxpInPreAlign_uid36_fpExpETest(BITSELECT,35)@0
    fxpInPreAlign_uid36_fpExpETest_in <= STD_LOGIC_VECTOR(fxpInExtX_uid35_fpExpETest_q(24 downto 0));
    fxpInPreAlign_uid36_fpExpETest_b <= STD_LOGIC_VECTOR(fxpInPreAlign_uid36_fpExpETest_in(24 downto 0));

    -- xv0_uid106_xTimesOOlog2Ext_uid37_fpExpETest(BITSELECT,105)@0
    xv0_uid106_xTimesOOlog2Ext_uid37_fpExpETest_in <= fxpInPreAlign_uid36_fpExpETest_b(5 downto 0);
    xv0_uid106_xTimesOOlog2Ext_uid37_fpExpETest_b <= xv0_uid106_xTimesOOlog2Ext_uid37_fpExpETest_in(5 downto 0);

    -- redist6(DELAY,285)
    redist6 : dspba_delay
    GENERIC MAP ( width => 6, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv0_uid106_xTimesOOlog2Ext_uid37_fpExpETest_b, xout => redist6_q, clk => clk, aclr => areset );

    -- p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest(LOOKUP,114)@2
    p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_combproc: PROCESS (redist6_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist6_q) IS
            WHEN "000000" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000000000000";
            WHEN "000001" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000010111000";
            WHEN "000010" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000101110001";
            WHEN "000011" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001000101001";
            WHEN "000100" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001011100010";
            WHEN "000101" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001110011011";
            WHEN "000110" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010001010011";
            WHEN "000111" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010100001100";
            WHEN "001000" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010111000101";
            WHEN "001001" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011001111101";
            WHEN "001010" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011100110110";
            WHEN "001011" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011111101111";
            WHEN "001100" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00100010100111";
            WHEN "001101" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00100101100000";
            WHEN "001110" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101000011001";
            WHEN "001111" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101011010001";
            WHEN "010000" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101110001010";
            WHEN "010001" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110001000011";
            WHEN "010010" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110011111011";
            WHEN "010011" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110110110100";
            WHEN "010100" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111001101101";
            WHEN "010101" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111100100101";
            WHEN "010110" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111111011110";
            WHEN "010111" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01000010010111";
            WHEN "011000" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01000101001111";
            WHEN "011001" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001000001000";
            WHEN "011010" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001011000001";
            WHEN "011011" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001101111001";
            WHEN "011100" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010000110010";
            WHEN "011101" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010011101011";
            WHEN "011110" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010110100011";
            WHEN "011111" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011001011100";
            WHEN "100000" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011100010101";
            WHEN "100001" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011111001101";
            WHEN "100010" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100010000110";
            WHEN "100011" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100100111111";
            WHEN "100100" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100111110111";
            WHEN "100101" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01101010110000";
            WHEN "100110" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01101101101001";
            WHEN "100111" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110000100001";
            WHEN "101000" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110011011010";
            WHEN "101001" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110110010011";
            WHEN "101010" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111001001011";
            WHEN "101011" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111100000100";
            WHEN "101100" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111110111101";
            WHEN "101101" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000001110101";
            WHEN "101110" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000100101110";
            WHEN "101111" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000111100111";
            WHEN "110000" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10001010011111";
            WHEN "110001" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10001101011000";
            WHEN "110010" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010000010001";
            WHEN "110011" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010011001001";
            WHEN "110100" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010110000010";
            WHEN "110101" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011000111011";
            WHEN "110110" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011011110011";
            WHEN "110111" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011110101100";
            WHEN "111000" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100001100101";
            WHEN "111001" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100100011101";
            WHEN "111010" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100111010110";
            WHEN "111011" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10101010001111";
            WHEN "111100" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10101101000111";
            WHEN "111101" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110000000000";
            WHEN "111110" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110010111001";
            WHEN "111111" => p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110101110001";
            WHEN OTHERS => -- unreachable
                           p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- xv1_uid107_xTimesOOlog2Ext_uid37_fpExpETest(BITSELECT,106)@0
    xv1_uid107_xTimesOOlog2Ext_uid37_fpExpETest_in <= fxpInPreAlign_uid36_fpExpETest_b(11 downto 0);
    xv1_uid107_xTimesOOlog2Ext_uid37_fpExpETest_b <= xv1_uid107_xTimesOOlog2Ext_uid37_fpExpETest_in(11 downto 6);

    -- redist5(DELAY,284)
    redist5 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv1_uid107_xTimesOOlog2Ext_uid37_fpExpETest_b, xout => redist5_q, clk => clk, aclr => areset );

    -- p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest(LOOKUP,113)@1
    p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_combproc: PROCESS (redist5_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist5_q) IS
            WHEN "000000" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000000000000000000";
            WHEN "000001" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000010111000101010";
            WHEN "000010" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000101110001010101";
            WHEN "000011" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001000101001111111";
            WHEN "000100" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001011100010101010";
            WHEN "000101" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001110011011010100";
            WHEN "000110" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010001010011111111";
            WHEN "000111" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010100001100101001";
            WHEN "001000" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010111000101010100";
            WHEN "001001" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011001111101111111";
            WHEN "001010" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011100110110101001";
            WHEN "001011" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011111101111010100";
            WHEN "001100" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00100010100111111110";
            WHEN "001101" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00100101100000101001";
            WHEN "001110" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101000011001010011";
            WHEN "001111" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101011010001111110";
            WHEN "010000" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101110001010101000";
            WHEN "010001" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110001000011010011";
            WHEN "010010" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110011111011111110";
            WHEN "010011" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110110110100101000";
            WHEN "010100" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111001101101010011";
            WHEN "010101" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111100100101111101";
            WHEN "010110" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111111011110101000";
            WHEN "010111" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01000010010111010010";
            WHEN "011000" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01000101001111111101";
            WHEN "011001" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001000001000100111";
            WHEN "011010" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001011000001010010";
            WHEN "011011" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001101111001111101";
            WHEN "011100" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010000110010100111";
            WHEN "011101" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010011101011010010";
            WHEN "011110" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010110100011111100";
            WHEN "011111" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011001011100100111";
            WHEN "100000" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011100010101010001";
            WHEN "100001" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011111001101111100";
            WHEN "100010" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100010000110100110";
            WHEN "100011" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100100111111010001";
            WHEN "100100" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100111110111111100";
            WHEN "100101" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01101010110000100110";
            WHEN "100110" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01101101101001010001";
            WHEN "100111" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110000100001111011";
            WHEN "101000" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110011011010100110";
            WHEN "101001" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110110010011010000";
            WHEN "101010" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111001001011111011";
            WHEN "101011" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111100000100100101";
            WHEN "101100" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111110111101010000";
            WHEN "101101" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000001110101111011";
            WHEN "101110" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000100101110100101";
            WHEN "101111" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000111100111010000";
            WHEN "110000" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10001010011111111010";
            WHEN "110001" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10001101011000100101";
            WHEN "110010" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010000010001001111";
            WHEN "110011" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010011001001111010";
            WHEN "110100" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010110000010100101";
            WHEN "110101" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011000111011001111";
            WHEN "110110" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011011110011111010";
            WHEN "110111" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011110101100100100";
            WHEN "111000" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100001100101001111";
            WHEN "111001" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100100011101111001";
            WHEN "111010" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100111010110100100";
            WHEN "111011" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10101010001111001110";
            WHEN "111100" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10101101000111111001";
            WHEN "111101" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110000000000100100";
            WHEN "111110" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110010111001001110";
            WHEN "111111" => p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110101110001111001";
            WHEN OTHERS => -- unreachable
                           p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- xv2_uid108_xTimesOOlog2Ext_uid37_fpExpETest(BITSELECT,107)@0
    xv2_uid108_xTimesOOlog2Ext_uid37_fpExpETest_in <= fxpInPreAlign_uid36_fpExpETest_b(17 downto 0);
    xv2_uid108_xTimesOOlog2Ext_uid37_fpExpETest_b <= xv2_uid108_xTimesOOlog2Ext_uid37_fpExpETest_in(17 downto 12);

    -- redist4(DELAY,283)
    redist4 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv2_uid108_xTimesOOlog2Ext_uid37_fpExpETest_b, xout => redist4_q, clk => clk, aclr => areset );

    -- p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest(LOOKUP,112)@1
    p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_combproc: PROCESS (redist4_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist4_q) IS
            WHEN "000000" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000000000000000000000000";
            WHEN "000001" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000010111000101010100011";
            WHEN "000010" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000101110001010101000111";
            WHEN "000011" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001000101001111111101011";
            WHEN "000100" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001011100010101010001110";
            WHEN "000101" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001110011011010100110010";
            WHEN "000110" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010001010011111111010110";
            WHEN "000111" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010100001100101001111001";
            WHEN "001000" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010111000101010100011101";
            WHEN "001001" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011001111101111111000001";
            WHEN "001010" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011100110110101001100100";
            WHEN "001011" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011111101111010100001000";
            WHEN "001100" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00100010100111111110101100";
            WHEN "001101" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00100101100000101001010000";
            WHEN "001110" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101000011001010011110011";
            WHEN "001111" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101011010001111110010111";
            WHEN "010000" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101110001010101000111011";
            WHEN "010001" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110001000011010011011110";
            WHEN "010010" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110011111011111110000010";
            WHEN "010011" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110110110100101000100110";
            WHEN "010100" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111001101101010011001001";
            WHEN "010101" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111100100101111101101101";
            WHEN "010110" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111111011110101000010001";
            WHEN "010111" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01000010010111010010110101";
            WHEN "011000" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01000101001111111101011000";
            WHEN "011001" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001000001000100111111100";
            WHEN "011010" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001011000001010010100000";
            WHEN "011011" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001101111001111101000011";
            WHEN "011100" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010000110010100111100111";
            WHEN "011101" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010011101011010010001011";
            WHEN "011110" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010110100011111100101110";
            WHEN "011111" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011001011100100111010010";
            WHEN "100000" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011100010101010001110110";
            WHEN "100001" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011111001101111100011010";
            WHEN "100010" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100010000110100110111101";
            WHEN "100011" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100100111111010001100001";
            WHEN "100100" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100111110111111100000101";
            WHEN "100101" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01101010110000100110101000";
            WHEN "100110" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01101101101001010001001100";
            WHEN "100111" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110000100001111011110000";
            WHEN "101000" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110011011010100110010011";
            WHEN "101001" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110110010011010000110111";
            WHEN "101010" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111001001011111011011011";
            WHEN "101011" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111100000100100101111110";
            WHEN "101100" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111110111101010000100010";
            WHEN "101101" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000001110101111011000110";
            WHEN "101110" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000100101110100101101010";
            WHEN "101111" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000111100111010000001101";
            WHEN "110000" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10001010011111111010110001";
            WHEN "110001" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10001101011000100101010101";
            WHEN "110010" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010000010001001111111000";
            WHEN "110011" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010011001001111010011100";
            WHEN "110100" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010110000010100101000000";
            WHEN "110101" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011000111011001111100011";
            WHEN "110110" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011011110011111010000111";
            WHEN "110111" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011110101100100100101011";
            WHEN "111000" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100001100101001111001111";
            WHEN "111001" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100100011101111001110010";
            WHEN "111010" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100111010110100100010110";
            WHEN "111011" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10101010001111001110111010";
            WHEN "111100" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10101101000111111001011101";
            WHEN "111101" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110000000000100100000001";
            WHEN "111110" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110010111001001110100101";
            WHEN "111111" => p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110101110001111001001000";
            WHEN OTHERS => -- unreachable
                           p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest(ADD,119)@1
    lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_a <= STD_LOGIC_VECTOR("0" & p2_uid113_xTimesOOlog2Ext_uid37_fpExpETest_q);
    lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_b <= STD_LOGIC_VECTOR("0000000" & p1_uid114_xTimesOOlog2Ext_uid37_fpExpETest_q);
    lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_a) + UNSIGNED(lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_b));
    lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_q <= lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_o(26 downto 0);

    -- xv3_uid109_xTimesOOlog2Ext_uid37_fpExpETest(BITSELECT,108)@0
    xv3_uid109_xTimesOOlog2Ext_uid37_fpExpETest_in <= fxpInPreAlign_uid36_fpExpETest_b(23 downto 0);
    xv3_uid109_xTimesOOlog2Ext_uid37_fpExpETest_b <= xv3_uid109_xTimesOOlog2Ext_uid37_fpExpETest_in(23 downto 18);

    -- redist3(DELAY,282)
    redist3 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv3_uid109_xTimesOOlog2Ext_uid37_fpExpETest_b, xout => redist3_q, clk => clk, aclr => areset );

    -- p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest(LOOKUP,111)@1
    p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_combproc: PROCESS (redist3_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist3_q) IS
            WHEN "000000" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000000000000000000000000000000";
            WHEN "000001" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000010111000101010100011101100";
            WHEN "000010" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00000101110001010101000111011001";
            WHEN "000011" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001000101001111111101011000101";
            WHEN "000100" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001011100010101010001110110010";
            WHEN "000101" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00001110011011010100110010011111";
            WHEN "000110" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010001010011111111010110001011";
            WHEN "000111" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010100001100101001111001111000";
            WHEN "001000" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00010111000101010100011101100101";
            WHEN "001001" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011001111101111111000001010001";
            WHEN "001010" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011100110110101001100100111110";
            WHEN "001011" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00011111101111010100001000101010";
            WHEN "001100" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00100010100111111110101100010111";
            WHEN "001101" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00100101100000101001010000000100";
            WHEN "001110" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101000011001010011110011110000";
            WHEN "001111" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101011010001111110010111011101";
            WHEN "010000" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00101110001010101000111011001010";
            WHEN "010001" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110001000011010011011110110110";
            WHEN "010010" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110011111011111110000010100011";
            WHEN "010011" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00110110110100101000100110001111";
            WHEN "010100" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111001101101010011001001111100";
            WHEN "010101" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111100100101111101101101101001";
            WHEN "010110" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "00111111011110101000010001010101";
            WHEN "010111" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01000010010111010010110101000010";
            WHEN "011000" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01000101001111111101011000101111";
            WHEN "011001" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001000001000100111111100011011";
            WHEN "011010" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001011000001010010100000001000";
            WHEN "011011" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01001101111001111101000011110100";
            WHEN "011100" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010000110010100111100111100001";
            WHEN "011101" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010011101011010010001011001110";
            WHEN "011110" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01010110100011111100101110111010";
            WHEN "011111" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011001011100100111010010100111";
            WHEN "100000" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011100010101010001110110010100";
            WHEN "100001" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01011111001101111100011010000000";
            WHEN "100010" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100010000110100110111101101101";
            WHEN "100011" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100100111111010001100001011001";
            WHEN "100100" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01100111110111111100000101000110";
            WHEN "100101" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01101010110000100110101000110011";
            WHEN "100110" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01101101101001010001001100011111";
            WHEN "100111" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110000100001111011110000001100";
            WHEN "101000" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110011011010100110010011111001";
            WHEN "101001" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01110110010011010000110111100101";
            WHEN "101010" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111001001011111011011011010010";
            WHEN "101011" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111100000100100101111110111110";
            WHEN "101100" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "01111110111101010000100010101011";
            WHEN "101101" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000001110101111011000110011000";
            WHEN "101110" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000100101110100101101010000100";
            WHEN "101111" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10000111100111010000001101110001";
            WHEN "110000" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10001010011111111010110001011110";
            WHEN "110001" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10001101011000100101010101001010";
            WHEN "110010" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010000010001001111111000110111";
            WHEN "110011" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010011001001111010011100100011";
            WHEN "110100" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10010110000010100101000000010000";
            WHEN "110101" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011000111011001111100011111101";
            WHEN "110110" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011011110011111010000111101001";
            WHEN "110111" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10011110101100100100101011010110";
            WHEN "111000" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100001100101001111001111000011";
            WHEN "111001" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100100011101111001110010101111";
            WHEN "111010" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10100111010110100100010110011100";
            WHEN "111011" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10101010001111001110111010001000";
            WHEN "111100" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10101101000111111001011101110101";
            WHEN "111101" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110000000000100100000001100010";
            WHEN "111110" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110010111001001110100101001110";
            WHEN "111111" => p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= "10110101110001111001001000111011";
            WHEN OTHERS => -- unreachable
                           p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- highBBits_uid117_xTimesOOlog2Ext_uid37_fpExpETest(BITSELECT,116)@1
    highBBits_uid117_xTimesOOlog2Ext_uid37_fpExpETest_in <= p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q;
    highBBits_uid117_xTimesOOlog2Ext_uid37_fpExpETest_b <= highBBits_uid117_xTimesOOlog2Ext_uid37_fpExpETest_in(31 downto 1);

    -- xv4_uid110_xTimesOOlog2Ext_uid37_fpExpETest(BITSELECT,109)@0
    xv4_uid110_xTimesOOlog2Ext_uid37_fpExpETest_in <= STD_LOGIC_VECTOR(fxpInPreAlign_uid36_fpExpETest_b);
    xv4_uid110_xTimesOOlog2Ext_uid37_fpExpETest_b <= STD_LOGIC_VECTOR(xv4_uid110_xTimesOOlog2Ext_uid37_fpExpETest_in(24 downto 24));

    -- redist2(DELAY,281)
    redist2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xv4_uid110_xTimesOOlog2Ext_uid37_fpExpETest_b, xout => redist2_q, clk => clk, aclr => areset );

    -- p4_uid111_xTimesOOlog2Ext_uid37_fpExpETest(LOOKUP,110)@1
    p4_uid111_xTimesOOlog2Ext_uid37_fpExpETest_combproc: PROCESS (redist2_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist2_q) IS
            WHEN "0" => p4_uid111_xTimesOOlog2Ext_uid37_fpExpETest_q <= "000000000000000000000000000000100";
            WHEN "1" => p4_uid111_xTimesOOlog2Ext_uid37_fpExpETest_q <= "110100011101010101110001001110000";
            WHEN OTHERS => -- unreachable
                           p4_uid111_xTimesOOlog2Ext_uid37_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest(ADD,117)@1
    lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => p4_uid111_xTimesOOlog2Ext_uid37_fpExpETest_q(32)) & p4_uid111_xTimesOOlog2Ext_uid37_fpExpETest_q));
    lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & highBBits_uid117_xTimesOOlog2Ext_uid37_fpExpETest_b));
    lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_a) + SIGNED(lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_b));
    lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_q <= lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_o(33 downto 0);

    -- lowRangeB_uid116_xTimesOOlog2Ext_uid37_fpExpETest(BITSELECT,115)@1
    lowRangeB_uid116_xTimesOOlog2Ext_uid37_fpExpETest_in <= p3_uid112_xTimesOOlog2Ext_uid37_fpExpETest_q(0 downto 0);
    lowRangeB_uid116_xTimesOOlog2Ext_uid37_fpExpETest_b <= lowRangeB_uid116_xTimesOOlog2Ext_uid37_fpExpETest_in(0 downto 0);

    -- lev1_a0_uid119_xTimesOOlog2Ext_uid37_fpExpETest(BITJOIN,118)@1
    lev1_a0_uid119_xTimesOOlog2Ext_uid37_fpExpETest_q <= lev1_a0sumAHighB_uid118_xTimesOOlog2Ext_uid37_fpExpETest_q & lowRangeB_uid116_xTimesOOlog2Ext_uid37_fpExpETest_b;

    -- lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest(ADD,120)@1 + 1
    lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 35 => lev1_a0_uid119_xTimesOOlog2Ext_uid37_fpExpETest_q(34)) & lev1_a0_uid119_xTimesOOlog2Ext_uid37_fpExpETest_q));
    lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000000000" & lev1_a1_uid120_xTimesOOlog2Ext_uid37_fpExpETest_q));
    lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_a) + SIGNED(lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_b));
        END IF;
    END PROCESS;
    lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_q <= lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_o(35 downto 0);

    -- lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest(ADD,121)@2
    lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 36 => lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_q(35)) & lev2_a0_uid121_xTimesOOlog2Ext_uid37_fpExpETest_q));
    lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00000000000000000000000" & p0_uid115_xTimesOOlog2Ext_uid37_fpExpETest_q));
    lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_a) + SIGNED(lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_b));
    lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_q <= lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_o(36 downto 0);

    -- sR_uid123_xTimesOOlog2Ext_uid37_fpExpETest(BITSELECT,122)@2
    sR_uid123_xTimesOOlog2Ext_uid37_fpExpETest_in <= STD_LOGIC_VECTOR(lev3_a0_uid122_xTimesOOlog2Ext_uid37_fpExpETest_q(32 downto 0));
    sR_uid123_xTimesOOlog2Ext_uid37_fpExpETest_b <= STD_LOGIC_VECTOR(sR_uid123_xTimesOOlog2Ext_uid37_fpExpETest_in(32 downto 4));

    -- oFracXZwE_uid39_fpExpETest(BITJOIN,38)@2
    oFracXZwE_uid39_fpExpETest_q <= sR_uid123_xTimesOOlog2Ext_uid37_fpExpETest_b & cstZeroWE_uid14_fpExpETest_q;

    -- topRangeFxpEPreRnd_uid46_fpExpETest(BITSELECT,45)@2
    topRangeFxpEPreRnd_uid46_fpExpETest_in <= STD_LOGIC_VECTOR(oFracXZwE_uid39_fpExpETest_q);
    topRangeFxpEPreRnd_uid46_fpExpETest_b <= STD_LOGIC_VECTOR(topRangeFxpEPreRnd_uid46_fpExpETest_in(36 downto 26));

    -- xMSB_uid216_fxpInPostAlign_uid47_fpExpETest(BITSELECT,215)@2
    xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_in <= STD_LOGIC_VECTOR(topRangeFxpEPreRnd_uid46_fpExpETest_b);
    xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b <= STD_LOGIC_VECTOR(xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_in(10 downto 10));

    -- stageIndexName_to11_uid226(BITSELECT,225)@2
    stageIndexName_to11_uid226_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 1 => xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b(0)) & xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b));
    stageIndexName_to11_uid226_b <= STD_LOGIC_VECTOR(stageIndexName_to11_uid226_in(10 downto 0));

    -- seMsb_to3_uid235(BITSELECT,234)@2
    seMsb_to3_uid235_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 1 => xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b(0)) & xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b));
    seMsb_to3_uid235_b <= STD_LOGIC_VECTOR(seMsb_to3_uid235_in(2 downto 0));

    -- rightShiftStage1Idx3Rng3_uid236_fxpInPostAlign_uid47_fpExpETest(BITSELECT,235)@2
    rightShiftStage1Idx3Rng3_uid236_fxpInPostAlign_uid47_fpExpETest_in <= rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q;
    rightShiftStage1Idx3Rng3_uid236_fxpInPostAlign_uid47_fpExpETest_b <= rightShiftStage1Idx3Rng3_uid236_fxpInPostAlign_uid47_fpExpETest_in(10 downto 3);

    -- rightShiftStage1Idx3_uid237_fxpInPostAlign_uid47_fpExpETest(BITJOIN,236)@2
    rightShiftStage1Idx3_uid237_fxpInPostAlign_uid47_fpExpETest_q <= seMsb_to3_uid235_b & rightShiftStage1Idx3Rng3_uid236_fxpInPostAlign_uid47_fpExpETest_b;

    -- seMsb_to2_uid232(BITSELECT,231)@2
    seMsb_to2_uid232_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b(0)) & xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b));
    seMsb_to2_uid232_b <= STD_LOGIC_VECTOR(seMsb_to2_uid232_in(1 downto 0));

    -- rightShiftStage1Idx2Rng2_uid233_fxpInPostAlign_uid47_fpExpETest(BITSELECT,232)@2
    rightShiftStage1Idx2Rng2_uid233_fxpInPostAlign_uid47_fpExpETest_in <= rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q;
    rightShiftStage1Idx2Rng2_uid233_fxpInPostAlign_uid47_fpExpETest_b <= rightShiftStage1Idx2Rng2_uid233_fxpInPostAlign_uid47_fpExpETest_in(10 downto 2);

    -- rightShiftStage1Idx2_uid234_fxpInPostAlign_uid47_fpExpETest(BITJOIN,233)@2
    rightShiftStage1Idx2_uid234_fxpInPostAlign_uid47_fpExpETest_q <= seMsb_to2_uid232_b & rightShiftStage1Idx2Rng2_uid233_fxpInPostAlign_uid47_fpExpETest_b;

    -- rightShiftStage1Idx1Rng1_uid230_fxpInPostAlign_uid47_fpExpETest(BITSELECT,229)@2
    rightShiftStage1Idx1Rng1_uid230_fxpInPostAlign_uid47_fpExpETest_in <= rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q;
    rightShiftStage1Idx1Rng1_uid230_fxpInPostAlign_uid47_fpExpETest_b <= rightShiftStage1Idx1Rng1_uid230_fxpInPostAlign_uid47_fpExpETest_in(10 downto 1);

    -- rightShiftStage1Idx1_uid231_fxpInPostAlign_uid47_fpExpETest(BITJOIN,230)@2
    rightShiftStage1Idx1_uid231_fxpInPostAlign_uid47_fpExpETest_q <= xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b & rightShiftStage1Idx1Rng1_uid230_fxpInPostAlign_uid47_fpExpETest_b;

    -- seMsb_to8_uid223(BITSELECT,222)@2
    seMsb_to8_uid223_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b(0)) & xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b));
    seMsb_to8_uid223_b <= STD_LOGIC_VECTOR(seMsb_to8_uid223_in(7 downto 0));

    -- rightShiftStage0Idx2Rng8_uid224_fxpInPostAlign_uid47_fpExpETest(BITSELECT,223)@2
    rightShiftStage0Idx2Rng8_uid224_fxpInPostAlign_uid47_fpExpETest_in <= topRangeFxpEPreRnd_uid46_fpExpETest_b;
    rightShiftStage0Idx2Rng8_uid224_fxpInPostAlign_uid47_fpExpETest_b <= rightShiftStage0Idx2Rng8_uid224_fxpInPostAlign_uid47_fpExpETest_in(10 downto 8);

    -- rightShiftStage0Idx2_uid225_fxpInPostAlign_uid47_fpExpETest(BITJOIN,224)@2
    rightShiftStage0Idx2_uid225_fxpInPostAlign_uid47_fpExpETest_q <= seMsb_to8_uid223_b & rightShiftStage0Idx2Rng8_uid224_fxpInPostAlign_uid47_fpExpETest_b;

    -- seMsb_to4_uid220(BITSELECT,219)@2
    seMsb_to4_uid220_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b(0)) & xMSB_uid216_fxpInPostAlign_uid47_fpExpETest_b));
    seMsb_to4_uid220_b <= STD_LOGIC_VECTOR(seMsb_to4_uid220_in(3 downto 0));

    -- rightShiftStage0Idx1Rng4_uid221_fxpInPostAlign_uid47_fpExpETest(BITSELECT,220)@2
    rightShiftStage0Idx1Rng4_uid221_fxpInPostAlign_uid47_fpExpETest_in <= topRangeFxpEPreRnd_uid46_fpExpETest_b;
    rightShiftStage0Idx1Rng4_uid221_fxpInPostAlign_uid47_fpExpETest_b <= rightShiftStage0Idx1Rng4_uid221_fxpInPostAlign_uid47_fpExpETest_in(10 downto 4);

    -- rightShiftStage0Idx1_uid222_fxpInPostAlign_uid47_fpExpETest(BITJOIN,221)@2
    rightShiftStage0Idx1_uid222_fxpInPostAlign_uid47_fpExpETest_q <= seMsb_to4_uid220_b & rightShiftStage0Idx1Rng4_uid221_fxpInPostAlign_uid47_fpExpETest_b;

    -- cstBiasPWE_uid31_fpExpETest(CONSTANT,30)
    cstBiasPWE_uid31_fpExpETest_q <= "100001";

    -- expX_uid6_fpExpETest(BITSELECT,5)@0
    expX_uid6_fpExpETest_in <= a;
    expX_uid6_fpExpETest_b <= expX_uid6_fpExpETest_in(30 downto 23);

    -- redist20(DELAY,299)
    redist20 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expX_uid6_fpExpETest_b, xout => redist20_q, clk => clk, aclr => areset );

    -- cstBiasPWE_uid16_fpExpETest(CONSTANT,15)
    cstBiasPWE_uid16_fpExpETest_q <= "10000111";

    -- shiftValuePreSat_uid41_fpExpETest(SUB,40)@1
    shiftValuePreSat_uid41_fpExpETest_a <= STD_LOGIC_VECTOR("0" & cstBiasPWE_uid16_fpExpETest_q);
    shiftValuePreSat_uid41_fpExpETest_b <= STD_LOGIC_VECTOR("0" & redist20_q);
    shiftValuePreSat_uid41_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValuePreSat_uid41_fpExpETest_a) - UNSIGNED(shiftValuePreSat_uid41_fpExpETest_b));
    shiftValuePreSat_uid41_fpExpETest_q <= shiftValuePreSat_uid41_fpExpETest_o(8 downto 0);

    -- shiftValuePreSatRed_uid44_fpExpETest(BITSELECT,43)@1
    shiftValuePreSatRed_uid44_fpExpETest_in <= shiftValuePreSat_uid41_fpExpETest_q(5 downto 0);
    shiftValuePreSatRed_uid44_fpExpETest_b <= shiftValuePreSatRed_uid44_fpExpETest_in(5 downto 0);

    -- shiftUdf_uid43_fpExpETest(COMPARE,42)@1
    shiftUdf_uid43_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => shiftValuePreSat_uid41_fpExpETest_q(8)) & shiftValuePreSat_uid41_fpExpETest_q));
    shiftUdf_uid43_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "0000" & cstBiasPWE_uid31_fpExpETest_q));
    shiftUdf_uid43_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(shiftUdf_uid43_fpExpETest_a) - SIGNED(shiftUdf_uid43_fpExpETest_b));
    shiftUdf_uid43_fpExpETest_n(0) <= not (shiftUdf_uid43_fpExpETest_o(10));

    -- shiftVal_uid45_fpExpETest(MUX,44)@1 + 1
    shiftVal_uid45_fpExpETest_s <= shiftUdf_uid43_fpExpETest_n;
    shiftVal_uid45_fpExpETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            shiftVal_uid45_fpExpETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (shiftVal_uid45_fpExpETest_s) IS
                WHEN "0" => shiftVal_uid45_fpExpETest_q <= shiftValuePreSatRed_uid44_fpExpETest_b;
                WHEN "1" => shiftVal_uid45_fpExpETest_q <= cstBiasPWE_uid31_fpExpETest_q;
                WHEN OTHERS => shiftVal_uid45_fpExpETest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rightShiftStageSel3Dto2_uid228_fxpInPostAlign_uid47_fpExpETest(BITSELECT,227)@2
    rightShiftStageSel3Dto2_uid228_fxpInPostAlign_uid47_fpExpETest_in <= shiftVal_uid45_fpExpETest_q(3 downto 0);
    rightShiftStageSel3Dto2_uid228_fxpInPostAlign_uid47_fpExpETest_b <= rightShiftStageSel3Dto2_uid228_fxpInPostAlign_uid47_fpExpETest_in(3 downto 2);

    -- rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest(MUX,228)@2
    rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_s <= rightShiftStageSel3Dto2_uid228_fxpInPostAlign_uid47_fpExpETest_b;
    rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_combproc: PROCESS (rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_s, topRangeFxpEPreRnd_uid46_fpExpETest_b, rightShiftStage0Idx1_uid222_fxpInPostAlign_uid47_fpExpETest_q, rightShiftStage0Idx2_uid225_fxpInPostAlign_uid47_fpExpETest_q, stageIndexName_to11_uid226_b)
    BEGIN
        CASE (rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_s) IS
            WHEN "00" => rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q <= topRangeFxpEPreRnd_uid46_fpExpETest_b;
            WHEN "01" => rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q <= rightShiftStage0Idx1_uid222_fxpInPostAlign_uid47_fpExpETest_q;
            WHEN "10" => rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q <= rightShiftStage0Idx2_uid225_fxpInPostAlign_uid47_fpExpETest_q;
            WHEN "11" => rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q <= stageIndexName_to11_uid226_b;
            WHEN OTHERS => rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStageSel1Dto0_uid238_fxpInPostAlign_uid47_fpExpETest(BITSELECT,237)@2
    rightShiftStageSel1Dto0_uid238_fxpInPostAlign_uid47_fpExpETest_in <= shiftVal_uid45_fpExpETest_q(1 downto 0);
    rightShiftStageSel1Dto0_uid238_fxpInPostAlign_uid47_fpExpETest_b <= rightShiftStageSel1Dto0_uid238_fxpInPostAlign_uid47_fpExpETest_in(1 downto 0);

    -- rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest(MUX,238)@2
    rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_s <= rightShiftStageSel1Dto0_uid238_fxpInPostAlign_uid47_fpExpETest_b;
    rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_combproc: PROCESS (rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_s, rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q, rightShiftStage1Idx1_uid231_fxpInPostAlign_uid47_fpExpETest_q, rightShiftStage1Idx2_uid234_fxpInPostAlign_uid47_fpExpETest_q, rightShiftStage1Idx3_uid237_fxpInPostAlign_uid47_fpExpETest_q)
    BEGIN
        CASE (rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_s) IS
            WHEN "00" => rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_q <= rightShiftStage0_uid229_fxpInPostAlign_uid47_fpExpETest_q;
            WHEN "01" => rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_q <= rightShiftStage1Idx1_uid231_fxpInPostAlign_uid47_fpExpETest_q;
            WHEN "10" => rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_q <= rightShiftStage1Idx2_uid234_fxpInPostAlign_uid47_fpExpETest_q;
            WHEN "11" => rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_q <= rightShiftStage1Idx3_uid237_fxpInPostAlign_uid47_fpExpETest_q;
            WHEN OTHERS => rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- wIntCst_uid218_fxpInPostAlign_uid47_fpExpETest(CONSTANT,217)
    wIntCst_uid218_fxpInPostAlign_uid47_fpExpETest_q <= "1011";

    -- shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest(COMPARE,218)@2
    shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_a <= STD_LOGIC_VECTOR("00" & shiftVal_uid45_fpExpETest_q);
    shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_b <= STD_LOGIC_VECTOR("0000" & wIntCst_uid218_fxpInPostAlign_uid47_fpExpETest_q);
    shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_a) - UNSIGNED(shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_b));
    shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_n(0) <= not (shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_o(7));

    -- r_uid242_fxpInPostAlign_uid47_fpExpETest(MUX,241)@2 + 1
    r_uid242_fxpInPostAlign_uid47_fpExpETest_s <= shiftedOut_uid219_fxpInPostAlign_uid47_fpExpETest_n;
    r_uid242_fxpInPostAlign_uid47_fpExpETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            r_uid242_fxpInPostAlign_uid47_fpExpETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (r_uid242_fxpInPostAlign_uid47_fpExpETest_s) IS
                WHEN "0" => r_uid242_fxpInPostAlign_uid47_fpExpETest_q <= rightShiftStage1_uid239_fxpInPostAlign_uid47_fpExpETest_q;
                WHEN "1" => r_uid242_fxpInPostAlign_uid47_fpExpETest_q <= stageIndexName_to11_uid226_b;
                WHEN OTHERS => r_uid242_fxpInPostAlign_uid47_fpExpETest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- xv0_uid151_eRndXlog2_uid50_fpExpETest(BITSELECT,150)@3
    xv0_uid151_eRndXlog2_uid50_fpExpETest_in <= r_uid242_fxpInPostAlign_uid47_fpExpETest_q(5 downto 0);
    xv0_uid151_eRndXlog2_uid50_fpExpETest_b <= xv0_uid151_eRndXlog2_uid50_fpExpETest_in(5 downto 0);

    -- p0_uid154_eRndXlog2_uid50_fpExpETest(LOOKUP,153)@3
    p0_uid154_eRndXlog2_uid50_fpExpETest_combproc: PROCESS (xv0_uid151_eRndXlog2_uid50_fpExpETest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (xv0_uid151_eRndXlog2_uid50_fpExpETest_b) IS
            WHEN "000000" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00000000000000000000000000000000000000000";
            WHEN "000001" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00000010110001011100100001011111110111110";
            WHEN "000010" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00000101100010111001000010111111101111100";
            WHEN "000011" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00001000010100010101100100011111100111010";
            WHEN "000100" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00001011000101110010000101111111011111000";
            WHEN "000101" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00001101110111001110100111011111010110110";
            WHEN "000110" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00010000101000101011001000111111001110100";
            WHEN "000111" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00010011011010000111101010011111000110010";
            WHEN "001000" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00010110001011100100001011111110111110000";
            WHEN "001001" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00011000111101000000101101011110110101110";
            WHEN "001010" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00011011101110011101001110111110101101100";
            WHEN "001011" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00011110011111111001110000011110100101010";
            WHEN "001100" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00100001010001010110010001111110011101000";
            WHEN "001101" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00100100000010110010110011011110010100110";
            WHEN "001110" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00100110110100001111010100111110001100100";
            WHEN "001111" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00101001100101101011110110011110000100010";
            WHEN "010000" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00101100010111001000010111111101111100000";
            WHEN "010001" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00101111001000100100111001011101110011110";
            WHEN "010010" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00110001111010000001011010111101101011100";
            WHEN "010011" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00110100101011011101111100011101100011010";
            WHEN "010100" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00110111011100111010011101111101011011000";
            WHEN "010101" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00111010001110010110111111011101010010110";
            WHEN "010110" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00111100111111110011100000111101001010100";
            WHEN "010111" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "00111111110001010000000010011101000010010";
            WHEN "011000" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01000010100010101100100011111100111010000";
            WHEN "011001" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01000101010100001001000101011100110001110";
            WHEN "011010" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01001000000101100101100110111100101001100";
            WHEN "011011" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01001010110111000010001000011100100001010";
            WHEN "011100" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01001101101000011110101001111100011001000";
            WHEN "011101" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01010000011001111011001011011100010000110";
            WHEN "011110" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01010011001011010111101100111100001000100";
            WHEN "011111" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01010101111100110100001110011100000000010";
            WHEN "100000" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01011000101110010000101111111011111000000";
            WHEN "100001" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01011011011111101101010001011011101111110";
            WHEN "100010" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01011110010001001001110010111011100111100";
            WHEN "100011" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01100001000010100110010100011011011111010";
            WHEN "100100" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01100011110100000010110101111011010111000";
            WHEN "100101" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01100110100101011111010111011011001110110";
            WHEN "100110" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01101001010110111011111000111011000110100";
            WHEN "100111" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01101100001000011000011010011010111110010";
            WHEN "101000" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01101110111001110100111011111010110110000";
            WHEN "101001" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01110001101011010001011101011010101101110";
            WHEN "101010" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01110100011100101101111110111010100101100";
            WHEN "101011" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01110111001110001010100000011010011101010";
            WHEN "101100" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01111001111111100111000001111010010101000";
            WHEN "101101" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01111100110001000011100011011010001100110";
            WHEN "101110" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "01111111100010100000000100111010000100100";
            WHEN "101111" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10000010010011111100100110011001111100010";
            WHEN "110000" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10000101000101011001000111111001110100000";
            WHEN "110001" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10000111110110110101101001011001101011110";
            WHEN "110010" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10001010101000010010001010111001100011100";
            WHEN "110011" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10001101011001101110101100011001011011010";
            WHEN "110100" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10010000001011001011001101111001010011000";
            WHEN "110101" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10010010111100100111101111011001001010110";
            WHEN "110110" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10010101101110000100010000111001000010100";
            WHEN "110111" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10011000011111100000110010011000111010010";
            WHEN "111000" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10011011010000111101010011111000110010000";
            WHEN "111001" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10011110000010011001110101011000101001110";
            WHEN "111010" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10100000110011110110010110111000100001100";
            WHEN "111011" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10100011100101010010111000011000011001010";
            WHEN "111100" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10100110010110101111011001111000010001000";
            WHEN "111101" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10101001001000001011111011011000001000110";
            WHEN "111110" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10101011111001101000011100111000000000100";
            WHEN "111111" => p0_uid154_eRndXlog2_uid50_fpExpETest_q <= "10101110101011000100111110010111111000010";
            WHEN OTHERS => -- unreachable
                           p0_uid154_eRndXlog2_uid50_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- highBBits_uid156_eRndXlog2_uid50_fpExpETest(BITSELECT,155)@3
    highBBits_uid156_eRndXlog2_uid50_fpExpETest_in <= p0_uid154_eRndXlog2_uid50_fpExpETest_q;
    highBBits_uid156_eRndXlog2_uid50_fpExpETest_b <= highBBits_uid156_eRndXlog2_uid50_fpExpETest_in(40 downto 1);

    -- xv1_uid152_eRndXlog2_uid50_fpExpETest(BITSELECT,151)@3
    xv1_uid152_eRndXlog2_uid50_fpExpETest_in <= STD_LOGIC_VECTOR(r_uid242_fxpInPostAlign_uid47_fpExpETest_q);
    xv1_uid152_eRndXlog2_uid50_fpExpETest_b <= STD_LOGIC_VECTOR(xv1_uid152_eRndXlog2_uid50_fpExpETest_in(10 downto 6));

    -- p1_uid153_eRndXlog2_uid50_fpExpETest(LOOKUP,152)@3
    p1_uid153_eRndXlog2_uid50_fpExpETest_combproc: PROCESS (xv1_uid152_eRndXlog2_uid50_fpExpETest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (xv1_uid152_eRndXlog2_uid50_fpExpETest_b) IS
            WHEN "00000" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0000000000000000000000000000000000000000000010";
            WHEN "00001" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0000001011000101110010000101111111011111000010";
            WHEN "00010" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0000010110001011100100001011111110111110000010";
            WHEN "00011" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0000100001010001010110010001111110011101000010";
            WHEN "00100" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0000101100010111001000010111111101111100000010";
            WHEN "00101" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0000110111011100111010011101111101011011000010";
            WHEN "00110" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0001000010100010101100100011111100111010000010";
            WHEN "00111" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0001001101101000011110101001111100011001000010";
            WHEN "01000" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0001011000101110010000101111111011111000000010";
            WHEN "01001" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0001100011110100000010110101111011010111000010";
            WHEN "01010" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0001101110111001110100111011111010110110000010";
            WHEN "01011" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0001111001111111100111000001111010010101000010";
            WHEN "01100" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0010000101000101011001000111111001110100000010";
            WHEN "01101" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0010010000001011001011001101111001010011000010";
            WHEN "01110" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0010011011010000111101010011111000110010000010";
            WHEN "01111" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "0010100110010110101111011001111000010001000010";
            WHEN "10000" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1101001110100011011110100000001000010000000010";
            WHEN "10001" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1101011001101001010000100110000111101111000010";
            WHEN "10010" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1101100100101111000010101100000111001110000010";
            WHEN "10011" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1101101111110100110100110010000110101101000010";
            WHEN "10100" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1101111010111010100110111000000110001100000010";
            WHEN "10101" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1110000110000000011000111110000101101011000010";
            WHEN "10110" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1110010001000110001011000100000101001010000010";
            WHEN "10111" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1110011100001011111101001010000100101001000010";
            WHEN "11000" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1110100111010001101111010000000100001000000010";
            WHEN "11001" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1110110010010111100001010110000011100111000010";
            WHEN "11010" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1110111101011101010011011100000011000110000010";
            WHEN "11011" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1111001000100011000101100010000010100101000010";
            WHEN "11100" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1111010011101000110111101000000010000100000010";
            WHEN "11101" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1111011110101110101001101110000001100011000010";
            WHEN "11110" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1111101001110100011011110100000001000010000010";
            WHEN "11111" => p1_uid153_eRndXlog2_uid50_fpExpETest_q <= "1111110100111010001101111010000000100001000010";
            WHEN OTHERS => -- unreachable
                           p1_uid153_eRndXlog2_uid50_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest(ADD,156)@3
    lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 46 => p1_uid153_eRndXlog2_uid50_fpExpETest_q(45)) & p1_uid153_eRndXlog2_uid50_fpExpETest_q));
    lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "0000000" & highBBits_uid156_eRndXlog2_uid50_fpExpETest_b));
    lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_a) + SIGNED(lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_b));
    lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_q <= lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_o(46 downto 0);

    -- lowRangeB_uid155_eRndXlog2_uid50_fpExpETest(BITSELECT,154)@3
    lowRangeB_uid155_eRndXlog2_uid50_fpExpETest_in <= p0_uid154_eRndXlog2_uid50_fpExpETest_q(0 downto 0);
    lowRangeB_uid155_eRndXlog2_uid50_fpExpETest_b <= lowRangeB_uid155_eRndXlog2_uid50_fpExpETest_in(0 downto 0);

    -- lev1_a0_uid158_eRndXlog2_uid50_fpExpETest(BITJOIN,157)@3
    lev1_a0_uid158_eRndXlog2_uid50_fpExpETest_q <= lev1_a0sumAHighB_uid157_eRndXlog2_uid50_fpExpETest_q & lowRangeB_uid155_eRndXlog2_uid50_fpExpETest_b;

    -- sR_uid159_eRndXlog2_uid50_fpExpETest(BITSELECT,158)@3
    sR_uid159_eRndXlog2_uid50_fpExpETest_in <= STD_LOGIC_VECTOR(lev1_a0_uid158_eRndXlog2_uid50_fpExpETest_q(45 downto 0));
    sR_uid159_eRndXlog2_uid50_fpExpETest_b <= STD_LOGIC_VECTOR(sR_uid159_eRndXlog2_uid50_fpExpETest_in(45 downto 3));

    -- redist18(DELAY,297)
    redist18 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid7_fpExpETest_b, xout => redist18_q, clk => clk, aclr => areset );

    -- redist14(DELAY,293)
    redist14 : dspba_delay
    GENERIC MAP ( width => 24, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => oFracX_uid32_fpExpETest_q, xout => redist14_q, clk => clk, aclr => areset );

    -- cstZeroWEP1_uid15_fpExpETest(CONSTANT,14)
    cstZeroWEP1_uid15_fpExpETest_q <= "000000000";

    -- oFracXZwE_uid52_fpExpETest(BITJOIN,51)@2
    oFracXZwE_uid52_fpExpETest_q <= GND_q & redist14_q & cstZeroWEP1_uid15_fpExpETest_q;

    -- onesCmpFxpIn_uid53_fpExpETest(LOGICAL,52)@2
    onesCmpFxpIn_uid53_fpExpETest_a <= oFracXZwE_uid52_fpExpETest_q;
    onesCmpFxpIn_uid53_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 1 => redist18_q(0)) & redist18_q));
    onesCmpFxpIn_uid53_fpExpETest_q <= onesCmpFxpIn_uid53_fpExpETest_a xor onesCmpFxpIn_uid53_fpExpETest_b;

    -- fxpInExt_uid54_fpExpETest(ADD,53)@2
    fxpInExt_uid54_fpExpETest_a <= STD_LOGIC_VECTOR("0" & onesCmpFxpIn_uid53_fpExpETest_q);
    fxpInExt_uid54_fpExpETest_b <= STD_LOGIC_VECTOR("0000000000000000000000000000000000" & redist18_q);
    fxpInExt_uid54_fpExpETest_o <= STD_LOGIC_VECTOR(UNSIGNED(fxpInExt_uid54_fpExpETest_a) + UNSIGNED(fxpInExt_uid54_fpExpETest_b));
    fxpInExt_uid54_fpExpETest_q <= fxpInExt_uid54_fpExpETest_o(34 downto 0);

    -- fxpInPreAlign_uid55_fpExpETest(BITSELECT,54)@2
    fxpInPreAlign_uid55_fpExpETest_in <= STD_LOGIC_VECTOR(fxpInExt_uid54_fpExpETest_q(33 downto 0));
    fxpInPreAlign_uid55_fpExpETest_b <= STD_LOGIC_VECTOR(fxpInPreAlign_uid55_fpExpETest_in(33 downto 0));

    -- xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,243)@2
    xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_in <= STD_LOGIC_VECTOR(fxpInPreAlign_uid55_fpExpETest_b);
    xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b <= STD_LOGIC_VECTOR(xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_in(33 downto 33));

    -- seMsb_to3_uid272(BITSELECT,271)@2
    seMsb_to3_uid272_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((2 downto 1 => xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b(0)) & xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b));
    seMsb_to3_uid272_b <= STD_LOGIC_VECTOR(seMsb_to3_uid272_in(2 downto 0));

    -- rightShiftStage2Idx3Rng3_uid273_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,272)@2
    rightShiftStage2Idx3Rng3_uid273_fxpInPostAlign_X_uid60_fpExpETest_in <= rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q;
    rightShiftStage2Idx3Rng3_uid273_fxpInPostAlign_X_uid60_fpExpETest_b <= rightShiftStage2Idx3Rng3_uid273_fxpInPostAlign_X_uid60_fpExpETest_in(33 downto 3);

    -- rightShiftStage2Idx3_uid274_fxpInPostAlign_X_uid60_fpExpETest(BITJOIN,273)@2
    rightShiftStage2Idx3_uid274_fxpInPostAlign_X_uid60_fpExpETest_q <= seMsb_to3_uid272_b & rightShiftStage2Idx3Rng3_uid273_fxpInPostAlign_X_uid60_fpExpETest_b;

    -- seMsb_to2_uid269(BITSELECT,268)@2
    seMsb_to2_uid269_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((1 downto 1 => xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b(0)) & xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b));
    seMsb_to2_uid269_b <= STD_LOGIC_VECTOR(seMsb_to2_uid269_in(1 downto 0));

    -- rightShiftStage2Idx2Rng2_uid270_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,269)@2
    rightShiftStage2Idx2Rng2_uid270_fxpInPostAlign_X_uid60_fpExpETest_in <= rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q;
    rightShiftStage2Idx2Rng2_uid270_fxpInPostAlign_X_uid60_fpExpETest_b <= rightShiftStage2Idx2Rng2_uid270_fxpInPostAlign_X_uid60_fpExpETest_in(33 downto 2);

    -- rightShiftStage2Idx2_uid271_fxpInPostAlign_X_uid60_fpExpETest(BITJOIN,270)@2
    rightShiftStage2Idx2_uid271_fxpInPostAlign_X_uid60_fpExpETest_q <= seMsb_to2_uid269_b & rightShiftStage2Idx2Rng2_uid270_fxpInPostAlign_X_uid60_fpExpETest_b;

    -- rightShiftStage2Idx1Rng1_uid267_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,266)@2
    rightShiftStage2Idx1Rng1_uid267_fxpInPostAlign_X_uid60_fpExpETest_in <= rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q;
    rightShiftStage2Idx1Rng1_uid267_fxpInPostAlign_X_uid60_fpExpETest_b <= rightShiftStage2Idx1Rng1_uid267_fxpInPostAlign_X_uid60_fpExpETest_in(33 downto 1);

    -- rightShiftStage2Idx1_uid268_fxpInPostAlign_X_uid60_fpExpETest(BITJOIN,267)@2
    rightShiftStage2Idx1_uid268_fxpInPostAlign_X_uid60_fpExpETest_q <= xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b & rightShiftStage2Idx1Rng1_uid267_fxpInPostAlign_X_uid60_fpExpETest_b;

    -- seMsb_to12_uid262(BITSELECT,261)@2
    seMsb_to12_uid262_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b(0)) & xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b));
    seMsb_to12_uid262_b <= STD_LOGIC_VECTOR(seMsb_to12_uid262_in(11 downto 0));

    -- rightShiftStage1Idx3Rng12_uid263_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,262)@2
    rightShiftStage1Idx3Rng12_uid263_fxpInPostAlign_X_uid60_fpExpETest_in <= rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q;
    rightShiftStage1Idx3Rng12_uid263_fxpInPostAlign_X_uid60_fpExpETest_b <= rightShiftStage1Idx3Rng12_uid263_fxpInPostAlign_X_uid60_fpExpETest_in(33 downto 12);

    -- rightShiftStage1Idx3_uid264_fxpInPostAlign_X_uid60_fpExpETest(BITJOIN,263)@2
    rightShiftStage1Idx3_uid264_fxpInPostAlign_X_uid60_fpExpETest_q <= seMsb_to12_uid262_b & rightShiftStage1Idx3Rng12_uid263_fxpInPostAlign_X_uid60_fpExpETest_b;

    -- seMsb_to8_uid259(BITSELECT,258)@2
    seMsb_to8_uid259_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 1 => xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b(0)) & xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b));
    seMsb_to8_uid259_b <= STD_LOGIC_VECTOR(seMsb_to8_uid259_in(7 downto 0));

    -- rightShiftStage1Idx2Rng8_uid260_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,259)@2
    rightShiftStage1Idx2Rng8_uid260_fxpInPostAlign_X_uid60_fpExpETest_in <= rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q;
    rightShiftStage1Idx2Rng8_uid260_fxpInPostAlign_X_uid60_fpExpETest_b <= rightShiftStage1Idx2Rng8_uid260_fxpInPostAlign_X_uid60_fpExpETest_in(33 downto 8);

    -- rightShiftStage1Idx2_uid261_fxpInPostAlign_X_uid60_fpExpETest(BITJOIN,260)@2
    rightShiftStage1Idx2_uid261_fxpInPostAlign_X_uid60_fpExpETest_q <= seMsb_to8_uid259_b & rightShiftStage1Idx2Rng8_uid260_fxpInPostAlign_X_uid60_fpExpETest_b;

    -- seMsb_to4_uid256(BITSELECT,255)@2
    seMsb_to4_uid256_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((3 downto 1 => xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b(0)) & xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b));
    seMsb_to4_uid256_b <= STD_LOGIC_VECTOR(seMsb_to4_uid256_in(3 downto 0));

    -- rightShiftStage1Idx1Rng4_uid257_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,256)@2
    rightShiftStage1Idx1Rng4_uid257_fxpInPostAlign_X_uid60_fpExpETest_in <= rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q;
    rightShiftStage1Idx1Rng4_uid257_fxpInPostAlign_X_uid60_fpExpETest_b <= rightShiftStage1Idx1Rng4_uid257_fxpInPostAlign_X_uid60_fpExpETest_in(33 downto 4);

    -- rightShiftStage1Idx1_uid258_fxpInPostAlign_X_uid60_fpExpETest(BITJOIN,257)@2
    rightShiftStage1Idx1_uid258_fxpInPostAlign_X_uid60_fpExpETest_q <= seMsb_to4_uid256_b & rightShiftStage1Idx1Rng4_uid257_fxpInPostAlign_X_uid60_fpExpETest_b;

    -- stageIndexName_to34_uid252(BITSELECT,251)@2
    stageIndexName_to34_uid252_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((33 downto 1 => xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b(0)) & xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b));
    stageIndexName_to34_uid252_b <= STD_LOGIC_VECTOR(stageIndexName_to34_uid252_in(33 downto 0));

    -- seMsb_to32_uid249(BITSELECT,248)@2
    seMsb_to32_uid249_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 1 => xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b(0)) & xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b));
    seMsb_to32_uid249_b <= STD_LOGIC_VECTOR(seMsb_to32_uid249_in(31 downto 0));

    -- rightShiftStage0Idx2Rng32_uid250_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,249)@2
    rightShiftStage0Idx2Rng32_uid250_fxpInPostAlign_X_uid60_fpExpETest_in <= fxpInPreAlign_uid55_fpExpETest_b;
    rightShiftStage0Idx2Rng32_uid250_fxpInPostAlign_X_uid60_fpExpETest_b <= rightShiftStage0Idx2Rng32_uid250_fxpInPostAlign_X_uid60_fpExpETest_in(33 downto 32);

    -- rightShiftStage0Idx2_uid251_fxpInPostAlign_X_uid60_fpExpETest(BITJOIN,250)@2
    rightShiftStage0Idx2_uid251_fxpInPostAlign_X_uid60_fpExpETest_q <= seMsb_to32_uid249_b & rightShiftStage0Idx2Rng32_uid250_fxpInPostAlign_X_uid60_fpExpETest_b;

    -- seMsb_to16_uid246(BITSELECT,245)@2
    seMsb_to16_uid246_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 1 => xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b(0)) & xMSB_uid244_fxpInPostAlign_X_uid60_fpExpETest_b));
    seMsb_to16_uid246_b <= STD_LOGIC_VECTOR(seMsb_to16_uid246_in(15 downto 0));

    -- rightShiftStage0Idx1Rng16_uid247_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,246)@2
    rightShiftStage0Idx1Rng16_uid247_fxpInPostAlign_X_uid60_fpExpETest_in <= fxpInPreAlign_uid55_fpExpETest_b;
    rightShiftStage0Idx1Rng16_uid247_fxpInPostAlign_X_uid60_fpExpETest_b <= rightShiftStage0Idx1Rng16_uid247_fxpInPostAlign_X_uid60_fpExpETest_in(33 downto 16);

    -- rightShiftStage0Idx1_uid248_fxpInPostAlign_X_uid60_fpExpETest(BITJOIN,247)@2
    rightShiftStage0Idx1_uid248_fxpInPostAlign_X_uid60_fpExpETest_q <= seMsb_to16_uid246_b & rightShiftStage0Idx1Rng16_uid247_fxpInPostAlign_X_uid60_fpExpETest_b;

    -- rightShiftStageSel5Dto4_uid254_fxpInPostAlign_X_uid60_fpExpETest(BITSELECT,253)@2
    rightShiftStageSel5Dto4_uid254_fxpInPostAlign_X_uid60_fpExpETest_in <= shiftVal_uid45_fpExpETest_q;
    rightShiftStageSel5Dto4_uid254_fxpInPostAlign_X_uid60_fpExpETest_b <= rightShiftStageSel5Dto4_uid254_fxpInPostAlign_X_uid60_fpExpETest_in(5 downto 4);

    -- rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest(MUX,254)@2
    rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_s <= rightShiftStageSel5Dto4_uid254_fxpInPostAlign_X_uid60_fpExpETest_b;
    rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_combproc: PROCESS (rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_s, fxpInPreAlign_uid55_fpExpETest_b, rightShiftStage0Idx1_uid248_fxpInPostAlign_X_uid60_fpExpETest_q, rightShiftStage0Idx2_uid251_fxpInPostAlign_X_uid60_fpExpETest_q, stageIndexName_to34_uid252_b)
    BEGIN
        CASE (rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_s) IS
            WHEN "00" => rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q <= fxpInPreAlign_uid55_fpExpETest_b;
            WHEN "01" => rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage0Idx1_uid248_fxpInPostAlign_X_uid60_fpExpETest_q;
            WHEN "10" => rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage0Idx2_uid251_fxpInPostAlign_X_uid60_fpExpETest_q;
            WHEN "11" => rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q <= stageIndexName_to34_uid252_b;
            WHEN OTHERS => rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest(MUX,265)@2
    rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_s <= rightShiftStageSel3Dto2_uid228_fxpInPostAlign_uid47_fpExpETest_b;
    rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_combproc: PROCESS (rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_s, rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q, rightShiftStage1Idx1_uid258_fxpInPostAlign_X_uid60_fpExpETest_q, rightShiftStage1Idx2_uid261_fxpInPostAlign_X_uid60_fpExpETest_q, rightShiftStage1Idx3_uid264_fxpInPostAlign_X_uid60_fpExpETest_q)
    BEGIN
        CASE (rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_s) IS
            WHEN "00" => rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage0_uid255_fxpInPostAlign_X_uid60_fpExpETest_q;
            WHEN "01" => rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage1Idx1_uid258_fxpInPostAlign_X_uid60_fpExpETest_q;
            WHEN "10" => rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage1Idx2_uid261_fxpInPostAlign_X_uid60_fpExpETest_q;
            WHEN "11" => rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage1Idx3_uid264_fxpInPostAlign_X_uid60_fpExpETest_q;
            WHEN OTHERS => rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest(MUX,275)@2 + 1
    rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_s <= rightShiftStageSel1Dto0_uid238_fxpInPostAlign_uid47_fpExpETest_b;
    rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_s) IS
                WHEN "00" => rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage1_uid266_fxpInPostAlign_X_uid60_fpExpETest_q;
                WHEN "01" => rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage2Idx1_uid268_fxpInPostAlign_X_uid60_fpExpETest_q;
                WHEN "10" => rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage2Idx2_uid271_fxpInPostAlign_X_uid60_fpExpETest_q;
                WHEN "11" => rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_q <= rightShiftStage2Idx3_uid274_fxpInPostAlign_X_uid60_fpExpETest_q;
                WHEN OTHERS => rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- aPostPad_uid63_fpExpETest(BITJOIN,62)@3
    aPostPad_uid63_fpExpETest_q <= rightShiftStage2_uid276_fxpInPostAlign_X_uid60_fpExpETest_q & cstZeroWE_uid14_fpExpETest_q;

    -- yExt_uid64_fpExpETest(SUB,63)@3
    yExt_uid64_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 42 => aPostPad_uid63_fpExpETest_q(41)) & aPostPad_uid63_fpExpETest_q));
    yExt_uid64_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 43 => sR_uid159_eRndXlog2_uid50_fpExpETest_b(42)) & sR_uid159_eRndXlog2_uid50_fpExpETest_b));
    yExt_uid64_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(yExt_uid64_fpExpETest_a) - SIGNED(yExt_uid64_fpExpETest_b));
    yExt_uid64_fpExpETest_q <= yExt_uid64_fpExpETest_o(43 downto 0);

    -- yRed_uid67_fpExpETest(BITSELECT,66)@3
    yRed_uid67_fpExpETest_in <= yExt_uid64_fpExpETest_q(31 downto 0);
    yRed_uid67_fpExpETest_b <= yRed_uid67_fpExpETest_in(31 downto 6);

    -- redist11(DELAY,290)
    redist11 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yRed_uid67_fpExpETest_b, xout => redist11_q, clk => clk, aclr => areset );

    -- msbUYExt_uid65_fpExpETest(BITSELECT,64)@3
    msbUYExt_uid65_fpExpETest_in <= STD_LOGIC_VECTOR(yExt_uid64_fpExpETest_q);
    msbUYExt_uid65_fpExpETest_b <= STD_LOGIC_VECTOR(msbUYExt_uid65_fpExpETest_in(43 downto 43));

    -- redist12(DELAY,291)
    redist12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => msbUYExt_uid65_fpExpETest_b, xout => redist12_q, clk => clk, aclr => areset );

    -- yRedPostMux_uid68_fpExpETest(MUX,67)@4
    yRedPostMux_uid68_fpExpETest_s <= redist12_q;
    yRedPostMux_uid68_fpExpETest_combproc: PROCESS (yRedPostMux_uid68_fpExpETest_s, redist11_q, zY_uid66_fpExpETest_q)
    BEGIN
        CASE (yRedPostMux_uid68_fpExpETest_s) IS
            WHEN "0" => yRedPostMux_uid68_fpExpETest_q <= redist11_q;
            WHEN "1" => yRedPostMux_uid68_fpExpETest_q <= zY_uid66_fpExpETest_q;
            WHEN OTHERS => yRedPostMux_uid68_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- yAddr_uid70_fpExpETest(BITSELECT,69)@4
    yAddr_uid70_fpExpETest_in <= yRedPostMux_uid68_fpExpETest_q;
    yAddr_uid70_fpExpETest_b <= yAddr_uid70_fpExpETest_in(25 downto 19);

    -- memoryC2_uid191_expTables(LOOKUP,190)@4
    memoryC2_uid191_expTables_combproc: PROCESS (yAddr_uid70_fpExpETest_b)
    BEGIN
        -- Begin reserved scope level
        CASE (yAddr_uid70_fpExpETest_b) IS
            WHEN "0000000" => memoryC2_uid191_expTables_q <= "00100000000111";
            WHEN "0000001" => memoryC2_uid191_expTables_q <= "00100000011010";
            WHEN "0000010" => memoryC2_uid191_expTables_q <= "00100000101001";
            WHEN "0000011" => memoryC2_uid191_expTables_q <= "00100000111001";
            WHEN "0000100" => memoryC2_uid191_expTables_q <= "00100001001001";
            WHEN "0000101" => memoryC2_uid191_expTables_q <= "00100001011000";
            WHEN "0000110" => memoryC2_uid191_expTables_q <= "00100001101010";
            WHEN "0000111" => memoryC2_uid191_expTables_q <= "00100001111101";
            WHEN "0001000" => memoryC2_uid191_expTables_q <= "00100010001100";
            WHEN "0001001" => memoryC2_uid191_expTables_q <= "00100010011101";
            WHEN "0001010" => memoryC2_uid191_expTables_q <= "00100010101111";
            WHEN "0001011" => memoryC2_uid191_expTables_q <= "00100011000001";
            WHEN "0001100" => memoryC2_uid191_expTables_q <= "00100011010010";
            WHEN "0001101" => memoryC2_uid191_expTables_q <= "00100011100100";
            WHEN "0001110" => memoryC2_uid191_expTables_q <= "00100011110110";
            WHEN "0001111" => memoryC2_uid191_expTables_q <= "00100100000111";
            WHEN "0010000" => memoryC2_uid191_expTables_q <= "00100100011010";
            WHEN "0010001" => memoryC2_uid191_expTables_q <= "00100100101011";
            WHEN "0010010" => memoryC2_uid191_expTables_q <= "00100100111110";
            WHEN "0010011" => memoryC2_uid191_expTables_q <= "00100101010001";
            WHEN "0010100" => memoryC2_uid191_expTables_q <= "00100101100100";
            WHEN "0010101" => memoryC2_uid191_expTables_q <= "00100101110111";
            WHEN "0010110" => memoryC2_uid191_expTables_q <= "00100110001000";
            WHEN "0010111" => memoryC2_uid191_expTables_q <= "00100110011110";
            WHEN "0011000" => memoryC2_uid191_expTables_q <= "00100110101111";
            WHEN "0011001" => memoryC2_uid191_expTables_q <= "00100111000101";
            WHEN "0011010" => memoryC2_uid191_expTables_q <= "00100111011000";
            WHEN "0011011" => memoryC2_uid191_expTables_q <= "00100111101001";
            WHEN "0011100" => memoryC2_uid191_expTables_q <= "00101000000000";
            WHEN "0011101" => memoryC2_uid191_expTables_q <= "00101000010011";
            WHEN "0011110" => memoryC2_uid191_expTables_q <= "00101000101000";
            WHEN "0011111" => memoryC2_uid191_expTables_q <= "00101000111100";
            WHEN "0100000" => memoryC2_uid191_expTables_q <= "00101001001110";
            WHEN "0100001" => memoryC2_uid191_expTables_q <= "00101001100101";
            WHEN "0100010" => memoryC2_uid191_expTables_q <= "00101001111000";
            WHEN "0100011" => memoryC2_uid191_expTables_q <= "00101010001111";
            WHEN "0100100" => memoryC2_uid191_expTables_q <= "00101010100011";
            WHEN "0100101" => memoryC2_uid191_expTables_q <= "00101010111000";
            WHEN "0100110" => memoryC2_uid191_expTables_q <= "00101011001100";
            WHEN "0100111" => memoryC2_uid191_expTables_q <= "00101011100100";
            WHEN "0101000" => memoryC2_uid191_expTables_q <= "00101011111100";
            WHEN "0101001" => memoryC2_uid191_expTables_q <= "00101100001111";
            WHEN "0101010" => memoryC2_uid191_expTables_q <= "00101100100111";
            WHEN "0101011" => memoryC2_uid191_expTables_q <= "00101100111100";
            WHEN "0101100" => memoryC2_uid191_expTables_q <= "00101101010010";
            WHEN "0101101" => memoryC2_uid191_expTables_q <= "00101101101011";
            WHEN "0101110" => memoryC2_uid191_expTables_q <= "00101110000010";
            WHEN "0101111" => memoryC2_uid191_expTables_q <= "00101110011010";
            WHEN "0110000" => memoryC2_uid191_expTables_q <= "00101110101111";
            WHEN "0110001" => memoryC2_uid191_expTables_q <= "00101111000101";
            WHEN "0110010" => memoryC2_uid191_expTables_q <= "00101111100000";
            WHEN "0110011" => memoryC2_uid191_expTables_q <= "00101111111000";
            WHEN "0110100" => memoryC2_uid191_expTables_q <= "00110000001101";
            WHEN "0110101" => memoryC2_uid191_expTables_q <= "00110000101000";
            WHEN "0110110" => memoryC2_uid191_expTables_q <= "00110000111110";
            WHEN "0110111" => memoryC2_uid191_expTables_q <= "00110001011001";
            WHEN "0111000" => memoryC2_uid191_expTables_q <= "00110001110000";
            WHEN "0111001" => memoryC2_uid191_expTables_q <= "00110010001010";
            WHEN "0111010" => memoryC2_uid191_expTables_q <= "00110010100010";
            WHEN "0111011" => memoryC2_uid191_expTables_q <= "00110010111100";
            WHEN "0111100" => memoryC2_uid191_expTables_q <= "00110011010110";
            WHEN "0111101" => memoryC2_uid191_expTables_q <= "00110011110000";
            WHEN "0111110" => memoryC2_uid191_expTables_q <= "00110100000111";
            WHEN "0111111" => memoryC2_uid191_expTables_q <= "00110100100011";
            WHEN "1000000" => memoryC2_uid191_expTables_q <= "00110100111101";
            WHEN "1000001" => memoryC2_uid191_expTables_q <= "00110101011001";
            WHEN "1000010" => memoryC2_uid191_expTables_q <= "00110101110011";
            WHEN "1000011" => memoryC2_uid191_expTables_q <= "00110110001110";
            WHEN "1000100" => memoryC2_uid191_expTables_q <= "00110110101001";
            WHEN "1000101" => memoryC2_uid191_expTables_q <= "00110111000101";
            WHEN "1000110" => memoryC2_uid191_expTables_q <= "00110111100000";
            WHEN "1000111" => memoryC2_uid191_expTables_q <= "00110111111011";
            WHEN "1001000" => memoryC2_uid191_expTables_q <= "00111000011010";
            WHEN "1001001" => memoryC2_uid191_expTables_q <= "00111000110100";
            WHEN "1001010" => memoryC2_uid191_expTables_q <= "00111001010001";
            WHEN "1001011" => memoryC2_uid191_expTables_q <= "00111001101110";
            WHEN "1001100" => memoryC2_uid191_expTables_q <= "00111010001010";
            WHEN "1001101" => memoryC2_uid191_expTables_q <= "00111010100111";
            WHEN "1001110" => memoryC2_uid191_expTables_q <= "00111011000111";
            WHEN "1001111" => memoryC2_uid191_expTables_q <= "00111011100000";
            WHEN "1010000" => memoryC2_uid191_expTables_q <= "00111100000010";
            WHEN "1010001" => memoryC2_uid191_expTables_q <= "00111100011110";
            WHEN "1010010" => memoryC2_uid191_expTables_q <= "00111101000000";
            WHEN "1010011" => memoryC2_uid191_expTables_q <= "00111101011101";
            WHEN "1010100" => memoryC2_uid191_expTables_q <= "00111101111010";
            WHEN "1010101" => memoryC2_uid191_expTables_q <= "00111110011011";
            WHEN "1010110" => memoryC2_uid191_expTables_q <= "00111110111010";
            WHEN "1010111" => memoryC2_uid191_expTables_q <= "00111111011001";
            WHEN "1011000" => memoryC2_uid191_expTables_q <= "00111111111010";
            WHEN "1011001" => memoryC2_uid191_expTables_q <= "01000000010111";
            WHEN "1011010" => memoryC2_uid191_expTables_q <= "01000000111001";
            WHEN "1011011" => memoryC2_uid191_expTables_q <= "01000001011011";
            WHEN "1011100" => memoryC2_uid191_expTables_q <= "01000001111011";
            WHEN "1011101" => memoryC2_uid191_expTables_q <= "01000010011100";
            WHEN "1011110" => memoryC2_uid191_expTables_q <= "01000010111111";
            WHEN "1011111" => memoryC2_uid191_expTables_q <= "01000011011111";
            WHEN "1100000" => memoryC2_uid191_expTables_q <= "01000100000011";
            WHEN "1100001" => memoryC2_uid191_expTables_q <= "01000100100001";
            WHEN "1100010" => memoryC2_uid191_expTables_q <= "01000101000100";
            WHEN "1100011" => memoryC2_uid191_expTables_q <= "01000101101001";
            WHEN "1100100" => memoryC2_uid191_expTables_q <= "01000110001100";
            WHEN "1100101" => memoryC2_uid191_expTables_q <= "01000110101111";
            WHEN "1100110" => memoryC2_uid191_expTables_q <= "01000111010010";
            WHEN "1100111" => memoryC2_uid191_expTables_q <= "01000111110101";
            WHEN "1101000" => memoryC2_uid191_expTables_q <= "01001000011010";
            WHEN "1101001" => memoryC2_uid191_expTables_q <= "01001000111100";
            WHEN "1101010" => memoryC2_uid191_expTables_q <= "01001001100100";
            WHEN "1101011" => memoryC2_uid191_expTables_q <= "01001010000110";
            WHEN "1101100" => memoryC2_uid191_expTables_q <= "01001010101110";
            WHEN "1101101" => memoryC2_uid191_expTables_q <= "01001011010001";
            WHEN "1101110" => memoryC2_uid191_expTables_q <= "01001011111000";
            WHEN "1101111" => memoryC2_uid191_expTables_q <= "01001100011101";
            WHEN "1110000" => memoryC2_uid191_expTables_q <= "01001101000100";
            WHEN "1110001" => memoryC2_uid191_expTables_q <= "01001101101101";
            WHEN "1110010" => memoryC2_uid191_expTables_q <= "01001110010100";
            WHEN "1110011" => memoryC2_uid191_expTables_q <= "01001110111000";
            WHEN "1110100" => memoryC2_uid191_expTables_q <= "01001111100010";
            WHEN "1110101" => memoryC2_uid191_expTables_q <= "01010000000111";
            WHEN "1110110" => memoryC2_uid191_expTables_q <= "01010000110001";
            WHEN "1110111" => memoryC2_uid191_expTables_q <= "01010001011001";
            WHEN "1111000" => memoryC2_uid191_expTables_q <= "01010010000010";
            WHEN "1111001" => memoryC2_uid191_expTables_q <= "01010010101011";
            WHEN "1111010" => memoryC2_uid191_expTables_q <= "01010011010101";
            WHEN "1111011" => memoryC2_uid191_expTables_q <= "01010100000000";
            WHEN "1111100" => memoryC2_uid191_expTables_q <= "01010100101010";
            WHEN "1111101" => memoryC2_uid191_expTables_q <= "01010101010101";
            WHEN "1111110" => memoryC2_uid191_expTables_q <= "01010101111111";
            WHEN "1111111" => memoryC2_uid191_expTables_q <= "01010110101001";
            WHEN OTHERS => -- unreachable
                           memoryC2_uid191_expTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- yPPolyEval_uid71_fpExpETest(BITSELECT,70)@4
    yPPolyEval_uid71_fpExpETest_in <= yRedPostMux_uid68_fpExpETest_q(18 downto 0);
    yPPolyEval_uid71_fpExpETest_b <= yPPolyEval_uid71_fpExpETest_in(18 downto 0);

    -- yT1_uid197_invPolyEval(BITSELECT,196)@4
    yT1_uid197_invPolyEval_in <= yPPolyEval_uid71_fpExpETest_b;
    yT1_uid197_invPolyEval_b <= yT1_uid197_invPolyEval_in(18 downto 5);

    -- prodXY_uid210_pT1_uid198_invPolyEval_cma(CHAINMULTADD,277)@4 + 3
    prodXY_uid210_pT1_uid198_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid210_pT1_uid198_invPolyEval_cma_a1(0),15));
    prodXY_uid210_pT1_uid198_invPolyEval_cma_p(0) <= prodXY_uid210_pT1_uid198_invPolyEval_cma_l(0) * prodXY_uid210_pT1_uid198_invPolyEval_cma_c1(0);
    prodXY_uid210_pT1_uid198_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid210_pT1_uid198_invPolyEval_cma_p(0),29);
    prodXY_uid210_pT1_uid198_invPolyEval_cma_w(0) <= prodXY_uid210_pT1_uid198_invPolyEval_cma_u(0);
    prodXY_uid210_pT1_uid198_invPolyEval_cma_x(0) <= prodXY_uid210_pT1_uid198_invPolyEval_cma_w(0);
    prodXY_uid210_pT1_uid198_invPolyEval_cma_y(0) <= prodXY_uid210_pT1_uid198_invPolyEval_cma_x(0);
    prodXY_uid210_pT1_uid198_invPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid210_pT1_uid198_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid210_pT1_uid198_invPolyEval_cma_c0 <= (others => (others => '0'));
            prodXY_uid210_pT1_uid198_invPolyEval_cma_a1 <= (others => (others => '0'));
            prodXY_uid210_pT1_uid198_invPolyEval_cma_c1 <= (others => (others => '0'));
            prodXY_uid210_pT1_uid198_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid210_pT1_uid198_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid197_invPolyEval_b),14);
            prodXY_uid210_pT1_uid198_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC2_uid191_expTables_q),14);
            prodXY_uid210_pT1_uid198_invPolyEval_cma_a1 <= prodXY_uid210_pT1_uid198_invPolyEval_cma_a0;
            prodXY_uid210_pT1_uid198_invPolyEval_cma_c1 <= prodXY_uid210_pT1_uid198_invPolyEval_cma_c0;
            prodXY_uid210_pT1_uid198_invPolyEval_cma_s(0) <= prodXY_uid210_pT1_uid198_invPolyEval_cma_y(0);
        END IF;
    END PROCESS;
    prodXY_uid210_pT1_uid198_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 28, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid210_pT1_uid198_invPolyEval_cma_s(0)(27 downto 0)), xout => prodXY_uid210_pT1_uid198_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid210_pT1_uid198_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid210_pT1_uid198_invPolyEval_cma_qq(27 downto 0));

    -- osig_uid211_pT1_uid198_invPolyEval(BITSELECT,210)@7
    osig_uid211_pT1_uid198_invPolyEval_in <= STD_LOGIC_VECTOR(prodXY_uid210_pT1_uid198_invPolyEval_cma_q);
    osig_uid211_pT1_uid198_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid211_pT1_uid198_invPolyEval_in(27 downto 13));

    -- highBBits_uid200_invPolyEval(BITSELECT,199)@7
    highBBits_uid200_invPolyEval_in <= STD_LOGIC_VECTOR(osig_uid211_pT1_uid198_invPolyEval_b);
    highBBits_uid200_invPolyEval_b <= STD_LOGIC_VECTOR(highBBits_uid200_invPolyEval_in(14 downto 1));

    -- redist9(DELAY,288)
    redist9 : dspba_delay
    GENERIC MAP ( width => 7, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid70_fpExpETest_b, xout => redist9_q, clk => clk, aclr => areset );

    -- memoryC1_uid188_expTables(LOOKUP,187)@7
    memoryC1_uid188_expTables_combproc: PROCESS (redist9_q)
    BEGIN
        -- Begin reserved scope level
        CASE (redist9_q) IS
            WHEN "0000000" => memoryC1_uid188_expTables_q <= "0001111111111111111110";
            WHEN "0000001" => memoryC1_uid188_expTables_q <= "0010000001000000001011";
            WHEN "0000010" => memoryC1_uid188_expTables_q <= "0010000010000000111101";
            WHEN "0000011" => memoryC1_uid188_expTables_q <= "0010000011000010001110";
            WHEN "0000100" => memoryC1_uid188_expTables_q <= "0010000100000100000000";
            WHEN "0000101" => memoryC1_uid188_expTables_q <= "0010000101000110010100";
            WHEN "0000110" => memoryC1_uid188_expTables_q <= "0010000110001001000110";
            WHEN "0000111" => memoryC1_uid188_expTables_q <= "0010000111001100011010";
            WHEN "0001000" => memoryC1_uid188_expTables_q <= "0010001000010000010011";
            WHEN "0001001" => memoryC1_uid188_expTables_q <= "0010001001010100101101";
            WHEN "0001010" => memoryC1_uid188_expTables_q <= "0010001010011001101000";
            WHEN "0001011" => memoryC1_uid188_expTables_q <= "0010001011011111000101";
            WHEN "0001100" => memoryC1_uid188_expTables_q <= "0010001100100101000111";
            WHEN "0001101" => memoryC1_uid188_expTables_q <= "0010001101101011101011";
            WHEN "0001110" => memoryC1_uid188_expTables_q <= "0010001110110010110010";
            WHEN "0001111" => memoryC1_uid188_expTables_q <= "0010001111111010011110";
            WHEN "0010000" => memoryC1_uid188_expTables_q <= "0010010001000010101100";
            WHEN "0010001" => memoryC1_uid188_expTables_q <= "0010010010001011100010";
            WHEN "0010010" => memoryC1_uid188_expTables_q <= "0010010011010100111001";
            WHEN "0010011" => memoryC1_uid188_expTables_q <= "0010010100011110110110";
            WHEN "0010100" => memoryC1_uid188_expTables_q <= "0010010101101001010111";
            WHEN "0010101" => memoryC1_uid188_expTables_q <= "0010010110110100011111";
            WHEN "0010110" => memoryC1_uid188_expTables_q <= "0010011000000000001101";
            WHEN "0010111" => memoryC1_uid188_expTables_q <= "0010011001001100011110";
            WHEN "0011000" => memoryC1_uid188_expTables_q <= "0010011010011001011001";
            WHEN "0011001" => memoryC1_uid188_expTables_q <= "0010011011100110110111";
            WHEN "0011010" => memoryC1_uid188_expTables_q <= "0010011100110100111111";
            WHEN "0011011" => memoryC1_uid188_expTables_q <= "0010011110000011101111";
            WHEN "0011100" => memoryC1_uid188_expTables_q <= "0010011111010011000010";
            WHEN "0011101" => memoryC1_uid188_expTables_q <= "0010100000100011000001";
            WHEN "0011110" => memoryC1_uid188_expTables_q <= "0010100001110011100110";
            WHEN "0011111" => memoryC1_uid188_expTables_q <= "0010100011000100110100";
            WHEN "0100000" => memoryC1_uid188_expTables_q <= "0010100100010110101101";
            WHEN "0100001" => memoryC1_uid188_expTables_q <= "0010100101101001001011";
            WHEN "0100010" => memoryC1_uid188_expTables_q <= "0010100110111100010110";
            WHEN "0100011" => memoryC1_uid188_expTables_q <= "0010101000010000000111";
            WHEN "0100100" => memoryC1_uid188_expTables_q <= "0010101001100100100110";
            WHEN "0100101" => memoryC1_uid188_expTables_q <= "0010101010111001101110";
            WHEN "0100110" => memoryC1_uid188_expTables_q <= "0010101100001111100001";
            WHEN "0100111" => memoryC1_uid188_expTables_q <= "0010101101100101111100";
            WHEN "0101000" => memoryC1_uid188_expTables_q <= "0010101110111101000011";
            WHEN "0101001" => memoryC1_uid188_expTables_q <= "0010110000010100111010";
            WHEN "0101010" => memoryC1_uid188_expTables_q <= "0010110001101101011001";
            WHEN "0101011" => memoryC1_uid188_expTables_q <= "0010110011000110101000";
            WHEN "0101100" => memoryC1_uid188_expTables_q <= "0010110100100000100010";
            WHEN "0101101" => memoryC1_uid188_expTables_q <= "0010110101111011000110";
            WHEN "0101110" => memoryC1_uid188_expTables_q <= "0010110111010110011010";
            WHEN "0101111" => memoryC1_uid188_expTables_q <= "0010111000110010011100";
            WHEN "0110000" => memoryC1_uid188_expTables_q <= "0010111010001111001111";
            WHEN "0110001" => memoryC1_uid188_expTables_q <= "0010111011101100101111";
            WHEN "0110010" => memoryC1_uid188_expTables_q <= "0010111101001010111010";
            WHEN "0110011" => memoryC1_uid188_expTables_q <= "0010111110101001110111";
            WHEN "0110100" => memoryC1_uid188_expTables_q <= "0011000000001001100110";
            WHEN "0110101" => memoryC1_uid188_expTables_q <= "0011000001101010000001";
            WHEN "0110110" => memoryC1_uid188_expTables_q <= "0011000011001011010000";
            WHEN "0110111" => memoryC1_uid188_expTables_q <= "0011000100101101001100";
            WHEN "0111000" => memoryC1_uid188_expTables_q <= "0011000110001111111101";
            WHEN "0111001" => memoryC1_uid188_expTables_q <= "0011000111110011011100";
            WHEN "0111010" => memoryC1_uid188_expTables_q <= "0011001001010111110000";
            WHEN "0111011" => memoryC1_uid188_expTables_q <= "0011001010111100110101";
            WHEN "0111100" => memoryC1_uid188_expTables_q <= "0011001100100010101100";
            WHEN "0111101" => memoryC1_uid188_expTables_q <= "0011001110001001010111";
            WHEN "0111110" => memoryC1_uid188_expTables_q <= "0011001111110000111001";
            WHEN "0111111" => memoryC1_uid188_expTables_q <= "0011010001011001001001";
            WHEN "1000000" => memoryC1_uid188_expTables_q <= "0011010011000010010000";
            WHEN "1000001" => memoryC1_uid188_expTables_q <= "0011010100101100001011";
            WHEN "1000010" => memoryC1_uid188_expTables_q <= "0011010110010110111101";
            WHEN "1000011" => memoryC1_uid188_expTables_q <= "0011011000000010100011";
            WHEN "1000100" => memoryC1_uid188_expTables_q <= "0011011001101111000000";
            WHEN "1000101" => memoryC1_uid188_expTables_q <= "0011011011011100010010";
            WHEN "1000110" => memoryC1_uid188_expTables_q <= "0011011101001010011100";
            WHEN "1000111" => memoryC1_uid188_expTables_q <= "0011011110111001011110";
            WHEN "1001000" => memoryC1_uid188_expTables_q <= "0011100000101001010011";
            WHEN "1001001" => memoryC1_uid188_expTables_q <= "0011100010011010000111";
            WHEN "1001010" => memoryC1_uid188_expTables_q <= "0011100100001011110000";
            WHEN "1001011" => memoryC1_uid188_expTables_q <= "0011100101111110010010";
            WHEN "1001100" => memoryC1_uid188_expTables_q <= "0011100111110001101111";
            WHEN "1001101" => memoryC1_uid188_expTables_q <= "0011101001100110000101";
            WHEN "1001110" => memoryC1_uid188_expTables_q <= "0011101011011011010010";
            WHEN "1001111" => memoryC1_uid188_expTables_q <= "0011101101010001100010";
            WHEN "1010000" => memoryC1_uid188_expTables_q <= "0011101111001000100101";
            WHEN "1010001" => memoryC1_uid188_expTables_q <= "0011110001000000101001";
            WHEN "1010010" => memoryC1_uid188_expTables_q <= "0011110010111001100100";
            WHEN "1010011" => memoryC1_uid188_expTables_q <= "0011110100110011100001";
            WHEN "1010100" => memoryC1_uid188_expTables_q <= "0011110110101110011011";
            WHEN "1010101" => memoryC1_uid188_expTables_q <= "0011111000101010001111";
            WHEN "1010110" => memoryC1_uid188_expTables_q <= "0011111010100111000011";
            WHEN "1010111" => memoryC1_uid188_expTables_q <= "0011111100100100110111";
            WHEN "1011000" => memoryC1_uid188_expTables_q <= "0011111110100011101000";
            WHEN "1011001" => memoryC1_uid188_expTables_q <= "0100000000100011011101";
            WHEN "1011010" => memoryC1_uid188_expTables_q <= "0100000010100100001101";
            WHEN "1011011" => memoryC1_uid188_expTables_q <= "0100000100100101111110";
            WHEN "1011100" => memoryC1_uid188_expTables_q <= "0100000110101000110010";
            WHEN "1011101" => memoryC1_uid188_expTables_q <= "0100001000101100101000";
            WHEN "1011110" => memoryC1_uid188_expTables_q <= "0100001010110001011110";
            WHEN "1011111" => memoryC1_uid188_expTables_q <= "0100001100110111011010";
            WHEN "1100000" => memoryC1_uid188_expTables_q <= "0100001110111110010101";
            WHEN "1100001" => memoryC1_uid188_expTables_q <= "0100010001000110011010";
            WHEN "1100010" => memoryC1_uid188_expTables_q <= "0100010011001111011111";
            WHEN "1100011" => memoryC1_uid188_expTables_q <= "0100010101011001100111";
            WHEN "1100100" => memoryC1_uid188_expTables_q <= "0100010111100100110110";
            WHEN "1100101" => memoryC1_uid188_expTables_q <= "0100011001110001001100";
            WHEN "1100110" => memoryC1_uid188_expTables_q <= "0100011011111110101000";
            WHEN "1100111" => memoryC1_uid188_expTables_q <= "0100011110001101001100";
            WHEN "1101000" => memoryC1_uid188_expTables_q <= "0100100000011100110110";
            WHEN "1101001" => memoryC1_uid188_expTables_q <= "0100100010101101101011";
            WHEN "1101010" => memoryC1_uid188_expTables_q <= "0100100100111111100011";
            WHEN "1101011" => memoryC1_uid188_expTables_q <= "0100100111010010101010";
            WHEN "1101100" => memoryC1_uid188_expTables_q <= "0100101001100110110110";
            WHEN "1101101" => memoryC1_uid188_expTables_q <= "0100101011111100010001";
            WHEN "1101110" => memoryC1_uid188_expTables_q <= "0100101110010010110011";
            WHEN "1101111" => memoryC1_uid188_expTables_q <= "0100110000101010100011";
            WHEN "1110000" => memoryC1_uid188_expTables_q <= "0100110011000011011111";
            WHEN "1110001" => memoryC1_uid188_expTables_q <= "0100110101011101100100";
            WHEN "1110010" => memoryC1_uid188_expTables_q <= "0100110111111000111010";
            WHEN "1110011" => memoryC1_uid188_expTables_q <= "0100111010010101100001";
            WHEN "1110100" => memoryC1_uid188_expTables_q <= "0100111100110011010001";
            WHEN "1110101" => memoryC1_uid188_expTables_q <= "0100111111010010010101";
            WHEN "1110110" => memoryC1_uid188_expTables_q <= "0101000001110010100100";
            WHEN "1110111" => memoryC1_uid188_expTables_q <= "0101000100010100000110";
            WHEN "1111000" => memoryC1_uid188_expTables_q <= "0101000110110110111001";
            WHEN "1111001" => memoryC1_uid188_expTables_q <= "0101001001011010111101";
            WHEN "1111010" => memoryC1_uid188_expTables_q <= "0101001100000000010100";
            WHEN "1111011" => memoryC1_uid188_expTables_q <= "0101001110100110111100";
            WHEN "1111100" => memoryC1_uid188_expTables_q <= "0101010001001110111010";
            WHEN "1111101" => memoryC1_uid188_expTables_q <= "0101010011111000001011";
            WHEN "1111110" => memoryC1_uid188_expTables_q <= "0101010110100010110010";
            WHEN "1111111" => memoryC1_uid188_expTables_q <= "0101011001001110110000";
            WHEN OTHERS => -- unreachable
                           memoryC1_uid188_expTables_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- s1sumAHighB_uid201_invPolyEval(ADD,200)@7
    s1sumAHighB_uid201_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 22 => memoryC1_uid188_expTables_q(21)) & memoryC1_uid188_expTables_q));
    s1sumAHighB_uid201_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((22 downto 14 => highBBits_uid200_invPolyEval_b(13)) & highBBits_uid200_invPolyEval_b));
    s1sumAHighB_uid201_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid201_invPolyEval_a) + SIGNED(s1sumAHighB_uid201_invPolyEval_b));
    s1sumAHighB_uid201_invPolyEval_q <= s1sumAHighB_uid201_invPolyEval_o(22 downto 0);

    -- lowRangeB_uid199_invPolyEval(BITSELECT,198)@7
    lowRangeB_uid199_invPolyEval_in <= osig_uid211_pT1_uid198_invPolyEval_b(0 downto 0);
    lowRangeB_uid199_invPolyEval_b <= lowRangeB_uid199_invPolyEval_in(0 downto 0);

    -- s1_uid202_invPolyEval(BITJOIN,201)@7
    s1_uid202_invPolyEval_q <= s1sumAHighB_uid201_invPolyEval_q & lowRangeB_uid199_invPolyEval_b;

    -- redist1(DELAY,280)
    redist1 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => s1_uid202_invPolyEval_q, xout => redist1_q, clk => clk, aclr => areset );

    -- redist8_notEnable(LOGICAL,316)
    redist8_notEnable_a <= STD_LOGIC_VECTOR(VCC_q);
    redist8_notEnable_q <= not (redist8_notEnable_a);

    -- redist8_nor(LOGICAL,317)
    redist8_nor_a <= STD_LOGIC_VECTOR(redist8_notEnable_q);
    redist8_nor_b <= STD_LOGIC_VECTOR(redist8_sticky_ena_q);
    redist8_nor_q <= not (redist8_nor_a or redist8_nor_b);

    -- redist8_cmpReg(REG,315)
    redist8_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist8_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist8_cmpReg_q <= STD_LOGIC_VECTOR(VCC_q);
        END IF;
    END PROCESS;

    -- redist8_sticky_ena(REG,318)
    redist8_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist8_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist8_nor_q = "1") THEN
                redist8_sticky_ena_q <= STD_LOGIC_VECTOR(redist8_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist8_enaAnd(LOGICAL,319)
    redist8_enaAnd_a <= STD_LOGIC_VECTOR(redist8_sticky_ena_q);
    redist8_enaAnd_b <= STD_LOGIC_VECTOR(VCC_q);
    redist8_enaAnd_q <= redist8_enaAnd_a and redist8_enaAnd_b;

    -- redist8_rdcnt(COUNTER,313)
    -- low=0, high=1, step=1, init=1
    redist8_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist8_rdcnt_i <= TO_UNSIGNED(1, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist8_rdcnt_i <= redist8_rdcnt_i + 1;
        END IF;
    END PROCESS;
    redist8_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist8_rdcnt_i, 1)));

    -- redist8_inputreg(DELAY,311)
    redist8_inputreg : dspba_delay
    GENERIC MAP ( width => 19, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPPolyEval_uid71_fpExpETest_b, xout => redist8_inputreg_q, clk => clk, aclr => areset );

    -- redist8_wraddr(REG,314)
    redist8_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist8_wraddr_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist8_wraddr_q <= STD_LOGIC_VECTOR(redist8_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist8_mem(DUALMEM,312)
    redist8_mem_ia <= STD_LOGIC_VECTOR(redist8_inputreg_q);
    redist8_mem_aa <= redist8_wraddr_q;
    redist8_mem_ab <= redist8_rdcnt_q;
    redist8_mem_reset0 <= areset;
    redist8_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 19,
        widthad_a => 1,
        numwords_a => 2,
        width_b => 19,
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
        clocken1 => redist8_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist8_mem_reset0,
        clock1 => clk,
        address_a => redist8_mem_aa,
        data_a => redist8_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist8_mem_ab,
        q_b => redist8_mem_iq
    );
    redist8_mem_q <= redist8_mem_iq(18 downto 0);

    -- prodXY_uid213_pT2_uid204_invPolyEval_cma(CHAINMULTADD,278)@8 + 3
    prodXY_uid213_pT2_uid204_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid213_pT2_uid204_invPolyEval_cma_a1(0),20));
    prodXY_uid213_pT2_uid204_invPolyEval_cma_p(0) <= prodXY_uid213_pT2_uid204_invPolyEval_cma_l(0) * prodXY_uid213_pT2_uid204_invPolyEval_cma_c1(0);
    prodXY_uid213_pT2_uid204_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid213_pT2_uid204_invPolyEval_cma_p(0),44);
    prodXY_uid213_pT2_uid204_invPolyEval_cma_w(0) <= prodXY_uid213_pT2_uid204_invPolyEval_cma_u(0);
    prodXY_uid213_pT2_uid204_invPolyEval_cma_x(0) <= prodXY_uid213_pT2_uid204_invPolyEval_cma_w(0);
    prodXY_uid213_pT2_uid204_invPolyEval_cma_y(0) <= prodXY_uid213_pT2_uid204_invPolyEval_cma_x(0);
    prodXY_uid213_pT2_uid204_invPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid213_pT2_uid204_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid213_pT2_uid204_invPolyEval_cma_c0 <= (others => (others => '0'));
            prodXY_uid213_pT2_uid204_invPolyEval_cma_a1 <= (others => (others => '0'));
            prodXY_uid213_pT2_uid204_invPolyEval_cma_c1 <= (others => (others => '0'));
            prodXY_uid213_pT2_uid204_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid213_pT2_uid204_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist8_mem_q),19);
            prodXY_uid213_pT2_uid204_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(redist1_q),24);
            prodXY_uid213_pT2_uid204_invPolyEval_cma_a1 <= prodXY_uid213_pT2_uid204_invPolyEval_cma_a0;
            prodXY_uid213_pT2_uid204_invPolyEval_cma_c1 <= prodXY_uid213_pT2_uid204_invPolyEval_cma_c0;
            prodXY_uid213_pT2_uid204_invPolyEval_cma_s(0) <= prodXY_uid213_pT2_uid204_invPolyEval_cma_y(0);
        END IF;
    END PROCESS;
    prodXY_uid213_pT2_uid204_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 43, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid213_pT2_uid204_invPolyEval_cma_s(0)(42 downto 0)), xout => prodXY_uid213_pT2_uid204_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid213_pT2_uid204_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid213_pT2_uid204_invPolyEval_cma_qq(42 downto 0));

    -- osig_uid214_pT2_uid204_invPolyEval(BITSELECT,213)@11
    osig_uid214_pT2_uid204_invPolyEval_in <= STD_LOGIC_VECTOR(prodXY_uid213_pT2_uid204_invPolyEval_cma_q);
    osig_uid214_pT2_uid204_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid214_pT2_uid204_invPolyEval_in(42 downto 18));

    -- highBBits_uid206_invPolyEval(BITSELECT,205)@11
    highBBits_uid206_invPolyEval_in <= STD_LOGIC_VECTOR(osig_uid214_pT2_uid204_invPolyEval_b);
    highBBits_uid206_invPolyEval_b <= STD_LOGIC_VECTOR(highBBits_uid206_invPolyEval_in(24 downto 2));

    -- redist10(DELAY,289)
    redist10 : dspba_delay
    GENERIC MAP ( width => 7, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist9_q, xout => redist10_q, clk => clk, aclr => areset );

    -- memoryC0_uid185_expTables(LOOKUP,184)@10 + 1
    memoryC0_uid185_expTables_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            memoryC0_uid185_expTables_q <= "00100000000000000000000000100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (redist10_q) IS
                WHEN "0000000" => memoryC0_uid185_expTables_q <= "00100000000000000000000000100";
                WHEN "0000001" => memoryC0_uid185_expTables_q <= "00100000010000000100000001010";
                WHEN "0000010" => memoryC0_uid185_expTables_q <= "00100000100000010000000101111";
                WHEN "0000011" => memoryC0_uid185_expTables_q <= "00100000110000100100010010101";
                WHEN "0000100" => memoryC0_uid185_expTables_q <= "00100001000001000000101011100";
                WHEN "0000101" => memoryC0_uid185_expTables_q <= "00100001010001100101010100101";
                WHEN "0000110" => memoryC0_uid185_expTables_q <= "00100001100010010010010010010";
                WHEN "0000111" => memoryC0_uid185_expTables_q <= "00100001110011000111101000011";
                WHEN "0001000" => memoryC0_uid185_expTables_q <= "00100010000100000101011011010";
                WHEN "0001001" => memoryC0_uid185_expTables_q <= "00100010010101001011101111001";
                WHEN "0001010" => memoryC0_uid185_expTables_q <= "00100010100110011010101000011";
                WHEN "0001011" => memoryC0_uid185_expTables_q <= "00100010110111110010001011010";
                WHEN "0001100" => memoryC0_uid185_expTables_q <= "00100011001001010010011100000";
                WHEN "0001101" => memoryC0_uid185_expTables_q <= "00100011011010111011011111001";
                WHEN "0001110" => memoryC0_uid185_expTables_q <= "00100011101100101101011001000";
                WHEN "0001111" => memoryC0_uid185_expTables_q <= "00100011111110101000001110000";
                WHEN "0010000" => memoryC0_uid185_expTables_q <= "00100100010000101100000010110";
                WHEN "0010001" => memoryC0_uid185_expTables_q <= "00100100100010111000111011100";
                WHEN "0010010" => memoryC0_uid185_expTables_q <= "00100100110101001110111101001";
                WHEN "0010011" => memoryC0_uid185_expTables_q <= "00100101000111101110001100000";
                WHEN "0010100" => memoryC0_uid185_expTables_q <= "00100101011010010110101100111";
                WHEN "0010101" => memoryC0_uid185_expTables_q <= "00100101101101001000100100010";
                WHEN "0010110" => memoryC0_uid185_expTables_q <= "00100110000000000011110111000";
                WHEN "0010111" => memoryC0_uid185_expTables_q <= "00100110010011001000101001110";
                WHEN "0011000" => memoryC0_uid185_expTables_q <= "00100110100110010111000001010";
                WHEN "0011001" => memoryC0_uid185_expTables_q <= "00100110111001101111000010011";
                WHEN "0011010" => memoryC0_uid185_expTables_q <= "00100111001101010000110001111";
                WHEN "0011011" => memoryC0_uid185_expTables_q <= "00100111100000111100010100110";
                WHEN "0011100" => memoryC0_uid185_expTables_q <= "00100111110100110001101111111";
                WHEN "0011101" => memoryC0_uid185_expTables_q <= "00101000001000110001001000001";
                WHEN "0011110" => memoryC0_uid185_expTables_q <= "00101000011100111010100010101";
                WHEN "0011111" => memoryC0_uid185_expTables_q <= "00101000110001001110000100011";
                WHEN "0100000" => memoryC0_uid185_expTables_q <= "00101001000101101011110010011";
                WHEN "0100001" => memoryC0_uid185_expTables_q <= "00101001011010010011110001111";
                WHEN "0100010" => memoryC0_uid185_expTables_q <= "00101001101111000110000111111";
                WHEN "0100011" => memoryC0_uid185_expTables_q <= "00101010000100000010111001110";
                WHEN "0100100" => memoryC0_uid185_expTables_q <= "00101010011001001010001100100";
                WHEN "0100101" => memoryC0_uid185_expTables_q <= "00101010101110011100000101101";
                WHEN "0100110" => memoryC0_uid185_expTables_q <= "00101011000011111000101010011";
                WHEN "0100111" => memoryC0_uid185_expTables_q <= "00101011011001100000000000001";
                WHEN "0101000" => memoryC0_uid185_expTables_q <= "00101011101111010010001100010";
                WHEN "0101001" => memoryC0_uid185_expTables_q <= "00101100000101001111010100001";
                WHEN "0101010" => memoryC0_uid185_expTables_q <= "00101100011011010111011101011";
                WHEN "0101011" => memoryC0_uid185_expTables_q <= "00101100110001101010101101011";
                WHEN "0101100" => memoryC0_uid185_expTables_q <= "00101101001000001001001001111";
                WHEN "0101101" => memoryC0_uid185_expTables_q <= "00101101011110110010111000100";
                WHEN "0101110" => memoryC0_uid185_expTables_q <= "00101101110101100111111110110";
                WHEN "0101111" => memoryC0_uid185_expTables_q <= "00101110001100101000100010011";
                WHEN "0110000" => memoryC0_uid185_expTables_q <= "00101110100011110100101001001";
                WHEN "0110001" => memoryC0_uid185_expTables_q <= "00101110111011001100011000111";
                WHEN "0110010" => memoryC0_uid185_expTables_q <= "00101111010010101111110111100";
                WHEN "0110011" => memoryC0_uid185_expTables_q <= "00101111101010011111001010110";
                WHEN "0110100" => memoryC0_uid185_expTables_q <= "00110000000010011010011000101";
                WHEN "0110101" => memoryC0_uid185_expTables_q <= "00110000011010100001100111001";
                WHEN "0110110" => memoryC0_uid185_expTables_q <= "00110000110010110100111100010";
                WHEN "0110111" => memoryC0_uid185_expTables_q <= "00110001001011010100011110001";
                WHEN "0111000" => memoryC0_uid185_expTables_q <= "00110001100100000000010010110";
                WHEN "0111001" => memoryC0_uid185_expTables_q <= "00110001111100111000100000100";
                WHEN "0111010" => memoryC0_uid185_expTables_q <= "00110010010101111101001101011";
                WHEN "0111011" => memoryC0_uid185_expTables_q <= "00110010101111001110011111110";
                WHEN "0111100" => memoryC0_uid185_expTables_q <= "00110011001000101100011110000";
                WHEN "0111101" => memoryC0_uid185_expTables_q <= "00110011100010010111001110011";
                WHEN "0111110" => memoryC0_uid185_expTables_q <= "00110011111100001110110111010";
                WHEN "0111111" => memoryC0_uid185_expTables_q <= "00110100010110010011011111011";
                WHEN "1000000" => memoryC0_uid185_expTables_q <= "00110100110000100101001101000";
                WHEN "1000001" => memoryC0_uid185_expTables_q <= "00110101001011000100000110110";
                WHEN "1000010" => memoryC0_uid185_expTables_q <= "00110101100101110000010011010";
                WHEN "1000011" => memoryC0_uid185_expTables_q <= "00110110000000101001111001010";
                WHEN "1000100" => memoryC0_uid185_expTables_q <= "00110110011011110000111111011";
                WHEN "1000101" => memoryC0_uid185_expTables_q <= "00110110110111000101101100100";
                WHEN "1000110" => memoryC0_uid185_expTables_q <= "00110111010010101000000111011";
                WHEN "1000111" => memoryC0_uid185_expTables_q <= "00110111101110011000010110111";
                WHEN "1001000" => memoryC0_uid185_expTables_q <= "00111000001010010110100010001";
                WHEN "1001001" => memoryC0_uid185_expTables_q <= "00111000100110100010101111110";
                WHEN "1001010" => memoryC0_uid185_expTables_q <= "00111001000010111101000111001";
                WHEN "1001011" => memoryC0_uid185_expTables_q <= "00111001011111100101101111010";
                WHEN "1001100" => memoryC0_uid185_expTables_q <= "00111001111100011100101111010";
                WHEN "1001101" => memoryC0_uid185_expTables_q <= "00111010011001100010001110011";
                WHEN "1001110" => memoryC0_uid185_expTables_q <= "00111010110110110110010100000";
                WHEN "1001111" => memoryC0_uid185_expTables_q <= "00111011010100011001000111001";
                WHEN "1010000" => memoryC0_uid185_expTables_q <= "00111011110010001010101111100";
                WHEN "1010001" => memoryC0_uid185_expTables_q <= "00111100010000001011010100011";
                WHEN "1010010" => memoryC0_uid185_expTables_q <= "00111100101110011010111101011";
                WHEN "1010011" => memoryC0_uid185_expTables_q <= "00111101001100111001110001111";
                WHEN "1010100" => memoryC0_uid185_expTables_q <= "00111101101011100111111001101";
                WHEN "1010101" => memoryC0_uid185_expTables_q <= "00111110001010100101011100011";
                WHEN "1010110" => memoryC0_uid185_expTables_q <= "00111110101001110010100001110";
                WHEN "1010111" => memoryC0_uid185_expTables_q <= "00111111001001001111010001100";
                WHEN "1011000" => memoryC0_uid185_expTables_q <= "00111111101000111011110011101";
                WHEN "1011001" => memoryC0_uid185_expTables_q <= "01000000001000111000001111111";
                WHEN "1011010" => memoryC0_uid185_expTables_q <= "01000000101001000100101110100";
                WHEN "1011011" => memoryC0_uid185_expTables_q <= "01000001001001100001010111011";
                WHEN "1011100" => memoryC0_uid185_expTables_q <= "01000001101010001110010010101";
                WHEN "1011101" => memoryC0_uid185_expTables_q <= "01000010001011001011101000011";
                WHEN "1011110" => memoryC0_uid185_expTables_q <= "01000010101100011001100001000";
                WHEN "1011111" => memoryC0_uid185_expTables_q <= "01000011001101111000000100101";
                WHEN "1100000" => memoryC0_uid185_expTables_q <= "01000011101111100111011011111";
                WHEN "1100001" => memoryC0_uid185_expTables_q <= "01000100010001100111101110111";
                WHEN "1100010" => memoryC0_uid185_expTables_q <= "01000100110011111001000110011";
                WHEN "1100011" => memoryC0_uid185_expTables_q <= "01000101010110011011101010111";
                WHEN "1100100" => memoryC0_uid185_expTables_q <= "01000101111001001111100101000";
                WHEN "1100101" => memoryC0_uid185_expTables_q <= "01000110011100010100111101011";
                WHEN "1100110" => memoryC0_uid185_expTables_q <= "01000110111111101011111100111";
                WHEN "1100111" => memoryC0_uid185_expTables_q <= "01000111100011010100101100010";
                WHEN "1101000" => memoryC0_uid185_expTables_q <= "01001000000111001111010100100";
                WHEN "1101001" => memoryC0_uid185_expTables_q <= "01001000101011011011111110100";
                WHEN "1101010" => memoryC0_uid185_expTables_q <= "01001001001111111010110011100";
                WHEN "1101011" => memoryC0_uid185_expTables_q <= "01001001110100101011111100011";
                WHEN "1101100" => memoryC0_uid185_expTables_q <= "01001010011001101111100010100";
                WHEN "1101101" => memoryC0_uid185_expTables_q <= "01001010111111000101101111000";
                WHEN "1101110" => memoryC0_uid185_expTables_q <= "01001011100100101110101011011";
                WHEN "1101111" => memoryC0_uid185_expTables_q <= "01001100001010101010100000111";
                WHEN "1110000" => memoryC0_uid185_expTables_q <= "01001100110000111001011001000";
                WHEN "1110001" => memoryC0_uid185_expTables_q <= "01001101010111011011011101100";
                WHEN "1110010" => memoryC0_uid185_expTables_q <= "01001101111110010000110111110";
                WHEN "1110011" => memoryC0_uid185_expTables_q <= "01001110100101011001110001100";
                WHEN "1110100" => memoryC0_uid185_expTables_q <= "01001111001100110110010100110";
                WHEN "1110101" => memoryC0_uid185_expTables_q <= "01001111110100100110101011001";
                WHEN "1110110" => memoryC0_uid185_expTables_q <= "01010000011100101010111110110";
                WHEN "1110111" => memoryC0_uid185_expTables_q <= "01010001000101000011011001100";
                WHEN "1111000" => memoryC0_uid185_expTables_q <= "01010001101101110000000101100";
                WHEN "1111001" => memoryC0_uid185_expTables_q <= "01010010010110110001001101000";
                WHEN "1111010" => memoryC0_uid185_expTables_q <= "01010011000000000110111010001";
                WHEN "1111011" => memoryC0_uid185_expTables_q <= "01010011101001110001010111011";
                WHEN "1111100" => memoryC0_uid185_expTables_q <= "01010100010011110000101111000";
                WHEN "1111101" => memoryC0_uid185_expTables_q <= "01010100111110000101001011101";
                WHEN "1111110" => memoryC0_uid185_expTables_q <= "01010101101000101110110111110";
                WHEN "1111111" => memoryC0_uid185_expTables_q <= "01010110010011101101111110000";
                WHEN OTHERS => -- unreachable
                               memoryC0_uid185_expTables_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- s2sumAHighB_uid207_invPolyEval(ADD,206)@11
    s2sumAHighB_uid207_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => memoryC0_uid185_expTables_q(28)) & memoryC0_uid185_expTables_q));
    s2sumAHighB_uid207_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 23 => highBBits_uid206_invPolyEval_b(22)) & highBBits_uid206_invPolyEval_b));
    s2sumAHighB_uid207_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid207_invPolyEval_a) + SIGNED(s2sumAHighB_uid207_invPolyEval_b));
    s2sumAHighB_uid207_invPolyEval_q <= s2sumAHighB_uid207_invPolyEval_o(29 downto 0);

    -- lowRangeB_uid205_invPolyEval(BITSELECT,204)@11
    lowRangeB_uid205_invPolyEval_in <= osig_uid214_pT2_uid204_invPolyEval_b(1 downto 0);
    lowRangeB_uid205_invPolyEval_b <= lowRangeB_uid205_invPolyEval_in(1 downto 0);

    -- s2_uid208_invPolyEval(BITJOIN,207)@11
    s2_uid208_invPolyEval_q <= s2sumAHighB_uid207_invPolyEval_q & lowRangeB_uid205_invPolyEval_b;

    -- peORExpInc_uid74_fpExpETest(BITSELECT,73)@11
    peORExpInc_uid74_fpExpETest_in <= STD_LOGIC_VECTOR(s2_uid208_invPolyEval_q(29 downto 0));
    peORExpInc_uid74_fpExpETest_b <= STD_LOGIC_VECTOR(peORExpInc_uid74_fpExpETest_in(29 downto 29));

    -- cstBias_uid9_fpExpETest(CONSTANT,8)
    cstBias_uid9_fpExpETest_q <= "01111111";

    -- redist0_notEnable(LOGICAL,307)
    redist0_notEnable_a <= STD_LOGIC_VECTOR(VCC_q);
    redist0_notEnable_q <= not (redist0_notEnable_a);

    -- redist0_nor(LOGICAL,308)
    redist0_nor_a <= STD_LOGIC_VECTOR(redist0_notEnable_q);
    redist0_nor_b <= STD_LOGIC_VECTOR(redist0_sticky_ena_q);
    redist0_nor_q <= not (redist0_nor_a or redist0_nor_b);

    -- redist0_mem_top(CONSTANT,304)
    redist0_mem_top_q <= "0101";

    -- redist0_cmp(LOGICAL,305)
    redist0_cmp_a <= redist0_mem_top_q;
    redist0_cmp_b <= STD_LOGIC_VECTOR("0" & redist0_rdcnt_q);
    redist0_cmp_q <= "1" WHEN redist0_cmp_a = redist0_cmp_b ELSE "0";

    -- redist0_cmpReg(REG,306)
    redist0_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist0_cmpReg_q <= STD_LOGIC_VECTOR(redist0_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_sticky_ena(REG,309)
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

    -- redist0_enaAnd(LOGICAL,310)
    redist0_enaAnd_a <= STD_LOGIC_VECTOR(redist0_sticky_ena_q);
    redist0_enaAnd_b <= STD_LOGIC_VECTOR(VCC_q);
    redist0_enaAnd_q <= redist0_enaAnd_a and redist0_enaAnd_b;

    -- redist0_rdcnt(COUNTER,302)
    -- low=0, high=5, step=1, init=1
    redist0_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_rdcnt_i <= TO_UNSIGNED(1, 3);
            redist0_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist0_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                redist0_rdcnt_eq <= '1';
            ELSE
                redist0_rdcnt_eq <= '0';
            END IF;
            IF (redist0_rdcnt_eq = '1') THEN
                redist0_rdcnt_i <= redist0_rdcnt_i - 5;
            ELSE
                redist0_rdcnt_i <= redist0_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_rdcnt_i, 3)));

    -- redist0_wraddr(REG,303)
    redist0_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist0_wraddr_q <= "000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist0_wraddr_q <= STD_LOGIC_VECTOR(redist0_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_mem(DUALMEM,301)
    redist0_mem_ia <= STD_LOGIC_VECTOR(r_uid242_fxpInPostAlign_uid47_fpExpETest_q);
    redist0_mem_aa <= redist0_wraddr_q;
    redist0_mem_ab <= redist0_rdcnt_q;
    redist0_mem_reset0 <= areset;
    redist0_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 11,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 11,
        widthad_b => 3,
        numwords_b => 6,
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
    redist0_mem_q <= redist0_mem_iq(10 downto 0);

    -- redist0_outputreg(DELAY,300)
    redist0_outputreg : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist0_mem_q, xout => redist0_outputreg_q, clk => clk, aclr => areset );

    -- expRPostBiasPreExc0_uid75_fpExpETest(ADD,74)@11
    expRPostBiasPreExc0_uid75_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => redist0_outputreg_q(10)) & redist0_outputreg_q));
    expRPostBiasPreExc0_uid75_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "0000" & cstBias_uid9_fpExpETest_q));
    expRPostBiasPreExc0_uid75_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc0_uid75_fpExpETest_a) + SIGNED(expRPostBiasPreExc0_uid75_fpExpETest_b));
    expRPostBiasPreExc0_uid75_fpExpETest_q <= expRPostBiasPreExc0_uid75_fpExpETest_o(11 downto 0);

    -- expRPostBiasPreExc_uid76_fpExpETest(ADD,75)@11 + 1
    expRPostBiasPreExc_uid76_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => expRPostBiasPreExc0_uid75_fpExpETest_q(11)) & expRPostBiasPreExc0_uid75_fpExpETest_q));
    expRPostBiasPreExc_uid76_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000000000000" & peORExpInc_uid74_fpExpETest_b));
    expRPostBiasPreExc_uid76_fpExpETest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expRPostBiasPreExc_uid76_fpExpETest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expRPostBiasPreExc_uid76_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(expRPostBiasPreExc_uid76_fpExpETest_a) + SIGNED(expRPostBiasPreExc_uid76_fpExpETest_b));
        END IF;
    END PROCESS;
    expRPostBiasPreExc_uid76_fpExpETest_q <= expRPostBiasPreExc_uid76_fpExpETest_o(12 downto 0);

    -- expR_uid81_fpExpETest(BITSELECT,80)@12
    expR_uid81_fpExpETest_in <= expRPostBiasPreExc_uid76_fpExpETest_q(7 downto 0);
    expR_uid81_fpExpETest_b <= expR_uid81_fpExpETest_in(7 downto 0);

    -- cstZeroWE_uid14_fpExpETest(CONSTANT,13)
    cstZeroWE_uid14_fpExpETest_q <= "00000000";

    -- cstZeroWF_uid18_fpExpETest(CONSTANT,17)
    cstZeroWF_uid18_fpExpETest_q <= "00000000000000000000000";

    -- fracXIsZero_uid24_fpExpETest(LOGICAL,23)@0 + 1
    fracXIsZero_uid24_fpExpETest_a <= cstZeroWF_uid18_fpExpETest_q;
    fracXIsZero_uid24_fpExpETest_b <= fracX_uid8_fpExpETest_b;
    fracXIsZero_uid24_fpExpETest_qi <= "1" WHEN fracXIsZero_uid24_fpExpETest_a = fracXIsZero_uid24_fpExpETest_b ELSE "0";
    fracXIsZero_uid24_fpExpETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid24_fpExpETest_qi, xout => fracXIsZero_uid24_fpExpETest_q, clk => clk, aclr => areset );

    -- fracXIsNotZero_uid25_fpExpETest(LOGICAL,24)@1
    fracXIsNotZero_uid25_fpExpETest_a <= fracXIsZero_uid24_fpExpETest_q;
    fracXIsNotZero_uid25_fpExpETest_q <= not (fracXIsNotZero_uid25_fpExpETest_a);

    -- expXIsMax_uid23_fpExpETest(LOGICAL,22)@1
    expXIsMax_uid23_fpExpETest_a <= redist20_q;
    expXIsMax_uid23_fpExpETest_b <= cstAllOWE_uid17_fpExpETest_q;
    expXIsMax_uid23_fpExpETest_q <= "1" WHEN expXIsMax_uid23_fpExpETest_a = expXIsMax_uid23_fpExpETest_b ELSE "0";

    -- excN_x_uid27_fpExpETest(LOGICAL,26)@1 + 1
    excN_x_uid27_fpExpETest_a <= expXIsMax_uid23_fpExpETest_q;
    excN_x_uid27_fpExpETest_b <= fracXIsNotZero_uid25_fpExpETest_q;
    excN_x_uid27_fpExpETest_qi <= excN_x_uid27_fpExpETest_a and excN_x_uid27_fpExpETest_b;
    excN_x_uid27_fpExpETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid27_fpExpETest_qi, xout => excN_x_uid27_fpExpETest_q, clk => clk, aclr => areset );

    -- redist16(DELAY,295)
    redist16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => excN_x_uid27_fpExpETest_q, xout => redist16_q, clk => clk, aclr => areset );

    -- redist19(DELAY,298)
    redist19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist18_q, xout => redist19_q, clk => clk, aclr => areset );

    -- invSignX_uid87_fpExpETest(LOGICAL,86)@12
    invSignX_uid87_fpExpETest_a <= redist19_q;
    invSignX_uid87_fpExpETest_q <= not (invSignX_uid87_fpExpETest_a);

    -- expOvfInitial_uid42_fpExpETest(BITSELECT,41)@1
    expOvfInitial_uid42_fpExpETest_in <= STD_LOGIC_VECTOR(shiftValuePreSat_uid41_fpExpETest_q);
    expOvfInitial_uid42_fpExpETest_b <= STD_LOGIC_VECTOR(expOvfInitial_uid42_fpExpETest_in(8 downto 8));

    -- redist13(DELAY,292)
    redist13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => expOvfInitial_uid42_fpExpETest_b, xout => redist13_q, clk => clk, aclr => areset );

    -- invExpXIsMax_uid28_fpExpETest(LOGICAL,27)@1
    invExpXIsMax_uid28_fpExpETest_a <= expXIsMax_uid23_fpExpETest_q;
    invExpXIsMax_uid28_fpExpETest_q <= not (invExpXIsMax_uid28_fpExpETest_a);

    -- excZ_x_uid22_fpExpETest(LOGICAL,21)@1
    excZ_x_uid22_fpExpETest_a <= redist20_q;
    excZ_x_uid22_fpExpETest_b <= cstZeroWE_uid14_fpExpETest_q;
    excZ_x_uid22_fpExpETest_q <= "1" WHEN excZ_x_uid22_fpExpETest_a = excZ_x_uid22_fpExpETest_b ELSE "0";

    -- InvExpXIsZero_uid29_fpExpETest(LOGICAL,28)@1
    InvExpXIsZero_uid29_fpExpETest_a <= excZ_x_uid22_fpExpETest_q;
    InvExpXIsZero_uid29_fpExpETest_q <= not (InvExpXIsZero_uid29_fpExpETest_a);

    -- excR_x_uid30_fpExpETest(LOGICAL,29)@1 + 1
    excR_x_uid30_fpExpETest_a <= InvExpXIsZero_uid29_fpExpETest_q;
    excR_x_uid30_fpExpETest_b <= invExpXIsMax_uid28_fpExpETest_q;
    excR_x_uid30_fpExpETest_qi <= excR_x_uid30_fpExpETest_a and excR_x_uid30_fpExpETest_b;
    excR_x_uid30_fpExpETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_x_uid30_fpExpETest_qi, xout => excR_x_uid30_fpExpETest_q, clk => clk, aclr => areset );

    -- redist15(DELAY,294)
    redist15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => excR_x_uid30_fpExpETest_q, xout => redist15_q, clk => clk, aclr => areset );

    -- regXAndExpOverflowAndPos_uid88_fpExpETest(LOGICAL,87)@12
    regXAndExpOverflowAndPos_uid88_fpExpETest_a <= redist15_q;
    regXAndExpOverflowAndPos_uid88_fpExpETest_b <= redist13_q;
    regXAndExpOverflowAndPos_uid88_fpExpETest_c <= invSignX_uid87_fpExpETest_q;
    regXAndExpOverflowAndPos_uid88_fpExpETest_q <= regXAndExpOverflowAndPos_uid88_fpExpETest_a and regXAndExpOverflowAndPos_uid88_fpExpETest_b and regXAndExpOverflowAndPos_uid88_fpExpETest_c;

    -- invExpOvfInitial_uid84_fpExpETest(LOGICAL,83)@12
    invExpOvfInitial_uid84_fpExpETest_a <= redist13_q;
    invExpOvfInitial_uid84_fpExpETest_q <= not (invExpOvfInitial_uid84_fpExpETest_a);

    -- expOvf_uid80_fpExpETest(COMPARE,79)@12
    expOvf_uid80_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expRPostBiasPreExc_uid76_fpExpETest_q(12)) & expRPostBiasPreExc_uid76_fpExpETest_q));
    expOvf_uid80_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000000" & cstAllOWE_uid17_fpExpETest_q));
    expOvf_uid80_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid80_fpExpETest_a) - SIGNED(expOvf_uid80_fpExpETest_b));
    expOvf_uid80_fpExpETest_n(0) <= not (expOvf_uid80_fpExpETest_o(14));

    -- regInAndOvf_uid90_fpExpETest(LOGICAL,89)@12
    regInAndOvf_uid90_fpExpETest_a <= redist15_q;
    regInAndOvf_uid90_fpExpETest_b <= expOvf_uid80_fpExpETest_n;
    regInAndOvf_uid90_fpExpETest_c <= invExpOvfInitial_uid84_fpExpETest_q;
    regInAndOvf_uid90_fpExpETest_q <= regInAndOvf_uid90_fpExpETest_a and regInAndOvf_uid90_fpExpETest_b and regInAndOvf_uid90_fpExpETest_c;

    -- excI_x_uid26_fpExpETest(LOGICAL,25)@1 + 1
    excI_x_uid26_fpExpETest_a <= expXIsMax_uid23_fpExpETest_q;
    excI_x_uid26_fpExpETest_b <= fracXIsZero_uid24_fpExpETest_q;
    excI_x_uid26_fpExpETest_qi <= excI_x_uid26_fpExpETest_a and excI_x_uid26_fpExpETest_b;
    excI_x_uid26_fpExpETest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid26_fpExpETest_qi, xout => excI_x_uid26_fpExpETest_q, clk => clk, aclr => areset );

    -- redist17(DELAY,296)
    redist17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 10, reset_kind => "ASYNC" )
    PORT MAP ( xin => excI_x_uid26_fpExpETest_q, xout => redist17_q, clk => clk, aclr => areset );

    -- posInf_uid92_fpExpETest(LOGICAL,91)@12
    posInf_uid92_fpExpETest_a <= redist17_q;
    posInf_uid92_fpExpETest_b <= invSignX_uid87_fpExpETest_q;
    posInf_uid92_fpExpETest_q <= posInf_uid92_fpExpETest_a and posInf_uid92_fpExpETest_b;

    -- excRInf_uid93_fpExpETest(LOGICAL,92)@12
    excRInf_uid93_fpExpETest_a <= posInf_uid92_fpExpETest_q;
    excRInf_uid93_fpExpETest_b <= regInAndOvf_uid90_fpExpETest_q;
    excRInf_uid93_fpExpETest_c <= regXAndExpOverflowAndPos_uid88_fpExpETest_q;
    excRInf_uid93_fpExpETest_q <= excRInf_uid93_fpExpETest_a or excRInf_uid93_fpExpETest_b or excRInf_uid93_fpExpETest_c;

    -- negInf_uid82_fpExpETest(LOGICAL,81)@12
    negInf_uid82_fpExpETest_a <= redist17_q;
    negInf_uid82_fpExpETest_b <= redist19_q;
    negInf_uid82_fpExpETest_q <= negInf_uid82_fpExpETest_a and negInf_uid82_fpExpETest_b;

    -- regXAndExpOverflowAndNeg_uid83_fpExpETest(LOGICAL,82)@12
    regXAndExpOverflowAndNeg_uid83_fpExpETest_a <= redist15_q;
    regXAndExpOverflowAndNeg_uid83_fpExpETest_b <= redist13_q;
    regXAndExpOverflowAndNeg_uid83_fpExpETest_c <= redist19_q;
    regXAndExpOverflowAndNeg_uid83_fpExpETest_q <= regXAndExpOverflowAndNeg_uid83_fpExpETest_a and regXAndExpOverflowAndNeg_uid83_fpExpETest_b and regXAndExpOverflowAndNeg_uid83_fpExpETest_c;

    -- expUdf_uid78_fpExpETest(COMPARE,77)@12
    expUdf_uid78_fpExpETest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "0000000000000" & GND_q));
    expUdf_uid78_fpExpETest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => expRPostBiasPreExc_uid76_fpExpETest_q(12)) & expRPostBiasPreExc_uid76_fpExpETest_q));
    expUdf_uid78_fpExpETest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid78_fpExpETest_a) - SIGNED(expUdf_uid78_fpExpETest_b));
    expUdf_uid78_fpExpETest_n(0) <= not (expUdf_uid78_fpExpETest_o(14));

    -- regXAndUdf_uid85_fpExpETest(LOGICAL,84)@12
    regXAndUdf_uid85_fpExpETest_a <= redist15_q;
    regXAndUdf_uid85_fpExpETest_b <= expUdf_uid78_fpExpETest_n;
    regXAndUdf_uid85_fpExpETest_c <= invExpOvfInitial_uid84_fpExpETest_q;
    regXAndUdf_uid85_fpExpETest_q <= regXAndUdf_uid85_fpExpETest_a and regXAndUdf_uid85_fpExpETest_b and regXAndUdf_uid85_fpExpETest_c;

    -- excRZero_uid86_fpExpETest(LOGICAL,85)@12
    excRZero_uid86_fpExpETest_a <= regXAndUdf_uid85_fpExpETest_q;
    excRZero_uid86_fpExpETest_b <= regXAndExpOverflowAndNeg_uid83_fpExpETest_q;
    excRZero_uid86_fpExpETest_c <= negInf_uid82_fpExpETest_q;
    excRZero_uid86_fpExpETest_q <= excRZero_uid86_fpExpETest_a or excRZero_uid86_fpExpETest_b or excRZero_uid86_fpExpETest_c;

    -- concExc_uid94_fpExpETest(BITJOIN,93)@12
    concExc_uid94_fpExpETest_q <= redist16_q & excRInf_uid93_fpExpETest_q & excRZero_uid86_fpExpETest_q;

    -- excREnc_uid95_fpExpETest(LOOKUP,94)@12
    excREnc_uid95_fpExpETest_combproc: PROCESS (concExc_uid94_fpExpETest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid94_fpExpETest_q) IS
            WHEN "000" => excREnc_uid95_fpExpETest_q <= "01";
            WHEN "001" => excREnc_uid95_fpExpETest_q <= "00";
            WHEN "010" => excREnc_uid95_fpExpETest_q <= "10";
            WHEN "011" => excREnc_uid95_fpExpETest_q <= "00";
            WHEN "100" => excREnc_uid95_fpExpETest_q <= "11";
            WHEN "101" => excREnc_uid95_fpExpETest_q <= "00";
            WHEN "110" => excREnc_uid95_fpExpETest_q <= "00";
            WHEN "111" => excREnc_uid95_fpExpETest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid95_fpExpETest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- expRPostExc_uid103_fpExpETest(MUX,102)@12
    expRPostExc_uid103_fpExpETest_s <= excREnc_uid95_fpExpETest_q;
    expRPostExc_uid103_fpExpETest_combproc: PROCESS (expRPostExc_uid103_fpExpETest_s, cstZeroWE_uid14_fpExpETest_q, expR_uid81_fpExpETest_b, cstAllOWE_uid17_fpExpETest_q)
    BEGIN
        CASE (expRPostExc_uid103_fpExpETest_s) IS
            WHEN "00" => expRPostExc_uid103_fpExpETest_q <= cstZeroWE_uid14_fpExpETest_q;
            WHEN "01" => expRPostExc_uid103_fpExpETest_q <= expR_uid81_fpExpETest_b;
            WHEN "10" => expRPostExc_uid103_fpExpETest_q <= cstAllOWE_uid17_fpExpETest_q;
            WHEN "11" => expRPostExc_uid103_fpExpETest_q <= cstAllOWE_uid17_fpExpETest_q;
            WHEN OTHERS => expRPostExc_uid103_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid96_fpExpETest(CONSTANT,95)
    oneFracRPostExc2_uid96_fpExpETest_q <= "00000000000000000000001";

    -- peOR_uid73_fpExpETest(BITSELECT,72)@11
    peOR_uid73_fpExpETest_in <= s2_uid208_invPolyEval_q(28 downto 0);
    peOR_uid73_fpExpETest_b <= peOR_uid73_fpExpETest_in(28 downto 5);

    -- fracR_uid77_fpExpETest(BITSELECT,76)@11
    fracR_uid77_fpExpETest_in <= peOR_uid73_fpExpETest_b(22 downto 0);
    fracR_uid77_fpExpETest_b <= fracR_uid77_fpExpETest_in(22 downto 0);

    -- redist7(DELAY,286)
    redist7 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracR_uid77_fpExpETest_b, xout => redist7_q, clk => clk, aclr => areset );

    -- fracRPostExc_uid99_fpExpETest(MUX,98)@12
    fracRPostExc_uid99_fpExpETest_s <= excREnc_uid95_fpExpETest_q;
    fracRPostExc_uid99_fpExpETest_combproc: PROCESS (fracRPostExc_uid99_fpExpETest_s, cstZeroWF_uid18_fpExpETest_q, redist7_q, oneFracRPostExc2_uid96_fpExpETest_q)
    BEGIN
        CASE (fracRPostExc_uid99_fpExpETest_s) IS
            WHEN "00" => fracRPostExc_uid99_fpExpETest_q <= cstZeroWF_uid18_fpExpETest_q;
            WHEN "01" => fracRPostExc_uid99_fpExpETest_q <= redist7_q;
            WHEN "10" => fracRPostExc_uid99_fpExpETest_q <= cstZeroWF_uid18_fpExpETest_q;
            WHEN "11" => fracRPostExc_uid99_fpExpETest_q <= oneFracRPostExc2_uid96_fpExpETest_q;
            WHEN OTHERS => fracRPostExc_uid99_fpExpETest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- RExpE_uid104_fpExpETest(BITJOIN,103)@12
    RExpE_uid104_fpExpETest_q <= GND_q & expRPostExc_uid103_fpExpETest_q & fracRPostExc_uid99_fpExpETest_q;

    -- xOut(GPOUT,4)@12
    q <= RExpE_uid104_fpExpETest_q;

END normal;
