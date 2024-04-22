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
-- VHDL created on Fri Nov 16 14:19:00 2012


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;
--USE work.topModel_safe_path.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

-- Text written from d:/qshell64/p4/ip/aion/src/mip_common/hw_model.cpp:1243
entity IntToFloat is
    port (
        x : in std_logic_vector(31 downto 0);
        r : out std_logic_vector(31 downto 0);
        clk : in std_logic;
        areset : in std_logic
        );
end;

architecture normal of IntToFloat is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal maxCount_uid11_fxpToFPTest_q : std_logic_vector (5 downto 0);
    signal msbIn_uid13_fxpToFPTest_q : std_logic_vector (7 downto 0);
    signal expInf_uid21_fxpToFPTest_q : std_logic_vector (7 downto 0);
    signal fracZ_uid24_fxpToFPTest_q : std_logic_vector (22 downto 0);
    signal expZ_uid30_fxpToFPTest_q : std_logic_vector (7 downto 0);
    signal zs_uid36_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal zs_uid41_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (15 downto 0);
    signal zs_uid55_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (3 downto 0);
    signal zs_uid62_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (1 downto 0);
    signal reg_rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_0_to_vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_1_q : std_logic_vector (7 downto 0);
    signal reg_expFracRnd_uid16_uid16_fxpToFPTest_0_to_expFracR_uid17_fxpToFPTest_0_q : std_logic_vector (32 downto 0);
    signal ld_xIn_v_to_xOut_v_q : std_logic_vector (0 downto 0);
    signal ld_xIn_c_to_xOut_c_q : std_logic_vector (7 downto 0);
    signal ld_inIsZero_uid12_fxpToFPTest_q_to_excSelector_uid23_fxpToFPTest_a_q : std_logic_vector (0 downto 0);
    signal ld_signX_uid6_fxpToFPTest_b_to_outRes_uid33_fxpToFPTest_c_q : std_logic_vector (0 downto 0);
    signal ld_vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_b_to_cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest_b_q : std_logic_vector (23 downto 0);
    signal ld_vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q_to_vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_c_q : std_logic_vector (31 downto 0);
    signal ld_vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_e_q : std_logic_vector (0 downto 0);
    signal ld_vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_f_q : std_logic_vector (0 downto 0);
    signal expFracR_uid17_fxpToFPTest_a : std_logic_vector(34 downto 0);
    signal expFracR_uid17_fxpToFPTest_b : std_logic_vector(34 downto 0);
    signal expFracR_uid17_fxpToFPTest_o : std_logic_vector (34 downto 0);
    signal expFracR_uid17_fxpToFPTest_q : std_logic_vector (33 downto 0);
    signal vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_a : std_logic_vector(7 downto 0);
    signal vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector(7 downto 0);
    signal vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector(0 downto 0);
    signal signX_uid6_fxpToFPTest_in : std_logic_vector (31 downto 0);
    signal signX_uid6_fxpToFPTest_b : std_logic_vector (0 downto 0);
    signal xXorSign_uid7_fxpToFPTest_a : std_logic_vector(31 downto 0);
    signal xXorSign_uid7_fxpToFPTest_b : std_logic_vector(31 downto 0);
    signal xXorSign_uid7_fxpToFPTest_q : std_logic_vector(31 downto 0);
    signal cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal fracR_uid18_fxpToFPTest_in : std_logic_vector (23 downto 0);
    signal fracR_uid18_fxpToFPTest_b : std_logic_vector (22 downto 0);
    signal expR_uid19_fxpToFPTest_in : std_logic_vector (33 downto 0);
    signal expR_uid19_fxpToFPTest_b : std_logic_vector (9 downto 0);
    signal yE_uid8_fxpToFPTest_a : std_logic_vector(33 downto 0);
    signal yE_uid8_fxpToFPTest_b : std_logic_vector(33 downto 0);
    signal yE_uid8_fxpToFPTest_o : std_logic_vector (33 downto 0);
    signal yE_uid8_fxpToFPTest_q : std_logic_vector (32 downto 0);
    signal rVStage_uid56_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid56_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (3 downto 0);
    signal vStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (27 downto 0);
    signal vStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (27 downto 0);
    signal ovf_uid20_fxpToFPTest_a : std_logic_vector(12 downto 0);
    signal ovf_uid20_fxpToFPTest_b : std_logic_vector(12 downto 0);
    signal ovf_uid20_fxpToFPTest_o : std_logic_vector (12 downto 0);
    signal ovf_uid20_fxpToFPTest_cin : std_logic_vector (0 downto 0);
    signal ovf_uid20_fxpToFPTest_n : std_logic_vector (0 downto 0);
    signal ovf_uid22_fxpToFPTest_a : std_logic_vector(12 downto 0);
    signal ovf_uid22_fxpToFPTest_b : std_logic_vector(12 downto 0);
    signal ovf_uid22_fxpToFPTest_o : std_logic_vector (12 downto 0);
    signal ovf_uid22_fxpToFPTest_cin : std_logic_vector (0 downto 0);
    signal ovf_uid22_fxpToFPTest_n : std_logic_vector (0 downto 0);
    signal expR_uid31_fxpToFPTest_in : std_logic_vector (7 downto 0);
    signal expR_uid31_fxpToFPTest_b : std_logic_vector (7 downto 0);
    signal y_uid9_fxpToFPTest_in : std_logic_vector (31 downto 0);
    signal y_uid9_fxpToFPTest_b : std_logic_vector (31 downto 0);
    signal vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_a : std_logic_vector(3 downto 0);
    signal vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector(3 downto 0);
    signal vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid60_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal excSelector_uid23_fxpToFPTest_a : std_logic_vector(0 downto 0);
    signal excSelector_uid23_fxpToFPTest_b : std_logic_vector(0 downto 0);
    signal excSelector_uid23_fxpToFPTest_q : std_logic_vector(0 downto 0);
    signal udfOrInZero_uid26_fxpToFPTest_a : std_logic_vector(0 downto 0);
    signal udfOrInZero_uid26_fxpToFPTest_b : std_logic_vector(0 downto 0);
    signal udfOrInZero_uid26_fxpToFPTest_q : std_logic_vector(0 downto 0);
    signal excSelector_uid27_fxpToFPTest_q : std_logic_vector (1 downto 0);
    signal expRPostExc_uid32_fxpToFPTest_s : std_logic_vector (1 downto 0);
    signal expRPostExc_uid32_fxpToFPTest_q : std_logic_vector (7 downto 0);
    signal vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_a : std_logic_vector(31 downto 0);
    signal vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector(31 downto 0);
    signal vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector(0 downto 0);
    signal vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal fracRPostExc_uid25_fxpToFPTest_s : std_logic_vector (0 downto 0);
    signal fracRPostExc_uid25_fxpToFPTest_q : std_logic_vector (22 downto 0);
    signal outRes_uid33_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal rVStage_uid42_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid42_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (15 downto 0);
    signal vStage_uid45_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (15 downto 0);
    signal vStage_uid45_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (15 downto 0);
    signal rVStage_uid63_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid63_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (1 downto 0);
    signal vStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (29 downto 0);
    signal vStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (29 downto 0);
    signal vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_a : std_logic_vector(15 downto 0);
    signal vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector(15 downto 0);
    signal vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid46_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_a : std_logic_vector(1 downto 0);
    signal vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector(1 downto 0);
    signal vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid67_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (7 downto 0);
    signal vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (23 downto 0);
    signal vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (23 downto 0);
    signal rVStage_uid70_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (31 downto 0);
    signal rVStage_uid70_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (0 downto 0);
    signal vStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_in : std_logic_vector (30 downto 0);
    signal vStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector (30 downto 0);
    signal vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_a : std_logic_vector(0 downto 0);
    signal vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector(0 downto 0);
    signal vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector(0 downto 0);
    signal cStage_uid74_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest_s : std_logic_vector (0 downto 0);
    signal vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (31 downto 0);
    signal vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (5 downto 0);
    signal fracRnd_uid15_fxpToFPTest_in : std_logic_vector (30 downto 0);
    signal fracRnd_uid15_fxpToFPTest_b : std_logic_vector (23 downto 0);
    signal vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_a : std_logic_vector(8 downto 0);
    signal vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_b : std_logic_vector(8 downto 0);
    signal vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_o : std_logic_vector (8 downto 0);
    signal vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_cin : std_logic_vector (0 downto 0);
    signal vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_c : std_logic_vector (0 downto 0);
    signal vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_s : std_logic_vector (0 downto 0);
    signal vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_q : std_logic_vector (5 downto 0);
    signal inIsZero_uid12_fxpToFPTest_a : std_logic_vector(5 downto 0);
    signal inIsZero_uid12_fxpToFPTest_b : std_logic_vector(5 downto 0);
    signal inIsZero_uid12_fxpToFPTest_q : std_logic_vector(0 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_a : std_logic_vector(8 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_b : std_logic_vector(8 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_o : std_logic_vector (8 downto 0);
    signal expPreRnd_uid14_fxpToFPTest_q : std_logic_vector (8 downto 0);
    signal expFracRnd_uid16_uid16_fxpToFPTest_q : std_logic_vector (32 downto 0);
begin


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--xIn(PORTIN,3)@0

	--signX_uid6_fxpToFPTest(BITSELECT,5)@0
    signX_uid6_fxpToFPTest_in <= x;
    signX_uid6_fxpToFPTest_b <= signX_uid6_fxpToFPTest_in(31 downto 31);

	--ld_signX_uid6_fxpToFPTest_b_to_outRes_uid33_fxpToFPTest_c(DELAY,117)@0
    ld_signX_uid6_fxpToFPTest_b_to_outRes_uid33_fxpToFPTest_c : dspba_delay
    GENERIC MAP ( width => 1, depth => 2 )
    PORT MAP ( xin => signX_uid6_fxpToFPTest_b, xout => ld_signX_uid6_fxpToFPTest_b_to_outRes_uid33_fxpToFPTest_c_q, clk => clk, aclr => areset );

	--expInf_uid21_fxpToFPTest(CONSTANT,20)
    expInf_uid21_fxpToFPTest_q <= "11111111";

	--expZ_uid30_fxpToFPTest(CONSTANT,29)
    expZ_uid30_fxpToFPTest_q <= "00000000";

	--maxCount_uid11_fxpToFPTest(CONSTANT,10)
    maxCount_uid11_fxpToFPTest_q <= "100000";

	--zs_uid36_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,35)
    zs_uid36_lzcShifterZ1_uid10_fxpToFPTest_q <= "00000000000000000000000000000000";

	--xXorSign_uid7_fxpToFPTest(LOGICAL,6)@0
    xXorSign_uid7_fxpToFPTest_a <= x;
    xXorSign_uid7_fxpToFPTest_b <= STD_LOGIC_VECTOR((31 downto 1 => signX_uid6_fxpToFPTest_b(0)) & signX_uid6_fxpToFPTest_b);
    xXorSign_uid7_fxpToFPTest_q <= xXorSign_uid7_fxpToFPTest_a xor xXorSign_uid7_fxpToFPTest_b;

	--yE_uid8_fxpToFPTest(ADD,7)@0
    yE_uid8_fxpToFPTest_a <= STD_LOGIC_VECTOR((33 downto 32 => xXorSign_uid7_fxpToFPTest_q(31)) & xXorSign_uid7_fxpToFPTest_q);
    yE_uid8_fxpToFPTest_b <= STD_LOGIC_VECTOR('0' & "00000000000000000000000000000000" & signX_uid6_fxpToFPTest_b);
            yE_uid8_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(yE_uid8_fxpToFPTest_a) + SIGNED(yE_uid8_fxpToFPTest_b));
    yE_uid8_fxpToFPTest_q <= yE_uid8_fxpToFPTest_o(32 downto 0);


	--y_uid9_fxpToFPTest(BITSELECT,8)@0
    y_uid9_fxpToFPTest_in <= yE_uid8_fxpToFPTest_q(31 downto 0);
    y_uid9_fxpToFPTest_b <= y_uid9_fxpToFPTest_in(31 downto 0);

	--vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,37)@0
    vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_a <= y_uid9_fxpToFPTest_b;
    vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_b <= zs_uid36_lzcShifterZ1_uid10_fxpToFPTest_q;
    vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" when vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_a = vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_b else "0";

	--ld_vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_f(DELAY,161)@0
    ld_vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_f : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_q, xout => ld_vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_f_q, clk => clk, aclr => areset );

	--zs_uid41_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,40)
    zs_uid41_lzcShifterZ1_uid10_fxpToFPTest_q <= "0000000000000000";

	--vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest(MUX,39)@0
    vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest: PROCESS (vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_s, y_uid9_fxpToFPTest_b)
    BEGIN
            CASE vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_s IS
                  WHEN "0" => vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_q <= y_uid9_fxpToFPTest_b;
                  WHEN "1" => vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_q <= zs_uid36_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN OTHERS => vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid42_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,41)@0
    rVStage_uid42_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_q;
    rVStage_uid42_lzcShifterZ1_uid10_fxpToFPTest_b <= rVStage_uid42_lzcShifterZ1_uid10_fxpToFPTest_in(31 downto 16);

	--vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,42)@0
    vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_a <= rVStage_uid42_lzcShifterZ1_uid10_fxpToFPTest_b;
    vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_b <= zs_uid41_lzcShifterZ1_uid10_fxpToFPTest_q;
    vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" when vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_a = vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_b else "0";

	--ld_vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_e(DELAY,160)@0
    ld_vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_e : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_q, xout => ld_vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_e_q, clk => clk, aclr => areset );

	--vStage_uid45_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,44)@0
    vStage_uid45_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_q(15 downto 0);
    vStage_uid45_lzcShifterZ1_uid10_fxpToFPTest_b <= vStage_uid45_lzcShifterZ1_uid10_fxpToFPTest_in(15 downto 0);

	--cStage_uid46_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,45)@0
    cStage_uid46_lzcShifterZ1_uid10_fxpToFPTest_q <= vStage_uid45_lzcShifterZ1_uid10_fxpToFPTest_b & zs_uid41_lzcShifterZ1_uid10_fxpToFPTest_q;

	--vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest(MUX,46)@0
    vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest: PROCESS (vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_s, vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_q, cStage_uid46_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
            CASE vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_s IS
                  WHEN "0" => vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid40_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN "1" => vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid46_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN OTHERS => vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,48)@0
    rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q;
    rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_b <= rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_in(31 downto 24);

	--reg_rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_0_to_vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_1(REG,82)@0
    reg_rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_0_to_vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_0_to_vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_1_q <= "00000000";
        ELSIF rising_edge(clk) THEN
            reg_rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_0_to_vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_1_q <= rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_b;
        END IF;
    END PROCESS;


	--vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,49)@1
    vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_a <= reg_rVStage_uid49_lzcShifterZ1_uid10_fxpToFPTest_0_to_vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_1_q;
    vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_b <= expZ_uid30_fxpToFPTest_q;
    vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" when vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_a = vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_b else "0";

	--zs_uid55_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,54)
    zs_uid55_lzcShifterZ1_uid10_fxpToFPTest_q <= "0000";

	--vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,51)@0
    vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q(23 downto 0);
    vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_b <= vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_in(23 downto 0);

	--ld_vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_b_to_cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest_b(DELAY,131)@0
    ld_vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_b_to_cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest_b : dspba_delay
    GENERIC MAP ( width => 24, depth => 1 )
    PORT MAP ( xin => vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_b, xout => ld_vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_b_to_cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest_b_q, clk => clk, aclr => areset );

	--cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,52)@1
    cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest_q <= ld_vStage_uid52_lzcShifterZ1_uid10_fxpToFPTest_b_to_cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest_b_q & expZ_uid30_fxpToFPTest_q;

	--ld_vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q_to_vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_c(DELAY,133)@0
    ld_vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q_to_vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_c : dspba_delay
    GENERIC MAP ( width => 32, depth => 1 )
    PORT MAP ( xin => vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q, xout => ld_vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q_to_vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_c_q, clk => clk, aclr => areset );

	--vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest(MUX,53)@1
    vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest: PROCESS (vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_s, ld_vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q_to_vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_c_q, cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
            CASE vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_s IS
                  WHEN "0" => vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_q <= ld_vStagei_uid47_lzcShifterZ1_uid10_fxpToFPTest_q_to_vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_c_q;
                  WHEN "1" => vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid53_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN OTHERS => vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid56_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,55)@1
    rVStage_uid56_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_q;
    rVStage_uid56_lzcShifterZ1_uid10_fxpToFPTest_b <= rVStage_uid56_lzcShifterZ1_uid10_fxpToFPTest_in(31 downto 28);

	--vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,56)@1
    vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_a <= rVStage_uid56_lzcShifterZ1_uid10_fxpToFPTest_b;
    vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_b <= zs_uid55_lzcShifterZ1_uid10_fxpToFPTest_q;
    vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" when vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_a = vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_b else "0";

	--zs_uid62_lzcShifterZ1_uid10_fxpToFPTest(CONSTANT,61)
    zs_uid62_lzcShifterZ1_uid10_fxpToFPTest_q <= "00";

	--vStage_uid59_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,58)@1
    vStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_q(27 downto 0);
    vStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_b <= vStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_in(27 downto 0);

	--cStage_uid60_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,59)@1
    cStage_uid60_lzcShifterZ1_uid10_fxpToFPTest_q <= vStage_uid59_lzcShifterZ1_uid10_fxpToFPTest_b & zs_uid55_lzcShifterZ1_uid10_fxpToFPTest_q;

	--vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest(MUX,60)@1
    vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest: PROCESS (vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_s, vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_q, cStage_uid60_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
            CASE vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_s IS
                  WHEN "0" => vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid54_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN "1" => vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid60_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN OTHERS => vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid63_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,62)@1
    rVStage_uid63_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_q;
    rVStage_uid63_lzcShifterZ1_uid10_fxpToFPTest_b <= rVStage_uid63_lzcShifterZ1_uid10_fxpToFPTest_in(31 downto 30);

	--vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,63)@1
    vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_a <= rVStage_uid63_lzcShifterZ1_uid10_fxpToFPTest_b;
    vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_b <= zs_uid62_lzcShifterZ1_uid10_fxpToFPTest_q;
    vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" when vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_a = vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_b else "0";

	--GND(CONSTANT,0)
    GND_q <= "0";

	--vStage_uid66_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,65)@1
    vStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_q(29 downto 0);
    vStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_b <= vStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_in(29 downto 0);

	--cStage_uid67_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,66)@1
    cStage_uid67_lzcShifterZ1_uid10_fxpToFPTest_q <= vStage_uid66_lzcShifterZ1_uid10_fxpToFPTest_b & zs_uid62_lzcShifterZ1_uid10_fxpToFPTest_q;

	--vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest(MUX,67)@1
    vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest: PROCESS (vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_s, vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_q, cStage_uid67_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
            CASE vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_s IS
                  WHEN "0" => vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid61_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN "1" => vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid67_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN OTHERS => vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--rVStage_uid70_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,69)@1
    rVStage_uid70_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_q;
    rVStage_uid70_lzcShifterZ1_uid10_fxpToFPTest_b <= rVStage_uid70_lzcShifterZ1_uid10_fxpToFPTest_in(31 downto 31);

	--vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest(LOGICAL,70)@1
    vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_a <= rVStage_uid70_lzcShifterZ1_uid10_fxpToFPTest_b;
    vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_b <= GND_q;
    vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_q <= "1" when vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_a = vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_b else "0";

	--vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,75)@1
    vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_q <= ld_vCount_uid38_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_f_q & ld_vCount_uid43_lzcShifterZ1_uid10_fxpToFPTest_q_to_vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_e_q & vCount_uid50_lzcShifterZ1_uid10_fxpToFPTest_q & vCount_uid57_lzcShifterZ1_uid10_fxpToFPTest_q & vCount_uid64_lzcShifterZ1_uid10_fxpToFPTest_q & vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_q;

	--vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest(COMPARE,77)@1
    vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_cin <= GND_q;
    vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_a <= STD_LOGIC_VECTOR("00" & maxCount_uid11_fxpToFPTest_q) & '0';
    vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_b <= STD_LOGIC_VECTOR("00" & vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_q) & vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_cin(0);
            vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_a) - UNSIGNED(vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_b));
    vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_c(0) <= vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_o(8);


	--vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest(MUX,79)@1
    vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_s <= vCountBig_uid78_lzcShifterZ1_uid10_fxpToFPTest_c;
    vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest: PROCESS (vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_s, vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
            CASE vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_s IS
                  WHEN "0" => vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_q <= vCount_uid76_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN "1" => vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_q <= maxCount_uid11_fxpToFPTest_q;
                  WHEN OTHERS => vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--msbIn_uid13_fxpToFPTest(CONSTANT,12)
    msbIn_uid13_fxpToFPTest_q <= "10011110";

	--expPreRnd_uid14_fxpToFPTest(SUB,13)@1
    expPreRnd_uid14_fxpToFPTest_a <= STD_LOGIC_VECTOR("0" & msbIn_uid13_fxpToFPTest_q);
    expPreRnd_uid14_fxpToFPTest_b <= STD_LOGIC_VECTOR("000" & vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_q);
            expPreRnd_uid14_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPreRnd_uid14_fxpToFPTest_a) - UNSIGNED(expPreRnd_uid14_fxpToFPTest_b));
    expPreRnd_uid14_fxpToFPTest_q <= expPreRnd_uid14_fxpToFPTest_o(8 downto 0);


	--vStage_uid73_lzcShifterZ1_uid10_fxpToFPTest(BITSELECT,72)@1
    vStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_in <= vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_q(30 downto 0);
    vStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_b <= vStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_in(30 downto 0);

	--cStage_uid74_lzcShifterZ1_uid10_fxpToFPTest(BITJOIN,73)@1
    cStage_uid74_lzcShifterZ1_uid10_fxpToFPTest_q <= vStage_uid73_lzcShifterZ1_uid10_fxpToFPTest_b & GND_q;

	--vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest(MUX,74)@1
    vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest_s <= vCount_uid71_lzcShifterZ1_uid10_fxpToFPTest_q;
    vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest: PROCESS (vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest_s, vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_q, cStage_uid74_lzcShifterZ1_uid10_fxpToFPTest_q)
    BEGIN
            CASE vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest_s IS
                  WHEN "0" => vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest_q <= vStagei_uid68_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN "1" => vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest_q <= cStage_uid74_lzcShifterZ1_uid10_fxpToFPTest_q;
                  WHEN OTHERS => vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracRnd_uid15_fxpToFPTest(BITSELECT,14)@1
    fracRnd_uid15_fxpToFPTest_in <= vStagei_uid75_lzcShifterZ1_uid10_fxpToFPTest_q(30 downto 0);
    fracRnd_uid15_fxpToFPTest_b <= fracRnd_uid15_fxpToFPTest_in(30 downto 7);

	--expFracRnd_uid16_uid16_fxpToFPTest(BITJOIN,15)@1
    expFracRnd_uid16_uid16_fxpToFPTest_q <= expPreRnd_uid14_fxpToFPTest_q & fracRnd_uid15_fxpToFPTest_b;

	--reg_expFracRnd_uid16_uid16_fxpToFPTest_0_to_expFracR_uid17_fxpToFPTest_0(REG,83)@1
    reg_expFracRnd_uid16_uid16_fxpToFPTest_0_to_expFracR_uid17_fxpToFPTest_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            reg_expFracRnd_uid16_uid16_fxpToFPTest_0_to_expFracR_uid17_fxpToFPTest_0_q <= "000000000000000000000000000000000";
        ELSIF rising_edge(clk) THEN
            reg_expFracRnd_uid16_uid16_fxpToFPTest_0_to_expFracR_uid17_fxpToFPTest_0_q <= expFracRnd_uid16_uid16_fxpToFPTest_q;
        END IF;
    END PROCESS;


	--expFracR_uid17_fxpToFPTest(ADD,16)@2
    expFracR_uid17_fxpToFPTest_a <= STD_LOGIC_VECTOR((34 downto 33 => reg_expFracRnd_uid16_uid16_fxpToFPTest_0_to_expFracR_uid17_fxpToFPTest_0_q(32)) & reg_expFracRnd_uid16_uid16_fxpToFPTest_0_to_expFracR_uid17_fxpToFPTest_0_q);
    expFracR_uid17_fxpToFPTest_b <= STD_LOGIC_VECTOR('0' & "000000000000000000000000000000000" & VCC_q);
            expFracR_uid17_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracR_uid17_fxpToFPTest_a) + SIGNED(expFracR_uid17_fxpToFPTest_b));
    expFracR_uid17_fxpToFPTest_q <= expFracR_uid17_fxpToFPTest_o(33 downto 0);


	--expR_uid19_fxpToFPTest(BITSELECT,18)@2
    expR_uid19_fxpToFPTest_in <= expFracR_uid17_fxpToFPTest_q;
    expR_uid19_fxpToFPTest_b <= expR_uid19_fxpToFPTest_in(33 downto 24);

	--expR_uid31_fxpToFPTest(BITSELECT,30)@2
    expR_uid31_fxpToFPTest_in <= expR_uid19_fxpToFPTest_b(7 downto 0);
    expR_uid31_fxpToFPTest_b <= expR_uid31_fxpToFPTest_in(7 downto 0);

	--ovf_uid22_fxpToFPTest(COMPARE,21)@2
    ovf_uid22_fxpToFPTest_cin <= GND_q;
    ovf_uid22_fxpToFPTest_a <= STD_LOGIC_VECTOR((11 downto 10 => expR_uid19_fxpToFPTest_b(9)) & expR_uid19_fxpToFPTest_b) & '0';
    ovf_uid22_fxpToFPTest_b <= STD_LOGIC_VECTOR('0' & "000" & expInf_uid21_fxpToFPTest_q) & ovf_uid22_fxpToFPTest_cin(0);
            ovf_uid22_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid22_fxpToFPTest_a) - SIGNED(ovf_uid22_fxpToFPTest_b));
    ovf_uid22_fxpToFPTest_n(0) <= not ovf_uid22_fxpToFPTest_o(12);


	--inIsZero_uid12_fxpToFPTest(LOGICAL,11)@1
    inIsZero_uid12_fxpToFPTest_a <= vCountFinal_uid80_lzcShifterZ1_uid10_fxpToFPTest_q;
    inIsZero_uid12_fxpToFPTest_b <= maxCount_uid11_fxpToFPTest_q;
    inIsZero_uid12_fxpToFPTest_q <= "1" when inIsZero_uid12_fxpToFPTest_a = inIsZero_uid12_fxpToFPTest_b else "0";

	--ld_inIsZero_uid12_fxpToFPTest_q_to_excSelector_uid23_fxpToFPTest_a(DELAY,104)@1
    ld_inIsZero_uid12_fxpToFPTest_q_to_excSelector_uid23_fxpToFPTest_a : dspba_delay
    GENERIC MAP ( width => 1, depth => 1 )
    PORT MAP ( xin => inIsZero_uid12_fxpToFPTest_q, xout => ld_inIsZero_uid12_fxpToFPTest_q_to_excSelector_uid23_fxpToFPTest_a_q, clk => clk, aclr => areset );

	--ovf_uid20_fxpToFPTest(COMPARE,19)@2
    ovf_uid20_fxpToFPTest_cin <= GND_q;
    ovf_uid20_fxpToFPTest_a <= STD_LOGIC_VECTOR('0' & "0000000000" & GND_q) & '0';
    ovf_uid20_fxpToFPTest_b <= STD_LOGIC_VECTOR((11 downto 10 => expR_uid19_fxpToFPTest_b(9)) & expR_uid19_fxpToFPTest_b) & ovf_uid20_fxpToFPTest_cin(0);
            ovf_uid20_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid20_fxpToFPTest_a) - SIGNED(ovf_uid20_fxpToFPTest_b));
    ovf_uid20_fxpToFPTest_n(0) <= not ovf_uid20_fxpToFPTest_o(12);


	--udfOrInZero_uid26_fxpToFPTest(LOGICAL,25)@2
    udfOrInZero_uid26_fxpToFPTest_a <= ovf_uid20_fxpToFPTest_n;
    udfOrInZero_uid26_fxpToFPTest_b <= ld_inIsZero_uid12_fxpToFPTest_q_to_excSelector_uid23_fxpToFPTest_a_q;
    udfOrInZero_uid26_fxpToFPTest_q <= udfOrInZero_uid26_fxpToFPTest_a or udfOrInZero_uid26_fxpToFPTest_b;

	--excSelector_uid27_fxpToFPTest(BITJOIN,26)@2
    excSelector_uid27_fxpToFPTest_q <= ovf_uid22_fxpToFPTest_n & udfOrInZero_uid26_fxpToFPTest_q;

	--expRPostExc_uid32_fxpToFPTest(MUX,31)@2
    expRPostExc_uid32_fxpToFPTest_s <= excSelector_uid27_fxpToFPTest_q;
    expRPostExc_uid32_fxpToFPTest: PROCESS (expRPostExc_uid32_fxpToFPTest_s, expR_uid31_fxpToFPTest_b)
    BEGIN
            CASE expRPostExc_uid32_fxpToFPTest_s IS
                  WHEN "00" => expRPostExc_uid32_fxpToFPTest_q <= expR_uid31_fxpToFPTest_b;
                  WHEN "01" => expRPostExc_uid32_fxpToFPTest_q <= expZ_uid30_fxpToFPTest_q;
                  WHEN "10" => expRPostExc_uid32_fxpToFPTest_q <= expInf_uid21_fxpToFPTest_q;
                  WHEN "11" => expRPostExc_uid32_fxpToFPTest_q <= expInf_uid21_fxpToFPTest_q;
                  WHEN OTHERS => expRPostExc_uid32_fxpToFPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--fracZ_uid24_fxpToFPTest(CONSTANT,23)
    fracZ_uid24_fxpToFPTest_q <= "00000000000000000000000";

	--fracR_uid18_fxpToFPTest(BITSELECT,17)@2
    fracR_uid18_fxpToFPTest_in <= expFracR_uid17_fxpToFPTest_q(23 downto 0);
    fracR_uid18_fxpToFPTest_b <= fracR_uid18_fxpToFPTest_in(23 downto 1);

	--excSelector_uid23_fxpToFPTest(LOGICAL,22)@2
    excSelector_uid23_fxpToFPTest_a <= ld_inIsZero_uid12_fxpToFPTest_q_to_excSelector_uid23_fxpToFPTest_a_q;
    excSelector_uid23_fxpToFPTest_b <= ovf_uid22_fxpToFPTest_n;
    excSelector_uid23_fxpToFPTest_q <= excSelector_uid23_fxpToFPTest_a or excSelector_uid23_fxpToFPTest_b;

	--fracRPostExc_uid25_fxpToFPTest(MUX,24)@2
    fracRPostExc_uid25_fxpToFPTest_s <= excSelector_uid23_fxpToFPTest_q;
    fracRPostExc_uid25_fxpToFPTest: PROCESS (fracRPostExc_uid25_fxpToFPTest_s, fracR_uid18_fxpToFPTest_b)
    BEGIN
            CASE fracRPostExc_uid25_fxpToFPTest_s IS
                  WHEN "0" => fracRPostExc_uid25_fxpToFPTest_q <= fracR_uid18_fxpToFPTest_b;
                  WHEN "1" => fracRPostExc_uid25_fxpToFPTest_q <= fracZ_uid24_fxpToFPTest_q;
                  WHEN OTHERS => fracRPostExc_uid25_fxpToFPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--outRes_uid33_fxpToFPTest(BITJOIN,32)@2
    outRes_uid33_fxpToFPTest_q <= ld_signX_uid6_fxpToFPTest_b_to_outRes_uid33_fxpToFPTest_c_q & expRPostExc_uid32_fxpToFPTest_q & fracRPostExc_uid25_fxpToFPTest_q;

	--xOut(PORTOUT,4)@2
    r <= outRes_uid33_fxpToFPTest_q;
end normal;
