-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/blanc/VITAL/X_AND2B1L.vhd,v 1.5 2010/01/14 19:35:24 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Latch used 2-input AND Gate
-- /___/   /\     Filename : X_AND2B1L.vhd
-- \   \  /  \    Timestamp : Tue Feb 26 11:11:42 PST 2008
--  \___\/\___\
--
-- Revision:
--    04/01/08 - Initial version.
--    04/14/09 - Invert SRI not DI (CR517897)
-- End Revision

----- CELL X_AND2B1L -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_AND2B1L is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC   : string  := "UNPLACED";
                                                                                 
      tipd_DI : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_SRI : VitalDelayType01 := (0.000 ns, 0.000 ns);
                                                                                 
      tpd_DI_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_SRI_O : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );
  port(
    O : out std_ulogic;

    SRI : in std_ulogic;
    DI : in std_ulogic
    );
 
  attribute VITAL_LEVEL0 of
    X_AND2B1L : entity is true;

end X_AND2B1L;

architecture X_AND2B1L_V of X_AND2B1L is

  attribute VITAL_LEVEL1 of
    X_AND2B1L_V : architecture is true;
                                                                                 
  signal DI_ipd : std_ulogic := 'X';
  signal SRI_ipd : std_ulogic := 'X';

begin
  WireDelay     : block
  begin
    VitalWireDelay (DI_ipd, DI, tipd_DI);
    VitalWireDelay (SRI_ipd, SRI, tipd_SRI);
  end block;

  VITALBehavior           : process (DI_ipd, SRI_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin
    O_zd := (not SRI_ipd) and  DI_ipd;
    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (DI_ipd'last_event, tpd_DI_O, true),
                1   => (SRI_ipd'last_event, tpd_SRI_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process;
end X_AND2B1L_V;


