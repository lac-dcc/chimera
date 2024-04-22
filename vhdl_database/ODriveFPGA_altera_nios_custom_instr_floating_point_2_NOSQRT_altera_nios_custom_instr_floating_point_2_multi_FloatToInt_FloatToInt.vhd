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

-- VHDL created from FloatToInt
-- VHDL created on Tue Dec 18 18:10:51 2012


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
entity FloatToInt is
    port (
        x : in std_logic_vector(31 downto 0);
        r : out std_logic_vector(31 downto 0);
        opSel : in std_logic_vector(0 downto 0) -- 0=truncate, 1=round-to-nearest
        );
end;

architecture normal of FloatToInt is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name NOT_GATE_PUSH_BACK OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410";

    signal GND_q : std_logic_vector (0 downto 0);
    signal VCC_q : std_logic_vector (0 downto 0);
    signal ovfExpVal_uid12_fpToFxPTest_q : std_logic_vector (7 downto 0);
    signal udfExpVal_uid14_fpToFxPTest_q : std_logic_vector (7 downto 0);
    signal ovfExpVal_uid16_fpToFxPTest_q : std_logic_vector (7 downto 0);
    signal zPadd_uid20_fpToFxPTest_q : std_logic_vector (7 downto 0);
    signal d3_uid26_fpToFxPTest_q : std_logic_vector (2 downto 0);
    signal d1_uid28_fpToFxPTest_q : std_logic_vector (2 downto 0);
    signal d0_uid29_fpToFxPTest_q : std_logic_vector (2 downto 0);
    signal maxPosValueS_uid36_fpToFxPTest_q : std_logic_vector (31 downto 0);
    signal maxNegValueS_uid37_fpToFxPTest_q : std_logic_vector (31 downto 0);
    signal maxNegValueU_uid41_fpToFxPTest_q : std_logic_vector (31 downto 0);
    signal fracX_uid8_fpToFxPTest_in : std_logic_vector (22 downto 0);
    signal fracX_uid8_fpToFxPTest_b : std_logic_vector (22 downto 0);
    signal expX_uid10_fpToFxPTest_in : std_logic_vector (30 downto 0);
    signal expX_uid10_fpToFxPTest_b : std_logic_vector (7 downto 0);
    signal signX_uid11_fpToFxPTest_in : std_logic_vector (31 downto 0);
    signal signX_uid11_fpToFxPTest_b : std_logic_vector (0 downto 0);
    signal join_uid25_fpToFxPTest_q : std_logic_vector (1 downto 0);
    signal ovf_uid13_fpToFxPTest_a : std_logic_vector(10 downto 0);
    signal ovf_uid13_fpToFxPTest_b : std_logic_vector(10 downto 0);
    signal ovf_uid13_fpToFxPTest_o : std_logic_vector (10 downto 0);
    signal ovf_uid13_fpToFxPTest_cin : std_logic_vector (0 downto 0);
    signal ovf_uid13_fpToFxPTest_n : std_logic_vector (0 downto 0);
    signal udf_uid15_fpToFxPTest_a : std_logic_vector(10 downto 0);
    signal udf_uid15_fpToFxPTest_b : std_logic_vector(10 downto 0);
    signal udf_uid15_fpToFxPTest_o : std_logic_vector (10 downto 0);
    signal udf_uid15_fpToFxPTest_cin : std_logic_vector (0 downto 0);
    signal udf_uid15_fpToFxPTest_n : std_logic_vector (0 downto 0);
    signal shiftValE_uid17_fpToFxPTest_a : std_logic_vector(8 downto 0);
    signal shiftValE_uid17_fpToFxPTest_b : std_logic_vector(8 downto 0);
    signal shiftValE_uid17_fpToFxPTest_o : std_logic_vector (8 downto 0);
    signal shiftValE_uid17_fpToFxPTest_q : std_logic_vector (8 downto 0);
    signal rndOp_uid30_fpToFxPTest_s : std_logic_vector (1 downto 0);
    signal rndOp_uid30_fpToFxPTest_q : std_logic_vector (2 downto 0);
    signal oFracX_uid9_uid9_fpToFxPTest_q : std_logic_vector (23 downto 0);
    signal shiftVal_uid18_fpToFxPTest_in : std_logic_vector (5 downto 0);
    signal shiftVal_uid18_fpToFxPTest_b : std_logic_vector (5 downto 0);
    signal zOFracX_uid19_fpToFxPTest_q : std_logic_vector (24 downto 0);
    signal shifterIn_uid21_fpToFxPTest_q : std_logic_vector (32 downto 0);
    signal rightShiferNoStickyOut_uid22_fpToFxPTest_s0 : std_logic_vector (5 downto 0);
    signal rightShiferNoStickyOut_uid22_fpToFxPTest_q0 : std_logic_vector (32 downto 0);
    signal rightShiferNoStickyOut_uid22_fpToFxPTest_s1 : std_logic_vector (5 downto 0);
    signal rightShiferNoStickyOut_uid22_fpToFxPTest_q1 : std_logic_vector (32 downto 0);
    signal rightShiferNoStickyOut_uid22_fpToFxPTest_s2 : std_logic_vector (5 downto 0);
    signal rightShiferNoStickyOut_uid22_fpToFxPTest_q2 : std_logic_vector (32 downto 0);
    signal rightShiferNoStickyOut_uid22_fpToFxPTest_q3 : std_logic_vector (32 downto 0);
    signal rightShiferNoStickyOut_uid22_fpToFxPTest_q : std_logic_vector (32 downto 0);
    signal zRightShiferNoStickyOut_uid23_fpToFxPTest_q : std_logic_vector (33 downto 0);
    signal xXorSign_uid24_fpToFxPTest_a : std_logic_vector(33 downto 0);
    signal xXorSign_uid24_fpToFxPTest_b : std_logic_vector(33 downto 0);
    signal xXorSign_uid24_fpToFxPTest_q : std_logic_vector(33 downto 0);
    signal sPostRndFull_uid31_fpToFxPTest_a : std_logic_vector(34 downto 0);
    signal sPostRndFull_uid31_fpToFxPTest_b : std_logic_vector(34 downto 0);
    signal sPostRndFull_uid31_fpToFxPTest_o : std_logic_vector (34 downto 0);
    signal sPostRndFull_uid31_fpToFxPTest_q : std_logic_vector (34 downto 0);
    signal sPostRnd_uid32_fpToFxPTest_in : std_logic_vector (32 downto 0);
    signal sPostRnd_uid32_fpToFxPTest_b : std_logic_vector (31 downto 0);
    signal sPostRndFullMSBU_uid33_fpToFxPTest_in : std_logic_vector (33 downto 0);
    signal sPostRndFullMSBU_uid33_fpToFxPTest_b : std_logic_vector (0 downto 0);
    signal sPostRndFullMSBU_uid34_fpToFxPTest_in : std_logic_vector (34 downto 0);
    signal sPostRndFullMSBU_uid34_fpToFxPTest_b : std_logic_vector (0 downto 0);
    signal rndOvf_uid35_fpToFxPTest_a : std_logic_vector(0 downto 0);
    signal rndOvf_uid35_fpToFxPTest_b : std_logic_vector(0 downto 0);
    signal rndOvf_uid35_fpToFxPTest_q : std_logic_vector(0 downto 0);
    signal ovfPostRnd_uid38_fpToFxPTest_a : std_logic_vector(0 downto 0);
    signal ovfPostRnd_uid38_fpToFxPTest_b : std_logic_vector(0 downto 0);
    signal ovfPostRnd_uid38_fpToFxPTest_q : std_logic_vector(0 downto 0);
    signal muxSelConc_uid39_fpToFxPTest_q : std_logic_vector (2 downto 0);
    signal muxSel_uid40_fpToFxPTest_q : std_logic_vector(1 downto 0);
    signal finalOut_uid42_fpToFxPTest_s : std_logic_vector (1 downto 0);
    signal finalOut_uid42_fpToFxPTest_q : std_logic_vector (31 downto 0);
begin


	--maxNegValueU_uid41_fpToFxPTest(CONSTANT,40)
    maxNegValueU_uid41_fpToFxPTest_q <= "00000000000000000000000000000000";

	--maxNegValueS_uid37_fpToFxPTest(CONSTANT,36)
    maxNegValueS_uid37_fpToFxPTest_q <= "10000000000000000000000000000000";

	--maxPosValueS_uid36_fpToFxPTest(CONSTANT,35)
    maxPosValueS_uid36_fpToFxPTest_q <= "01111111111111111111111111111111";

	--d3_uid26_fpToFxPTest(CONSTANT,25)
    d3_uid26_fpToFxPTest_q <= "001";

	--d1_uid28_fpToFxPTest(CONSTANT,27)
    d1_uid28_fpToFxPTest_q <= "010";

	--d0_uid29_fpToFxPTest(CONSTANT,28)
    d0_uid29_fpToFxPTest_q <= "000";

	--signX_uid11_fpToFxPTest(BITSELECT,10)@0
    signX_uid11_fpToFxPTest_in <= x;
    signX_uid11_fpToFxPTest_b <= signX_uid11_fpToFxPTest_in(31 downto 31);

	--join_uid25_fpToFxPTest(BITJOIN,24)@0
    join_uid25_fpToFxPTest_q <= opSel & signX_uid11_fpToFxPTest_b;

	--rndOp_uid30_fpToFxPTest(MUX,29)@0
    rndOp_uid30_fpToFxPTest_s <= join_uid25_fpToFxPTest_q;
    rndOp_uid30_fpToFxPTest: PROCESS (rndOp_uid30_fpToFxPTest_s)
    BEGIN
            CASE rndOp_uid30_fpToFxPTest_s IS
                  WHEN "00" => rndOp_uid30_fpToFxPTest_q <= d0_uid29_fpToFxPTest_q;
                  WHEN "01" => rndOp_uid30_fpToFxPTest_q <= d1_uid28_fpToFxPTest_q;
                  WHEN "10" => rndOp_uid30_fpToFxPTest_q <= d3_uid26_fpToFxPTest_q;
                  WHEN "11" => rndOp_uid30_fpToFxPTest_q <= d3_uid26_fpToFxPTest_q;
                  WHEN OTHERS => rndOp_uid30_fpToFxPTest_q <= (others => '0');
            END CASE;
    END PROCESS;


	--GND(CONSTANT,0)
    GND_q <= "0";

	--expX_uid10_fpToFxPTest(BITSELECT,9)@0
    expX_uid10_fpToFxPTest_in <= x(30 downto 0);
    expX_uid10_fpToFxPTest_b <= expX_uid10_fpToFxPTest_in(30 downto 23);

	--ovfExpVal_uid16_fpToFxPTest(CONSTANT,15)
    ovfExpVal_uid16_fpToFxPTest_q <= "10011101";

	--shiftValE_uid17_fpToFxPTest(SUB,16)@0
    shiftValE_uid17_fpToFxPTest_a <= STD_LOGIC_VECTOR("0" & ovfExpVal_uid16_fpToFxPTest_q);
    shiftValE_uid17_fpToFxPTest_b <= STD_LOGIC_VECTOR("0" & expX_uid10_fpToFxPTest_b);
            shiftValE_uid17_fpToFxPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(shiftValE_uid17_fpToFxPTest_a) - UNSIGNED(shiftValE_uid17_fpToFxPTest_b));
    shiftValE_uid17_fpToFxPTest_q <= shiftValE_uid17_fpToFxPTest_o(8 downto 0);


	--shiftVal_uid18_fpToFxPTest(BITSELECT,17)@0
    shiftVal_uid18_fpToFxPTest_in <= shiftValE_uid17_fpToFxPTest_q(5 downto 0);
    shiftVal_uid18_fpToFxPTest_b <= shiftVal_uid18_fpToFxPTest_in(5 downto 0);

	--fracX_uid8_fpToFxPTest(BITSELECT,7)@0
    fracX_uid8_fpToFxPTest_in <= x(22 downto 0);
    fracX_uid8_fpToFxPTest_b <= fracX_uid8_fpToFxPTest_in(22 downto 0);

	--oFracX_uid9_uid9_fpToFxPTest(BITJOIN,8)@0
    oFracX_uid9_uid9_fpToFxPTest_q <= VCC_q & fracX_uid8_fpToFxPTest_b;

	--zOFracX_uid19_fpToFxPTest(BITJOIN,18)@0
    zOFracX_uid19_fpToFxPTest_q <= GND_q & oFracX_uid9_uid9_fpToFxPTest_q;

	--zPadd_uid20_fpToFxPTest(CONSTANT,19)
    zPadd_uid20_fpToFxPTest_q <= "00000000";

	--shifterIn_uid21_fpToFxPTest(BITJOIN,20)@0
    shifterIn_uid21_fpToFxPTest_q <= zOFracX_uid19_fpToFxPTest_q & zPadd_uid20_fpToFxPTest_q;

	--rightShiferNoStickyOut_uid22_fpToFxPTest(BSHIFT,21)@0
    rightShiferNoStickyOut_uid22_fpToFxPTest_q0 <= shifterIn_uid21_fpToFxPTest_q;
    rightShiferNoStickyOut_uid22_fpToFxPTest_s0 <= shiftVal_uid18_fpToFxPTest_b;
    rightShiferNoStickyOut_uid22_fpToFxPTest_s1 <= rightShiferNoStickyOut_uid22_fpToFxPTest_s0;
    rightShiferNoStickyOut_uid22_fpToFxPTest_s2 <= rightShiferNoStickyOut_uid22_fpToFxPTest_s1;
    with rightShiferNoStickyOut_uid22_fpToFxPTest_s0(1 downto 0) select rightShiferNoStickyOut_uid22_fpToFxPTest_q1 <= 
        rightShiferNoStickyOut_uid22_fpToFxPTest_q0 WHEN "00", 
        (0 to 0 => rightShiferNoStickyOut_uid22_fpToFxPTest_q0(32)) & rightShiferNoStickyOut_uid22_fpToFxPTest_q0(32 downto 1) WHEN "01",
        (0 to 1 => rightShiferNoStickyOut_uid22_fpToFxPTest_q0(32)) & rightShiferNoStickyOut_uid22_fpToFxPTest_q0(32 downto 2) WHEN "10",
        (0 to 2 => rightShiferNoStickyOut_uid22_fpToFxPTest_q0(32)) & rightShiferNoStickyOut_uid22_fpToFxPTest_q0(32 downto 3) WHEN "11",
        (others => '0') WHEN OTHERS;
    with rightShiferNoStickyOut_uid22_fpToFxPTest_s1(3 downto 2) select rightShiferNoStickyOut_uid22_fpToFxPTest_q2 <= 
        rightShiferNoStickyOut_uid22_fpToFxPTest_q1 WHEN "00", 
        (0 to 3 => rightShiferNoStickyOut_uid22_fpToFxPTest_q1(32)) & rightShiferNoStickyOut_uid22_fpToFxPTest_q1(32 downto 4) WHEN "01",
        (0 to 7 => rightShiferNoStickyOut_uid22_fpToFxPTest_q1(32)) & rightShiferNoStickyOut_uid22_fpToFxPTest_q1(32 downto 8) WHEN "10",
        (0 to 11 => rightShiferNoStickyOut_uid22_fpToFxPTest_q1(32)) & rightShiferNoStickyOut_uid22_fpToFxPTest_q1(32 downto 12) WHEN "11",
        (others => '0') WHEN OTHERS;
    with rightShiferNoStickyOut_uid22_fpToFxPTest_s2(5 downto 4) select rightShiferNoStickyOut_uid22_fpToFxPTest_q3 <= 
        rightShiferNoStickyOut_uid22_fpToFxPTest_q2 WHEN "00", 
        (0 to 15 => rightShiferNoStickyOut_uid22_fpToFxPTest_q2(32)) & rightShiferNoStickyOut_uid22_fpToFxPTest_q2(32 downto 16) WHEN "01",
        (0 to 31 => rightShiferNoStickyOut_uid22_fpToFxPTest_q2(32)) & rightShiferNoStickyOut_uid22_fpToFxPTest_q2(32 downto 32) WHEN "10",
        (others => '0') WHEN OTHERS;

    rightShiferNoStickyOut_uid22_fpToFxPTest_q <= rightShiferNoStickyOut_uid22_fpToFxPTest_q3(32 downto 0);

	--zRightShiferNoStickyOut_uid23_fpToFxPTest(BITJOIN,22)@0
    zRightShiferNoStickyOut_uid23_fpToFxPTest_q <= GND_q & rightShiferNoStickyOut_uid22_fpToFxPTest_q;

	--xXorSign_uid24_fpToFxPTest(LOGICAL,23)@0
    xXorSign_uid24_fpToFxPTest_a <= zRightShiferNoStickyOut_uid23_fpToFxPTest_q;
    xXorSign_uid24_fpToFxPTest_b <= STD_LOGIC_VECTOR((33 downto 1 => signX_uid11_fpToFxPTest_b(0)) & signX_uid11_fpToFxPTest_b);
    xXorSign_uid24_fpToFxPTest_q <= xXorSign_uid24_fpToFxPTest_a xor xXorSign_uid24_fpToFxPTest_b;

	--sPostRndFull_uid31_fpToFxPTest(ADD,30)@0
    sPostRndFull_uid31_fpToFxPTest_a <= STD_LOGIC_VECTOR((34 downto 34 => xXorSign_uid24_fpToFxPTest_q(33)) & xXorSign_uid24_fpToFxPTest_q);
    sPostRndFull_uid31_fpToFxPTest_b <= STD_LOGIC_VECTOR((34 downto 3 => rndOp_uid30_fpToFxPTest_q(2)) & rndOp_uid30_fpToFxPTest_q);
            sPostRndFull_uid31_fpToFxPTest_o <= STD_LOGIC_VECTOR(SIGNED(sPostRndFull_uid31_fpToFxPTest_a) + SIGNED(sPostRndFull_uid31_fpToFxPTest_b));
    sPostRndFull_uid31_fpToFxPTest_q <= sPostRndFull_uid31_fpToFxPTest_o(34 downto 0);


	--sPostRnd_uid32_fpToFxPTest(BITSELECT,31)@0
    sPostRnd_uid32_fpToFxPTest_in <= sPostRndFull_uid31_fpToFxPTest_q(32 downto 0);
    sPostRnd_uid32_fpToFxPTest_b <= sPostRnd_uid32_fpToFxPTest_in(32 downto 1);

	--udfExpVal_uid14_fpToFxPTest(CONSTANT,13)
    udfExpVal_uid14_fpToFxPTest_q <= "01111101";

	--udf_uid15_fpToFxPTest(COMPARE,14)@0
    udf_uid15_fpToFxPTest_cin <= GND_q;
    udf_uid15_fpToFxPTest_a <= STD_LOGIC_VECTOR("00" & udfExpVal_uid14_fpToFxPTest_q) & '0';
    udf_uid15_fpToFxPTest_b <= STD_LOGIC_VECTOR("00" & expX_uid10_fpToFxPTest_b) & udf_uid15_fpToFxPTest_cin(0);
            udf_uid15_fpToFxPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(udf_uid15_fpToFxPTest_a) - UNSIGNED(udf_uid15_fpToFxPTest_b));
    udf_uid15_fpToFxPTest_n(0) <= not udf_uid15_fpToFxPTest_o(10);


	--sPostRndFullMSBU_uid33_fpToFxPTest(BITSELECT,32)@0
    sPostRndFullMSBU_uid33_fpToFxPTest_in <= sPostRndFull_uid31_fpToFxPTest_q(33 downto 0);
    sPostRndFullMSBU_uid33_fpToFxPTest_b <= sPostRndFullMSBU_uid33_fpToFxPTest_in(33 downto 33);

	--sPostRndFullMSBU_uid34_fpToFxPTest(BITSELECT,33)@0
    sPostRndFullMSBU_uid34_fpToFxPTest_in <= sPostRndFull_uid31_fpToFxPTest_q;
    sPostRndFullMSBU_uid34_fpToFxPTest_b <= sPostRndFullMSBU_uid34_fpToFxPTest_in(34 downto 34);

	--rndOvf_uid35_fpToFxPTest(LOGICAL,34)@0
    rndOvf_uid35_fpToFxPTest_a <= sPostRndFullMSBU_uid34_fpToFxPTest_b;
    rndOvf_uid35_fpToFxPTest_b <= sPostRndFullMSBU_uid33_fpToFxPTest_b;
    rndOvf_uid35_fpToFxPTest_q <= rndOvf_uid35_fpToFxPTest_a xor rndOvf_uid35_fpToFxPTest_b;

	--ovfExpVal_uid12_fpToFxPTest(CONSTANT,11)
    ovfExpVal_uid12_fpToFxPTest_q <= "10011110";

	--ovf_uid13_fpToFxPTest(COMPARE,12)@0
    ovf_uid13_fpToFxPTest_cin <= GND_q;
    ovf_uid13_fpToFxPTest_a <= STD_LOGIC_VECTOR("00" & expX_uid10_fpToFxPTest_b) & '0';
    ovf_uid13_fpToFxPTest_b <= STD_LOGIC_VECTOR("00" & ovfExpVal_uid12_fpToFxPTest_q) & ovf_uid13_fpToFxPTest_cin(0);
            ovf_uid13_fpToFxPTest_o <= STD_LOGIC_VECTOR(UNSIGNED(ovf_uid13_fpToFxPTest_a) - UNSIGNED(ovf_uid13_fpToFxPTest_b));
    ovf_uid13_fpToFxPTest_n(0) <= not ovf_uid13_fpToFxPTest_o(10);


	--ovfPostRnd_uid38_fpToFxPTest(LOGICAL,37)@0
    ovfPostRnd_uid38_fpToFxPTest_a <= ovf_uid13_fpToFxPTest_n;
    ovfPostRnd_uid38_fpToFxPTest_b <= rndOvf_uid35_fpToFxPTest_q;
    ovfPostRnd_uid38_fpToFxPTest_q <= ovfPostRnd_uid38_fpToFxPTest_a or ovfPostRnd_uid38_fpToFxPTest_b;

	--muxSelConc_uid39_fpToFxPTest(BITJOIN,38)@0
    muxSelConc_uid39_fpToFxPTest_q <= signX_uid11_fpToFxPTest_b & udf_uid15_fpToFxPTest_n & ovfPostRnd_uid38_fpToFxPTest_q;

	--muxSel_uid40_fpToFxPTest(LOOKUP,39)@0
    muxSel_uid40_fpToFxPTest: PROCESS (muxSelConc_uid39_fpToFxPTest_q)
    BEGIN
        -- Begin reserved scope level
            CASE (muxSelConc_uid39_fpToFxPTest_q) IS
                WHEN "000" =>  muxSel_uid40_fpToFxPTest_q <= "00";
                WHEN "001" =>  muxSel_uid40_fpToFxPTest_q <= "01";
                WHEN "010" =>  muxSel_uid40_fpToFxPTest_q <= "11";
                WHEN "011" =>  muxSel_uid40_fpToFxPTest_q <= "00";
                WHEN "100" =>  muxSel_uid40_fpToFxPTest_q <= "00";
                WHEN "101" =>  muxSel_uid40_fpToFxPTest_q <= "10";
                WHEN "110" =>  muxSel_uid40_fpToFxPTest_q <= "11";
                WHEN "111" =>  muxSel_uid40_fpToFxPTest_q <= "00";
                WHEN OTHERS =>
                    muxSel_uid40_fpToFxPTest_q <= (others => '-');
            END CASE;
        -- End reserved scope level
    END PROCESS;


	--VCC(CONSTANT,1)
    VCC_q <= "1";

	--finalOut_uid42_fpToFxPTest(MUX,41)@0
    finalOut_uid42_fpToFxPTest_s <= muxSel_uid40_fpToFxPTest_q;
    finalOut_uid42_fpToFxPTest: PROCESS (finalOut_uid42_fpToFxPTest_s, sPostRnd_uid32_fpToFxPTest_b)
    BEGIN
            CASE finalOut_uid42_fpToFxPTest_s IS
                  WHEN "00" => finalOut_uid42_fpToFxPTest_q <= sPostRnd_uid32_fpToFxPTest_b;
                  WHEN "01" => finalOut_uid42_fpToFxPTest_q <= maxPosValueS_uid36_fpToFxPTest_q;
                  WHEN "10" => finalOut_uid42_fpToFxPTest_q <= maxNegValueS_uid37_fpToFxPTest_q;
                  WHEN "11" => finalOut_uid42_fpToFxPTest_q <= maxNegValueU_uid41_fpToFxPTest_q;
                  WHEN OTHERS => finalOut_uid42_fpToFxPTest_q <= (others => '0');
            END CASE;
    END PROCESS;

	--xOut(PORTOUT,4)@0
    r <= finalOut_uid42_fpToFxPTest_q;
end normal;
