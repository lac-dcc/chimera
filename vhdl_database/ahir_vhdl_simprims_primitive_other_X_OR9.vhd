-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_OR9.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  9-input OR Gate
-- /___/   /\     Filename : X_OR9.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:12 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_OR9 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_OR9 is
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

      tpd_I0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I1_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I2_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I3_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I4_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I5_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I6_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I7_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I8_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );

  port(
    O     : out std_ulogic;
    I0    : in  std_ulogic;
    I1    : in  std_ulogic;
    I2    : in  std_ulogic;
    I3    : in  std_ulogic;
    I4    : in  std_ulogic;
    I5    : in  std_ulogic;
    I6    : in  std_ulogic;
    I7    : in  std_ulogic;
    I8    : in  std_ulogic
    );
  attribute VITAL_LEVEL0 of
    X_OR9 :     entity is true;
end X_OR9;

architecture X_OR9_V of X_OR9 is
  attribute VITAL_LEVEL1 of
    X_OR9_V : architecture is true;

  signal I0_ipd : std_ulogic := 'X';
  signal I1_ipd : std_ulogic := 'X';
  signal I2_ipd : std_ulogic := 'X';
  signal I3_ipd : std_ulogic := 'X';
  signal I4_ipd : std_ulogic := 'X';
  signal I5_ipd : std_ulogic := 'X';
  signal I6_ipd : std_ulogic := 'X';
  signal I7_ipd : std_ulogic := 'X';
  signal I8_ipd : std_ulogic := 'X';
begin
  WireDelay     : block
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
  end block;

  VITALBehavior           : process (I8_ipd, I7_ipd, I6_ipd, I5_ipd, I4_ipd, I3_ipd, I2_ipd, I1_ipd, I0_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin
    O_zd := (I8_ipd) or (I7_ipd) or (I6_ipd) or (I5_ipd) or (I4_ipd) or (I3_ipd) or (I2_ipd) or (I1_ipd) or (I0_ipd);
    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (I8_ipd'last_event, tpd_I8_O, true),
                        1   => (I7_ipd'last_event, tpd_I7_O, true),
                        2   => (I6_ipd'last_event, tpd_I6_O, true),
                        3   => (I5_ipd'last_event, tpd_I5_O, true),
                        4   => (I4_ipd'last_event, tpd_I4_O, true),
                        5   => (I3_ipd'last_event, tpd_I3_O, true),
                        6   => (I2_ipd'last_event, tpd_I2_O, true),
                        7   => (I1_ipd'last_event, tpd_I1_O, true),
                        8   => (I0_ipd'last_event, tpd_I0_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process;
end X_OR9_V;
