-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_XOR32.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  32-input XOR Gate
-- /___/   /\     Filename : X_XOR32.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:21 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_XOR32 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_XOR32 is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_I0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I2 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I3 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I4 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I5 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I6 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I7 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I8 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I9 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I10 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I11 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I12 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I13 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I14 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I15 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I16 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I17 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I18 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I19 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I20 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I21 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I22 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I23 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I24 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I25 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I26 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I27 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I28 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I29 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I30 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I31 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_I0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I1_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I2_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I3_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I4_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I5_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I6_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I7_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I8_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I9_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I10_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I11_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I12_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I13_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I14_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I15_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I16_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I17_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I18_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I19_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I20_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I21_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I22_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I23_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I24_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I25_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I26_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I27_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I28_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I29_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I30_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I31_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );

  port(
    O   : out std_ulogic;
    I0  : in  std_ulogic;
    I1  : in  std_ulogic;
    I2  : in  std_ulogic;
    I3  : in  std_ulogic;
    I4  : in  std_ulogic;
    I5  : in  std_ulogic;
    I6  : in  std_ulogic;
    I7  : in  std_ulogic;
    I8  : in  std_ulogic;
    I9  : in  std_ulogic;
    I10 : in  std_ulogic;
    I11 : in  std_ulogic;
    I12 : in  std_ulogic;
    I13 : in  std_ulogic;
    I14 : in  std_ulogic;
    I15 : in  std_ulogic;
    I16 : in  std_ulogic;
    I17 : in  std_ulogic;
    I18 : in  std_ulogic;
    I19 : in  std_ulogic;
    I20 : in  std_ulogic;
    I21 : in  std_ulogic;
    I22 : in  std_ulogic;
    I23 : in  std_ulogic;
    I24 : in  std_ulogic;
    I25 : in  std_ulogic;
    I26 : in  std_ulogic;
    I27 : in  std_ulogic;
    I28 : in  std_ulogic;
    I29 : in  std_ulogic;
    I30 : in  std_ulogic;
    I31 : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_XOR32 : entity is true;
end X_XOR32;

architecture X_XOR32_V of X_XOR32 is
  attribute VITAL_LEVEL1 of
    X_XOR32_V : architecture is true;

  signal I0_ipd  : std_ulogic := 'X';
  signal I1_ipd  : std_ulogic := 'X';
  signal I2_ipd  : std_ulogic := 'X';
  signal I3_ipd  : std_ulogic := 'X';
  signal I4_ipd  : std_ulogic := 'X';
  signal I5_ipd  : std_ulogic := 'X';
  signal I6_ipd  : std_ulogic := 'X';
  signal I7_ipd  : std_ulogic := 'X';
  signal I8_ipd  : std_ulogic := 'X';
  signal I9_ipd  : std_ulogic := 'X';
  signal I10_ipd : std_ulogic := 'X';
  signal I11_ipd : std_ulogic := 'X';
  signal I12_ipd : std_ulogic := 'X';
  signal I13_ipd : std_ulogic := 'X';
  signal I14_ipd : std_ulogic := 'X';
  signal I15_ipd : std_ulogic := 'X';
  signal I16_ipd : std_ulogic := 'X';
  signal I17_ipd : std_ulogic := 'X';
  signal I18_ipd : std_ulogic := 'X';
  signal I19_ipd : std_ulogic := 'X';
  signal I20_ipd : std_ulogic := 'X';
  signal I21_ipd : std_ulogic := 'X';
  signal I22_ipd : std_ulogic := 'X';
  signal I23_ipd : std_ulogic := 'X';
  signal I24_ipd : std_ulogic := 'X';
  signal I25_ipd : std_ulogic := 'X';
  signal I26_ipd : std_ulogic := 'X';
  signal I27_ipd : std_ulogic := 'X';
  signal I28_ipd : std_ulogic := 'X';
  signal I29_ipd : std_ulogic := 'X';
  signal I30_ipd : std_ulogic := 'X';
  signal I31_ipd : std_ulogic := 'X';
begin

  WireDelay : block
  begin
    VitalWireDelay (I0_ipd, I0, tipd_I0);
    VitalWireDelay (I1_ipd, I1, tipd_I1);
    VitalWireDelay (I2_ipd, I2, tipd_I2);
    VitalWireDelay (I3_ipd, I3, tipd_I3);
    VitalWireDelay (I4_ipd, I4, tipd_I4);
    VitalWireDelay (I5_ipd, I5, tipd_I5);
    VitalWireDelay (I6_ipd, I6, tipd_I6);
    VitalWireDelay (I7_ipd, I7, tipd_I7);
    VitalWireDelay (I8_ipd, I8, tipd_I8);
    VitalWireDelay (I9_ipd, I9, tipd_I9);
    VitalWireDelay (I10_ipd, I10, tipd_I10);
    VitalWireDelay (I11_ipd, I11, tipd_I11);
    VitalWireDelay (I12_ipd, I12, tipd_I12);
    VitalWireDelay (I13_ipd, I13, tipd_I13);
    VitalWireDelay (I14_ipd, I14, tipd_I14);
    VitalWireDelay (I15_ipd, I15, tipd_I15);
    VitalWireDelay (I16_ipd, I16, tipd_I16);
    VitalWireDelay (I17_ipd, I17, tipd_I17);
    VitalWireDelay (I18_ipd, I18, tipd_I18);
    VitalWireDelay (I19_ipd, I19, tipd_I19);
    VitalWireDelay (I20_ipd, I20, tipd_I20);
    VitalWireDelay (I21_ipd, I21, tipd_I21);
    VitalWireDelay (I22_ipd, I22, tipd_I22);
    VitalWireDelay (I23_ipd, I23, tipd_I23);
    VitalWireDelay (I24_ipd, I24, tipd_I24);
    VitalWireDelay (I25_ipd, I25, tipd_I25);
    VitalWireDelay (I26_ipd, I26, tipd_I26);
    VitalWireDelay (I27_ipd, I27, tipd_I27);
    VitalWireDelay (I28_ipd, I28, tipd_I28);
    VitalWireDelay (I29_ipd, I29, tipd_I29);
    VitalWireDelay (I30_ipd, I30, tipd_I30);
    VitalWireDelay (I31_ipd, I31, tipd_I31);
  end block;

  VITALBehavior           : process (I0_ipd, I1_ipd, I2_ipd, I3_ipd, I4_ipd, I5_ipd, I6_ipd, I7_ipd, I8_ipd, I9_ipd, I10_ipd, I11_ipd, I12_ipd, I13_ipd, I14_ipd, I15_ipd, I16_ipd, I17_ipd, I18_ipd, I19_ipd, I20_ipd, I21_ipd, I22_ipd, I23_ipd, I24_ipd, I25_ipd, I26_ipd, I27_ipd, I28_ipd, I29_ipd, I30_ipd, I31_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin

    O_zd := I0_ipd xor I1_ipd xor I2_ipd xor I3_ipd xor I4_ipd xor I5_ipd xor I6_ipd xor I7_ipd xor I8_ipd xor I9_ipd xor I10_ipd xor I11_ipd xor I12_ipd xor I13_ipd xor I14_ipd xor I15_ipd xor I16_ipd xor I17_ipd xor I18_ipd xor I19_ipd xor I20_ipd xor I21_ipd xor I22_ipd xor I23_ipd xor I24_ipd xor I25_ipd xor I26_ipd xor I27_ipd xor I28_ipd xor I29_ipd xor I30_ipd xor I31_ipd;

    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (I0_ipd'last_event, tpd_I0_O, true),
                        1   => (I1_ipd'last_event, tpd_I1_O, true),
                        2   => (I2_ipd'last_event, tpd_I2_O, true),
                        3   => (I3_ipd'last_event, tpd_I3_O, true),
                        4   => (I4_ipd'last_event, tpd_I4_O, true),
                        5   => (I5_ipd'last_event, tpd_I5_O, true),
                        6   => (I6_ipd'last_event, tpd_I6_O, true),
                        7   => (I7_ipd'last_event, tpd_I7_O, true),
                        8   => (I8_ipd'last_event, tpd_I8_O, true),
                        9   => (I9_ipd'last_event, tpd_I9_O, true),
                        10  => (I10_ipd'last_event, tpd_I10_O, true),
                        11  => (I11_ipd'last_event, tpd_I11_O, true),
                        12  => (I12_ipd'last_event, tpd_I12_O, true),
                        13  => (I13_ipd'last_event, tpd_I13_O, true),
                        14  => (I14_ipd'last_event, tpd_I14_O, true),
                        15  => (I15_ipd'last_event, tpd_I15_O, true),
                        16  => (I16_ipd'last_event, tpd_I16_O, true),
                        17  => (I17_ipd'last_event, tpd_I17_O, true),
                        18  => (I18_ipd'last_event, tpd_I18_O, true),
                        19  => (I19_ipd'last_event, tpd_I19_O, true),
                        20  => (I20_ipd'last_event, tpd_I20_O, true),
                        21  => (I21_ipd'last_event, tpd_I21_O, true),
                        22  => (I22_ipd'last_event, tpd_I22_O, true),
                        23  => (I23_ipd'last_event, tpd_I23_O, true),
                        24  => (I24_ipd'last_event, tpd_I24_O, true),
                        25  => (I25_ipd'last_event, tpd_I25_O, true),
                        26  => (I26_ipd'last_event, tpd_I26_O, true),
                        27  => (I27_ipd'last_event, tpd_I27_O, true),
                        28  => (I28_ipd'last_event, tpd_I28_O, true),
                        29  => (I29_ipd'last_event, tpd_I29_O, true),
                        30  => (I20_ipd'last_event, tpd_I20_O, true),
                        31  => (I31_ipd'last_event, tpd_I31_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process;
end X_XOR32_V;
