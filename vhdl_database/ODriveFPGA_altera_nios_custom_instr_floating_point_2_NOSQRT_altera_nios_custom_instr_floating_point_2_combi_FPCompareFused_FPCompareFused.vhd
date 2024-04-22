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

-- VHDL created from FPCompareFused
-- VHDL created on Thu Dec 06 17:41:49 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/qshell64/p4/ip/aion/src/mip_common/hw_model.cpp:1246
entity FPCompareFused is
    port (
        x : in std_logic_vector(31 downto 0);
        y : in std_logic_vector(31 downto 0);
        opSel : in std_logic_vector(2 downto 0);
        r : out std_logic_vector(0 downto 0)
        );
end;

architecture normal of FPCompareFused is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid6_fpCompareFusedTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid7_fpCompareFusedTest_q : std_logic_vector (22 downto 0);
    signal cstAllZWE_uid8_fpCompareFusedTest_q : std_logic_vector (7 downto 0);
    signal two_uid52_fpCompareFusedTest_q : std_logic_vector (1 downto 0);
    signal cmpEqXY_uid72_fpCompareFusedTest_a : std_logic_vector(31 downto 0);
    signal cmpEqXY_uid72_fpCompareFusedTest_b : std_logic_vector(31 downto 0);
    signal cmpEqXY_uid72_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal exp_uid9_fpCompareFusedTest_in : std_logic_vector (30 downto 0);
    signal exp_uid9_fpCompareFusedTest_b : std_logic_vector (7 downto 0);
    signal frac_uid13_fpCompareFusedTest_in : std_logic_vector (22 downto 0);
    signal frac_uid13_fpCompareFusedTest_b : std_logic_vector (22 downto 0);
    signal X31_uid50_fpCompareFusedTest_in : std_logic_vector (31 downto 0);
    signal X31_uid50_fpCompareFusedTest_b : std_logic_vector (0 downto 0);
    signal exp_uid26_fpCompareFusedTest_in : std_logic_vector (30 downto 0);
    signal exp_uid26_fpCompareFusedTest_b : std_logic_vector (7 downto 0);
    signal frac_uid30_fpCompareFusedTest_in : std_logic_vector (22 downto 0);
    signal frac_uid30_fpCompareFusedTest_b : std_logic_vector (22 downto 0);
    signal Y31_uid51_fpCompareFusedTest_in : std_logic_vector (31 downto 0);
    signal Y31_uid51_fpCompareFusedTest_b : std_logic_vector (0 downto 0);
    signal expXIsMax_uid12_fpCompareFusedTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpCompareFusedTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid29_fpCompareFusedTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid29_fpCompareFusedTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid29_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid14_fpCompareFusedTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpCompareFusedTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid31_fpCompareFusedTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid31_fpCompareFusedTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid31_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid10_fpCompareFusedTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpCompareFusedTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid10_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal expXIsZero_uid27_fpCompareFusedTest_a : std_logic_vector(7 downto 0);
    signal expXIsZero_uid27_fpCompareFusedTest_b : std_logic_vector(7 downto 0);
    signal expXIsZero_uid27_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal expFracX_uid42_fpCompareFusedTest_q : std_logic_vector (30 downto 0);
    signal join_uid53_fpCompareFusedTest_q : std_logic_vector (1 downto 0);
    signal join_uid56_fpCompareFusedTest_q : std_logic_vector (1 downto 0);
    signal xorSigns_uid58_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal xorSigns_uid58_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal xorSigns_uid58_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal expFracY_uid45_fpCompareFusedTest_q : std_logic_vector (30 downto 0);
    signal exc_Z_uid15_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal exc_Z_uid15_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal exc_Z_uid15_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid17_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid17_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal exc_Z_uid32_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal exc_Z_uid32_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal exc_Z_uid32_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid34_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid34_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal efxGTEefy_uid46_fpCompareFusedTest_a : std_logic_vector(33 downto 0);
    signal efxGTEefy_uid46_fpCompareFusedTest_b : std_logic_vector(33 downto 0);
    signal efxGTEefy_uid46_fpCompareFusedTest_o : std_logic_vector (33 downto 0);
    signal efxGTEefy_uid46_fpCompareFusedTest_cin : std_logic_vector (0 downto 0);
    signal efxGTEefy_uid46_fpCompareFusedTest_n : std_logic_vector (0 downto 0);
    signal efxLTEefy_uid47_fpCompareFusedTest_a : std_logic_vector(33 downto 0);
    signal efxLTEefy_uid47_fpCompareFusedTest_b : std_logic_vector(33 downto 0);
    signal efxLTEefy_uid47_fpCompareFusedTest_o : std_logic_vector (33 downto 0);
    signal efxLTEefy_uid47_fpCompareFusedTest_cin : std_logic_vector (0 downto 0);
    signal efxLTEefy_uid47_fpCompareFusedTest_n : std_logic_vector (0 downto 0);
    signal cmpEQ_w2_uid54_fpCompareFusedTest_a : std_logic_vector(1 downto 0);
    signal cmpEQ_w2_uid54_fpCompareFusedTest_b : std_logic_vector(1 downto 0);
    signal cmpEQ_w2_uid54_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal cmpEQ_w2_uid57_fpCompareFusedTest_a : std_logic_vector(1 downto 0);
    signal cmpEQ_w2_uid57_fpCompareFusedTest_b : std_logic_vector(1 downto 0);
    signal cmpEQ_w2_uid57_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal InvXorSigns_uid59_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal InvXorSigns_uid59_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal bothZero_uid60_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal bothZero_uid60_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal bothZero_uid60_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal InvExc_Z_uid64_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal InvExc_Z_uid64_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid18_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid18_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid18_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal InvExc_Z_uid63_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal InvExc_Z_uid63_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid35_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid35_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid35_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal InvEfxGTEefy_uid49_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal InvEfxGTEefy_uid49_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal expFracCompMuxLE_uid69_fpCompareFusedTest_s : std_logic_vector (0 downto 0);
    signal expFracCompMuxLE_uid69_fpCompareFusedTest_q : std_logic_vector (0 downto 0);
    signal expFracCompMuxGE_uid77_fpCompareFusedTest_s : std_logic_vector (0 downto 0);
    signal expFracCompMuxGE_uid77_fpCompareFusedTest_q : std_logic_vector (0 downto 0);
    signal InvEfxLTEefy_uid48_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal InvEfxLTEefy_uid48_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal InvBothZero_uid62_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal InvBothZero_uid62_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal rLE_uid71_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal rLE_uid71_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal rLE_uid71_fpCompareFusedTest_c : std_logic_vector(0 downto 0);
    signal rLE_uid71_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal rEQ_uid74_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal rEQ_uid74_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal rEQ_uid74_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal rNEQ_uid76_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal rNEQ_uid76_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal rNEQ_uid76_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal GE_uid79_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal GE_uid79_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal GE_uid79_fpCompareFusedTest_c : std_logic_vector(0 downto 0);
    signal GE_uid79_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal oneNotZero_uid65_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal oneNotZero_uid65_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal oneNotZero_uid65_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal oneIsNaN_uid88_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal oneIsNaN_uid88_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal oneIsNaN_uid88_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal expFracCompMuxLT_uid61_fpCompareFusedTest_s : std_logic_vector (0 downto 0);
    signal expFracCompMuxLT_uid61_fpCompareFusedTest_q : std_logic_vector (0 downto 0);
    signal expFracCompMux_uid80_fpCompareFusedTest_s : std_logic_vector (0 downto 0);
    signal expFracCompMux_uid80_fpCompareFusedTest_q : std_logic_vector (0 downto 0);
    signal signOrderingAndNotZero_uid66_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal signOrderingAndNotZero_uid66_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal signOrderingAndNotZero_uid66_fpCompareFusedTest_c : std_logic_vector(0 downto 0);
    signal signOrderingAndNotZero_uid66_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal signOrderingAndNotZero_uid85_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal signOrderingAndNotZero_uid85_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal signOrderingAndNotZero_uid85_fpCompareFusedTest_c : std_logic_vector(0 downto 0);
    signal signOrderingAndNotZero_uid85_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal rLT_uid68_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal rLT_uid68_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal rLT_uid68_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal rGT_uid87_fpCompareFusedTest_a : std_logic_vector(0 downto 0);
    signal rGT_uid87_fpCompareFusedTest_b : std_logic_vector(0 downto 0);
    signal rGT_uid87_fpCompareFusedTest_q : std_logic_vector(0 downto 0);
    signal muxResPreExc_uid89_fpCompareFusedTest_s : std_logic_vector (2 downto 0);
    signal muxResPreExc_uid89_fpCompareFusedTest_q : std_logic_vector (0 downto 0);
    signal r_uid90_fpCompareFusedTest_s : std_logic_vector (0 downto 0);
    signal r_uid90_fpCompareFusedTest_q : std_logic_vector (0 downto 0);
begin


	--GND(CONSTANT,0)
    GND_q <= "0";

	--cmpEqXY_uid72_fpCompareFusedTest(LOGICAL,71)@0
    cmpEqXY_uid72_fpCompareFusedTest_a <= x;
    cmpEqXY_uid72_fpCompareFusedTest_b <= y;
    cmpEqXY_uid72_fpCompareFusedTest_q <= "1" when cmpEqXY_uid72_fpCompareFusedTest_a = cmpEqXY_uid72_fpCompareFusedTest_b else "0";

	--cstAllZWF_uid7_fpCompareFusedTest(CONSTANT,6)
    cstAllZWF_uid7_fpCompareFusedTest_q <= "00000000000000000000000";

	--frac_uid30_fpCompareFusedTest(BITSELECT,29)@0
    frac_uid30_fpCompareFusedTest_in <= y(22 downto 0);
    frac_uid30_fpCompareFusedTest_b <= frac_uid30_fpCompareFusedTest_in(22 downto 0);

	--fracXIsZero_uid31_fpCompareFusedTest(LOGICAL,30)@0
    fracXIsZero_uid31_fpCompareFusedTest_a <= frac_uid30_fpCompareFusedTest_b;
    fracXIsZero_uid31_fpCompareFusedTest_b <= cstAllZWF_uid7_fpCompareFusedTest_q;
    fracXIsZero_uid31_fpCompareFusedTest_q <= "1" when fracXIsZero_uid31_fpCompareFusedTest_a = fracXIsZero_uid31_fpCompareFusedTest_b else "0";

	--cstAllZWE_uid8_fpCompareFusedTest(CONSTANT,7)
    cstAllZWE_uid8_fpCompareFusedTest_q <= "00000000";

	--exp_uid26_fpCompareFusedTest(BITSELECT,25)@0
    exp_uid26_fpCompareFusedTest_in <= y(30 downto 0);
    exp_uid26_fpCompareFusedTest_b <= exp_uid26_fpCompareFusedTest_in(30 downto 23);

	--expXIsZero_uid27_fpCompareFusedTest(LOGICAL,26)@0
    expXIsZero_uid27_fpCompareFusedTest_a <= exp_uid26_fpCompareFusedTest_b;
    expXIsZero_uid27_fpCompareFusedTest_b <= cstAllZWE_uid8_fpCompareFusedTest_q;
    expXIsZero_uid27_fpCompareFusedTest_q <= "1" when expXIsZero_uid27_fpCompareFusedTest_a = expXIsZero_uid27_fpCompareFusedTest_b else "0";

	--exc_Z_uid32_fpCompareFusedTest(LOGICAL,31)@0
    exc_Z_uid32_fpCompareFusedTest_a <= expXIsZero_uid27_fpCompareFusedTest_q;
    exc_Z_uid32_fpCompareFusedTest_b <= fracXIsZero_uid31_fpCompareFusedTest_q;
    exc_Z_uid32_fpCompareFusedTest_q <= exc_Z_uid32_fpCompareFusedTest_a and exc_Z_uid32_fpCompareFusedTest_b;

	--frac_uid13_fpCompareFusedTest(BITSELECT,12)@0
    frac_uid13_fpCompareFusedTest_in <= x(22 downto 0);
    frac_uid13_fpCompareFusedTest_b <= frac_uid13_fpCompareFusedTest_in(22 downto 0);

	--fracXIsZero_uid14_fpCompareFusedTest(LOGICAL,13)@0
    fracXIsZero_uid14_fpCompareFusedTest_a <= frac_uid13_fpCompareFusedTest_b;
    fracXIsZero_uid14_fpCompareFusedTest_b <= cstAllZWF_uid7_fpCompareFusedTest_q;
    fracXIsZero_uid14_fpCompareFusedTest_q <= "1" when fracXIsZero_uid14_fpCompareFusedTest_a = fracXIsZero_uid14_fpCompareFusedTest_b else "0";

	--exp_uid9_fpCompareFusedTest(BITSELECT,8)@0
    exp_uid9_fpCompareFusedTest_in <= x(30 downto 0);
    exp_uid9_fpCompareFusedTest_b <= exp_uid9_fpCompareFusedTest_in(30 downto 23);

	--expXIsZero_uid10_fpCompareFusedTest(LOGICAL,9)@0
    expXIsZero_uid10_fpCompareFusedTest_a <= exp_uid9_fpCompareFusedTest_b;
    expXIsZero_uid10_fpCompareFusedTest_b <= cstAllZWE_uid8_fpCompareFusedTest_q;
    expXIsZero_uid10_fpCompareFusedTest_q <= "1" when expXIsZero_uid10_fpCompareFusedTest_a = expXIsZero_uid10_fpCompareFusedTest_b else "0";

	--exc_Z_uid15_fpCompareFusedTest(LOGICAL,14)@0
    exc_Z_uid15_fpCompareFusedTest_a <= expXIsZero_uid10_fpCompareFusedTest_q;
    exc_Z_uid15_fpCompareFusedTest_b <= fracXIsZero_uid14_fpCompareFusedTest_q;
    exc_Z_uid15_fpCompareFusedTest_q <= exc_Z_uid15_fpCompareFusedTest_a and exc_Z_uid15_fpCompareFusedTest_b;

	--bothZero_uid60_fpCompareFusedTest(LOGICAL,59)@0
    bothZero_uid60_fpCompareFusedTest_a <= exc_Z_uid15_fpCompareFusedTest_q;
    bothZero_uid60_fpCompareFusedTest_b <= exc_Z_uid32_fpCompareFusedTest_q;
    bothZero_uid60_fpCompareFusedTest_q <= bothZero_uid60_fpCompareFusedTest_a and bothZero_uid60_fpCompareFusedTest_b;

	--rNEQ_uid76_fpCompareFusedTest(LOGICAL,75)@0
    rNEQ_uid76_fpCompareFusedTest_a <= bothZero_uid60_fpCompareFusedTest_q;
    rNEQ_uid76_fpCompareFusedTest_b <= cmpEqXY_uid72_fpCompareFusedTest_q;
    rNEQ_uid76_fpCompareFusedTest_q <= not (rNEQ_uid76_fpCompareFusedTest_a or rNEQ_uid76_fpCompareFusedTest_b);

	--InvBothZero_uid62_fpCompareFusedTest(LOGICAL,61)@0
    InvBothZero_uid62_fpCompareFusedTest_a <= bothZero_uid60_fpCompareFusedTest_q;
    InvBothZero_uid62_fpCompareFusedTest_q <= not InvBothZero_uid62_fpCompareFusedTest_a;

	--InvExc_Z_uid63_fpCompareFusedTest(LOGICAL,62)@0
    InvExc_Z_uid63_fpCompareFusedTest_a <= exc_Z_uid32_fpCompareFusedTest_q;
    InvExc_Z_uid63_fpCompareFusedTest_q <= not InvExc_Z_uid63_fpCompareFusedTest_a;

	--InvExc_Z_uid64_fpCompareFusedTest(LOGICAL,63)@0
    InvExc_Z_uid64_fpCompareFusedTest_a <= exc_Z_uid15_fpCompareFusedTest_q;
    InvExc_Z_uid64_fpCompareFusedTest_q <= not InvExc_Z_uid64_fpCompareFusedTest_a;

	--oneNotZero_uid65_fpCompareFusedTest(LOGICAL,64)@0
    oneNotZero_uid65_fpCompareFusedTest_a <= InvExc_Z_uid64_fpCompareFusedTest_q;
    oneNotZero_uid65_fpCompareFusedTest_b <= InvExc_Z_uid63_fpCompareFusedTest_q;
    oneNotZero_uid65_fpCompareFusedTest_q <= oneNotZero_uid65_fpCompareFusedTest_a or oneNotZero_uid65_fpCompareFusedTest_b;

	--two_uid52_fpCompareFusedTest(CONSTANT,51)
    two_uid52_fpCompareFusedTest_q <= "10";

	--Y31_uid51_fpCompareFusedTest(BITSELECT,50)@0
    Y31_uid51_fpCompareFusedTest_in <= y;
    Y31_uid51_fpCompareFusedTest_b <= Y31_uid51_fpCompareFusedTest_in(31 downto 31);

	--X31_uid50_fpCompareFusedTest(BITSELECT,49)@0
    X31_uid50_fpCompareFusedTest_in <= x;
    X31_uid50_fpCompareFusedTest_b <= X31_uid50_fpCompareFusedTest_in(31 downto 31);

	--join_uid56_fpCompareFusedTest(BITJOIN,55)@0
    join_uid56_fpCompareFusedTest_q <= Y31_uid51_fpCompareFusedTest_b & X31_uid50_fpCompareFusedTest_b;

	--cmpEQ_w2_uid57_fpCompareFusedTest(LOGICAL,56)@0
    cmpEQ_w2_uid57_fpCompareFusedTest_a <= join_uid56_fpCompareFusedTest_q;
    cmpEQ_w2_uid57_fpCompareFusedTest_b <= two_uid52_fpCompareFusedTest_q;
    cmpEQ_w2_uid57_fpCompareFusedTest_q <= "1" when cmpEQ_w2_uid57_fpCompareFusedTest_a = cmpEQ_w2_uid57_fpCompareFusedTest_b else "0";

	--signOrderingAndNotZero_uid85_fpCompareFusedTest(LOGICAL,84)@0
    signOrderingAndNotZero_uid85_fpCompareFusedTest_a <= cmpEQ_w2_uid57_fpCompareFusedTest_q;
    signOrderingAndNotZero_uid85_fpCompareFusedTest_b <= oneNotZero_uid65_fpCompareFusedTest_q;
    signOrderingAndNotZero_uid85_fpCompareFusedTest_c <= InvBothZero_uid62_fpCompareFusedTest_q;
    signOrderingAndNotZero_uid85_fpCompareFusedTest_q <= signOrderingAndNotZero_uid85_fpCompareFusedTest_a and signOrderingAndNotZero_uid85_fpCompareFusedTest_b and signOrderingAndNotZero_uid85_fpCompareFusedTest_c;

	--expFracY_uid45_fpCompareFusedTest(BITJOIN,44)@0
    expFracY_uid45_fpCompareFusedTest_q <= exp_uid26_fpCompareFusedTest_b & frac_uid30_fpCompareFusedTest_b;

	--expFracX_uid42_fpCompareFusedTest(BITJOIN,41)@0
    expFracX_uid42_fpCompareFusedTest_q <= exp_uid9_fpCompareFusedTest_b & frac_uid13_fpCompareFusedTest_b;

	--efxGTEefy_uid46_fpCompareFusedTest(COMPARE,45)@0
    efxGTEefy_uid46_fpCompareFusedTest_cin <= GND_q;
    efxGTEefy_uid46_fpCompareFusedTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid42_fpCompareFusedTest_q) & '0';
    efxGTEefy_uid46_fpCompareFusedTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid45_fpCompareFusedTest_q) & efxGTEefy_uid46_fpCompareFusedTest_cin(0);
            efxGTEefy_uid46_fpCompareFusedTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTEefy_uid46_fpCompareFusedTest_a) - UNSIGNED(efxGTEefy_uid46_fpCompareFusedTest_b));
    efxGTEefy_uid46_fpCompareFusedTest_n(0) <= not efxGTEefy_uid46_fpCompareFusedTest_o(33);


	--InvEfxGTEefy_uid49_fpCompareFusedTest(LOGICAL,48)@0
    InvEfxGTEefy_uid49_fpCompareFusedTest_a <= efxGTEefy_uid46_fpCompareFusedTest_n;
    InvEfxGTEefy_uid49_fpCompareFusedTest_q <= not InvEfxGTEefy_uid49_fpCompareFusedTest_a;

	--efxLTEefy_uid47_fpCompareFusedTest(COMPARE,46)@0
    efxLTEefy_uid47_fpCompareFusedTest_cin <= GND_q;
    efxLTEefy_uid47_fpCompareFusedTest_a <= STD_LOGIC_VECTOR("00" & expFracY_uid45_fpCompareFusedTest_q) & '0';
    efxLTEefy_uid47_fpCompareFusedTest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid42_fpCompareFusedTest_q) & efxLTEefy_uid47_fpCompareFusedTest_cin(0);
            efxLTEefy_uid47_fpCompareFusedTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTEefy_uid47_fpCompareFusedTest_a) - UNSIGNED(efxLTEefy_uid47_fpCompareFusedTest_b));
    efxLTEefy_uid47_fpCompareFusedTest_n(0) <= not efxLTEefy_uid47_fpCompareFusedTest_o(33);


	--InvEfxLTEefy_uid48_fpCompareFusedTest(LOGICAL,47)@0
    InvEfxLTEefy_uid48_fpCompareFusedTest_a <= efxLTEefy_uid47_fpCompareFusedTest_n;
    InvEfxLTEefy_uid48_fpCompareFusedTest_q <= not InvEfxLTEefy_uid48_fpCompareFusedTest_a;

	--expFracCompMux_uid80_fpCompareFusedTest(MUX,79)@0
    expFracCompMux_uid80_fpCompareFusedTest_s <= X31_uid50_fpCompareFusedTest_b;
    expFracCompMux_uid80_fpCompareFusedTest: PROCESS (expFracCompMux_uid80_fpCompareFusedTest_s, InvEfxLTEefy_uid48_fpCompareFusedTest_q, InvEfxGTEefy_uid49_fpCompareFusedTest_q)
    BEGIN
            CASE expFracCompMux_uid80_fpCompareFusedTest_s IS
                  WHEN "0" => expFracCompMux_uid80_fpCompareFusedTest_q <= InvEfxLTEefy_uid48_fpCompareFusedTest_q;
                  WHEN "1" => expFracCompMux_uid80_fpCompareFusedTest_q <= InvEfxGTEefy_uid49_fpCompareFusedTest_q;
                  WHEN OTHERS => expFracCompMux_uid80_fpCompareFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--xorSigns_uid58_fpCompareFusedTest(LOGICAL,57)@0
    xorSigns_uid58_fpCompareFusedTest_a <= X31_uid50_fpCompareFusedTest_b;
    xorSigns_uid58_fpCompareFusedTest_b <= Y31_uid51_fpCompareFusedTest_b;
    xorSigns_uid58_fpCompareFusedTest_q <= xorSigns_uid58_fpCompareFusedTest_a xor xorSigns_uid58_fpCompareFusedTest_b;

	--InvXorSigns_uid59_fpCompareFusedTest(LOGICAL,58)@0
    InvXorSigns_uid59_fpCompareFusedTest_a <= xorSigns_uid58_fpCompareFusedTest_q;
    InvXorSigns_uid59_fpCompareFusedTest_q <= not InvXorSigns_uid59_fpCompareFusedTest_a;

	--sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest(LOGICAL,85)@0
    sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest_a <= InvXorSigns_uid59_fpCompareFusedTest_q;
    sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest_b <= expFracCompMux_uid80_fpCompareFusedTest_q;
    sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest_q <= sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest_a and sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest_b;

	--rGT_uid87_fpCompareFusedTest(LOGICAL,86)@0
    rGT_uid87_fpCompareFusedTest_a <= sxEQsyExpFracCompMuxGT_uid86_fpCompareFusedTest_q;
    rGT_uid87_fpCompareFusedTest_b <= signOrderingAndNotZero_uid85_fpCompareFusedTest_q;
    rGT_uid87_fpCompareFusedTest_q <= rGT_uid87_fpCompareFusedTest_a or rGT_uid87_fpCompareFusedTest_b;

	--expFracCompMuxGE_uid77_fpCompareFusedTest(MUX,76)@0
    expFracCompMuxGE_uid77_fpCompareFusedTest_s <= X31_uid50_fpCompareFusedTest_b;
    expFracCompMuxGE_uid77_fpCompareFusedTest: PROCESS (expFracCompMuxGE_uid77_fpCompareFusedTest_s, efxGTEefy_uid46_fpCompareFusedTest_n, efxLTEefy_uid47_fpCompareFusedTest_n)
    BEGIN
            CASE expFracCompMuxGE_uid77_fpCompareFusedTest_s IS
                  WHEN "0" => expFracCompMuxGE_uid77_fpCompareFusedTest_q <= efxGTEefy_uid46_fpCompareFusedTest_n;
                  WHEN "1" => expFracCompMuxGE_uid77_fpCompareFusedTest_q <= efxLTEefy_uid47_fpCompareFusedTest_n;
                  WHEN OTHERS => expFracCompMuxGE_uid77_fpCompareFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest(LOGICAL,77)@0
    sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest_a <= InvXorSigns_uid59_fpCompareFusedTest_q;
    sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest_b <= expFracCompMuxGE_uid77_fpCompareFusedTest_q;
    sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest_q <= sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest_a and sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest_b;

	--GE_uid79_fpCompareFusedTest(LOGICAL,78)@0
    GE_uid79_fpCompareFusedTest_a <= sxEQsyExpFracCompMuxGE_uid78_fpCompareFusedTest_q;
    GE_uid79_fpCompareFusedTest_b <= cmpEQ_w2_uid57_fpCompareFusedTest_q;
    GE_uid79_fpCompareFusedTest_c <= bothZero_uid60_fpCompareFusedTest_q;
    GE_uid79_fpCompareFusedTest_q <= GE_uid79_fpCompareFusedTest_a or GE_uid79_fpCompareFusedTest_b or GE_uid79_fpCompareFusedTest_c;

	--rEQ_uid74_fpCompareFusedTest(LOGICAL,73)@0
    rEQ_uid74_fpCompareFusedTest_a <= bothZero_uid60_fpCompareFusedTest_q;
    rEQ_uid74_fpCompareFusedTest_b <= cmpEqXY_uid72_fpCompareFusedTest_q;
    rEQ_uid74_fpCompareFusedTest_q <= rEQ_uid74_fpCompareFusedTest_a or rEQ_uid74_fpCompareFusedTest_b;

	--join_uid53_fpCompareFusedTest(BITJOIN,52)@0
    join_uid53_fpCompareFusedTest_q <= X31_uid50_fpCompareFusedTest_b & Y31_uid51_fpCompareFusedTest_b;

	--cmpEQ_w2_uid54_fpCompareFusedTest(LOGICAL,53)@0
    cmpEQ_w2_uid54_fpCompareFusedTest_a <= join_uid53_fpCompareFusedTest_q;
    cmpEQ_w2_uid54_fpCompareFusedTest_b <= two_uid52_fpCompareFusedTest_q;
    cmpEQ_w2_uid54_fpCompareFusedTest_q <= "1" when cmpEQ_w2_uid54_fpCompareFusedTest_a = cmpEQ_w2_uid54_fpCompareFusedTest_b else "0";

	--expFracCompMuxLE_uid69_fpCompareFusedTest(MUX,68)@0
    expFracCompMuxLE_uid69_fpCompareFusedTest_s <= X31_uid50_fpCompareFusedTest_b;
    expFracCompMuxLE_uid69_fpCompareFusedTest: PROCESS (expFracCompMuxLE_uid69_fpCompareFusedTest_s, efxLTEefy_uid47_fpCompareFusedTest_n, efxGTEefy_uid46_fpCompareFusedTest_n)
    BEGIN
            CASE expFracCompMuxLE_uid69_fpCompareFusedTest_s IS
                  WHEN "0" => expFracCompMuxLE_uid69_fpCompareFusedTest_q <= efxLTEefy_uid47_fpCompareFusedTest_n;
                  WHEN "1" => expFracCompMuxLE_uid69_fpCompareFusedTest_q <= efxGTEefy_uid46_fpCompareFusedTest_n;
                  WHEN OTHERS => expFracCompMuxLE_uid69_fpCompareFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest(LOGICAL,69)@0
    sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest_a <= InvXorSigns_uid59_fpCompareFusedTest_q;
    sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest_b <= expFracCompMuxLE_uid69_fpCompareFusedTest_q;
    sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest_q <= sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest_a and sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest_b;

	--rLE_uid71_fpCompareFusedTest(LOGICAL,70)@0
    rLE_uid71_fpCompareFusedTest_a <= sxEQsyExpFracCompMuxLE_uid70_fpCompareFusedTest_q;
    rLE_uid71_fpCompareFusedTest_b <= cmpEQ_w2_uid54_fpCompareFusedTest_q;
    rLE_uid71_fpCompareFusedTest_c <= bothZero_uid60_fpCompareFusedTest_q;
    rLE_uid71_fpCompareFusedTest_q <= rLE_uid71_fpCompareFusedTest_a or rLE_uid71_fpCompareFusedTest_b or rLE_uid71_fpCompareFusedTest_c;

	--signOrderingAndNotZero_uid66_fpCompareFusedTest(LOGICAL,65)@0
    signOrderingAndNotZero_uid66_fpCompareFusedTest_a <= cmpEQ_w2_uid54_fpCompareFusedTest_q;
    signOrderingAndNotZero_uid66_fpCompareFusedTest_b <= oneNotZero_uid65_fpCompareFusedTest_q;
    signOrderingAndNotZero_uid66_fpCompareFusedTest_c <= InvBothZero_uid62_fpCompareFusedTest_q;
    signOrderingAndNotZero_uid66_fpCompareFusedTest_q <= signOrderingAndNotZero_uid66_fpCompareFusedTest_a and signOrderingAndNotZero_uid66_fpCompareFusedTest_b and signOrderingAndNotZero_uid66_fpCompareFusedTest_c;

	--expFracCompMuxLT_uid61_fpCompareFusedTest(MUX,60)@0
    expFracCompMuxLT_uid61_fpCompareFusedTest_s <= X31_uid50_fpCompareFusedTest_b;
    expFracCompMuxLT_uid61_fpCompareFusedTest: PROCESS (expFracCompMuxLT_uid61_fpCompareFusedTest_s, InvEfxGTEefy_uid49_fpCompareFusedTest_q, InvEfxLTEefy_uid48_fpCompareFusedTest_q)
    BEGIN
            CASE expFracCompMuxLT_uid61_fpCompareFusedTest_s IS
                  WHEN "0" => expFracCompMuxLT_uid61_fpCompareFusedTest_q <= InvEfxGTEefy_uid49_fpCompareFusedTest_q;
                  WHEN "1" => expFracCompMuxLT_uid61_fpCompareFusedTest_q <= InvEfxLTEefy_uid48_fpCompareFusedTest_q;
                  WHEN OTHERS => expFracCompMuxLT_uid61_fpCompareFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest(LOGICAL,66)@0
    sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest_a <= InvXorSigns_uid59_fpCompareFusedTest_q;
    sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest_b <= expFracCompMuxLT_uid61_fpCompareFusedTest_q;
    sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest_q <= sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest_a and sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest_b;

	--rLT_uid68_fpCompareFusedTest(LOGICAL,67)@0
    rLT_uid68_fpCompareFusedTest_a <= sxEQsyExpFracCompMuxLT_uid67_fpCompareFusedTest_q;
    rLT_uid68_fpCompareFusedTest_b <= signOrderingAndNotZero_uid66_fpCompareFusedTest_q;
    rLT_uid68_fpCompareFusedTest_q <= rLT_uid68_fpCompareFusedTest_a or rLT_uid68_fpCompareFusedTest_b;

	--muxResPreExc_uid89_fpCompareFusedTest(MUX,88)@0
    muxResPreExc_uid89_fpCompareFusedTest_s <= opSel;
    muxResPreExc_uid89_fpCompareFusedTest: PROCESS (muxResPreExc_uid89_fpCompareFusedTest_s, rLT_uid68_fpCompareFusedTest_q, rLE_uid71_fpCompareFusedTest_q, rEQ_uid74_fpCompareFusedTest_q, GE_uid79_fpCompareFusedTest_q, rGT_uid87_fpCompareFusedTest_q, rNEQ_uid76_fpCompareFusedTest_q)
    BEGIN
            CASE muxResPreExc_uid89_fpCompareFusedTest_s IS
                  WHEN "000" => muxResPreExc_uid89_fpCompareFusedTest_q <= rLT_uid68_fpCompareFusedTest_q;
                  WHEN "001" => muxResPreExc_uid89_fpCompareFusedTest_q <= rLE_uid71_fpCompareFusedTest_q;
                  WHEN "010" => muxResPreExc_uid89_fpCompareFusedTest_q <= rEQ_uid74_fpCompareFusedTest_q;
                  WHEN "011" => muxResPreExc_uid89_fpCompareFusedTest_q <= GE_uid79_fpCompareFusedTest_q;
                  WHEN "100" => muxResPreExc_uid89_fpCompareFusedTest_q <= rGT_uid87_fpCompareFusedTest_q;
                  WHEN "101" => muxResPreExc_uid89_fpCompareFusedTest_q <= rNEQ_uid76_fpCompareFusedTest_q;
                  WHEN OTHERS => muxResPreExc_uid89_fpCompareFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--InvFracXIsZero_uid34_fpCompareFusedTest(LOGICAL,33)@0
    InvFracXIsZero_uid34_fpCompareFusedTest_a <= fracXIsZero_uid31_fpCompareFusedTest_q;
    InvFracXIsZero_uid34_fpCompareFusedTest_q <= not InvFracXIsZero_uid34_fpCompareFusedTest_a;

	--cstAllOWE_uid6_fpCompareFusedTest(CONSTANT,5)
    cstAllOWE_uid6_fpCompareFusedTest_q <= "11111111";

	--expXIsMax_uid29_fpCompareFusedTest(LOGICAL,28)@0
    expXIsMax_uid29_fpCompareFusedTest_a <= exp_uid26_fpCompareFusedTest_b;
    expXIsMax_uid29_fpCompareFusedTest_b <= cstAllOWE_uid6_fpCompareFusedTest_q;
    expXIsMax_uid29_fpCompareFusedTest_q <= "1" when expXIsMax_uid29_fpCompareFusedTest_a = expXIsMax_uid29_fpCompareFusedTest_b else "0";

	--exc_N_uid35_fpCompareFusedTest(LOGICAL,34)@0
    exc_N_uid35_fpCompareFusedTest_a <= expXIsMax_uid29_fpCompareFusedTest_q;
    exc_N_uid35_fpCompareFusedTest_b <= InvFracXIsZero_uid34_fpCompareFusedTest_q;
    exc_N_uid35_fpCompareFusedTest_q <= exc_N_uid35_fpCompareFusedTest_a and exc_N_uid35_fpCompareFusedTest_b;

	--InvFracXIsZero_uid17_fpCompareFusedTest(LOGICAL,16)@0
    InvFracXIsZero_uid17_fpCompareFusedTest_a <= fracXIsZero_uid14_fpCompareFusedTest_q;
    InvFracXIsZero_uid17_fpCompareFusedTest_q <= not InvFracXIsZero_uid17_fpCompareFusedTest_a;

	--expXIsMax_uid12_fpCompareFusedTest(LOGICAL,11)@0
    expXIsMax_uid12_fpCompareFusedTest_a <= exp_uid9_fpCompareFusedTest_b;
    expXIsMax_uid12_fpCompareFusedTest_b <= cstAllOWE_uid6_fpCompareFusedTest_q;
    expXIsMax_uid12_fpCompareFusedTest_q <= "1" when expXIsMax_uid12_fpCompareFusedTest_a = expXIsMax_uid12_fpCompareFusedTest_b else "0";

	--exc_N_uid18_fpCompareFusedTest(LOGICAL,17)@0
    exc_N_uid18_fpCompareFusedTest_a <= expXIsMax_uid12_fpCompareFusedTest_q;
    exc_N_uid18_fpCompareFusedTest_b <= InvFracXIsZero_uid17_fpCompareFusedTest_q;
    exc_N_uid18_fpCompareFusedTest_q <= exc_N_uid18_fpCompareFusedTest_a and exc_N_uid18_fpCompareFusedTest_b;

	--oneIsNaN_uid88_fpCompareFusedTest(LOGICAL,87)@0
    oneIsNaN_uid88_fpCompareFusedTest_a <= exc_N_uid18_fpCompareFusedTest_q;
    oneIsNaN_uid88_fpCompareFusedTest_b <= exc_N_uid35_fpCompareFusedTest_q;
    oneIsNaN_uid88_fpCompareFusedTest_q <= oneIsNaN_uid88_fpCompareFusedTest_a or oneIsNaN_uid88_fpCompareFusedTest_b;

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--r_uid90_fpCompareFusedTest(MUX,89)@0
    r_uid90_fpCompareFusedTest_s <= oneIsNaN_uid88_fpCompareFusedTest_q;
    r_uid90_fpCompareFusedTest: PROCESS (r_uid90_fpCompareFusedTest_s, muxResPreExc_uid89_fpCompareFusedTest_q)
    BEGIN
            CASE r_uid90_fpCompareFusedTest_s IS
                  WHEN "0" => r_uid90_fpCompareFusedTest_q <= muxResPreExc_uid89_fpCompareFusedTest_q;
                  WHEN "1" => r_uid90_fpCompareFusedTest_q <= GND_q;
                  WHEN OTHERS => r_uid90_fpCompareFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--xOut(PORTOUT,4)@0
    r <= r_uid90_fpCompareFusedTest_q;
end normal;
