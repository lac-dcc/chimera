-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_AND3.vhd,v 1.3 2010/01/14 19:43:22 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  3-input AND Gate
-- /___/   /\     Filename : X_AND3.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:06 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_AND3 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_AND3 is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC   : string  := "UNPLACED";

      tipd_I0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I2 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_I0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I1_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I2_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );

  port(
    O  : out std_ulogic;
    I0 : in  std_ulogic;
    I1 : in  std_ulogic;
    I2 : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_AND3 : entity is true;

end X_AND3;

architecture X_AND3_V of X_AND3 is

  attribute VITAL_LEVEL1 of
    X_AND3_V : architecture is true;

  signal I0_ipd : std_ulogic := 'X';
  signal I1_ipd : std_ulogic := 'X';
  signal I2_ipd : std_ulogic := 'X';
begin
  WireDelay     : block
  begin
    VitalWireDelay (I0_ipd, I0, tipd_I0);
    VitalWireDelay (I1_ipd, I1, tipd_I1);
    VitalWireDelay (I2_ipd, I2, tipd_I2);
  end block;

  VITALBehavior           : process (I0_ipd, I1_ipd, I2_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin
    O_zd := I0_ipd and I1_ipd and I2_ipd;
    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (I0_ipd'last_event, tpd_I0_O, true),
                1   => (I1_ipd'last_event, tpd_I1_O, true),
                2   => (I2_ipd'last_event, tpd_I2_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process;

end X_AND3_V;
