-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_MUX2.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  2-to-1 Multiplexer
-- /___/   /\     Filename : X_MUX2.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:10 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_MUX2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_MUX2 is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_IA : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_IB : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_SEL : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_IA_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_IB_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_SEL_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );

  port(
    O   : out std_ulogic;
    IA  : in  std_ulogic;
    IB  : in  std_ulogic;
    SEL : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_MUX2 : entity is true;
end X_MUX2;

architecture X_MUX2_V of X_MUX2 is
  attribute VITAL_LEVEL1 of
    X_MUX2_V : architecture is true;

  signal IA_ipd  : std_ulogic := 'X';
  signal IB_ipd  : std_ulogic := 'X';
  signal SEL_ipd : std_ulogic := 'X';
begin
  WireDelay      : block
  begin
    VitalWireDelay (IA_ipd, IA, tipd_IA);
    VitalWireDelay (IB_ipd, IB, tipd_IB);
    VitalWireDelay (SEL_ipd, SEL, tipd_SEL);
  end block;

  VITALBehavior           : process (IA_ipd, IB_ipd, SEL_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin
    O_zd := VitalMUX(data => (IB_ipd, IA_ipd), dselect => (0 => SEL_ipd));

    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (IA_ipd'last_event, tpd_IA_O, true),
                        1   => (IB_ipd'last_event, tpd_IB_O, true),
                        2   => (SEL_ipd'last_event, tpd_SEL_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process;
end X_MUX2_V;
