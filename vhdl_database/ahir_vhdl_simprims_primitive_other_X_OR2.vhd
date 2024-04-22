-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_OR2.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  2-input OR Gate
-- /___/   /\     Filename : X_OR2.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:11 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_OR2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_OR2 is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_I0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I1 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_I0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I1_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );

  port(
    O  : out std_ulogic;
    I0 : in  std_ulogic;
    I1 : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_OR2 : entity is true;
end X_OR2;

architecture X_OR2_V of X_OR2 is
  attribute VITAL_LEVEL1 of
    X_OR2_V : architecture is true;

  signal I0_ipd : std_ulogic := 'X';
  signal I1_ipd : std_ulogic := 'X';
begin
  WireDelay     : block
  begin
    VitalWireDelay (I0_ipd, I0, tipd_I0);
    VitalWireDelay (I1_ipd, I1, tipd_I1);
  end block;

  VITALBehavior           : process (I0_ipd, I1_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin
    O_zd := I0_ipd or I1_ipd;
    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (I0_ipd'last_event, tpd_I0_O, true),
                        1   => (I1_ipd'last_event, tpd_I1_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process;
end X_OR2_V;
