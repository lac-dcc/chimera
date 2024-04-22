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

-- VHDL created from fp_gt_arria10_altera_fp_functions_160_jgnu7ly
-- VHDL created on Tue Oct  9 13:21:48 2018


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

entity fp_gt_arria10_altera_fp_functions_160_jgnu7ly is
    port (
        a : in std_logic_vector(31 downto 0);  -- float32_m23
        b : in std_logic_vector(31 downto 0);  -- float32_m23
        q : out std_logic_vector(0 downto 0);  -- ufix1
        clk : in std_logic;
        areset : in std_logic
    );
end fp_gt_arria10_altera_fp_functions_160_jgnu7ly;

architecture normal of fp_gt_arria10_altera_fp_functions_160_jgnu7ly is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstAllOWE_uid6_fpCompareTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal cstZeroWF_uid7_fpCompareTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal cstAllZWE_uid8_fpCompareTest_q : STD_LOGIC_VECTOR (7 downto 0);
    signal two_uid56_fpCompareTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal exp_x_uid9_fpCompareTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_x_uid9_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_x_uid10_fpCompareTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_x_uid10_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signX_uid54_fpCompareTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signX_uid54_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal exp_y_uid26_fpCompareTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal exp_y_uid26_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal frac_y_uid27_fpCompareTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal frac_y_uid27_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal signY_uid55_fpCompareTest_in : STD_LOGIC_VECTOR (31 downto 0);
    signal signY_uid55_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid12_fpCompareTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid12_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid12_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsMax_uid29_fpCompareTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid29_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsMax_uid29_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid13_fpCompareTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid13_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid13_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsZero_uid30_fpCompareTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid30_fpCompareTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal fracXIsZero_uid30_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsZero_uid11_fpCompareTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid11_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid11_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expXIsZero_uid28_fpCompareTest_a : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid28_fpCompareTest_b : STD_LOGIC_VECTOR (7 downto 0);
    signal expXIsZero_uid28_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracX_uid43_fpCompareTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal concSYSX_uid57_fpCompareTest_q : STD_LOGIC_VECTOR (1 downto 0);
    signal xorSigns_uid59_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid59_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal xorSigns_uid59_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracY_uid47_fpCompareTest_q : STD_LOGIC_VECTOR (30 downto 0);
    signal fracXIsNotZero_uid14_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid14_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid15_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid15_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_x_uid15_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid31_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal fracXIsNotZero_uid31_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid32_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid32_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excZ_y_uid32_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal efxGTefy_uid49_fpCompareTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid49_fpCompareTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid49_fpCompareTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxGTefy_uid49_fpCompareTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal efxLTefy_uid50_fpCompareTest_a : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid50_fpCompareTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid50_fpCompareTest_o : STD_LOGIC_VECTOR (32 downto 0);
    signal efxLTefy_uid50_fpCompareTest_c : STD_LOGIC_VECTOR (0 downto 0);
    signal sxGTsy_uid58_fpCompareTest_a : STD_LOGIC_VECTOR (1 downto 0);
    signal sxGTsy_uid58_fpCompareTest_b : STD_LOGIC_VECTOR (1 downto 0);
    signal sxGTsy_uid58_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid60_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsy_uid60_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid17_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid17_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_x_uid17_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid63_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcXZ_uid63_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal excN_y_uid34_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid62_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal invExcYZ_uid62_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid61_fpCompareTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal expFracCompMux_uid61_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid66_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid66_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal sxEQsyExpFracCompMux_uid66_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid40_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid40_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal oneIsNaN_uid40_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid64_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid64_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal oneNonZero_uid64_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid65_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid65_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal rc2_uid65_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid67_fpCompareTest_a : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid67_fpCompareTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal r_uid67_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid68_fpCompareTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal rPostExc_uid68_fpCompareTest_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- xIn(GPIN,3)@0

    -- frac_y_uid27_fpCompareTest(BITSELECT,26)@0
    frac_y_uid27_fpCompareTest_in <= b;
    frac_y_uid27_fpCompareTest_b <= frac_y_uid27_fpCompareTest_in(22 downto 0);

    -- cstZeroWF_uid7_fpCompareTest(CONSTANT,6)
    cstZeroWF_uid7_fpCompareTest_q <= "00000000000000000000000";

    -- fracXIsZero_uid30_fpCompareTest(LOGICAL,29)@0
    fracXIsZero_uid30_fpCompareTest_a <= cstZeroWF_uid7_fpCompareTest_q;
    fracXIsZero_uid30_fpCompareTest_b <= frac_y_uid27_fpCompareTest_b;
    fracXIsZero_uid30_fpCompareTest_q <= "1" WHEN fracXIsZero_uid30_fpCompareTest_a = fracXIsZero_uid30_fpCompareTest_b ELSE "0";

    -- cstAllZWE_uid8_fpCompareTest(CONSTANT,7)
    cstAllZWE_uid8_fpCompareTest_q <= "00000000";

    -- exp_y_uid26_fpCompareTest(BITSELECT,25)@0
    exp_y_uid26_fpCompareTest_in <= b;
    exp_y_uid26_fpCompareTest_b <= exp_y_uid26_fpCompareTest_in(30 downto 23);

    -- expXIsZero_uid28_fpCompareTest(LOGICAL,27)@0
    expXIsZero_uid28_fpCompareTest_a <= exp_y_uid26_fpCompareTest_b;
    expXIsZero_uid28_fpCompareTest_b <= cstAllZWE_uid8_fpCompareTest_q;
    expXIsZero_uid28_fpCompareTest_q <= "1" WHEN expXIsZero_uid28_fpCompareTest_a = expXIsZero_uid28_fpCompareTest_b ELSE "0";

    -- excZ_y_uid32_fpCompareTest(LOGICAL,31)@0
    excZ_y_uid32_fpCompareTest_a <= expXIsZero_uid28_fpCompareTest_q;
    excZ_y_uid32_fpCompareTest_b <= fracXIsZero_uid30_fpCompareTest_q;
    excZ_y_uid32_fpCompareTest_q <= excZ_y_uid32_fpCompareTest_a and excZ_y_uid32_fpCompareTest_b;

    -- invExcYZ_uid62_fpCompareTest(LOGICAL,61)@0
    invExcYZ_uid62_fpCompareTest_a <= excZ_y_uid32_fpCompareTest_q;
    invExcYZ_uid62_fpCompareTest_q <= not (invExcYZ_uid62_fpCompareTest_a);

    -- frac_x_uid10_fpCompareTest(BITSELECT,9)@0
    frac_x_uid10_fpCompareTest_in <= a;
    frac_x_uid10_fpCompareTest_b <= frac_x_uid10_fpCompareTest_in(22 downto 0);

    -- fracXIsZero_uid13_fpCompareTest(LOGICAL,12)@0
    fracXIsZero_uid13_fpCompareTest_a <= cstZeroWF_uid7_fpCompareTest_q;
    fracXIsZero_uid13_fpCompareTest_b <= frac_x_uid10_fpCompareTest_b;
    fracXIsZero_uid13_fpCompareTest_q <= "1" WHEN fracXIsZero_uid13_fpCompareTest_a = fracXIsZero_uid13_fpCompareTest_b ELSE "0";

    -- exp_x_uid9_fpCompareTest(BITSELECT,8)@0
    exp_x_uid9_fpCompareTest_in <= a;
    exp_x_uid9_fpCompareTest_b <= exp_x_uid9_fpCompareTest_in(30 downto 23);

    -- expXIsZero_uid11_fpCompareTest(LOGICAL,10)@0
    expXIsZero_uid11_fpCompareTest_a <= exp_x_uid9_fpCompareTest_b;
    expXIsZero_uid11_fpCompareTest_b <= cstAllZWE_uid8_fpCompareTest_q;
    expXIsZero_uid11_fpCompareTest_q <= "1" WHEN expXIsZero_uid11_fpCompareTest_a = expXIsZero_uid11_fpCompareTest_b ELSE "0";

    -- excZ_x_uid15_fpCompareTest(LOGICAL,14)@0
    excZ_x_uid15_fpCompareTest_a <= expXIsZero_uid11_fpCompareTest_q;
    excZ_x_uid15_fpCompareTest_b <= fracXIsZero_uid13_fpCompareTest_q;
    excZ_x_uid15_fpCompareTest_q <= excZ_x_uid15_fpCompareTest_a and excZ_x_uid15_fpCompareTest_b;

    -- invExcXZ_uid63_fpCompareTest(LOGICAL,62)@0
    invExcXZ_uid63_fpCompareTest_a <= excZ_x_uid15_fpCompareTest_q;
    invExcXZ_uid63_fpCompareTest_q <= not (invExcXZ_uid63_fpCompareTest_a);

    -- oneNonZero_uid64_fpCompareTest(LOGICAL,63)@0
    oneNonZero_uid64_fpCompareTest_a <= invExcXZ_uid63_fpCompareTest_q;
    oneNonZero_uid64_fpCompareTest_b <= invExcYZ_uid62_fpCompareTest_q;
    oneNonZero_uid64_fpCompareTest_q <= oneNonZero_uid64_fpCompareTest_a or oneNonZero_uid64_fpCompareTest_b;

    -- two_uid56_fpCompareTest(CONSTANT,55)
    two_uid56_fpCompareTest_q <= "10";

    -- signY_uid55_fpCompareTest(BITSELECT,54)@0
    signY_uid55_fpCompareTest_in <= STD_LOGIC_VECTOR(b);
    signY_uid55_fpCompareTest_b <= STD_LOGIC_VECTOR(signY_uid55_fpCompareTest_in(31 downto 31));

    -- signX_uid54_fpCompareTest(BITSELECT,53)@0
    signX_uid54_fpCompareTest_in <= STD_LOGIC_VECTOR(a);
    signX_uid54_fpCompareTest_b <= STD_LOGIC_VECTOR(signX_uid54_fpCompareTest_in(31 downto 31));

    -- concSYSX_uid57_fpCompareTest(BITJOIN,56)@0
    concSYSX_uid57_fpCompareTest_q <= signY_uid55_fpCompareTest_b & signX_uid54_fpCompareTest_b;

    -- sxGTsy_uid58_fpCompareTest(LOGICAL,57)@0
    sxGTsy_uid58_fpCompareTest_a <= concSYSX_uid57_fpCompareTest_q;
    sxGTsy_uid58_fpCompareTest_b <= two_uid56_fpCompareTest_q;
    sxGTsy_uid58_fpCompareTest_q <= "1" WHEN sxGTsy_uid58_fpCompareTest_a = sxGTsy_uid58_fpCompareTest_b ELSE "0";

    -- rc2_uid65_fpCompareTest(LOGICAL,64)@0
    rc2_uid65_fpCompareTest_a <= sxGTsy_uid58_fpCompareTest_q;
    rc2_uid65_fpCompareTest_b <= oneNonZero_uid64_fpCompareTest_q;
    rc2_uid65_fpCompareTest_q <= rc2_uid65_fpCompareTest_a and rc2_uid65_fpCompareTest_b;

    -- expFracY_uid47_fpCompareTest(BITJOIN,46)@0
    expFracY_uid47_fpCompareTest_q <= exp_y_uid26_fpCompareTest_b & frac_y_uid27_fpCompareTest_b;

    -- expFracX_uid43_fpCompareTest(BITJOIN,42)@0
    expFracX_uid43_fpCompareTest_q <= exp_x_uid9_fpCompareTest_b & frac_x_uid10_fpCompareTest_b;

    -- efxLTefy_uid50_fpCompareTest(COMPARE,49)@0
    efxLTefy_uid50_fpCompareTest_a <= STD_LOGIC_VECTOR("00" & expFracX_uid43_fpCompareTest_q);
    efxLTefy_uid50_fpCompareTest_b <= STD_LOGIC_VECTOR("00" & expFracY_uid47_fpCompareTest_q);
    efxLTefy_uid50_fpCompareTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxLTefy_uid50_fpCompareTest_a) - UNSIGNED(efxLTefy_uid50_fpCompareTest_b));
    efxLTefy_uid50_fpCompareTest_c(0) <= efxLTefy_uid50_fpCompareTest_o(32);

    -- efxGTefy_uid49_fpCompareTest(COMPARE,48)@0
    efxGTefy_uid49_fpCompareTest_a <= STD_LOGIC_VECTOR("00" & expFracY_uid47_fpCompareTest_q);
    efxGTefy_uid49_fpCompareTest_b <= STD_LOGIC_VECTOR("00" & expFracX_uid43_fpCompareTest_q);
    efxGTefy_uid49_fpCompareTest_o <= STD_LOGIC_VECTOR(UNSIGNED(efxGTefy_uid49_fpCompareTest_a) - UNSIGNED(efxGTefy_uid49_fpCompareTest_b));
    efxGTefy_uid49_fpCompareTest_c(0) <= efxGTefy_uid49_fpCompareTest_o(32);

    -- expFracCompMux_uid61_fpCompareTest(MUX,60)@0
    expFracCompMux_uid61_fpCompareTest_s <= signX_uid54_fpCompareTest_b;
    expFracCompMux_uid61_fpCompareTest_combproc: PROCESS (expFracCompMux_uid61_fpCompareTest_s, efxGTefy_uid49_fpCompareTest_c, efxLTefy_uid50_fpCompareTest_c)
    BEGIN
        CASE (expFracCompMux_uid61_fpCompareTest_s) IS
            WHEN "0" => expFracCompMux_uid61_fpCompareTest_q <= efxGTefy_uid49_fpCompareTest_c;
            WHEN "1" => expFracCompMux_uid61_fpCompareTest_q <= efxLTefy_uid50_fpCompareTest_c;
            WHEN OTHERS => expFracCompMux_uid61_fpCompareTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xorSigns_uid59_fpCompareTest(LOGICAL,58)@0
    xorSigns_uid59_fpCompareTest_a <= signX_uid54_fpCompareTest_b;
    xorSigns_uid59_fpCompareTest_b <= signY_uid55_fpCompareTest_b;
    xorSigns_uid59_fpCompareTest_q <= xorSigns_uid59_fpCompareTest_a xor xorSigns_uid59_fpCompareTest_b;

    -- sxEQsy_uid60_fpCompareTest(LOGICAL,59)@0
    sxEQsy_uid60_fpCompareTest_a <= xorSigns_uid59_fpCompareTest_q;
    sxEQsy_uid60_fpCompareTest_q <= not (sxEQsy_uid60_fpCompareTest_a);

    -- sxEQsyExpFracCompMux_uid66_fpCompareTest(LOGICAL,65)@0
    sxEQsyExpFracCompMux_uid66_fpCompareTest_a <= sxEQsy_uid60_fpCompareTest_q;
    sxEQsyExpFracCompMux_uid66_fpCompareTest_b <= expFracCompMux_uid61_fpCompareTest_q;
    sxEQsyExpFracCompMux_uid66_fpCompareTest_q <= sxEQsyExpFracCompMux_uid66_fpCompareTest_a and sxEQsyExpFracCompMux_uid66_fpCompareTest_b;

    -- r_uid67_fpCompareTest(LOGICAL,66)@0
    r_uid67_fpCompareTest_a <= sxEQsyExpFracCompMux_uid66_fpCompareTest_q;
    r_uid67_fpCompareTest_b <= rc2_uid65_fpCompareTest_q;
    r_uid67_fpCompareTest_q <= r_uid67_fpCompareTest_a or r_uid67_fpCompareTest_b;

    -- fracXIsNotZero_uid31_fpCompareTest(LOGICAL,30)@0
    fracXIsNotZero_uid31_fpCompareTest_a <= fracXIsZero_uid30_fpCompareTest_q;
    fracXIsNotZero_uid31_fpCompareTest_q <= not (fracXIsNotZero_uid31_fpCompareTest_a);

    -- cstAllOWE_uid6_fpCompareTest(CONSTANT,5)
    cstAllOWE_uid6_fpCompareTest_q <= "11111111";

    -- expXIsMax_uid29_fpCompareTest(LOGICAL,28)@0
    expXIsMax_uid29_fpCompareTest_a <= exp_y_uid26_fpCompareTest_b;
    expXIsMax_uid29_fpCompareTest_b <= cstAllOWE_uid6_fpCompareTest_q;
    expXIsMax_uid29_fpCompareTest_q <= "1" WHEN expXIsMax_uid29_fpCompareTest_a = expXIsMax_uid29_fpCompareTest_b ELSE "0";

    -- excN_y_uid34_fpCompareTest(LOGICAL,33)@0
    excN_y_uid34_fpCompareTest_a <= expXIsMax_uid29_fpCompareTest_q;
    excN_y_uid34_fpCompareTest_b <= fracXIsNotZero_uid31_fpCompareTest_q;
    excN_y_uid34_fpCompareTest_q <= excN_y_uid34_fpCompareTest_a and excN_y_uid34_fpCompareTest_b;

    -- fracXIsNotZero_uid14_fpCompareTest(LOGICAL,13)@0
    fracXIsNotZero_uid14_fpCompareTest_a <= fracXIsZero_uid13_fpCompareTest_q;
    fracXIsNotZero_uid14_fpCompareTest_q <= not (fracXIsNotZero_uid14_fpCompareTest_a);

    -- expXIsMax_uid12_fpCompareTest(LOGICAL,11)@0
    expXIsMax_uid12_fpCompareTest_a <= exp_x_uid9_fpCompareTest_b;
    expXIsMax_uid12_fpCompareTest_b <= cstAllOWE_uid6_fpCompareTest_q;
    expXIsMax_uid12_fpCompareTest_q <= "1" WHEN expXIsMax_uid12_fpCompareTest_a = expXIsMax_uid12_fpCompareTest_b ELSE "0";

    -- excN_x_uid17_fpCompareTest(LOGICAL,16)@0
    excN_x_uid17_fpCompareTest_a <= expXIsMax_uid12_fpCompareTest_q;
    excN_x_uid17_fpCompareTest_b <= fracXIsNotZero_uid14_fpCompareTest_q;
    excN_x_uid17_fpCompareTest_q <= excN_x_uid17_fpCompareTest_a and excN_x_uid17_fpCompareTest_b;

    -- oneIsNaN_uid40_fpCompareTest(LOGICAL,39)@0
    oneIsNaN_uid40_fpCompareTest_a <= excN_x_uid17_fpCompareTest_q;
    oneIsNaN_uid40_fpCompareTest_b <= excN_y_uid34_fpCompareTest_q;
    oneIsNaN_uid40_fpCompareTest_q <= oneIsNaN_uid40_fpCompareTest_a or oneIsNaN_uid40_fpCompareTest_b;

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- rPostExc_uid68_fpCompareTest(MUX,67)@0
    rPostExc_uid68_fpCompareTest_s <= oneIsNaN_uid40_fpCompareTest_q;
    rPostExc_uid68_fpCompareTest_combproc: PROCESS (rPostExc_uid68_fpCompareTest_s, r_uid67_fpCompareTest_q, GND_q)
    BEGIN
        CASE (rPostExc_uid68_fpCompareTest_s) IS
            WHEN "0" => rPostExc_uid68_fpCompareTest_q <= r_uid67_fpCompareTest_q;
            WHEN "1" => rPostExc_uid68_fpCompareTest_q <= GND_q;
            WHEN OTHERS => rPostExc_uid68_fpCompareTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- xOut(GPOUT,4)@0
    q <= rPostExc_uid68_fpCompareTest_q;

END normal;
