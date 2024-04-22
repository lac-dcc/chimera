-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_OBUFDS.vhd,v 1.4 2010/12/02 00:56:07 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Differential Signaling Output Buffer
-- /___/   /\     Filename : X_OBUFDS.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:10 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    05/09/05 - #207243 -- Added PATHPULSE.
--    07/02/07 - CR 441959
--    06/03/08 - CR 472154 Removed Vital GSR/GTS constructs
--    12/01/10 - CR 584500 - added attribute SLEW
-- End Revision
----- CELL X_OBUFDS -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_OBUFDS is
  generic(
      Xon   : boolean := true;
      MsgOn : boolean := true;

      CAPACITANCE : string  := "DONT_CARE";
      IOSTANDARD  : string  := "DEFAULT";
      LOC         : string  := "UNPLACED";
      SLEW        : string  := "SLOW";

      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I_OB : VitalDelayType01 := (0.000 ns, 0.000 ns);

      PATHPULSE : time := 0 ps            
    );

  port(
    O  : out std_ulogic;
    OB : out std_ulogic;
    I  : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_OBUFDS : entity is true;
end X_OBUFDS;

architecture X_OBUFDS_V of X_OBUFDS is
--  attribute VITAL_LEVEL1 of
  attribute VITAL_LEVEL0 of
    X_OBUFDS_V : architecture is true;

  signal GTS_resolved : std_ulogic := 'X';
  signal I_ipd : std_ulogic := 'X';
begin

  GTS_resolved <= TO_X01(GTS);

  WireDelay    : block
  begin
    VitalWireDelay (I_ipd, I, tipd_I);
  end block;

  VITALBehavior            : process (GTS_resolved, I_ipd)
    variable O_zd          : std_ulogic;
    variable OB_zd         : std_ulogic;
    variable O_GlitchData  : VitalGlitchDataType;
    variable OB_GlitchData : VitalGlitchDataType;
    variable I_GlitchData : SimprimGlitchDataType;
    variable O_prev       : std_ulogic;
    variable OB_prev       : std_ulogic;    
    variable InputGlitch  : boolean := false;
    variable I_ipd_reg    : std_ulogic;
    variable FIRST_TRANSITION_AFTER_GTS_ACTIVE : boolean := false;        
    variable tmp_GTS_O : VitalDelayType01z := (0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns);
    variable tmp_GTS_OB : VitalDelayType01z := (0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns);
  begin

    I_ipd_reg    := TO_X01(I_ipd);
    if (falling_edge(GTS_resolved)) then
      FIRST_TRANSITION_AFTER_GTS_ACTIVE                  := true;
    end if;

    if (GTS_resolved = '0') then
      if (FIRST_TRANSITION_AFTER_GTS_ACTIVE = true) then
        FIRST_TRANSITION_AFTER_GTS_ACTIVE := false;
      else
        if ((tpd_I_O(tr01) < PATHPULSE) or (tpd_I_O(tr10) < PATHPULSE)) then
        else
          SimprimGlitch
            (
            GlitchOccured => InputGlitch,
            OutSignal     => O,
            GlitchData    => I_GlitchData,
            InSignalName  => "I",
            NewValue      => I_ipd_reg,
            PrevValue     => O_Prev,
            PathpulseTime => PATHPULSE,
            MsgOn         => false,
            MsgSeverity   => warning
            );
        end if;

        if ((tpd_I_OB(tr01) < PATHPULSE) or (tpd_I_OB(tr10) < PATHPULSE)) then
        else
          SimprimGlitch
            (
            GlitchOccured => InputGlitch,
            OutSignal     => OB,
            GlitchData    => I_GlitchData,
            InSignalName  => "I",
            NewValue      => I_ipd_reg,
            PrevValue     => OB_Prev,
            PathpulseTime => PATHPULSE,
            MsgOn         => false,
            MsgSeverity   => warning
            );
        end if;        
      end if;
    end if;        
    if (InputGlitch = false) then
      O_prev := TO_X01(O_zd);
      OB_prev := TO_X01(OB_zd);        
    end if;

    
    O_zd := VitalBUFIF0 (data => I_ipd, enable => (GTS_resolved));
    OB_zd := VitalBUFIF0 (data => not I_ipd, enable => (GTS_resolved));

    VitalPathDelay01Z (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (I_ipd'last_event, VitalExtendToFillDelay(tpd_I_O), (GTS_resolved = '0')),
                        1 => (GTS_resolved'last_event, tmp_GTS_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning,
      OutputMap     => "UX01ZWLH-");
    VitalPathDelay01Z (
      OutSignal     => OB,
      GlitchData    => OB_GlitchData,
      OutSignalName => "OB",
      OutTemp       => OB_zd,
      Paths         => (0 => (I_ipd'last_event, VitalExtendToFillDelay(tpd_I_OB), (GTS_resolved = '0')),
                        1 => (GTS_resolved'last_event, tmp_GTS_OB, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning,
      OutputMap     => "UX01ZWLH-");
    
    if (InputGlitch = true) then
      InputGlitch := false;
    end if;            
  end process;
end X_OBUFDS_V;
