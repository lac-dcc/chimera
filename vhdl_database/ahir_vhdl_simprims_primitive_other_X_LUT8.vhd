-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_LUT8.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  8-input Look-Up-Table with General Output
-- /___/   /\     Filename : X_LUT8.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:10 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_LUT8 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_LUT8 is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_ADR0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR2 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR3 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR4 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR5 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR6 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR7 : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
      tpd_ADR0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR1_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR2_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR3_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR4_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR5_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR6_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR7_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    INIT       : bit_vector       := X"0000000000000000000000000000000000000000000000000000000000000000"
    );

  port(
    O    : out std_ulogic;
    ADR0 : in  std_ulogic;
    ADR1 : in  std_ulogic;
    ADR2 : in  std_ulogic;
    ADR3 : in  std_ulogic;
    ADR4 : in  std_ulogic;
    ADR5 : in  std_ulogic;
    ADR6 : in  std_ulogic;
    ADR7 : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_LUT8 : entity is true;
end X_LUT8;

architecture X_LUT8_V of X_LUT8 is
  attribute VITAL_LEVEL1 of
    X_LUT8_V : architecture is true;

  signal ADR0_ipd : std_ulogic := 'X';
  signal ADR1_ipd : std_ulogic := 'X';
  signal ADR2_ipd : std_ulogic := 'X';
  signal ADR3_ipd : std_ulogic := 'X';
  signal ADR4_ipd : std_ulogic := 'X';
  signal ADR5_ipd : std_ulogic := 'X';
  signal ADR6_ipd : std_ulogic := 'X';
  signal ADR7_ipd : std_ulogic := 'X';
begin
  WireDelay : block
  begin
    VitalWireDelay (ADR0_ipd, ADR0, tipd_ADR0);
    VitalWireDelay (ADR1_ipd, ADR1, tipd_ADR1);
    VitalWireDelay (ADR2_ipd, ADR2, tipd_ADR2);
    VitalWireDelay (ADR3_ipd, ADR3, tipd_ADR3);
    VitalWireDelay (ADR4_ipd, ADR4, tipd_ADR4);
    VitalWireDelay (ADR5_ipd, ADR5, tipd_ADR5);
    VitalWireDelay (ADR6_ipd, ADR6, tipd_ADR6);
    VitalWireDelay (ADR7_ipd, ADR7, tipd_ADR7);
  end block;

  VITALBehavior : process (ADR0_ipd, ADR1_ipd, ADR2_ipd, ADR3_ipd, ADR4_ipd, ADR5_ipd, ADR6_ipd, ADR7_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin
    O_zd := VitalMUX(data => To_StdLogicVector(INIT), dselect => (ADR7_ipd, ADR6_ipd, ADR5_ipd, ADR4_ipd, ADR3_ipd, ADR2_ipd, ADR1_ipd, ADR0_ipd));
    
    VitalPathDelay01 (
      OutSignal           => O,
      GlitchData          => O_GlitchData,
      OutSignalName       => "O",
      OutTemp             => O_zd,
      Paths               => (0 => (ADR0_ipd'last_event, tpd_ADR0_O, true),
                              1 => (ADR1_ipd'last_event, tpd_ADR1_O, true),
                              2 => (ADR2_ipd'last_event, tpd_ADR2_O, true),
                              3 => (ADR3_ipd'last_event, tpd_ADR3_O, true),
                              4 => (ADR4_ipd'last_event, tpd_ADR4_O, true),
                              5 => (ADR5_ipd'last_event, tpd_ADR5_O, true),
                              6 => (ADR6_ipd'last_event, tpd_ADR6_O, true),
                              7 => (ADR7_ipd'last_event, tpd_ADR7_O, true)),
      Mode                => VitalTransport,
      Xon                 => Xon,
      MsgOn               => MsgOn,
      MsgSeverity         => warning);
  end process;
end X_LUT8_V;
