-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_TRI.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  3-State Buffer
-- /___/   /\     Filename : X_TRI.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:20 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    06/03/08 - CR 472154 Removed Vital GSR/GTS constructs
-- End Revision

----- CELL X_TRI -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

entity X_TRI is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC            : string  := "UNPLACED";

    tipd_CTL : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_CTL_O : VitalDelayType01z := (0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns);
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

    PATHPULSE : time := 500 ps    
    );

  port(
    O   : out std_ulogic := '0';
    
    CTL : in  std_ulogic;
    I   : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_TRI : entity is true;
end X_TRI;

architecture X_TRI_V of X_TRI is
--  attribute VITAL_LEVEL1 of
  attribute VITAL_LEVEL0 of    
    X_TRI_V : architecture is true;

  signal CTL_ipd : std_ulogic := 'X';
  signal I_ipd   : std_ulogic := 'X';

  signal GTS_resolved   : std_ulogic := '0';
begin
  GTS_resolved <= TO_X01(GTS);
  WireDelay      : block
  begin
    VitalWireDelay (CTL_ipd, CTL, tipd_CTL);
    VitalWireDelay (I_ipd, I, tipd_I);
  end block;

  VITALBehavior           : process (CTL_ipd, I_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
    variable I_GlitchData                    : SimprimGlitchDataType;
    variable O_prev                          : std_ulogic;
    variable InputGlitch                     : boolean := false;
    variable I_ipd_reg                       : std_ulogic;
    variable FIRST_TRANSITION_AFTER_CTL_HIGH : boolean := false;    
    variable tmp_GTS_O : VitalDelayType01z := (0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns);

  begin
    I_ipd_reg                                          := TO_X01(I_ipd);
    if ((CTL_ipd'event) and (CTL_ipd'last_value = '0') and (CTL_ipd = '1')) then
      FIRST_TRANSITION_AFTER_CTL_HIGH                  := true;
    end if;

    if (CTL_ipd = '1') then
      if (FIRST_TRANSITION_AFTER_CTL_HIGH = true) then
        FIRST_TRANSITION_AFTER_CTL_HIGH := false;
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
      end if;
    end if;

    if (InputGlitch = false) then
      O_prev := TO_X01(O_zd);
    end if;    
    O_zd := VitalBUFIF1 (data => I_ipd, enable => (CTL_ipd or GTS_resolved));

    VitalPathDelay01Z (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (CTL_ipd'last_event, VitalExtendToFillDelay(tpd_CTL_O), (GTS_resolved = '0')),
                        1   => (I_ipd'last_event, VitalExtendToFillDelay(tpd_I_O), (GTS_resolved = '0')),
                        2   => (GTS_resolved'last_event, tmp_GTS_O, true)),
      
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning,
      OutputMap     => "UX01ZWLH-");
    if (InputGlitch = true) then
      InputGlitch := false;
    end if;    
  end process;
end X_TRI_V;

