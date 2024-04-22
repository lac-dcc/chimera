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

-- VHDL created from fp_div_arria10_altera_fp_functions_160_ffbveaa
-- VHDL created on Tue Oct  9 10:16:59 2018


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

entity fp_div_arria10_altera_fp_functions_160_ffbveaa is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_div_arria10_altera_fp_functions_160_ffbveaa;

architecture normal of fp_div_arria10_altera_fp_functions_160_ffbveaa is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstBiasM1_uid6_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal paddingY_uid15_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal fracYZero_uid15_fpDivTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal fracYZero_uid15_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYZero_uid15_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid18_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstAllZWE_uid20_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid23_fpDivTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid23_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_x_uid23_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid23_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid24_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid24_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid24_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid25_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid25_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid25_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_y_uid37_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal excZ_y_uid37_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid37_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid38_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid38_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid38_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid39_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid39_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid39_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal signR_uid46_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXmY_uid47_fpDivTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expXmY_uid47_fpDivTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal fracYPostZ_uid56_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYPostZ_uid56_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYPostZ_uid56_fpDivTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal fracYPostZ_uid56_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oFracXSE_bottomExtension_uid61_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_a : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_o : STD_LOGIC_VECTOR (35 downto 0);
    signal expFracPostRnd_uid76_fpDivTest_q : STD_LOGIC_VECTOR (34 downto 0);
    signal oneFracRPostExc2_uid100_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal memoryC0_uid112_invTables_lutmem_reset0 : std_logic;
    signal memoryC0_uid112_invTables_lutmem_ia : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid112_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid112_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC0_uid112_invTables_lutmem_ir : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC0_uid112_invTables_lutmem_r : STD_LOGIC_VECTOR (30 downto 0);
    signal memoryC1_uid115_invTables_lutmem_reset0 : std_logic;
    signal memoryC1_uid115_invTables_lutmem_ia : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid115_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid115_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC1_uid115_invTables_lutmem_ir : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC1_uid115_invTables_lutmem_r : STD_LOGIC_VECTOR (20 downto 0);
    signal memoryC2_uid118_invTables_lutmem_reset0 : std_logic;
    signal memoryC2_uid118_invTables_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid118_invTables_lutmem_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid118_invTables_lutmem_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal memoryC2_uid118_invTables_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal memoryC2_uid118_invTables_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_atype is array(0 to 0) of UNSIGNED(25 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0 : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_atype;
    attribute preserve : boolean;
    attribute preserve of prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0 : signal is true;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a1 : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_atype;
    attribute preserve of prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a1 : signal is true;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ctype is array(0 to 0) of UNSIGNED(23 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0 : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ctype;
    attribute preserve of prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0 : signal is true;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c1 : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ctype;
    attribute preserve of prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c1 : signal is true;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ptype is array(0 to 0) of UNSIGNED(49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_p : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ptype;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_utype is array(0 to 0) of UNSIGNED(49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_u : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_utype;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_wtype is array(0 to 0) of UNSIGNED(49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_w : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_wtype;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_xtype is array(0 to 0) of UNSIGNED(49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_x : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_xtype;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ytype is array(0 to 0) of UNSIGNED(49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_y : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_ytype;
    type prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_stype is array(0 to 0) of UNSIGNED(49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s : prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_stype;
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq : STD_LOGIC_VECTOR (49 downto 0);
    signal prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q : STD_LOGIC_VECTOR (49 downto 0);
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_atype is array(0 to 0) of UNSIGNED(11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_a0 : prodXY_uid140_pT1_uid125_invPolyEval_cma_atype;
    attribute preserve of prodXY_uid140_pT1_uid125_invPolyEval_cma_a0 : signal is true;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_a1 : prodXY_uid140_pT1_uid125_invPolyEval_cma_atype;
    attribute preserve of prodXY_uid140_pT1_uid125_invPolyEval_cma_a1 : signal is true;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_ctype is array(0 to 0) of SIGNED(11 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_c0 : prodXY_uid140_pT1_uid125_invPolyEval_cma_ctype;
    attribute preserve of prodXY_uid140_pT1_uid125_invPolyEval_cma_c0 : signal is true;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_c1 : prodXY_uid140_pT1_uid125_invPolyEval_cma_ctype;
    attribute preserve of prodXY_uid140_pT1_uid125_invPolyEval_cma_c1 : signal is true;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_ltype is array(0 to 0) of SIGNED(12 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_l : prodXY_uid140_pT1_uid125_invPolyEval_cma_ltype;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_ptype is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_p : prodXY_uid140_pT1_uid125_invPolyEval_cma_ptype;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_utype is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_u : prodXY_uid140_pT1_uid125_invPolyEval_cma_utype;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_wtype is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_w : prodXY_uid140_pT1_uid125_invPolyEval_cma_wtype;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_xtype is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_x : prodXY_uid140_pT1_uid125_invPolyEval_cma_xtype;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_ytype is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_y : prodXY_uid140_pT1_uid125_invPolyEval_cma_ytype;
    type prodXY_uid140_pT1_uid125_invPolyEval_cma_stype is array(0 to 0) of SIGNED(24 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_s : prodXY_uid140_pT1_uid125_invPolyEval_cma_stype;
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_qq : STD_LOGIC_VECTOR (23 downto 0);
    signal prodXY_uid140_pT1_uid125_invPolyEval_cma_q : STD_LOGIC_VECTOR (23 downto 0);
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_atype is array(0 to 0) of UNSIGNED(13 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_a0 : prodXY_uid143_pT2_uid131_invPolyEval_cma_atype;
    attribute preserve of prodXY_uid143_pT2_uid131_invPolyEval_cma_a0 : signal is true;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_a1 : prodXY_uid143_pT2_uid131_invPolyEval_cma_atype;
    attribute preserve of prodXY_uid143_pT2_uid131_invPolyEval_cma_a1 : signal is true;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_ctype is array(0 to 0) of SIGNED(22 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_c0 : prodXY_uid143_pT2_uid131_invPolyEval_cma_ctype;
    attribute preserve of prodXY_uid143_pT2_uid131_invPolyEval_cma_c0 : signal is true;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_c1 : prodXY_uid143_pT2_uid131_invPolyEval_cma_ctype;
    attribute preserve of prodXY_uid143_pT2_uid131_invPolyEval_cma_c1 : signal is true;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_ltype is array(0 to 0) of SIGNED(14 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_l : prodXY_uid143_pT2_uid131_invPolyEval_cma_ltype;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_ptype is array(0 to 0) of SIGNED(37 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_p : prodXY_uid143_pT2_uid131_invPolyEval_cma_ptype;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_utype is array(0 to 0) of SIGNED(37 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_u : prodXY_uid143_pT2_uid131_invPolyEval_cma_utype;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_wtype is array(0 to 0) of SIGNED(37 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_w : prodXY_uid143_pT2_uid131_invPolyEval_cma_wtype;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_xtype is array(0 to 0) of SIGNED(37 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_x : prodXY_uid143_pT2_uid131_invPolyEval_cma_xtype;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_ytype is array(0 to 0) of SIGNED(37 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_y : prodXY_uid143_pT2_uid131_invPolyEval_cma_ytype;
    type prodXY_uid143_pT2_uid131_invPolyEval_cma_stype is array(0 to 0) of SIGNED(37 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_s : prodXY_uid143_pT2_uid131_invPolyEval_cma_stype;
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_qq : STD_LOGIC_VECTOR (36 downto 0);
    signal prodXY_uid143_pT2_uid131_invPolyEval_cma_q : STD_LOGIC_VECTOR (36 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (13 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (8 downto 0);
    signal redist7_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist10_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_outputreg_q : STD_LOGIC_VECTOR (8 downto 0);
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
    signal redist15_outputreg_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist15_mem_reset0 : std_logic;
    signal redist15_mem_ia : STD_LOGIC_VECTOR (22 downto 0);
    signal redist15_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_mem_iq : STD_LOGIC_VECTOR (22 downto 0);
    signal redist15_mem_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist15_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of redist15_rdcnt_i : signal is true;
    signal redist15_rdcnt_eq : std_logic;
    attribute preserve of redist15_rdcnt_eq : signal is true;
    signal redist15_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal redist15_mem_top_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute preserve of redist15_sticky_ena_q : signal is true;
    signal updatedY_uid16_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal fracXIsNotZero_uid26_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid26_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_x_uid27_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid28_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid29_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid30_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_x_uid31_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid40_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excI_y_uid41_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid42_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExpXIsMax_uid43_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal InvExpXIsZero_uid44_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excR_y_uid45_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expR_uid48_fpDivTest_a : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_o : STD_LOGIC_VECTOR (10 downto 0);
    signal expR_uid48_fpDivTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal zeroOverReg_uid85_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid85_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal zeroOverReg_uid85_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid87_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid87_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xRegOrZero_uid87_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid88_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid88_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal regOrZeroOverInf_uid88_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid90_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid90_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYZ_uid90_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid92_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid92_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYZ_uid92_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid93_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid93_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYR_uid93_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid95_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid95_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXZYZ_uid95_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid96_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid96_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXIYI_uid96_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpDivTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpDivTest_d : STD_LOGIC_VECTOR (0 downto 0);
    signal excRNaN_uid97_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid108_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcRNaN_uid108_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid109_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid109_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sRPostExc_uid109_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal lOAdded_uid58_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
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
    signal redist15_cmp_a : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_cmp_b : STD_LOGIC_VECTOR (3 downto 0);
    signal redist15_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_notEnable_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_nor_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_nor_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_enaAnd_a : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_enaAnd_b : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expX_uid9_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expX_uid9_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracX_uid10_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracX_uid10_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid11_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid11_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expY_uid12_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal expY_uid12_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal fracY_uid13_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal fracY_uid13_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signY_uid14_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signY_uid14_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yPE_uid52_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal yPE_uid52_fpDivTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal oFracXSE_mergedSignalTM_uid63_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal fracRPreExc_uid78_fpDivTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracRPreExc_uid78_fpDivTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal excRPreExc_uid79_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal excRPreExc_uid79_fpDivTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expRExt_uid80_fpDivTest_in : STD_LOGIC_VECTOR (34 downto 0);
    signal expRExt_uid80_fpDivTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal osig_uid138_prodDivPreNormProd_uid60_fpDivTest_in : STD_LOGIC_VECTOR (49 downto 0);
    signal osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal osig_uid141_pT1_uid125_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal osig_uid141_pT1_uid125_invPolyEval_b : STD_LOGIC_VECTOR (12 downto 0);
    signal osig_uid144_pT2_uid131_invPolyEval_in : STD_LOGIC_VECTOR (36 downto 0);
    signal osig_uid144_pT2_uid131_invPolyEval_b : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormTrunc_uid66_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormTrunc_uid66_fpDivTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal yT1_uid124_invPolyEval_in : STD_LOGIC_VECTOR (13 downto 0);
    signal yT1_uid124_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal yAddr_uid51_fpDivTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yAddr_uid51_fpDivTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expUdf_uid81_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expUdf_uid81_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expOvf_uid84_fpDivTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal expOvf_uid84_fpDivTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid126_invPolyEval_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeB_uid126_invPolyEval_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highBBits_uid127_invPolyEval_in : STD_LOGIC_VECTOR (12 downto 0);
    signal highBBits_uid127_invPolyEval_b : STD_LOGIC_VECTOR (11 downto 0);
    signal lowRangeB_uid132_invPolyEval_in : STD_LOGIC_VECTOR (1 downto 0);
    signal lowRangeB_uid132_invPolyEval_b : STD_LOGIC_VECTOR (1 downto 0);
    signal highBBits_uid133_invPolyEval_in : STD_LOGIC_VECTOR (23 downto 0);
    signal highBBits_uid133_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal norm_uid67_fpDivTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal norm_uid67_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal divValPreNormHigh_uid68_fpDivTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal divValPreNormHigh_uid68_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid69_fpDivTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal divValPreNormLow_uid69_fpDivTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal regOverRegWithUf_uid86_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid86_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid86_fpDivTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal regOverRegWithUf_uid86_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid91_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid91_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid91_fpDivTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excXRYROvf_uid91_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_a : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_b : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_o : STD_LOGIC_VECTOR (21 downto 0);
    signal s1sumAHighB_uid128_invPolyEval_q : STD_LOGIC_VECTOR (21 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_a : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_b : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_o : STD_LOGIC_VECTOR (31 downto 0);
    signal s2sumAHighB_uid134_invPolyEval_q : STD_LOGIC_VECTOR (31 downto 0);
    signal normFracRnd_uid70_fpDivTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal normFracRnd_uid70_fpDivTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal rndOp_uid75_fpDivTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal excRZero_uid89_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid89_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid89_fpDivTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRZero_uid89_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid94_fpDivTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid94_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid94_fpDivTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid94_fpDivTest_d : STD_LOGIC_VECTOR (0 downto 0);
    signal excRInf_uid94_fpDivTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal s1_uid129_invPolyEval_q : STD_LOGIC_VECTOR (22 downto 0);
    signal s2_uid135_invPolyEval_q : STD_LOGIC_VECTOR (33 downto 0);
    signal expFracRnd_uid71_fpDivTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal concExc_uid98_fpDivTest_q : STD_LOGIC_VECTOR (2 downto 0);
    signal invY_uid54_fpDivTest_in : STD_LOGIC_VECTOR (30 downto 0);
    signal invY_uid54_fpDivTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal inverseIsOne_uid55_fpDivTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal inverseIsOne_uid55_fpDivTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excREnc_uid99_fpDivTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid103_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal fracRPostExc_uid103_fpDivTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expRPostExc_uid107_fpDivTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid107_fpDivTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal divR_uid110_fpDivTest_q : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- xIn(GPIN,3)@0

    -- fracY_uid13_fpDivTest(BITSELECT,12)@0
    fracY_uid13_fpDivTest_in <= b;
    fracY_uid13_fpDivTest_b <= fracY_uid13_fpDivTest_in(22 downto 0);

    -- paddingY_uid15_fpDivTest(CONSTANT,14)
    paddingY_uid15_fpDivTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid39_fpDivTest(LOGICAL,38)@0 + 1
    fracXIsZero_uid39_fpDivTest_a <= paddingY_uid15_fpDivTest_q;
    fracXIsZero_uid39_fpDivTest_b <= fracY_uid13_fpDivTest_b;
    fracXIsZero_uid39_fpDivTest_qi <= "1" WHEN fracXIsZero_uid39_fpDivTest_a = fracXIsZero_uid39_fpDivTest_b ELSE "0";
    fracXIsZero_uid39_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_qi, xout => fracXIsZero_uid39_fpDivTest_q, clk => clk, aclr => areset );

    -- redist8(DELAY,159)
    redist8 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid39_fpDivTest_q, xout => redist8_q, clk => clk, aclr => areset );

    -- cstAllOWE_uid18_fpDivTest(CONSTANT,17)
    cstAllOWE_uid18_fpDivTest_q <= "11111111";

    -- expY_uid12_fpDivTest(BITSELECT,11)@0
    expY_uid12_fpDivTest_in <= b;
    expY_uid12_fpDivTest_b <= expY_uid12_fpDivTest_in(30 downto 23);

    -- expXIsMax_uid38_fpDivTest(LOGICAL,37)@0 + 1
    expXIsMax_uid38_fpDivTest_a <= expY_uid12_fpDivTest_b;
    expXIsMax_uid38_fpDivTest_b <= cstAllOWE_uid18_fpDivTest_q;
    expXIsMax_uid38_fpDivTest_qi <= "1" WHEN expXIsMax_uid38_fpDivTest_a = expXIsMax_uid38_fpDivTest_b ELSE "0";
    expXIsMax_uid38_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_qi, xout => expXIsMax_uid38_fpDivTest_q, clk => clk, aclr => areset );

    -- redist9(DELAY,160)
    redist9 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid38_fpDivTest_q, xout => redist9_q, clk => clk, aclr => areset );

    -- excI_y_uid41_fpDivTest(LOGICAL,40)@12
    excI_y_uid41_fpDivTest_a <= redist9_q;
    excI_y_uid41_fpDivTest_b <= redist8_q;
    excI_y_uid41_fpDivTest_q <= excI_y_uid41_fpDivTest_a and excI_y_uid41_fpDivTest_b;

    -- redist15_notEnable(LOGICAL,185)
    redist15_notEnable_a <= STD_LOGIC_VECTOR(VCC_q);
    redist15_notEnable_q <= not (redist15_notEnable_a);

    -- redist15_nor(LOGICAL,186)
    redist15_nor_a <= STD_LOGIC_VECTOR(redist15_notEnable_q);
    redist15_nor_b <= STD_LOGIC_VECTOR(redist15_sticky_ena_q);
    redist15_nor_q <= not (redist15_nor_a or redist15_nor_b);

    -- redist15_mem_top(CONSTANT,182)
    redist15_mem_top_q <= "0101";

    -- redist15_cmp(LOGICAL,183)
    redist15_cmp_a <= redist15_mem_top_q;
    redist15_cmp_b <= STD_LOGIC_VECTOR("0" & redist15_rdcnt_q);
    redist15_cmp_q <= "1" WHEN redist15_cmp_a = redist15_cmp_b ELSE "0";

    -- redist15_cmpReg(REG,184)
    redist15_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_cmpReg_q <= STD_LOGIC_VECTOR(redist15_cmp_q);
        END IF;
    END PROCESS;

    -- redist15_sticky_ena(REG,187)
    redist15_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_nor_q = "1") THEN
                redist15_sticky_ena_q <= STD_LOGIC_VECTOR(redist15_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist15_enaAnd(LOGICAL,188)
    redist15_enaAnd_a <= STD_LOGIC_VECTOR(redist15_sticky_ena_q);
    redist15_enaAnd_b <= STD_LOGIC_VECTOR(VCC_q);
    redist15_enaAnd_q <= redist15_enaAnd_a and redist15_enaAnd_b;

    -- redist15_rdcnt(COUNTER,180)
    -- low=0, high=5, step=1, init=1
    redist15_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_rdcnt_i <= TO_UNSIGNED(1, 3);
            redist15_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (redist15_rdcnt_i = TO_UNSIGNED(4, 3)) THEN
                redist15_rdcnt_eq <= '1';
            ELSE
                redist15_rdcnt_eq <= '0';
            END IF;
            IF (redist15_rdcnt_eq = '1') THEN
                redist15_rdcnt_i <= redist15_rdcnt_i - 5;
            ELSE
                redist15_rdcnt_i <= redist15_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist15_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist15_rdcnt_i, 3)));

    -- fracX_uid10_fpDivTest(BITSELECT,9)@0
    fracX_uid10_fpDivTest_in <= a;
    fracX_uid10_fpDivTest_b <= fracX_uid10_fpDivTest_in(22 downto 0);

    -- redist15_wraddr(REG,181)
    redist15_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist15_wraddr_q <= "000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist15_wraddr_q <= STD_LOGIC_VECTOR(redist15_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist15_mem(DUALMEM,179)
    redist15_mem_ia <= STD_LOGIC_VECTOR(fracX_uid10_fpDivTest_b);
    redist15_mem_aa <= redist15_wraddr_q;
    redist15_mem_ab <= redist15_rdcnt_q;
    redist15_mem_reset0 <= areset;
    redist15_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 23,
        widthad_a => 3,
        numwords_a => 6,
        width_b => 23,
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
        clocken1 => redist15_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => redist15_mem_reset0,
        clock1 => clk,
        address_a => redist15_mem_aa,
        data_a => redist15_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist15_mem_ab,
        q_b => redist15_mem_iq
    );
    redist15_mem_q <= redist15_mem_iq(22 downto 0);

    -- redist15_outputreg(DELAY,178)
    redist15_outputreg : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist15_mem_q, xout => redist15_outputreg_q, clk => clk, aclr => areset );

    -- fracXIsZero_uid25_fpDivTest(LOGICAL,24)@8 + 1
    fracXIsZero_uid25_fpDivTest_a <= paddingY_uid15_fpDivTest_q;
    fracXIsZero_uid25_fpDivTest_b <= redist15_outputreg_q;
    fracXIsZero_uid25_fpDivTest_qi <= "1" WHEN fracXIsZero_uid25_fpDivTest_a = fracXIsZero_uid25_fpDivTest_b ELSE "0";
    fracXIsZero_uid25_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpDivTest_qi, xout => fracXIsZero_uid25_fpDivTest_q, clk => clk, aclr => areset );

    -- redist11(DELAY,162)
    redist11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracXIsZero_uid25_fpDivTest_q, xout => redist11_q, clk => clk, aclr => areset );

    -- expX_uid9_fpDivTest(BITSELECT,8)@0
    expX_uid9_fpDivTest_in <= a;
    expX_uid9_fpDivTest_b <= expX_uid9_fpDivTest_in(30 downto 23);

    -- expXIsMax_uid24_fpDivTest(LOGICAL,23)@0 + 1
    expXIsMax_uid24_fpDivTest_a <= expX_uid9_fpDivTest_b;
    expXIsMax_uid24_fpDivTest_b <= cstAllOWE_uid18_fpDivTest_q;
    expXIsMax_uid24_fpDivTest_qi <= "1" WHEN expXIsMax_uid24_fpDivTest_a = expXIsMax_uid24_fpDivTest_b ELSE "0";
    expXIsMax_uid24_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid24_fpDivTest_qi, xout => expXIsMax_uid24_fpDivTest_q, clk => clk, aclr => areset );

    -- redist12(DELAY,163)
    redist12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => expXIsMax_uid24_fpDivTest_q, xout => redist12_q, clk => clk, aclr => areset );

    -- excI_x_uid27_fpDivTest(LOGICAL,26)@12
    excI_x_uid27_fpDivTest_a <= redist12_q;
    excI_x_uid27_fpDivTest_b <= redist11_q;
    excI_x_uid27_fpDivTest_q <= excI_x_uid27_fpDivTest_a and excI_x_uid27_fpDivTest_b;

    -- excXIYI_uid96_fpDivTest(LOGICAL,95)@12
    excXIYI_uid96_fpDivTest_a <= excI_x_uid27_fpDivTest_q;
    excXIYI_uid96_fpDivTest_b <= excI_y_uid41_fpDivTest_q;
    excXIYI_uid96_fpDivTest_q <= excXIYI_uid96_fpDivTest_a and excXIYI_uid96_fpDivTest_b;

    -- fracXIsNotZero_uid40_fpDivTest(LOGICAL,39)@12
    fracXIsNotZero_uid40_fpDivTest_a <= redist8_q;
    fracXIsNotZero_uid40_fpDivTest_q <= not (fracXIsNotZero_uid40_fpDivTest_a);

    -- excN_y_uid42_fpDivTest(LOGICAL,41)@12
    excN_y_uid42_fpDivTest_a <= redist9_q;
    excN_y_uid42_fpDivTest_b <= fracXIsNotZero_uid40_fpDivTest_q;
    excN_y_uid42_fpDivTest_q <= excN_y_uid42_fpDivTest_a and excN_y_uid42_fpDivTest_b;

    -- fracXIsNotZero_uid26_fpDivTest(LOGICAL,25)@12
    fracXIsNotZero_uid26_fpDivTest_a <= redist11_q;
    fracXIsNotZero_uid26_fpDivTest_q <= not (fracXIsNotZero_uid26_fpDivTest_a);

    -- excN_x_uid28_fpDivTest(LOGICAL,27)@12
    excN_x_uid28_fpDivTest_a <= redist12_q;
    excN_x_uid28_fpDivTest_b <= fracXIsNotZero_uid26_fpDivTest_q;
    excN_x_uid28_fpDivTest_q <= excN_x_uid28_fpDivTest_a and excN_x_uid28_fpDivTest_b;

    -- cstAllZWE_uid20_fpDivTest(CONSTANT,19)
    cstAllZWE_uid20_fpDivTest_q <= "00000000";

    -- excZ_y_uid37_fpDivTest(LOGICAL,36)@0 + 1
    excZ_y_uid37_fpDivTest_a <= expY_uid12_fpDivTest_b;
    excZ_y_uid37_fpDivTest_b <= cstAllZWE_uid20_fpDivTest_q;
    excZ_y_uid37_fpDivTest_qi <= "1" WHEN excZ_y_uid37_fpDivTest_a = excZ_y_uid37_fpDivTest_b ELSE "0";
    excZ_y_uid37_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_qi, xout => excZ_y_uid37_fpDivTest_q, clk => clk, aclr => areset );

    -- redist10(DELAY,161)
    redist10 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_y_uid37_fpDivTest_q, xout => redist10_q, clk => clk, aclr => areset );

    -- excZ_x_uid23_fpDivTest(LOGICAL,22)@0 + 1
    excZ_x_uid23_fpDivTest_a <= expX_uid9_fpDivTest_b;
    excZ_x_uid23_fpDivTest_b <= cstAllZWE_uid20_fpDivTest_q;
    excZ_x_uid23_fpDivTest_qi <= "1" WHEN excZ_x_uid23_fpDivTest_a = excZ_x_uid23_fpDivTest_b ELSE "0";
    excZ_x_uid23_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid23_fpDivTest_qi, xout => excZ_x_uid23_fpDivTest_q, clk => clk, aclr => areset );

    -- redist13(DELAY,164)
    redist13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => excZ_x_uid23_fpDivTest_q, xout => redist13_q, clk => clk, aclr => areset );

    -- excXZYZ_uid95_fpDivTest(LOGICAL,94)@12
    excXZYZ_uid95_fpDivTest_a <= redist13_q;
    excXZYZ_uid95_fpDivTest_b <= redist10_q;
    excXZYZ_uid95_fpDivTest_q <= excXZYZ_uid95_fpDivTest_a and excXZYZ_uid95_fpDivTest_b;

    -- excRNaN_uid97_fpDivTest(LOGICAL,96)@12
    excRNaN_uid97_fpDivTest_a <= excXZYZ_uid95_fpDivTest_q;
    excRNaN_uid97_fpDivTest_b <= excN_x_uid28_fpDivTest_q;
    excRNaN_uid97_fpDivTest_c <= excN_y_uid42_fpDivTest_q;
    excRNaN_uid97_fpDivTest_d <= excXIYI_uid96_fpDivTest_q;
    excRNaN_uid97_fpDivTest_q <= excRNaN_uid97_fpDivTest_a or excRNaN_uid97_fpDivTest_b or excRNaN_uid97_fpDivTest_c or excRNaN_uid97_fpDivTest_d;

    -- invExcRNaN_uid108_fpDivTest(LOGICAL,107)@12
    invExcRNaN_uid108_fpDivTest_a <= excRNaN_uid97_fpDivTest_q;
    invExcRNaN_uid108_fpDivTest_q <= not (invExcRNaN_uid108_fpDivTest_a);

    -- signY_uid14_fpDivTest(BITSELECT,13)@0
    signY_uid14_fpDivTest_in <= STD_LOGIC_VECTOR(b);
    signY_uid14_fpDivTest_b <= STD_LOGIC_VECTOR(signY_uid14_fpDivTest_in(31 downto 31));

    -- signX_uid11_fpDivTest(BITSELECT,10)@0
    signX_uid11_fpDivTest_in <= STD_LOGIC_VECTOR(a);
    signX_uid11_fpDivTest_b <= STD_LOGIC_VECTOR(signX_uid11_fpDivTest_in(31 downto 31));

    -- signR_uid46_fpDivTest(LOGICAL,45)@0 + 1
    signR_uid46_fpDivTest_a <= signX_uid11_fpDivTest_b;
    signR_uid46_fpDivTest_b <= signY_uid14_fpDivTest_b;
    signR_uid46_fpDivTest_qi <= signR_uid46_fpDivTest_a xor signR_uid46_fpDivTest_b;
    signR_uid46_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid46_fpDivTest_qi, xout => signR_uid46_fpDivTest_q, clk => clk, aclr => areset );

    -- redist7(DELAY,158)
    redist7 : dspba_delay
    GENERIC MAP ( width => 1, depth => 11, reset_kind => "ASYNC" )
    PORT MAP ( xin => signR_uid46_fpDivTest_q, xout => redist7_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- sRPostExc_uid109_fpDivTest(LOGICAL,108)@12
    sRPostExc_uid109_fpDivTest_a <= redist7_q;
    sRPostExc_uid109_fpDivTest_b <= invExcRNaN_uid108_fpDivTest_q;
    sRPostExc_uid109_fpDivTest_q <= sRPostExc_uid109_fpDivTest_a and sRPostExc_uid109_fpDivTest_b;

    -- lOAdded_uid58_fpDivTest(BITJOIN,57)@8
    lOAdded_uid58_fpDivTest_q <= VCC_q & redist15_outputreg_q;

    -- redist0(DELAY,151)
    redist0 : dspba_delay
    GENERIC MAP ( width => 24, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => lOAdded_uid58_fpDivTest_q, xout => redist0_q, clk => clk, aclr => areset );

    -- oFracXSE_bottomExtension_uid61_fpDivTest(CONSTANT,60)
    oFracXSE_bottomExtension_uid61_fpDivTest_q <= "00";

    -- oFracXSE_mergedSignalTM_uid63_fpDivTest(BITJOIN,62)@11
    oFracXSE_mergedSignalTM_uid63_fpDivTest_q <= redist0_q & oFracXSE_bottomExtension_uid61_fpDivTest_q;

    -- yAddr_uid51_fpDivTest(BITSELECT,50)@0
    yAddr_uid51_fpDivTest_in <= fracY_uid13_fpDivTest_b;
    yAddr_uid51_fpDivTest_b <= yAddr_uid51_fpDivTest_in(22 downto 14);

    -- memoryC2_uid118_invTables_lutmem(DUALMEM,147)@0 + 2
    memoryC2_uid118_invTables_lutmem_aa <= yAddr_uid51_fpDivTest_b;
    memoryC2_uid118_invTables_lutmem_reset0 <= areset;
    memoryC2_uid118_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_div_arria10_altera_fp_functions_160_ffbveaa_memoryC2_uid118_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC2_uid118_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC2_uid118_invTables_lutmem_aa,
        q_a => memoryC2_uid118_invTables_lutmem_ir
    );
    memoryC2_uid118_invTables_lutmem_r <= memoryC2_uid118_invTables_lutmem_ir(11 downto 0);

    -- yPE_uid52_fpDivTest(BITSELECT,51)@0
    yPE_uid52_fpDivTest_in <= b;
    yPE_uid52_fpDivTest_b <= yPE_uid52_fpDivTest_in(13 downto 0);

    -- redist2(DELAY,153)
    redist2 : dspba_delay
    GENERIC MAP ( width => 14, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => yPE_uid52_fpDivTest_b, xout => redist2_q, clk => clk, aclr => areset );

    -- yT1_uid124_invPolyEval(BITSELECT,123)@2
    yT1_uid124_invPolyEval_in <= redist2_q;
    yT1_uid124_invPolyEval_b <= yT1_uid124_invPolyEval_in(13 downto 2);

    -- prodXY_uid140_pT1_uid125_invPolyEval_cma(CHAINMULTADD,149)@2 + 3
    prodXY_uid140_pT1_uid125_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid140_pT1_uid125_invPolyEval_cma_a1(0),13));
    prodXY_uid140_pT1_uid125_invPolyEval_cma_p(0) <= prodXY_uid140_pT1_uid125_invPolyEval_cma_l(0) * prodXY_uid140_pT1_uid125_invPolyEval_cma_c1(0);
    prodXY_uid140_pT1_uid125_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid140_pT1_uid125_invPolyEval_cma_p(0),25);
    prodXY_uid140_pT1_uid125_invPolyEval_cma_w(0) <= prodXY_uid140_pT1_uid125_invPolyEval_cma_u(0);
    prodXY_uid140_pT1_uid125_invPolyEval_cma_x(0) <= prodXY_uid140_pT1_uid125_invPolyEval_cma_w(0);
    prodXY_uid140_pT1_uid125_invPolyEval_cma_y(0) <= prodXY_uid140_pT1_uid125_invPolyEval_cma_x(0);
    prodXY_uid140_pT1_uid125_invPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid140_pT1_uid125_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid140_pT1_uid125_invPolyEval_cma_c0 <= (others => (others => '0'));
            prodXY_uid140_pT1_uid125_invPolyEval_cma_a1 <= (others => (others => '0'));
            prodXY_uid140_pT1_uid125_invPolyEval_cma_c1 <= (others => (others => '0'));
            prodXY_uid140_pT1_uid125_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid140_pT1_uid125_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(yT1_uid124_invPolyEval_b),12);
            prodXY_uid140_pT1_uid125_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(memoryC2_uid118_invTables_lutmem_r),12);
            prodXY_uid140_pT1_uid125_invPolyEval_cma_a1 <= prodXY_uid140_pT1_uid125_invPolyEval_cma_a0;
            prodXY_uid140_pT1_uid125_invPolyEval_cma_c1 <= prodXY_uid140_pT1_uid125_invPolyEval_cma_c0;
            prodXY_uid140_pT1_uid125_invPolyEval_cma_s(0) <= prodXY_uid140_pT1_uid125_invPolyEval_cma_y(0);
        END IF;
    END PROCESS;
    prodXY_uid140_pT1_uid125_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 24, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_s(0)(23 downto 0)), xout => prodXY_uid140_pT1_uid125_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid140_pT1_uid125_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_qq(23 downto 0));

    -- osig_uid141_pT1_uid125_invPolyEval(BITSELECT,140)@5
    osig_uid141_pT1_uid125_invPolyEval_in <= STD_LOGIC_VECTOR(prodXY_uid140_pT1_uid125_invPolyEval_cma_q);
    osig_uid141_pT1_uid125_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid141_pT1_uid125_invPolyEval_in(23 downto 11));

    -- highBBits_uid127_invPolyEval(BITSELECT,126)@5
    highBBits_uid127_invPolyEval_in <= STD_LOGIC_VECTOR(osig_uid141_pT1_uid125_invPolyEval_b);
    highBBits_uid127_invPolyEval_b <= STD_LOGIC_VECTOR(highBBits_uid127_invPolyEval_in(12 downto 1));

    -- redist4(DELAY,155)
    redist4 : dspba_delay
    GENERIC MAP ( width => 9, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => yAddr_uid51_fpDivTest_b, xout => redist4_q, clk => clk, aclr => areset );

    -- memoryC1_uid115_invTables_lutmem(DUALMEM,146)@3 + 2
    memoryC1_uid115_invTables_lutmem_aa <= redist4_q;
    memoryC1_uid115_invTables_lutmem_reset0 <= areset;
    memoryC1_uid115_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 21,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_div_arria10_altera_fp_functions_160_ffbveaa_memoryC1_uid115_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC1_uid115_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC1_uid115_invTables_lutmem_aa,
        q_a => memoryC1_uid115_invTables_lutmem_ir
    );
    memoryC1_uid115_invTables_lutmem_r <= memoryC1_uid115_invTables_lutmem_ir(20 downto 0);

    -- s1sumAHighB_uid128_invPolyEval(ADD,127)@5
    s1sumAHighB_uid128_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => memoryC1_uid115_invTables_lutmem_r(20)) & memoryC1_uid115_invTables_lutmem_r));
    s1sumAHighB_uid128_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 12 => highBBits_uid127_invPolyEval_b(11)) & highBBits_uid127_invPolyEval_b));
    s1sumAHighB_uid128_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s1sumAHighB_uid128_invPolyEval_a) + SIGNED(s1sumAHighB_uid128_invPolyEval_b));
    s1sumAHighB_uid128_invPolyEval_q <= s1sumAHighB_uid128_invPolyEval_o(21 downto 0);

    -- lowRangeB_uid126_invPolyEval(BITSELECT,125)@5
    lowRangeB_uid126_invPolyEval_in <= osig_uid141_pT1_uid125_invPolyEval_b(0 downto 0);
    lowRangeB_uid126_invPolyEval_b <= lowRangeB_uid126_invPolyEval_in(0 downto 0);

    -- s1_uid129_invPolyEval(BITJOIN,128)@5
    s1_uid129_invPolyEval_q <= s1sumAHighB_uid128_invPolyEval_q & lowRangeB_uid126_invPolyEval_b;

    -- redist3(DELAY,154)
    redist3 : dspba_delay
    GENERIC MAP ( width => 14, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist2_q, xout => redist3_q, clk => clk, aclr => areset );

    -- prodXY_uid143_pT2_uid131_invPolyEval_cma(CHAINMULTADD,150)@5 + 3
    prodXY_uid143_pT2_uid131_invPolyEval_cma_l(0) <= SIGNED(RESIZE(prodXY_uid143_pT2_uid131_invPolyEval_cma_a1(0),15));
    prodXY_uid143_pT2_uid131_invPolyEval_cma_p(0) <= prodXY_uid143_pT2_uid131_invPolyEval_cma_l(0) * prodXY_uid143_pT2_uid131_invPolyEval_cma_c1(0);
    prodXY_uid143_pT2_uid131_invPolyEval_cma_u(0) <= RESIZE(prodXY_uid143_pT2_uid131_invPolyEval_cma_p(0),38);
    prodXY_uid143_pT2_uid131_invPolyEval_cma_w(0) <= prodXY_uid143_pT2_uid131_invPolyEval_cma_u(0);
    prodXY_uid143_pT2_uid131_invPolyEval_cma_x(0) <= prodXY_uid143_pT2_uid131_invPolyEval_cma_w(0);
    prodXY_uid143_pT2_uid131_invPolyEval_cma_y(0) <= prodXY_uid143_pT2_uid131_invPolyEval_cma_x(0);
    prodXY_uid143_pT2_uid131_invPolyEval_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid143_pT2_uid131_invPolyEval_cma_a0 <= (others => (others => '0'));
            prodXY_uid143_pT2_uid131_invPolyEval_cma_c0 <= (others => (others => '0'));
            prodXY_uid143_pT2_uid131_invPolyEval_cma_a1 <= (others => (others => '0'));
            prodXY_uid143_pT2_uid131_invPolyEval_cma_c1 <= (others => (others => '0'));
            prodXY_uid143_pT2_uid131_invPolyEval_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid143_pT2_uid131_invPolyEval_cma_a0(0) <= RESIZE(UNSIGNED(redist3_q),14);
            prodXY_uid143_pT2_uid131_invPolyEval_cma_c0(0) <= RESIZE(SIGNED(s1_uid129_invPolyEval_q),23);
            prodXY_uid143_pT2_uid131_invPolyEval_cma_a1 <= prodXY_uid143_pT2_uid131_invPolyEval_cma_a0;
            prodXY_uid143_pT2_uid131_invPolyEval_cma_c1 <= prodXY_uid143_pT2_uid131_invPolyEval_cma_c0;
            prodXY_uid143_pT2_uid131_invPolyEval_cma_s(0) <= prodXY_uid143_pT2_uid131_invPolyEval_cma_y(0);
        END IF;
    END PROCESS;
    prodXY_uid143_pT2_uid131_invPolyEval_cma_delay : dspba_delay
    GENERIC MAP ( width => 37, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_s(0)(36 downto 0)), xout => prodXY_uid143_pT2_uid131_invPolyEval_cma_qq, clk => clk, aclr => areset );
    prodXY_uid143_pT2_uid131_invPolyEval_cma_q <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_qq(36 downto 0));

    -- osig_uid144_pT2_uid131_invPolyEval(BITSELECT,143)@8
    osig_uid144_pT2_uid131_invPolyEval_in <= STD_LOGIC_VECTOR(prodXY_uid143_pT2_uid131_invPolyEval_cma_q);
    osig_uid144_pT2_uid131_invPolyEval_b <= STD_LOGIC_VECTOR(osig_uid144_pT2_uid131_invPolyEval_in(36 downto 13));

    -- highBBits_uid133_invPolyEval(BITSELECT,132)@8
    highBBits_uid133_invPolyEval_in <= STD_LOGIC_VECTOR(osig_uid144_pT2_uid131_invPolyEval_b);
    highBBits_uid133_invPolyEval_b <= STD_LOGIC_VECTOR(highBBits_uid133_invPolyEval_in(23 downto 2));

    -- redist5(DELAY,156)
    redist5 : dspba_delay
    GENERIC MAP ( width => 9, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist4_q, xout => redist5_q, clk => clk, aclr => areset );

    -- memoryC0_uid112_invTables_lutmem(DUALMEM,145)@6 + 2
    memoryC0_uid112_invTables_lutmem_aa <= redist5_q;
    memoryC0_uid112_invTables_lutmem_reset0 <= areset;
    memoryC0_uid112_invTables_lutmem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "M20K",
        operation_mode => "ROM",
        width_a => 31,
        widthad_a => 9,
        numwords_a => 512,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fp_div_arria10_altera_fp_functions_160_ffbveaa_memoryC0_uid112_invTables_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Arria 10"
    )
    PORT MAP (
        clocken0 => VCC_q(0),
        aclr0 => memoryC0_uid112_invTables_lutmem_reset0,
        clock0 => clk,
        address_a => memoryC0_uid112_invTables_lutmem_aa,
        q_a => memoryC0_uid112_invTables_lutmem_ir
    );
    memoryC0_uid112_invTables_lutmem_r <= memoryC0_uid112_invTables_lutmem_ir(30 downto 0);

    -- s2sumAHighB_uid134_invPolyEval(ADD,133)@8
    s2sumAHighB_uid134_invPolyEval_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 31 => memoryC0_uid112_invTables_lutmem_r(30)) & memoryC0_uid112_invTables_lutmem_r));
    s2sumAHighB_uid134_invPolyEval_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 22 => highBBits_uid133_invPolyEval_b(21)) & highBBits_uid133_invPolyEval_b));
    s2sumAHighB_uid134_invPolyEval_o <= STD_LOGIC_VECTOR(SIGNED(s2sumAHighB_uid134_invPolyEval_a) + SIGNED(s2sumAHighB_uid134_invPolyEval_b));
    s2sumAHighB_uid134_invPolyEval_q <= s2sumAHighB_uid134_invPolyEval_o(31 downto 0);

    -- lowRangeB_uid132_invPolyEval(BITSELECT,131)@8
    lowRangeB_uid132_invPolyEval_in <= osig_uid144_pT2_uid131_invPolyEval_b(1 downto 0);
    lowRangeB_uid132_invPolyEval_b <= lowRangeB_uid132_invPolyEval_in(1 downto 0);

    -- s2_uid135_invPolyEval(BITJOIN,134)@8
    s2_uid135_invPolyEval_q <= s2sumAHighB_uid134_invPolyEval_q & lowRangeB_uid132_invPolyEval_b;

    -- invY_uid54_fpDivTest(BITSELECT,53)@8
    invY_uid54_fpDivTest_in <= s2_uid135_invPolyEval_q(30 downto 0);
    invY_uid54_fpDivTest_b <= invY_uid54_fpDivTest_in(30 downto 5);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma(CHAINMULTADD,148)@8 + 3
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_p(0) <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a1(0) * prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c1(0);
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_u(0) <= RESIZE(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_p(0),50);
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_w(0) <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_u(0);
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_x(0) <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_w(0);
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_y(0) <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_x(0);
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_chainmultadd: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0 <= (others => (others => '0'));
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0 <= (others => (others => '0'));
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a1 <= (others => (others => '0'));
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c1 <= (others => (others => '0'));
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s <= (others => (others => '0'));
        ELSIF (clk'EVENT AND clk = '1') THEN
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0(0) <= RESIZE(UNSIGNED(invY_uid54_fpDivTest_b),26);
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0(0) <= RESIZE(UNSIGNED(lOAdded_uid58_fpDivTest_q),24);
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a1 <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_a0;
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c1 <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_c0;
            prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s(0) <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_y(0);
        END IF;
    END PROCESS;
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_delay : dspba_delay
    GENERIC MAP ( width => 50, depth => 0, reset_kind => "ASYNC" )
    PORT MAP ( xin => STD_LOGIC_VECTOR(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_s(0)(49 downto 0)), xout => prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq, clk => clk, aclr => areset );
    prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q <= STD_LOGIC_VECTOR(prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_qq(49 downto 0));

    -- osig_uid138_prodDivPreNormProd_uid60_fpDivTest(BITSELECT,137)@11
    osig_uid138_prodDivPreNormProd_uid60_fpDivTest_in <= prodXY_uid137_prodDivPreNormProd_uid60_fpDivTest_cma_q;
    osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b <= osig_uid138_prodDivPreNormProd_uid60_fpDivTest_in(49 downto 24);

    -- inverseIsOne_uid55_fpDivTest(BITSELECT,54)@8
    inverseIsOne_uid55_fpDivTest_in <= s2_uid135_invPolyEval_q(31 downto 0);
    inverseIsOne_uid55_fpDivTest_b <= inverseIsOne_uid55_fpDivTest_in(31 downto 31);

    -- updatedY_uid16_fpDivTest(BITJOIN,15)@0
    updatedY_uid16_fpDivTest_q <= GND_q & paddingY_uid15_fpDivTest_q;

    -- fracYZero_uid15_fpDivTest(LOGICAL,16)@0 + 1
    fracYZero_uid15_fpDivTest_a <= STD_LOGIC_VECTOR("0" & fracY_uid13_fpDivTest_b);
    fracYZero_uid15_fpDivTest_b <= updatedY_uid16_fpDivTest_q;
    fracYZero_uid15_fpDivTest_qi <= "1" WHEN fracYZero_uid15_fpDivTest_a = fracYZero_uid15_fpDivTest_b ELSE "0";
    fracYZero_uid15_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_qi, xout => fracYZero_uid15_fpDivTest_q, clk => clk, aclr => areset );

    -- redist14(DELAY,165)
    redist14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 7, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracYZero_uid15_fpDivTest_q, xout => redist14_q, clk => clk, aclr => areset );

    -- fracYPostZ_uid56_fpDivTest(LOGICAL,55)@8 + 1
    fracYPostZ_uid56_fpDivTest_a <= redist14_q;
    fracYPostZ_uid56_fpDivTest_b <= inverseIsOne_uid55_fpDivTest_b;
    fracYPostZ_uid56_fpDivTest_qi <= fracYPostZ_uid56_fpDivTest_a or fracYPostZ_uid56_fpDivTest_b;
    fracYPostZ_uid56_fpDivTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracYPostZ_uid56_fpDivTest_qi, xout => fracYPostZ_uid56_fpDivTest_q, clk => clk, aclr => areset );

    -- redist1(DELAY,152)
    redist1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracYPostZ_uid56_fpDivTest_q, xout => redist1_q, clk => clk, aclr => areset );

    -- divValPreNormTrunc_uid66_fpDivTest(MUX,65)@11
    divValPreNormTrunc_uid66_fpDivTest_s <= redist1_q;
    divValPreNormTrunc_uid66_fpDivTest_combproc: PROCESS (divValPreNormTrunc_uid66_fpDivTest_s, osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b, oFracXSE_mergedSignalTM_uid63_fpDivTest_q)
    BEGIN
        CASE (divValPreNormTrunc_uid66_fpDivTest_s) IS
            WHEN "0" => divValPreNormTrunc_uid66_fpDivTest_q <= osig_uid138_prodDivPreNormProd_uid60_fpDivTest_b;
            WHEN "1" => divValPreNormTrunc_uid66_fpDivTest_q <= oFracXSE_mergedSignalTM_uid63_fpDivTest_q;
            WHEN OTHERS => divValPreNormTrunc_uid66_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- norm_uid67_fpDivTest(BITSELECT,66)@11
    norm_uid67_fpDivTest_in <= STD_LOGIC_VECTOR(divValPreNormTrunc_uid66_fpDivTest_q);
    norm_uid67_fpDivTest_b <= STD_LOGIC_VECTOR(norm_uid67_fpDivTest_in(25 downto 25));

    -- rndOp_uid75_fpDivTest(BITJOIN,74)@11
    rndOp_uid75_fpDivTest_q <= norm_uid67_fpDivTest_b & paddingY_uid15_fpDivTest_q & VCC_q;

    -- cstBiasM1_uid6_fpDivTest(CONSTANT,5)
    cstBiasM1_uid6_fpDivTest_q <= "01111110";

    -- redist6_notEnable(LOGICAL,174)
    redist6_notEnable_a <= STD_LOGIC_VECTOR(VCC_q);
    redist6_notEnable_q <= not (redist6_notEnable_a);

    -- redist6_nor(LOGICAL,175)
    redist6_nor_a <= STD_LOGIC_VECTOR(redist6_notEnable_q);
    redist6_nor_b <= STD_LOGIC_VECTOR(redist6_sticky_ena_q);
    redist6_nor_q <= not (redist6_nor_a or redist6_nor_b);

    -- redist6_mem_top(CONSTANT,171)
    redist6_mem_top_q <= "0111";

    -- redist6_cmp(LOGICAL,172)
    redist6_cmp_a <= redist6_mem_top_q;
    redist6_cmp_b <= STD_LOGIC_VECTOR("0" & redist6_rdcnt_q);
    redist6_cmp_q <= "1" WHEN redist6_cmp_a = redist6_cmp_b ELSE "0";

    -- redist6_cmpReg(REG,173)
    redist6_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist6_cmpReg_q <= STD_LOGIC_VECTOR(redist6_cmp_q);
        END IF;
    END PROCESS;

    -- redist6_sticky_ena(REG,176)
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

    -- redist6_enaAnd(LOGICAL,177)
    redist6_enaAnd_a <= STD_LOGIC_VECTOR(redist6_sticky_ena_q);
    redist6_enaAnd_b <= STD_LOGIC_VECTOR(VCC_q);
    redist6_enaAnd_q <= redist6_enaAnd_a and redist6_enaAnd_b;

    -- redist6_rdcnt(COUNTER,169)
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

    -- expXmY_uid47_fpDivTest(SUB,46)@0 + 1
    expXmY_uid47_fpDivTest_a <= STD_LOGIC_VECTOR("0" & expX_uid9_fpDivTest_b);
    expXmY_uid47_fpDivTest_b <= STD_LOGIC_VECTOR("0" & expY_uid12_fpDivTest_b);
    expXmY_uid47_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expXmY_uid47_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expXmY_uid47_fpDivTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expXmY_uid47_fpDivTest_a) - UNSIGNED(expXmY_uid47_fpDivTest_b));
        END IF;
    END PROCESS;
    expXmY_uid47_fpDivTest_q <= expXmY_uid47_fpDivTest_o(8 downto 0);

    -- redist6_wraddr(REG,170)
    redist6_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            redist6_wraddr_q <= "000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            redist6_wraddr_q <= STD_LOGIC_VECTOR(redist6_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist6_mem(DUALMEM,168)
    redist6_mem_ia <= STD_LOGIC_VECTOR(expXmY_uid47_fpDivTest_q);
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

    -- redist6_outputreg(DELAY,167)
    redist6_outputreg : dspba_delay
    GENERIC MAP ( width => 9, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => redist6_mem_q, xout => redist6_outputreg_q, clk => clk, aclr => areset );

    -- expR_uid48_fpDivTest(ADD,47)@11
    expR_uid48_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 9 => redist6_outputreg_q(8)) & redist6_outputreg_q));
    expR_uid48_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00" & cstBiasM1_uid6_fpDivTest_q));
    expR_uid48_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expR_uid48_fpDivTest_a) + SIGNED(expR_uid48_fpDivTest_b));
    expR_uid48_fpDivTest_q <= expR_uid48_fpDivTest_o(9 downto 0);

    -- divValPreNormHigh_uid68_fpDivTest(BITSELECT,67)@11
    divValPreNormHigh_uid68_fpDivTest_in <= divValPreNormTrunc_uid66_fpDivTest_q(24 downto 0);
    divValPreNormHigh_uid68_fpDivTest_b <= divValPreNormHigh_uid68_fpDivTest_in(24 downto 1);

    -- divValPreNormLow_uid69_fpDivTest(BITSELECT,68)@11
    divValPreNormLow_uid69_fpDivTest_in <= divValPreNormTrunc_uid66_fpDivTest_q(23 downto 0);
    divValPreNormLow_uid69_fpDivTest_b <= divValPreNormLow_uid69_fpDivTest_in(23 downto 0);

    -- normFracRnd_uid70_fpDivTest(MUX,69)@11
    normFracRnd_uid70_fpDivTest_s <= norm_uid67_fpDivTest_b;
    normFracRnd_uid70_fpDivTest_combproc: PROCESS (normFracRnd_uid70_fpDivTest_s, divValPreNormLow_uid69_fpDivTest_b, divValPreNormHigh_uid68_fpDivTest_b)
    BEGIN
        CASE (normFracRnd_uid70_fpDivTest_s) IS
            WHEN "0" => normFracRnd_uid70_fpDivTest_q <= divValPreNormLow_uid69_fpDivTest_b;
            WHEN "1" => normFracRnd_uid70_fpDivTest_q <= divValPreNormHigh_uid68_fpDivTest_b;
            WHEN OTHERS => normFracRnd_uid70_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- expFracRnd_uid71_fpDivTest(BITJOIN,70)@11
    expFracRnd_uid71_fpDivTest_q <= expR_uid48_fpDivTest_q & normFracRnd_uid70_fpDivTest_q;

    -- expFracPostRnd_uid76_fpDivTest(ADD,75)@11 + 1
    expFracPostRnd_uid76_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((35 downto 34 => expFracRnd_uid71_fpDivTest_q(33)) & expFracRnd_uid71_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "0000000000" & rndOp_uid75_fpDivTest_q));
    expFracPostRnd_uid76_fpDivTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            expFracPostRnd_uid76_fpDivTest_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            expFracPostRnd_uid76_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracPostRnd_uid76_fpDivTest_a) + SIGNED(expFracPostRnd_uid76_fpDivTest_b));
        END IF;
    END PROCESS;
    expFracPostRnd_uid76_fpDivTest_q <= expFracPostRnd_uid76_fpDivTest_o(34 downto 0);

    -- excRPreExc_uid79_fpDivTest(BITSELECT,78)@12
    excRPreExc_uid79_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(31 downto 0);
    excRPreExc_uid79_fpDivTest_b <= excRPreExc_uid79_fpDivTest_in(31 downto 24);

    -- invExpXIsMax_uid43_fpDivTest(LOGICAL,42)@12
    invExpXIsMax_uid43_fpDivTest_a <= redist9_q;
    invExpXIsMax_uid43_fpDivTest_q <= not (invExpXIsMax_uid43_fpDivTest_a);

    -- InvExpXIsZero_uid44_fpDivTest(LOGICAL,43)@12
    InvExpXIsZero_uid44_fpDivTest_a <= redist10_q;
    InvExpXIsZero_uid44_fpDivTest_q <= not (InvExpXIsZero_uid44_fpDivTest_a);

    -- excR_y_uid45_fpDivTest(LOGICAL,44)@12
    excR_y_uid45_fpDivTest_a <= InvExpXIsZero_uid44_fpDivTest_q;
    excR_y_uid45_fpDivTest_b <= invExpXIsMax_uid43_fpDivTest_q;
    excR_y_uid45_fpDivTest_q <= excR_y_uid45_fpDivTest_a and excR_y_uid45_fpDivTest_b;

    -- excXIYR_uid93_fpDivTest(LOGICAL,92)@12
    excXIYR_uid93_fpDivTest_a <= excI_x_uid27_fpDivTest_q;
    excXIYR_uid93_fpDivTest_b <= excR_y_uid45_fpDivTest_q;
    excXIYR_uid93_fpDivTest_q <= excXIYR_uid93_fpDivTest_a and excXIYR_uid93_fpDivTest_b;

    -- excXIYZ_uid92_fpDivTest(LOGICAL,91)@12
    excXIYZ_uid92_fpDivTest_a <= excI_x_uid27_fpDivTest_q;
    excXIYZ_uid92_fpDivTest_b <= redist10_q;
    excXIYZ_uid92_fpDivTest_q <= excXIYZ_uid92_fpDivTest_a and excXIYZ_uid92_fpDivTest_b;

    -- expRExt_uid80_fpDivTest(BITSELECT,79)@12
    expRExt_uid80_fpDivTest_in <= STD_LOGIC_VECTOR(expFracPostRnd_uid76_fpDivTest_q);
    expRExt_uid80_fpDivTest_b <= STD_LOGIC_VECTOR(expRExt_uid80_fpDivTest_in(34 downto 24));

    -- expOvf_uid84_fpDivTest(COMPARE,83)@12
    expOvf_uid84_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid80_fpDivTest_b(10)) & expRExt_uid80_fpDivTest_b));
    expOvf_uid84_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "0000" & cstAllOWE_uid18_fpDivTest_q));
    expOvf_uid84_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expOvf_uid84_fpDivTest_a) - SIGNED(expOvf_uid84_fpDivTest_b));
    expOvf_uid84_fpDivTest_n(0) <= not (expOvf_uid84_fpDivTest_o(12));

    -- invExpXIsMax_uid29_fpDivTest(LOGICAL,28)@12
    invExpXIsMax_uid29_fpDivTest_a <= redist12_q;
    invExpXIsMax_uid29_fpDivTest_q <= not (invExpXIsMax_uid29_fpDivTest_a);

    -- InvExpXIsZero_uid30_fpDivTest(LOGICAL,29)@12
    InvExpXIsZero_uid30_fpDivTest_a <= redist13_q;
    InvExpXIsZero_uid30_fpDivTest_q <= not (InvExpXIsZero_uid30_fpDivTest_a);

    -- excR_x_uid31_fpDivTest(LOGICAL,30)@12
    excR_x_uid31_fpDivTest_a <= InvExpXIsZero_uid30_fpDivTest_q;
    excR_x_uid31_fpDivTest_b <= invExpXIsMax_uid29_fpDivTest_q;
    excR_x_uid31_fpDivTest_q <= excR_x_uid31_fpDivTest_a and excR_x_uid31_fpDivTest_b;

    -- excXRYROvf_uid91_fpDivTest(LOGICAL,90)@12
    excXRYROvf_uid91_fpDivTest_a <= excR_x_uid31_fpDivTest_q;
    excXRYROvf_uid91_fpDivTest_b <= excR_y_uid45_fpDivTest_q;
    excXRYROvf_uid91_fpDivTest_c <= expOvf_uid84_fpDivTest_n;
    excXRYROvf_uid91_fpDivTest_q <= excXRYROvf_uid91_fpDivTest_a and excXRYROvf_uid91_fpDivTest_b and excXRYROvf_uid91_fpDivTest_c;

    -- excXRYZ_uid90_fpDivTest(LOGICAL,89)@12
    excXRYZ_uid90_fpDivTest_a <= excR_x_uid31_fpDivTest_q;
    excXRYZ_uid90_fpDivTest_b <= redist10_q;
    excXRYZ_uid90_fpDivTest_q <= excXRYZ_uid90_fpDivTest_a and excXRYZ_uid90_fpDivTest_b;

    -- excRInf_uid94_fpDivTest(LOGICAL,93)@12
    excRInf_uid94_fpDivTest_a <= excXRYZ_uid90_fpDivTest_q;
    excRInf_uid94_fpDivTest_b <= excXRYROvf_uid91_fpDivTest_q;
    excRInf_uid94_fpDivTest_c <= excXIYZ_uid92_fpDivTest_q;
    excRInf_uid94_fpDivTest_d <= excXIYR_uid93_fpDivTest_q;
    excRInf_uid94_fpDivTest_q <= excRInf_uid94_fpDivTest_a or excRInf_uid94_fpDivTest_b or excRInf_uid94_fpDivTest_c or excRInf_uid94_fpDivTest_d;

    -- xRegOrZero_uid87_fpDivTest(LOGICAL,86)@12
    xRegOrZero_uid87_fpDivTest_a <= excR_x_uid31_fpDivTest_q;
    xRegOrZero_uid87_fpDivTest_b <= redist13_q;
    xRegOrZero_uid87_fpDivTest_q <= xRegOrZero_uid87_fpDivTest_a or xRegOrZero_uid87_fpDivTest_b;

    -- regOrZeroOverInf_uid88_fpDivTest(LOGICAL,87)@12
    regOrZeroOverInf_uid88_fpDivTest_a <= xRegOrZero_uid87_fpDivTest_q;
    regOrZeroOverInf_uid88_fpDivTest_b <= excI_y_uid41_fpDivTest_q;
    regOrZeroOverInf_uid88_fpDivTest_q <= regOrZeroOverInf_uid88_fpDivTest_a and regOrZeroOverInf_uid88_fpDivTest_b;

    -- expUdf_uid81_fpDivTest(COMPARE,80)@12
    expUdf_uid81_fpDivTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "00000000000" & GND_q));
    expUdf_uid81_fpDivTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => expRExt_uid80_fpDivTest_b(10)) & expRExt_uid80_fpDivTest_b));
    expUdf_uid81_fpDivTest_o <= STD_LOGIC_VECTOR(SIGNED(expUdf_uid81_fpDivTest_a) - SIGNED(expUdf_uid81_fpDivTest_b));
    expUdf_uid81_fpDivTest_n(0) <= not (expUdf_uid81_fpDivTest_o(12));

    -- regOverRegWithUf_uid86_fpDivTest(LOGICAL,85)@12
    regOverRegWithUf_uid86_fpDivTest_a <= expUdf_uid81_fpDivTest_n;
    regOverRegWithUf_uid86_fpDivTest_b <= excR_x_uid31_fpDivTest_q;
    regOverRegWithUf_uid86_fpDivTest_c <= excR_y_uid45_fpDivTest_q;
    regOverRegWithUf_uid86_fpDivTest_q <= regOverRegWithUf_uid86_fpDivTest_a and regOverRegWithUf_uid86_fpDivTest_b and regOverRegWithUf_uid86_fpDivTest_c;

    -- zeroOverReg_uid85_fpDivTest(LOGICAL,84)@12
    zeroOverReg_uid85_fpDivTest_a <= redist13_q;
    zeroOverReg_uid85_fpDivTest_b <= excR_y_uid45_fpDivTest_q;
    zeroOverReg_uid85_fpDivTest_q <= zeroOverReg_uid85_fpDivTest_a and zeroOverReg_uid85_fpDivTest_b;

    -- excRZero_uid89_fpDivTest(LOGICAL,88)@12
    excRZero_uid89_fpDivTest_a <= zeroOverReg_uid85_fpDivTest_q;
    excRZero_uid89_fpDivTest_b <= regOverRegWithUf_uid86_fpDivTest_q;
    excRZero_uid89_fpDivTest_c <= regOrZeroOverInf_uid88_fpDivTest_q;
    excRZero_uid89_fpDivTest_q <= excRZero_uid89_fpDivTest_a or excRZero_uid89_fpDivTest_b or excRZero_uid89_fpDivTest_c;

    -- concExc_uid98_fpDivTest(BITJOIN,97)@12
    concExc_uid98_fpDivTest_q <= excRNaN_uid97_fpDivTest_q & excRInf_uid94_fpDivTest_q & excRZero_uid89_fpDivTest_q;

    -- excREnc_uid99_fpDivTest(LOOKUP,98)@12
    excREnc_uid99_fpDivTest_combproc: PROCESS (concExc_uid98_fpDivTest_q)
    BEGIN
        -- Begin reserved scope level
        CASE (concExc_uid98_fpDivTest_q) IS
            WHEN "000" => excREnc_uid99_fpDivTest_q <= "01";
            WHEN "001" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "010" => excREnc_uid99_fpDivTest_q <= "10";
            WHEN "011" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "100" => excREnc_uid99_fpDivTest_q <= "11";
            WHEN "101" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "110" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN "111" => excREnc_uid99_fpDivTest_q <= "00";
            WHEN OTHERS => -- unreachable
                           excREnc_uid99_fpDivTest_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- expRPostExc_uid107_fpDivTest(MUX,106)@12
    expRPostExc_uid107_fpDivTest_s <= excREnc_uid99_fpDivTest_q;
    expRPostExc_uid107_fpDivTest_combproc: PROCESS (expRPostExc_uid107_fpDivTest_s, cstAllZWE_uid20_fpDivTest_q, excRPreExc_uid79_fpDivTest_b, cstAllOWE_uid18_fpDivTest_q)
    BEGIN
        CASE (expRPostExc_uid107_fpDivTest_s) IS
            WHEN "00" => expRPostExc_uid107_fpDivTest_q <= cstAllZWE_uid20_fpDivTest_q;
            WHEN "01" => expRPostExc_uid107_fpDivTest_q <= excRPreExc_uid79_fpDivTest_b;
            WHEN "10" => expRPostExc_uid107_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN "11" => expRPostExc_uid107_fpDivTest_q <= cstAllOWE_uid18_fpDivTest_q;
            WHEN OTHERS => expRPostExc_uid107_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- oneFracRPostExc2_uid100_fpDivTest(CONSTANT,99)
    oneFracRPostExc2_uid100_fpDivTest_q <= "00000000000000000000001";

    -- fracRPreExc_uid78_fpDivTest(BITSELECT,77)@12
    fracRPreExc_uid78_fpDivTest_in <= expFracPostRnd_uid76_fpDivTest_q(23 downto 0);
    fracRPreExc_uid78_fpDivTest_b <= fracRPreExc_uid78_fpDivTest_in(23 downto 1);

    -- fracRPostExc_uid103_fpDivTest(MUX,102)@12
    fracRPostExc_uid103_fpDivTest_s <= excREnc_uid99_fpDivTest_q;
    fracRPostExc_uid103_fpDivTest_combproc: PROCESS (fracRPostExc_uid103_fpDivTest_s, paddingY_uid15_fpDivTest_q, fracRPreExc_uid78_fpDivTest_b, oneFracRPostExc2_uid100_fpDivTest_q)
    BEGIN
        CASE (fracRPostExc_uid103_fpDivTest_s) IS
            WHEN "00" => fracRPostExc_uid103_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "01" => fracRPostExc_uid103_fpDivTest_q <= fracRPreExc_uid78_fpDivTest_b;
            WHEN "10" => fracRPostExc_uid103_fpDivTest_q <= paddingY_uid15_fpDivTest_q;
            WHEN "11" => fracRPostExc_uid103_fpDivTest_q <= oneFracRPostExc2_uid100_fpDivTest_q;
            WHEN OTHERS => fracRPostExc_uid103_fpDivTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- divR_uid110_fpDivTest(BITJOIN,109)@12
    divR_uid110_fpDivTest_q <= sRPostExc_uid109_fpDivTest_q & expRPostExc_uid107_fpDivTest_q & fracRPostExc_uid103_fpDivTest_q;

    -- xOut(GPOUT,4)@12
    q <= divR_uid110_fpDivTest_q;

END normal;
