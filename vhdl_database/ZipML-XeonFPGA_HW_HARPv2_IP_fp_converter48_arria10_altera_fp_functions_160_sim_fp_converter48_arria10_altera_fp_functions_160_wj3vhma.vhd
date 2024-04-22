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

-- VHDL created from fp_converter48_arria10_altera_fp_functions_160_wj3vhma
-- VHDL created on Mon Feb 26 12:27:46 2018


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

entity fp_converter48_arria10_altera_fp_functions_160_wj3vhma is
    port (
        a : in std_logic_vector(47 downto 0);  -- sfix48_en23
        q : out std_logic_vector(31 downto 0);  -- float32_m23
        clk : in std_logic;
        areset : in std_logic
    );
end fp_converter48_arria10_altera_fp_functions_160_wj3vhma;

architecture normal of fp_converter48_arria10_altera_fp_functions_160_wj3vhma is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal maxCount_uid12_fxpToFPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal inIsZero_uid13_fxpToFPTest_a : STD_LOGIC_VECTOR (5 downto 0);
    signal inIsZero_uid13_fxpToFPTest_b : STD_LOGIC_VECTOR (5 downto 0);
    signal inIsZero_uid13_fxpToFPTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal inIsZero_uid13_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal msbIn_uid14_fxpToFPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal expInf_uid24_fxpToFPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal fracZ_uid27_fxpToFPTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal expZ_uid33_fxpToFPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal zs_uid38_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal zs_uid45_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal zs_uid59_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal zs_uid66_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal redist0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal redist1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal redist4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal redist5_q : STD_LOGIC_VECTOR (47 downto 0);
    signal redist6_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_o : STD_LOGIC_VECTOR (7 downto 0);
    signal vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracR_uid20_fxpToFPTest_a : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracR_uid20_fxpToFPTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracR_uid20_fxpToFPTest_o : STD_LOGIC_VECTOR (34 downto 0);
    signal expFracR_uid20_fxpToFPTest_q : STD_LOGIC_VECTOR (33 downto 0);
    signal vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal signX_uid6_fxpToFPTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal signX_uid6_fxpToFPTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xXorSign_uid8_fxpToFPTest_a : STD_LOGIC_VECTOR (47 downto 0);
    signal xXorSign_uid8_fxpToFPTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal xXorSign_uid8_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal expPreRnd_uid15_fxpToFPTest_a : STD_LOGIC_VECTOR (8 downto 0);
    signal expPreRnd_uid15_fxpToFPTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal expPreRnd_uid15_fxpToFPTest_o : STD_LOGIC_VECTOR (8 downto 0);
    signal expPreRnd_uid15_fxpToFPTest_q : STD_LOGIC_VECTOR (8 downto 0);
    signal rVStage_uid53_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal rVStage_uid53_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vStage_uid56_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (39 downto 0);
    signal vStage_uid56_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (39 downto 0);
    signal expFracRnd_uid17_fxpToFPTest_q : STD_LOGIC_VECTOR (32 downto 0);
    signal rVStage_uid39_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal rVStage_uid39_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vStage_uid42_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal vStage_uid42_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal fracR_uid21_fxpToFPTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal fracR_uid21_fxpToFPTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal expR_uid22_fxpToFPTest_in : STD_LOGIC_VECTOR (33 downto 0);
    signal expR_uid22_fxpToFPTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal yE_uid9_fxpToFPTest_a : STD_LOGIC_VECTOR (48 downto 0);
    signal yE_uid9_fxpToFPTest_b : STD_LOGIC_VECTOR (48 downto 0);
    signal yE_uid9_fxpToFPTest_o : STD_LOGIC_VECTOR (48 downto 0);
    signal yE_uid9_fxpToFPTest_q : STD_LOGIC_VECTOR (48 downto 0);
    signal vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid57_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_a : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid43_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal udf_uid23_fxpToFPTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal udf_uid23_fxpToFPTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal udf_uid23_fxpToFPTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal udf_uid23_fxpToFPTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal ovf_uid25_fxpToFPTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal ovf_uid25_fxpToFPTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal ovf_uid25_fxpToFPTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal ovf_uid25_fxpToFPTest_n : STD_LOGIC_VECTOR (0 downto 0);
    signal expR_uid34_fxpToFPTest_in : STD_LOGIC_VECTOR (7 downto 0);
    signal expR_uid34_fxpToFPTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal y_uid10_fxpToFPTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal y_uid10_fxpToFPTest_b : STD_LOGIC_VECTOR (47 downto 0);
    signal vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal excSelector_uid26_fxpToFPTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid26_fxpToFPTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid26_fxpToFPTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid26_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal udfOrInZero_uid29_fxpToFPTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal udfOrInZero_uid29_fxpToFPTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal udfOrInZero_uid29_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excSelector_uid30_fxpToFPTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid35_fxpToFPTest_s : STD_LOGIC_VECTOR (1 downto 0);
    signal expRPostExc_uid35_fxpToFPTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal rVStage_uid60_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal rVStage_uid60_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal vStage_uid63_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (43 downto 0);
    signal vStage_uid63_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (43 downto 0);
    signal rVStage_uid46_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal rVStage_uid46_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vStage_uid49_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal vStage_uid49_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal fracRPostExc_uid28_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal fracRPostExc_uid28_fxpToFPTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal outRes_uid36_fxpToFPTest_q : STD_LOGIC_VECTOR (31 downto 0);
    signal vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_a : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (3 downto 0);
    signal vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid64_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid50_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rVStage_uid67_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal rVStage_uid67_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal vStage_uid70_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (45 downto 0);
    signal vStage_uid70_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (45 downto 0);
    signal vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_a : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid71_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal rVStage_uid74_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (47 downto 0);
    signal rVStage_uid74_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vStage_uid77_lzcShifterZ1_uid11_fxpToFPTest_in : STD_LOGIC_VECTOR (46 downto 0);
    signal vStage_uid77_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (46 downto 0);
    signal vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cStage_uid78_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (47 downto 0);
    signal vCount_uid80_lzcShifterZ1_uid11_fxpToFPTest_q : STD_LOGIC_VECTOR (5 downto 0);
    signal fracRnd_uid16_fxpToFPTest_in : STD_LOGIC_VECTOR (46 downto 0);
    signal fracRnd_uid16_fxpToFPTest_b : STD_LOGIC_VECTOR (23 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- xIn(GPIN,3)@0

    -- signX_uid6_fxpToFPTest(BITSELECT,5)@0
    signX_uid6_fxpToFPTest_in <= STD_LOGIC_VECTOR(a);
    signX_uid6_fxpToFPTest_b <= STD_LOGIC_VECTOR(signX_uid6_fxpToFPTest_in(47 downto 47));

    -- redist6(DELAY,92)
    redist6 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => signX_uid6_fxpToFPTest_b, xout => redist6_q, clk => clk, aclr => areset );

    -- expInf_uid24_fxpToFPTest(CONSTANT,23)
    expInf_uid24_fxpToFPTest_q <= "11111111";

    -- expZ_uid33_fxpToFPTest(CONSTANT,32)
    expZ_uid33_fxpToFPTest_q <= "00000000";

    -- maxCount_uid12_fxpToFPTest(CONSTANT,11)
    maxCount_uid12_fxpToFPTest_q <= "110000";

    -- zs_uid38_lzcShifterZ1_uid11_fxpToFPTest(CONSTANT,37)
    zs_uid38_lzcShifterZ1_uid11_fxpToFPTest_q <= "00000000000000000000000000000000";

    -- xXorSign_uid8_fxpToFPTest(LOGICAL,7)@0
    xXorSign_uid8_fxpToFPTest_a <= STD_LOGIC_VECTOR(a);
    xXorSign_uid8_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((47 downto 1 => signX_uid6_fxpToFPTest_b(0)) & signX_uid6_fxpToFPTest_b));
    xXorSign_uid8_fxpToFPTest_q <= xXorSign_uid8_fxpToFPTest_a xor xXorSign_uid8_fxpToFPTest_b;

    -- yE_uid9_fxpToFPTest(ADD,8)@0
    yE_uid9_fxpToFPTest_a <= STD_LOGIC_VECTOR("0" & xXorSign_uid8_fxpToFPTest_q);
    yE_uid9_fxpToFPTest_b <= STD_LOGIC_VECTOR("000000000000000000000000000000000000000000000000" & signX_uid6_fxpToFPTest_b);
    yE_uid9_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yE_uid9_fxpToFPTest_a) + UNSIGNED(yE_uid9_fxpToFPTest_b));
    yE_uid9_fxpToFPTest_q <= yE_uid9_fxpToFPTest_o(48 downto 0);

    -- y_uid10_fxpToFPTest(BITSELECT,9)@0
    y_uid10_fxpToFPTest_in <= STD_LOGIC_VECTOR(yE_uid9_fxpToFPTest_q(47 downto 0));
    y_uid10_fxpToFPTest_b <= STD_LOGIC_VECTOR(y_uid10_fxpToFPTest_in(47 downto 0));

    -- redist5(DELAY,91)
    redist5 : dspba_delay
    GENERIC MAP ( width => 48, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => y_uid10_fxpToFPTest_b, xout => redist5_q, clk => clk, aclr => areset );

    -- rVStage_uid39_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,38)@1
    rVStage_uid39_lzcShifterZ1_uid11_fxpToFPTest_in <= redist5_q;
    rVStage_uid39_lzcShifterZ1_uid11_fxpToFPTest_b <= rVStage_uid39_lzcShifterZ1_uid11_fxpToFPTest_in(47 downto 16);

    -- vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest(LOGICAL,39)@1
    vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_a <= rVStage_uid39_lzcShifterZ1_uid11_fxpToFPTest_b;
    vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_b <= zs_uid38_lzcShifterZ1_uid11_fxpToFPTest_q;
    vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_q <= "1" WHEN vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_a = vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_b ELSE "0";

    -- redist2(DELAY,88)
    redist2 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_q, xout => redist2_q, clk => clk, aclr => areset );

    -- zs_uid45_lzcShifterZ1_uid11_fxpToFPTest(CONSTANT,44)
    zs_uid45_lzcShifterZ1_uid11_fxpToFPTest_q <= "0000000000000000";

    -- vStage_uid42_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,41)@1
    vStage_uid42_lzcShifterZ1_uid11_fxpToFPTest_in <= redist5_q(15 downto 0);
    vStage_uid42_lzcShifterZ1_uid11_fxpToFPTest_b <= vStage_uid42_lzcShifterZ1_uid11_fxpToFPTest_in(15 downto 0);

    -- cStage_uid43_lzcShifterZ1_uid11_fxpToFPTest(BITJOIN,42)@1
    cStage_uid43_lzcShifterZ1_uid11_fxpToFPTest_q <= vStage_uid42_lzcShifterZ1_uid11_fxpToFPTest_b & zs_uid38_lzcShifterZ1_uid11_fxpToFPTest_q;

    -- vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest(MUX,43)@1
    vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_s <= vCount_uid40_lzcShifterZ1_uid11_fxpToFPTest_q;
    vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_combproc: PROCESS (vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_s, redist5_q, cStage_uid43_lzcShifterZ1_uid11_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_q <= redist5_q;
            WHEN "1" => vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_q <= cStage_uid43_lzcShifterZ1_uid11_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid46_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,45)@1
    rVStage_uid46_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_q;
    rVStage_uid46_lzcShifterZ1_uid11_fxpToFPTest_b <= rVStage_uid46_lzcShifterZ1_uid11_fxpToFPTest_in(47 downto 32);

    -- vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest(LOGICAL,46)@1
    vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_a <= rVStage_uid46_lzcShifterZ1_uid11_fxpToFPTest_b;
    vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_b <= zs_uid45_lzcShifterZ1_uid11_fxpToFPTest_q;
    vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_q <= "1" WHEN vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_a = vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_b ELSE "0";

    -- redist1(DELAY,87)
    redist1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_q, xout => redist1_q, clk => clk, aclr => areset );

    -- vStage_uid49_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,48)@1
    vStage_uid49_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_q(31 downto 0);
    vStage_uid49_lzcShifterZ1_uid11_fxpToFPTest_b <= vStage_uid49_lzcShifterZ1_uid11_fxpToFPTest_in(31 downto 0);

    -- cStage_uid50_lzcShifterZ1_uid11_fxpToFPTest(BITJOIN,49)@1
    cStage_uid50_lzcShifterZ1_uid11_fxpToFPTest_q <= vStage_uid49_lzcShifterZ1_uid11_fxpToFPTest_b & zs_uid45_lzcShifterZ1_uid11_fxpToFPTest_q;

    -- vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest(MUX,50)@1 + 1
    vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_s <= vCount_uid47_lzcShifterZ1_uid11_fxpToFPTest_q;
    vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_q <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_s) IS
                WHEN "0" => vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_q <= vStagei_uid44_lzcShifterZ1_uid11_fxpToFPTest_q;
                WHEN "1" => vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_q <= cStage_uid50_lzcShifterZ1_uid11_fxpToFPTest_q;
                WHEN OTHERS => vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_q <= (others => '0');
            END CASE;
        END IF;
    END PROCESS;

    -- rVStage_uid53_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,52)@2
    rVStage_uid53_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_q;
    rVStage_uid53_lzcShifterZ1_uid11_fxpToFPTest_b <= rVStage_uid53_lzcShifterZ1_uid11_fxpToFPTest_in(47 downto 40);

    -- vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest(LOGICAL,53)@2
    vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_a <= rVStage_uid53_lzcShifterZ1_uid11_fxpToFPTest_b;
    vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_b <= expZ_uid33_fxpToFPTest_q;
    vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_q <= "1" WHEN vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_a = vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_b ELSE "0";

    -- zs_uid59_lzcShifterZ1_uid11_fxpToFPTest(CONSTANT,58)
    zs_uid59_lzcShifterZ1_uid11_fxpToFPTest_q <= "0000";

    -- vStage_uid56_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,55)@2
    vStage_uid56_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_q(39 downto 0);
    vStage_uid56_lzcShifterZ1_uid11_fxpToFPTest_b <= vStage_uid56_lzcShifterZ1_uid11_fxpToFPTest_in(39 downto 0);

    -- cStage_uid57_lzcShifterZ1_uid11_fxpToFPTest(BITJOIN,56)@2
    cStage_uid57_lzcShifterZ1_uid11_fxpToFPTest_q <= vStage_uid56_lzcShifterZ1_uid11_fxpToFPTest_b & expZ_uid33_fxpToFPTest_q;

    -- vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest(MUX,57)@2
    vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_s <= vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_q;
    vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_combproc: PROCESS (vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_s, vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_q, cStage_uid57_lzcShifterZ1_uid11_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_q <= vStagei_uid51_lzcShifterZ1_uid11_fxpToFPTest_q;
            WHEN "1" => vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_q <= cStage_uid57_lzcShifterZ1_uid11_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid60_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,59)@2
    rVStage_uid60_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_q;
    rVStage_uid60_lzcShifterZ1_uid11_fxpToFPTest_b <= rVStage_uid60_lzcShifterZ1_uid11_fxpToFPTest_in(47 downto 44);

    -- vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest(LOGICAL,60)@2
    vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_a <= rVStage_uid60_lzcShifterZ1_uid11_fxpToFPTest_b;
    vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_b <= zs_uid59_lzcShifterZ1_uid11_fxpToFPTest_q;
    vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_q <= "1" WHEN vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_a = vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_b ELSE "0";

    -- zs_uid66_lzcShifterZ1_uid11_fxpToFPTest(CONSTANT,65)
    zs_uid66_lzcShifterZ1_uid11_fxpToFPTest_q <= "00";

    -- vStage_uid63_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,62)@2
    vStage_uid63_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_q(43 downto 0);
    vStage_uid63_lzcShifterZ1_uid11_fxpToFPTest_b <= vStage_uid63_lzcShifterZ1_uid11_fxpToFPTest_in(43 downto 0);

    -- cStage_uid64_lzcShifterZ1_uid11_fxpToFPTest(BITJOIN,63)@2
    cStage_uid64_lzcShifterZ1_uid11_fxpToFPTest_q <= vStage_uid63_lzcShifterZ1_uid11_fxpToFPTest_b & zs_uid59_lzcShifterZ1_uid11_fxpToFPTest_q;

    -- vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest(MUX,64)@2
    vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_s <= vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_q;
    vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_combproc: PROCESS (vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_s, vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_q, cStage_uid64_lzcShifterZ1_uid11_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_q <= vStagei_uid58_lzcShifterZ1_uid11_fxpToFPTest_q;
            WHEN "1" => vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_q <= cStage_uid64_lzcShifterZ1_uid11_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid67_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,66)@2
    rVStage_uid67_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_q;
    rVStage_uid67_lzcShifterZ1_uid11_fxpToFPTest_b <= rVStage_uid67_lzcShifterZ1_uid11_fxpToFPTest_in(47 downto 46);

    -- vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest(LOGICAL,67)@2
    vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_a <= rVStage_uid67_lzcShifterZ1_uid11_fxpToFPTest_b;
    vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_b <= zs_uid66_lzcShifterZ1_uid11_fxpToFPTest_q;
    vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_q <= "1" WHEN vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_a = vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_b ELSE "0";

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- vStage_uid70_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,69)@2
    vStage_uid70_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_q(45 downto 0);
    vStage_uid70_lzcShifterZ1_uid11_fxpToFPTest_b <= vStage_uid70_lzcShifterZ1_uid11_fxpToFPTest_in(45 downto 0);

    -- cStage_uid71_lzcShifterZ1_uid11_fxpToFPTest(BITJOIN,70)@2
    cStage_uid71_lzcShifterZ1_uid11_fxpToFPTest_q <= vStage_uid70_lzcShifterZ1_uid11_fxpToFPTest_b & zs_uid66_lzcShifterZ1_uid11_fxpToFPTest_q;

    -- vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest(MUX,71)@2
    vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_s <= vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_q;
    vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_combproc: PROCESS (vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_s, vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_q, cStage_uid71_lzcShifterZ1_uid11_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_q <= vStagei_uid65_lzcShifterZ1_uid11_fxpToFPTest_q;
            WHEN "1" => vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_q <= cStage_uid71_lzcShifterZ1_uid11_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- rVStage_uid74_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,73)@2
    rVStage_uid74_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_q;
    rVStage_uid74_lzcShifterZ1_uid11_fxpToFPTest_b <= rVStage_uid74_lzcShifterZ1_uid11_fxpToFPTest_in(47 downto 47);

    -- vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest(LOGICAL,74)@2
    vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_a <= rVStage_uid74_lzcShifterZ1_uid11_fxpToFPTest_b;
    vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_b <= GND_q;
    vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_q <= "1" WHEN vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_a = vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_b ELSE "0";

    -- vCount_uid80_lzcShifterZ1_uid11_fxpToFPTest(BITJOIN,79)@2
    vCount_uid80_lzcShifterZ1_uid11_fxpToFPTest_q <= redist2_q & redist1_q & vCount_uid54_lzcShifterZ1_uid11_fxpToFPTest_q & vCount_uid61_lzcShifterZ1_uid11_fxpToFPTest_q & vCount_uid68_lzcShifterZ1_uid11_fxpToFPTest_q & vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_q;

    -- redist0(DELAY,86)
    redist0 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => vCount_uid80_lzcShifterZ1_uid11_fxpToFPTest_q, xout => redist0_q, clk => clk, aclr => areset );

    -- vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest(COMPARE,81)@3
    vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_a <= STD_LOGIC_VECTOR("00" & maxCount_uid12_fxpToFPTest_q);
    vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_b <= STD_LOGIC_VECTOR("00" & redist0_q);
    vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_a) - UNSIGNED(vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_b));
    vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_c(0) <= vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_o(7);

    -- vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest(MUX,83)@3
    vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_s <= vCountBig_uid82_lzcShifterZ1_uid11_fxpToFPTest_c;
    vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_combproc: PROCESS (vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_s, redist0_q, maxCount_uid12_fxpToFPTest_q)
    BEGIN
        CASE (vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_s) IS
            WHEN "0" => vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_q <= redist0_q;
            WHEN "1" => vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_q <= maxCount_uid12_fxpToFPTest_q;
            WHEN OTHERS => vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- msbIn_uid14_fxpToFPTest(CONSTANT,13)
    msbIn_uid14_fxpToFPTest_q <= "10010111";

    -- expPreRnd_uid15_fxpToFPTest(SUB,14)@3
    expPreRnd_uid15_fxpToFPTest_a <= STD_LOGIC_VECTOR("0" & msbIn_uid14_fxpToFPTest_q);
    expPreRnd_uid15_fxpToFPTest_b <= STD_LOGIC_VECTOR("000" & vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_q);
    expPreRnd_uid15_fxpToFPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(expPreRnd_uid15_fxpToFPTest_a) - UNSIGNED(expPreRnd_uid15_fxpToFPTest_b));
    expPreRnd_uid15_fxpToFPTest_q <= expPreRnd_uid15_fxpToFPTest_o(8 downto 0);

    -- vStage_uid77_lzcShifterZ1_uid11_fxpToFPTest(BITSELECT,76)@2
    vStage_uid77_lzcShifterZ1_uid11_fxpToFPTest_in <= vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_q(46 downto 0);
    vStage_uid77_lzcShifterZ1_uid11_fxpToFPTest_b <= vStage_uid77_lzcShifterZ1_uid11_fxpToFPTest_in(46 downto 0);

    -- cStage_uid78_lzcShifterZ1_uid11_fxpToFPTest(BITJOIN,77)@2
    cStage_uid78_lzcShifterZ1_uid11_fxpToFPTest_q <= vStage_uid77_lzcShifterZ1_uid11_fxpToFPTest_b & GND_q;

    -- vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest(MUX,78)@2
    vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_s <= vCount_uid75_lzcShifterZ1_uid11_fxpToFPTest_q;
    vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_combproc: PROCESS (vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_s, vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_q, cStage_uid78_lzcShifterZ1_uid11_fxpToFPTest_q)
    BEGIN
        CASE (vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_s) IS
            WHEN "0" => vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_q <= vStagei_uid72_lzcShifterZ1_uid11_fxpToFPTest_q;
            WHEN "1" => vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_q <= cStage_uid78_lzcShifterZ1_uid11_fxpToFPTest_q;
            WHEN OTHERS => vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracRnd_uid16_fxpToFPTest(BITSELECT,15)@2
    fracRnd_uid16_fxpToFPTest_in <= vStagei_uid79_lzcShifterZ1_uid11_fxpToFPTest_q(46 downto 0);
    fracRnd_uid16_fxpToFPTest_b <= fracRnd_uid16_fxpToFPTest_in(46 downto 23);

    -- redist4(DELAY,90)
    redist4 : dspba_delay
    GENERIC MAP ( width => 24, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => fracRnd_uid16_fxpToFPTest_b, xout => redist4_q, clk => clk, aclr => areset );

    -- expFracRnd_uid17_fxpToFPTest(BITJOIN,16)@3
    expFracRnd_uid17_fxpToFPTest_q <= expPreRnd_uid15_fxpToFPTest_q & redist4_q;

    -- redist3(DELAY,89)
    redist3 : dspba_delay
    GENERIC MAP ( width => 33, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => expFracRnd_uid17_fxpToFPTest_q, xout => redist3_q, clk => clk, aclr => areset );

    -- expFracR_uid20_fxpToFPTest(ADD,19)@4
    expFracR_uid20_fxpToFPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 33 => redist3_q(32)) & redist3_q));
    expFracR_uid20_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000000000000000000000000000000000" & VCC_q));
    expFracR_uid20_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(expFracR_uid20_fxpToFPTest_a) + SIGNED(expFracR_uid20_fxpToFPTest_b));
    expFracR_uid20_fxpToFPTest_q <= expFracR_uid20_fxpToFPTest_o(33 downto 0);

    -- expR_uid22_fxpToFPTest(BITSELECT,21)@4
    expR_uid22_fxpToFPTest_in <= STD_LOGIC_VECTOR(expFracR_uid20_fxpToFPTest_q);
    expR_uid22_fxpToFPTest_b <= STD_LOGIC_VECTOR(expR_uid22_fxpToFPTest_in(33 downto 24));

    -- expR_uid34_fxpToFPTest(BITSELECT,33)@4
    expR_uid34_fxpToFPTest_in <= expR_uid22_fxpToFPTest_b(7 downto 0);
    expR_uid34_fxpToFPTest_b <= expR_uid34_fxpToFPTest_in(7 downto 0);

    -- ovf_uid25_fxpToFPTest(COMPARE,24)@4
    ovf_uid25_fxpToFPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => expR_uid22_fxpToFPTest_b(9)) & expR_uid22_fxpToFPTest_b));
    ovf_uid25_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "000" & expInf_uid24_fxpToFPTest_q));
    ovf_uid25_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(ovf_uid25_fxpToFPTest_a) - SIGNED(ovf_uid25_fxpToFPTest_b));
    ovf_uid25_fxpToFPTest_n(0) <= not (ovf_uid25_fxpToFPTest_o(11));

    -- inIsZero_uid13_fxpToFPTest(LOGICAL,12)@3 + 1
    inIsZero_uid13_fxpToFPTest_a <= vCountFinal_uid84_lzcShifterZ1_uid11_fxpToFPTest_q;
    inIsZero_uid13_fxpToFPTest_b <= maxCount_uid12_fxpToFPTest_q;
    inIsZero_uid13_fxpToFPTest_qi <= "1" WHEN inIsZero_uid13_fxpToFPTest_a = inIsZero_uid13_fxpToFPTest_b ELSE "0";
    inIsZero_uid13_fxpToFPTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => inIsZero_uid13_fxpToFPTest_qi, xout => inIsZero_uid13_fxpToFPTest_q, clk => clk, aclr => areset );

    -- udf_uid23_fxpToFPTest(COMPARE,22)@4
    udf_uid23_fxpToFPTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("0" & "0000000000" & GND_q));
    udf_uid23_fxpToFPTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => expR_uid22_fxpToFPTest_b(9)) & expR_uid22_fxpToFPTest_b));
    udf_uid23_fxpToFPTest_o <= STD_LOGIC_VECTOR(SIGNED(udf_uid23_fxpToFPTest_a) - SIGNED(udf_uid23_fxpToFPTest_b));
    udf_uid23_fxpToFPTest_n(0) <= not (udf_uid23_fxpToFPTest_o(11));

    -- udfOrInZero_uid29_fxpToFPTest(LOGICAL,28)@4
    udfOrInZero_uid29_fxpToFPTest_a <= udf_uid23_fxpToFPTest_n;
    udfOrInZero_uid29_fxpToFPTest_b <= inIsZero_uid13_fxpToFPTest_q;
    udfOrInZero_uid29_fxpToFPTest_q <= udfOrInZero_uid29_fxpToFPTest_a or udfOrInZero_uid29_fxpToFPTest_b;

    -- excSelector_uid30_fxpToFPTest(BITJOIN,29)@4
    excSelector_uid30_fxpToFPTest_q <= ovf_uid25_fxpToFPTest_n & udfOrInZero_uid29_fxpToFPTest_q;

    -- expRPostExc_uid35_fxpToFPTest(MUX,34)@4
    expRPostExc_uid35_fxpToFPTest_s <= excSelector_uid30_fxpToFPTest_q;
    expRPostExc_uid35_fxpToFPTest_combproc: PROCESS (expRPostExc_uid35_fxpToFPTest_s, expR_uid34_fxpToFPTest_b, expZ_uid33_fxpToFPTest_q, expInf_uid24_fxpToFPTest_q)
    BEGIN
        CASE (expRPostExc_uid35_fxpToFPTest_s) IS
            WHEN "00" => expRPostExc_uid35_fxpToFPTest_q <= expR_uid34_fxpToFPTest_b;
            WHEN "01" => expRPostExc_uid35_fxpToFPTest_q <= expZ_uid33_fxpToFPTest_q;
            WHEN "10" => expRPostExc_uid35_fxpToFPTest_q <= expInf_uid24_fxpToFPTest_q;
            WHEN "11" => expRPostExc_uid35_fxpToFPTest_q <= expInf_uid24_fxpToFPTest_q;
            WHEN OTHERS => expRPostExc_uid35_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- fracZ_uid27_fxpToFPTest(CONSTANT,26)
    fracZ_uid27_fxpToFPTest_q <= "00000000000000000000000";

    -- fracR_uid21_fxpToFPTest(BITSELECT,20)@4
    fracR_uid21_fxpToFPTest_in <= expFracR_uid20_fxpToFPTest_q(23 downto 0);
    fracR_uid21_fxpToFPTest_b <= fracR_uid21_fxpToFPTest_in(23 downto 1);

    -- excSelector_uid26_fxpToFPTest(LOGICAL,25)@4
    excSelector_uid26_fxpToFPTest_a <= inIsZero_uid13_fxpToFPTest_q;
    excSelector_uid26_fxpToFPTest_b <= ovf_uid25_fxpToFPTest_n;
    excSelector_uid26_fxpToFPTest_c <= udf_uid23_fxpToFPTest_n;
    excSelector_uid26_fxpToFPTest_q <= excSelector_uid26_fxpToFPTest_a or excSelector_uid26_fxpToFPTest_b or excSelector_uid26_fxpToFPTest_c;

    -- fracRPostExc_uid28_fxpToFPTest(MUX,27)@4
    fracRPostExc_uid28_fxpToFPTest_s <= excSelector_uid26_fxpToFPTest_q;
    fracRPostExc_uid28_fxpToFPTest_combproc: PROCESS (fracRPostExc_uid28_fxpToFPTest_s, fracR_uid21_fxpToFPTest_b, fracZ_uid27_fxpToFPTest_q)
    BEGIN
        CASE (fracRPostExc_uid28_fxpToFPTest_s) IS
            WHEN "0" => fracRPostExc_uid28_fxpToFPTest_q <= fracR_uid21_fxpToFPTest_b;
            WHEN "1" => fracRPostExc_uid28_fxpToFPTest_q <= fracZ_uid27_fxpToFPTest_q;
            WHEN OTHERS => fracRPostExc_uid28_fxpToFPTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- outRes_uid36_fxpToFPTest(BITJOIN,35)@4
    outRes_uid36_fxpToFPTest_q <= redist6_q & expRPostExc_uid35_fxpToFPTest_q & fracRPostExc_uid28_fxpToFPTest_q;

    -- xOut(GPOUT,4)@4
    q <= outRes_uid36_fxpToFPTest_q;

END normal;
