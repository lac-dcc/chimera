-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_OR16.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  16-input OR Gate
-- /___/   /\     Filename : X_OR16.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:11 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_OR16 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_OR16 is
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
      tpd_I15_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
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
    I15 : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_OR16 : entity is true;
end X_OR16;

architecture X_OR16_V of X_OR16 is
  attribute VITAL_LEVEL1 of
    X_OR16_V : architecture is true;

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
begin
  WireDelay      : block
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
  end block;

  VITALBehavior           : process (I0_ipd, I1_ipd, I2_ipd, I3_ipd, I4_ipd, I5_ipd, I6_ipd, I7_ipd, I8_ipd, I9_ipd, I10_ipd, I11_ipd, I12_ipd, I13_ipd, I14_ipd, I15_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin
    O_zd := I0_ipd or I1_ipd or I2_ipd or I3_ipd or I4_ipd or I5_ipd or I6_ipd or I7_ipd or I8_ipd or I9_ipd or I10_ipd or I11_ipd or I12_ipd or I13_ipd or I14_ipd or I15_ipd;

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
                        15  => (I15_ipd'last_event, tpd_I15_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process;
end X_OR16_V;
