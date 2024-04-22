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

-- VHDL created from topModel
-- VHDL created on Fri Nov 16 14:06:15 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
--USE work.topModel_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/qshell64/p4/ip/aion/src/mip_common/hw_model.cpp:1243
entity FPMinMaxFused is
    port (
        x : in std_logic_vector(31 downto 0);
        y : in std_logic_vector(31 downto 0);
        opSel : in std_logic_vector(0 downto 0);
        r : out std_logic_vector(31 downto 0)
        );
end;

architecture normal of FPMinMaxFused is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal cstAllOWE_uid6_fpMinMaxFusedTest_q : std_logic_vector (7 downto 0);
    signal cstAllZWF_uid7_fpMinMaxFusedTest_q : std_logic_vector (22 downto 0);
    signal fracNaN_uid66_fpMinMaxFusedTest_q : std_logic_vector (22 downto 0);
    signal join_uid68_fpMinMaxFusedTest_q : std_logic_vector (31 downto 0);
    signal d0Mux_uid62_fpMinMaxFusedTest_s : std_logic_vector (0 downto 0);
    signal d0Mux_uid62_fpMinMaxFusedTest_q : std_logic_vector (31 downto 0);
    signal d1Mux_uid63_fpMinMaxFusedTest_s : std_logic_vector (0 downto 0);
    signal d1Mux_uid63_fpMinMaxFusedTest_q : std_logic_vector (31 downto 0);
    signal exp_uid11_fpMinMaxFusedTest_in : std_logic_vector (30 downto 0);
    signal exp_uid11_fpMinMaxFusedTest_b : std_logic_vector (7 downto 0);
    signal frac_uid13_fpMinMaxFusedTest_in : std_logic_vector (22 downto 0);
    signal frac_uid13_fpMinMaxFusedTest_b : std_logic_vector (22 downto 0);
    signal X31_uid51_fpMinMaxFusedTest_in : std_logic_vector (31 downto 0);
    signal X31_uid51_fpMinMaxFusedTest_b : std_logic_vector (0 downto 0);
    signal exp_uid27_fpMinMaxFusedTest_in : std_logic_vector (30 downto 0);
    signal exp_uid27_fpMinMaxFusedTest_b : std_logic_vector (7 downto 0);
    signal frac_uid29_fpMinMaxFusedTest_in : std_logic_vector (22 downto 0);
    signal frac_uid29_fpMinMaxFusedTest_b : std_logic_vector (22 downto 0);
    signal Y31_uid52_fpMinMaxFusedTest_in : std_logic_vector (31 downto 0);
    signal Y31_uid52_fpMinMaxFusedTest_b : std_logic_vector (0 downto 0);
    signal expXIsMax_uid12_fpMinMaxFusedTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpMinMaxFusedTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid12_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal expXIsMax_uid28_fpMinMaxFusedTest_a : std_logic_vector(7 downto 0);
    signal expXIsMax_uid28_fpMinMaxFusedTest_b : std_logic_vector(7 downto 0);
    signal expXIsMax_uid28_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid14_fpMinMaxFusedTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpMinMaxFusedTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid14_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal fracXIsZero_uid30_fpMinMaxFusedTest_a : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid30_fpMinMaxFusedTest_b : std_logic_vector(22 downto 0);
    signal fracXIsZero_uid30_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal expFracX_uid47_fpMinMaxFusedTest_q : std_logic_vector (30 downto 0);
    signal InvX31_uid57_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal InvX31_uid57_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal expFracY_uid50_fpMinMaxFusedTest_q : std_logic_vector (30 downto 0);
    signal InvY31_uid56_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal InvY31_uid56_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal xPosYNeg_uid60_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal xPosYNeg_uid60_fpMinMaxFusedTest_b : std_logic_vector(0 downto 0);
    signal xPosYNeg_uid60_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid16_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid16_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid32_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal InvFracXIsZero_uid32_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal efxGTefy_uid53_fpMinMaxFusedTest_a : std_logic_vector(33 downto 0);
    signal efxGTefy_uid53_fpMinMaxFusedTest_b : std_logic_vector(33 downto 0);
    signal efxGTefy_uid53_fpMinMaxFusedTest_o : std_logic_vector (33 downto 0);
    signal efxGTefy_uid53_fpMinMaxFusedTest_cin : std_logic_vector (0 downto 0);
    signal efxGTefy_uid53_fpMinMaxFusedTest_c : std_logic_vector (0 downto 0);
    signal xPosyPosXGtY_uid58_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal xPosyPosXGtY_uid58_fpMinMaxFusedTest_b : std_logic_vector(0 downto 0);
    signal xPosyPosXGtY_uid58_fpMinMaxFusedTest_c : std_logic_vector(0 downto 0);
    signal xPosyPosXGtY_uid58_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpMinMaxFusedTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid17_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal exc_N_uid33_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal exc_N_uid33_fpMinMaxFusedTest_b : std_logic_vector(0 downto 0);
    signal exc_N_uid33_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal InvEfxGTefy_uid54_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal InvEfxGTefy_uid54_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal nanOut_uid38_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal nanOut_uid38_fpMinMaxFusedTest_b : std_logic_vector(0 downto 0);
    signal nanOut_uid38_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal oneIsNaN_uid39_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal oneIsNaN_uid39_fpMinMaxFusedTest_b : std_logic_vector(0 downto 0);
    signal oneIsNaN_uid39_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid42_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid42_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal InvExc_N_uid40_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal InvExc_N_uid40_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal xNegyNegYGTX_uid55_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal xNegyNegYGTX_uid55_fpMinMaxFusedTest_b : std_logic_vector(0 downto 0);
    signal xNegyNegYGTX_uid55_fpMinMaxFusedTest_c : std_logic_vector(0 downto 0);
    signal xNegyNegYGTX_uid55_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal join_uid65_fpMinMaxFusedTest_q : std_logic_vector (1 downto 0);
    signal xNotNaN_uid43_fpMinMaxFusedTest_a : std_logic_vector(31 downto 0);
    signal xNotNaN_uid43_fpMinMaxFusedTest_b : std_logic_vector(31 downto 0);
    signal xNotNaN_uid43_fpMinMaxFusedTest_q : std_logic_vector(31 downto 0);
    signal yNotNaN_uid41_fpMinMaxFusedTest_a : std_logic_vector(31 downto 0);
    signal yNotNaN_uid41_fpMinMaxFusedTest_b : std_logic_vector(31 downto 0);
    signal yNotNaN_uid41_fpMinMaxFusedTest_q : std_logic_vector(31 downto 0);
    signal selX_uid61_fpMinMaxFusedTest_a : std_logic_vector(0 downto 0);
    signal selX_uid61_fpMinMaxFusedTest_b : std_logic_vector(0 downto 0);
    signal selX_uid61_fpMinMaxFusedTest_c : std_logic_vector(0 downto 0);
    signal selX_uid61_fpMinMaxFusedTest_q : std_logic_vector(0 downto 0);
    signal oneNaNOutput_uid44_fpMinMaxFusedTest_a : std_logic_vector(31 downto 0);
    signal oneNaNOutput_uid44_fpMinMaxFusedTest_b : std_logic_vector(31 downto 0);
    signal oneNaNOutput_uid44_fpMinMaxFusedTest_q : std_logic_vector(31 downto 0);
    signal r_uid64_fpMinMaxFusedTest_s : std_logic_vector (0 downto 0);
    signal r_uid64_fpMinMaxFusedTest_q : std_logic_vector (31 downto 0);
    signal rPostNaN_uid72_fpMinMaxFusedTest_s : std_logic_vector (1 downto 0);
    signal rPostNaN_uid72_fpMinMaxFusedTest_q : std_logic_vector (31 downto 0);
begin


	--cstAllZWF_uid7_fpMinMaxFusedTest(CONSTANT,6)
    cstAllZWF_uid7_fpMinMaxFusedTest_q <= "00000000000000000000000";

	--frac_uid29_fpMinMaxFusedTest(BITSELECT,28)@0
    frac_uid29_fpMinMaxFusedTest_in <= y(22 downto 0);
    frac_uid29_fpMinMaxFusedTest_b <= frac_uid29_fpMinMaxFusedTest_in(22 downto 0);

	--fracXIsZero_uid30_fpMinMaxFusedTest(LOGICAL,29)@0
    fracXIsZero_uid30_fpMinMaxFusedTest_a <= frac_uid29_fpMinMaxFusedTest_b;
    fracXIsZero_uid30_fpMinMaxFusedTest_b <= cstAllZWF_uid7_fpMinMaxFusedTest_q;
    fracXIsZero_uid30_fpMinMaxFusedTest_q <= "1" when fracXIsZero_uid30_fpMinMaxFusedTest_a = fracXIsZero_uid30_fpMinMaxFusedTest_b else "0";

	--InvFracXIsZero_uid32_fpMinMaxFusedTest(LOGICAL,31)@0
    InvFracXIsZero_uid32_fpMinMaxFusedTest_a <= fracXIsZero_uid30_fpMinMaxFusedTest_q;
    InvFracXIsZero_uid32_fpMinMaxFusedTest_q <= not InvFracXIsZero_uid32_fpMinMaxFusedTest_a;

	--cstAllOWE_uid6_fpMinMaxFusedTest(CONSTANT,5)
    cstAllOWE_uid6_fpMinMaxFusedTest_q <= "11111111";

	--exp_uid27_fpMinMaxFusedTest(BITSELECT,26)@0
    exp_uid27_fpMinMaxFusedTest_in <= y(30 downto 0);
    exp_uid27_fpMinMaxFusedTest_b <= exp_uid27_fpMinMaxFusedTest_in(30 downto 23);

	--expXIsMax_uid28_fpMinMaxFusedTest(LOGICAL,27)@0
    expXIsMax_uid28_fpMinMaxFusedTest_a <= exp_uid27_fpMinMaxFusedTest_b;
    expXIsMax_uid28_fpMinMaxFusedTest_b <= cstAllOWE_uid6_fpMinMaxFusedTest_q;
    expXIsMax_uid28_fpMinMaxFusedTest_q <= "1" when expXIsMax_uid28_fpMinMaxFusedTest_a = expXIsMax_uid28_fpMinMaxFusedTest_b else "0";

	--exc_N_uid33_fpMinMaxFusedTest(LOGICAL,32)@0
    exc_N_uid33_fpMinMaxFusedTest_a <= expXIsMax_uid28_fpMinMaxFusedTest_q;
    exc_N_uid33_fpMinMaxFusedTest_b <= InvFracXIsZero_uid32_fpMinMaxFusedTest_q;
    exc_N_uid33_fpMinMaxFusedTest_q <= exc_N_uid33_fpMinMaxFusedTest_a and exc_N_uid33_fpMinMaxFusedTest_b;

	--InvExc_N_uid40_fpMinMaxFusedTest(LOGICAL,39)@0
    InvExc_N_uid40_fpMinMaxFusedTest_a <= exc_N_uid33_fpMinMaxFusedTest_q;
    InvExc_N_uid40_fpMinMaxFusedTest_q <= not InvExc_N_uid40_fpMinMaxFusedTest_a;

	--yNotNaN_uid41_fpMinMaxFusedTest(LOGICAL,40)@0
    yNotNaN_uid41_fpMinMaxFusedTest_a <= STD_LOGIC_VECTOR((31 downto 1 => InvExc_N_uid40_fpMinMaxFusedTest_q(0)) & InvExc_N_uid40_fpMinMaxFusedTest_q);
    yNotNaN_uid41_fpMinMaxFusedTest_b <= y;
    yNotNaN_uid41_fpMinMaxFusedTest_q <= yNotNaN_uid41_fpMinMaxFusedTest_a and yNotNaN_uid41_fpMinMaxFusedTest_b;

	--frac_uid13_fpMinMaxFusedTest(BITSELECT,12)@0
    frac_uid13_fpMinMaxFusedTest_in <= x(22 downto 0);
    frac_uid13_fpMinMaxFusedTest_b <= frac_uid13_fpMinMaxFusedTest_in(22 downto 0);

	--fracXIsZero_uid14_fpMinMaxFusedTest(LOGICAL,13)@0
    fracXIsZero_uid14_fpMinMaxFusedTest_a <= frac_uid13_fpMinMaxFusedTest_b;
    fracXIsZero_uid14_fpMinMaxFusedTest_b <= cstAllZWF_uid7_fpMinMaxFusedTest_q;
    fracXIsZero_uid14_fpMinMaxFusedTest_q <= "1" when fracXIsZero_uid14_fpMinMaxFusedTest_a = fracXIsZero_uid14_fpMinMaxFusedTest_b else "0";

	--InvFracXIsZero_uid16_fpMinMaxFusedTest(LOGICAL,15)@0
    InvFracXIsZero_uid16_fpMinMaxFusedTest_a <= fracXIsZero_uid14_fpMinMaxFusedTest_q;
    InvFracXIsZero_uid16_fpMinMaxFusedTest_q <= not InvFracXIsZero_uid16_fpMinMaxFusedTest_a;

	--exp_uid11_fpMinMaxFusedTest(BITSELECT,10)@0
    exp_uid11_fpMinMaxFusedTest_in <= x(30 downto 0);
    exp_uid11_fpMinMaxFusedTest_b <= exp_uid11_fpMinMaxFusedTest_in(30 downto 23);

	--expXIsMax_uid12_fpMinMaxFusedTest(LOGICAL,11)@0
    expXIsMax_uid12_fpMinMaxFusedTest_a <= exp_uid11_fpMinMaxFusedTest_b;
    expXIsMax_uid12_fpMinMaxFusedTest_b <= cstAllOWE_uid6_fpMinMaxFusedTest_q;
    expXIsMax_uid12_fpMinMaxFusedTest_q <= "1" when expXIsMax_uid12_fpMinMaxFusedTest_a = expXIsMax_uid12_fpMinMaxFusedTest_b else "0";

	--exc_N_uid17_fpMinMaxFusedTest(LOGICAL,16)@0
    exc_N_uid17_fpMinMaxFusedTest_a <= expXIsMax_uid12_fpMinMaxFusedTest_q;
    exc_N_uid17_fpMinMaxFusedTest_b <= InvFracXIsZero_uid16_fpMinMaxFusedTest_q;
    exc_N_uid17_fpMinMaxFusedTest_q <= exc_N_uid17_fpMinMaxFusedTest_a and exc_N_uid17_fpMinMaxFusedTest_b;

	--InvExc_N_uid42_fpMinMaxFusedTest(LOGICAL,41)@0
    InvExc_N_uid42_fpMinMaxFusedTest_a <= exc_N_uid17_fpMinMaxFusedTest_q;
    InvExc_N_uid42_fpMinMaxFusedTest_q <= not InvExc_N_uid42_fpMinMaxFusedTest_a;

	--xNotNaN_uid43_fpMinMaxFusedTest(LOGICAL,42)@0
    xNotNaN_uid43_fpMinMaxFusedTest_a <= STD_LOGIC_VECTOR((31 downto 1 => InvExc_N_uid42_fpMinMaxFusedTest_q(0)) & InvExc_N_uid42_fpMinMaxFusedTest_q);
    xNotNaN_uid43_fpMinMaxFusedTest_b <= x;
    xNotNaN_uid43_fpMinMaxFusedTest_q <= xNotNaN_uid43_fpMinMaxFusedTest_a and xNotNaN_uid43_fpMinMaxFusedTest_b;

	--oneNaNOutput_uid44_fpMinMaxFusedTest(LOGICAL,43)@0
    oneNaNOutput_uid44_fpMinMaxFusedTest_a <= xNotNaN_uid43_fpMinMaxFusedTest_q;
    oneNaNOutput_uid44_fpMinMaxFusedTest_b <= yNotNaN_uid41_fpMinMaxFusedTest_q;
    oneNaNOutput_uid44_fpMinMaxFusedTest_q <= oneNaNOutput_uid44_fpMinMaxFusedTest_a or oneNaNOutput_uid44_fpMinMaxFusedTest_b;

	--GND(CONSTANT,0)
    GND_q <= "0";

	--fracNaN_uid66_fpMinMaxFusedTest(CONSTANT,65)
    fracNaN_uid66_fpMinMaxFusedTest_q <= "00000000000000000000001";

	--join_uid68_fpMinMaxFusedTest(BITJOIN,67)@0
    join_uid68_fpMinMaxFusedTest_q <= GND_q & cstAllOWE_uid6_fpMinMaxFusedTest_q & fracNaN_uid66_fpMinMaxFusedTest_q;

	--d1Mux_uid63_fpMinMaxFusedTest(MUX,62)@0
    d1Mux_uid63_fpMinMaxFusedTest_s <= opSel;
    d1Mux_uid63_fpMinMaxFusedTest: PROCESS (d1Mux_uid63_fpMinMaxFusedTest_s, y, x)
    BEGIN
            CASE d1Mux_uid63_fpMinMaxFusedTest_s IS
                  WHEN "0" => d1Mux_uid63_fpMinMaxFusedTest_q <= y;
                  WHEN "1" => d1Mux_uid63_fpMinMaxFusedTest_q <= x;
                  WHEN OTHERS => d1Mux_uid63_fpMinMaxFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--d0Mux_uid62_fpMinMaxFusedTest(MUX,61)@0
    d0Mux_uid62_fpMinMaxFusedTest_s <= opSel;
    d0Mux_uid62_fpMinMaxFusedTest: PROCESS (d0Mux_uid62_fpMinMaxFusedTest_s, x, y)
    BEGIN
            CASE d0Mux_uid62_fpMinMaxFusedTest_s IS
                  WHEN "0" => d0Mux_uid62_fpMinMaxFusedTest_q <= x;
                  WHEN "1" => d0Mux_uid62_fpMinMaxFusedTest_q <= y;
                  WHEN OTHERS => d0Mux_uid62_fpMinMaxFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--expFracX_uid47_fpMinMaxFusedTest(BITJOIN,46)@0
    expFracX_uid47_fpMinMaxFusedTest_q <= exp_uid11_fpMinMaxFusedTest_b & frac_uid13_fpMinMaxFusedTest_b;

	--expFracY_uid50_fpMinMaxFusedTest(BITJOIN,49)@0
    expFracY_uid50_fpMinMaxFusedTest_q <= exp_uid27_fpMinMaxFusedTest_b & frac_uid29_fpMinMaxFusedTest_b;

	--efxGTefy_uid53_fpMinMaxFusedTest(COMPARE,52)@0
    efxGTefy_uid53_fpMinMaxFusedTest_cin <= GND_q;
    efxGTefy_uid53_fpMinMaxFusedTest_a <= STD_LOGIC_VECTOR("00" & expFracY_uid50_fpMinMaxFusedTest_q) & '0';
    efxGTefy_uid53_fpMinMaxFusedTest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid47_fpMinMaxFusedTest_q) & efxGTefy_uid53_fpMinMaxFusedTest_cin(0);
            efxGTefy_uid53_fpMinMaxFusedTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid53_fpMinMaxFusedTest_a) - UNSIGNED(efxGTefy_uid53_fpMinMaxFusedTest_b));
    efxGTefy_uid53_fpMinMaxFusedTest_c(0) <= efxGTefy_uid53_fpMinMaxFusedTest_o(33);


	--InvEfxGTefy_uid54_fpMinMaxFusedTest(LOGICAL,53)@0
    InvEfxGTefy_uid54_fpMinMaxFusedTest_a <= efxGTefy_uid53_fpMinMaxFusedTest_c;
    InvEfxGTefy_uid54_fpMinMaxFusedTest_q <= not InvEfxGTefy_uid54_fpMinMaxFusedTest_a;

	--Y31_uid52_fpMinMaxFusedTest(BITSELECT,51)@0
    Y31_uid52_fpMinMaxFusedTest_in <= y;
    Y31_uid52_fpMinMaxFusedTest_b <= Y31_uid52_fpMinMaxFusedTest_in(31 downto 31);

	--X31_uid51_fpMinMaxFusedTest(BITSELECT,50)@0
    X31_uid51_fpMinMaxFusedTest_in <= x;
    X31_uid51_fpMinMaxFusedTest_b <= X31_uid51_fpMinMaxFusedTest_in(31 downto 31);

	--xNegyNegYGTX_uid55_fpMinMaxFusedTest(LOGICAL,54)@0
    xNegyNegYGTX_uid55_fpMinMaxFusedTest_a <= X31_uid51_fpMinMaxFusedTest_b;
    xNegyNegYGTX_uid55_fpMinMaxFusedTest_b <= Y31_uid52_fpMinMaxFusedTest_b;
    xNegyNegYGTX_uid55_fpMinMaxFusedTest_c <= InvEfxGTefy_uid54_fpMinMaxFusedTest_q;
    xNegyNegYGTX_uid55_fpMinMaxFusedTest_q <= xNegyNegYGTX_uid55_fpMinMaxFusedTest_a and xNegyNegYGTX_uid55_fpMinMaxFusedTest_b and xNegyNegYGTX_uid55_fpMinMaxFusedTest_c;

	--InvY31_uid56_fpMinMaxFusedTest(LOGICAL,55)@0
    InvY31_uid56_fpMinMaxFusedTest_a <= Y31_uid52_fpMinMaxFusedTest_b;
    InvY31_uid56_fpMinMaxFusedTest_q <= not InvY31_uid56_fpMinMaxFusedTest_a;

	--InvX31_uid57_fpMinMaxFusedTest(LOGICAL,56)@0
    InvX31_uid57_fpMinMaxFusedTest_a <= X31_uid51_fpMinMaxFusedTest_b;
    InvX31_uid57_fpMinMaxFusedTest_q <= not InvX31_uid57_fpMinMaxFusedTest_a;

	--xPosyPosXGtY_uid58_fpMinMaxFusedTest(LOGICAL,57)@0
    xPosyPosXGtY_uid58_fpMinMaxFusedTest_a <= InvX31_uid57_fpMinMaxFusedTest_q;
    xPosyPosXGtY_uid58_fpMinMaxFusedTest_b <= InvY31_uid56_fpMinMaxFusedTest_q;
    xPosyPosXGtY_uid58_fpMinMaxFusedTest_c <= efxGTefy_uid53_fpMinMaxFusedTest_c;
    xPosyPosXGtY_uid58_fpMinMaxFusedTest_q <= xPosyPosXGtY_uid58_fpMinMaxFusedTest_a and xPosyPosXGtY_uid58_fpMinMaxFusedTest_b and xPosyPosXGtY_uid58_fpMinMaxFusedTest_c;

	--xPosYNeg_uid60_fpMinMaxFusedTest(LOGICAL,59)@0
    xPosYNeg_uid60_fpMinMaxFusedTest_a <= InvX31_uid57_fpMinMaxFusedTest_q;
    xPosYNeg_uid60_fpMinMaxFusedTest_b <= Y31_uid52_fpMinMaxFusedTest_b;
    xPosYNeg_uid60_fpMinMaxFusedTest_q <= xPosYNeg_uid60_fpMinMaxFusedTest_a and xPosYNeg_uid60_fpMinMaxFusedTest_b;

	--selX_uid61_fpMinMaxFusedTest(LOGICAL,60)@0
    selX_uid61_fpMinMaxFusedTest_a <= xPosYNeg_uid60_fpMinMaxFusedTest_q;
    selX_uid61_fpMinMaxFusedTest_b <= xPosyPosXGtY_uid58_fpMinMaxFusedTest_q;
    selX_uid61_fpMinMaxFusedTest_c <= xNegyNegYGTX_uid55_fpMinMaxFusedTest_q;
    selX_uid61_fpMinMaxFusedTest_q <= selX_uid61_fpMinMaxFusedTest_a or selX_uid61_fpMinMaxFusedTest_b or selX_uid61_fpMinMaxFusedTest_c;

	--r_uid64_fpMinMaxFusedTest(MUX,63)@0
    r_uid64_fpMinMaxFusedTest_s <= selX_uid61_fpMinMaxFusedTest_q;
    r_uid64_fpMinMaxFusedTest: PROCESS (r_uid64_fpMinMaxFusedTest_s, d0Mux_uid62_fpMinMaxFusedTest_q, d1Mux_uid63_fpMinMaxFusedTest_q)
    BEGIN
            CASE r_uid64_fpMinMaxFusedTest_s IS
                  WHEN "0" => r_uid64_fpMinMaxFusedTest_q <= d0Mux_uid62_fpMinMaxFusedTest_q;
                  WHEN "1" => r_uid64_fpMinMaxFusedTest_q <= d1Mux_uid63_fpMinMaxFusedTest_q;
                  WHEN OTHERS => r_uid64_fpMinMaxFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--oneIsNaN_uid39_fpMinMaxFusedTest(LOGICAL,38)@0
    oneIsNaN_uid39_fpMinMaxFusedTest_a <= exc_N_uid17_fpMinMaxFusedTest_q;
    oneIsNaN_uid39_fpMinMaxFusedTest_b <= exc_N_uid33_fpMinMaxFusedTest_q;
    oneIsNaN_uid39_fpMinMaxFusedTest_q <= oneIsNaN_uid39_fpMinMaxFusedTest_a xor oneIsNaN_uid39_fpMinMaxFusedTest_b;

	--nanOut_uid38_fpMinMaxFusedTest(LOGICAL,37)@0
    nanOut_uid38_fpMinMaxFusedTest_a <= exc_N_uid17_fpMinMaxFusedTest_q;
    nanOut_uid38_fpMinMaxFusedTest_b <= exc_N_uid33_fpMinMaxFusedTest_q;
    nanOut_uid38_fpMinMaxFusedTest_q <= nanOut_uid38_fpMinMaxFusedTest_a and nanOut_uid38_fpMinMaxFusedTest_b;

	--join_uid65_fpMinMaxFusedTest(BITJOIN,64)@0
    join_uid65_fpMinMaxFusedTest_q <= oneIsNaN_uid39_fpMinMaxFusedTest_q & nanOut_uid38_fpMinMaxFusedTest_q;

	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--rPostNaN_uid72_fpMinMaxFusedTest(MUX,71)@0
    rPostNaN_uid72_fpMinMaxFusedTest_s <= join_uid65_fpMinMaxFusedTest_q;
    rPostNaN_uid72_fpMinMaxFusedTest: PROCESS (rPostNaN_uid72_fpMinMaxFusedTest_s, r_uid64_fpMinMaxFusedTest_q, join_uid68_fpMinMaxFusedTest_q, oneNaNOutput_uid44_fpMinMaxFusedTest_q, join_uid68_fpMinMaxFusedTest_q)
    BEGIN
            CASE rPostNaN_uid72_fpMinMaxFusedTest_s IS
                  WHEN "00" => rPostNaN_uid72_fpMinMaxFusedTest_q <= r_uid64_fpMinMaxFusedTest_q;
                  WHEN "01" => rPostNaN_uid72_fpMinMaxFusedTest_q <= join_uid68_fpMinMaxFusedTest_q;
                  WHEN "10" => rPostNaN_uid72_fpMinMaxFusedTest_q <= oneNaNOutput_uid44_fpMinMaxFusedTest_q;
                  WHEN "11" => rPostNaN_uid72_fpMinMaxFusedTest_q <= join_uid68_fpMinMaxFusedTest_q;
                  WHEN OTHERS => rPostNaN_uid72_fpMinMaxFusedTest_q <= (others => '0');
            END CASE;
    END PROCESS;

	--xOut(PORTOUT,4)@0
    r <= rPostNaN_uid72_fpMinMaxFusedTest_q;
end normal;
