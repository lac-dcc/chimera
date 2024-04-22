-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_CKBUF.vhd,v 1.3 2010/01/14 19:43:22 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  General Purpose Buffer with Inertial Delay
-- /___/   /\     Filename : X_CKBUF.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:07 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_CKBUF -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_CKBUF is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC            : string  := "UNPLACED";

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    
    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

    PATHPULSE : time := 0 ps
    );

  port(
    O : out std_ulogic;
    I : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_CKBUF : entity is true;

end X_CKBUF;

architecture X_CKBUF_V of X_CKBUF is

  attribute VITAL_LEVEL0 of
    X_CKBUF_V : architecture is true;

  signal I_ipd : std_ulogic := 'X';
begin
  WireDelay    : block
  begin
    VitalWireDelay (I_ipd, I, tipd_I);
  end block;

  VITALBehavior           : process
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
    variable I_GlitchData : SimprimGlitchDataType;
    variable O_prev       : std_ulogic;
    variable InputGlitch  : boolean := false;
    variable I_ipd_reg    : std_ulogic;
    variable FIRST_TIME   : boolean := true;
  begin

    I_ipd_reg    := TO_X01(I_ipd);
    if (FIRST_TIME = true) then
      wait until ((I_ipd = '0') or (I_ipd = '1') or (I_ipd = 'L') or (I_ipd = 'H'));
      FIRST_TIME := false;
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

    if (InputGlitch = false) then
      O_prev := TO_X01(O_zd);
    end if;

    if (InputGlitch = true) then
      InputGlitch := false;
    end if;

    O_zd := TO_X01(I_ipd);

    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (I_ipd'last_event, tpd_I_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);


    wait on I_ipd;
  end process;
end X_CKBUF_V;
