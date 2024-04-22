-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_OBUF.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Output Buffer
-- /___/   /\     Filename : X_OBUF.vhd
-- \   \  /  \    Timestamp : Tue Mar  8 10:57:20 PDT 2005
--  \___\/\___\
--
-- Revision:
--    03/23/05 - Initial version.
--    04/25/05 - #207191 -- Changed GTS active 1  --fp  .
--    05/09/05 - #207243 -- Added PATHPULSE. 
--    07/02/07 - CR 441959
--    06/03/08 - CR 472154 Removed Vital GSR/GTS constructs
-- End Revision
----- CELL X_OBUF -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_OBUF is
  generic(
      Xon   : boolean := true;
      MsgOn : boolean := true;

      CAPACITANCE : string  := "DONT_CARE";
      DRIVE       : integer := 12;
      IOSTANDARD  : string  := "DEFAULT";
      LOC         : string  := "UNPLACED";
      SLEW        : string  := "SLOW";

      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

      PATHPULSE : time := 0 ps      
    );

  port(
    O   : out std_ulogic;
    I   : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_OBUF : entity is true;
end X_OBUF;

architecture X_OBUF_V of X_OBUF is
--  attribute VITAL_LEVEL1 of
  attribute VITAL_LEVEL0 of
    X_OBUF_V : architecture is true;

  signal GTS_resolved : std_ulogic := 'X';
  signal I_ipd   : std_ulogic := 'X';
begin

  GTS_resolved <= TO_X01(GTS);

  WireDelay      : block
  begin
    VitalWireDelay (I_ipd, I, tipd_I);
  end block;

  VITALBehavior           : process (GTS_resolved, I_ipd)
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
    variable I_GlitchData : SimprimGlitchDataType;
    variable O_prev       : std_ulogic;
    variable InputGlitch  : boolean := false;
    variable I_ipd_reg    : std_ulogic;
    variable FIRST_TRANSITION_AFTER_GTS_ACTIVE : boolean := false;    
    variable tmp_GTS_O : VitalDelayType01z := (0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns, 0.000 ns);
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
      end if;   
    end if;
    if (InputGlitch = false) then
      O_prev := TO_X01(O_zd);
    end if;    

    O_zd := VitalBUFIF0 (data => I_ipd, enable => GTS_resolved);

    VitalPathDelay01Z (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (GTS_resolved'last_event, tmp_GTS_O, true),
                        1   => (I_ipd'last_event, VitalExtendToFillDelay(tpd_I_O), (GTS_resolved = '0'))),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning,
      OutputMap     => "UX01ZWLH-");
    
    if (InputGlitch = true) then
      InputGlitch := false;
    end if;        
  end process;
end X_OBUF_V;
