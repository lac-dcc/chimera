-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/blanc/VITAL/X_AUTOBUF.vhd,v 1.5 2010/01/14 19:35:24 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Clock Buffer
-- /___/   /\     Filename : X_AUTOBUF.vhd
-- \   \  /  \    Timestamp : 
--  \___\/\___\
--
-- Revision:
--    05/08/09 - Initial version.
--    07/23/09 - Add more attrute values (CR521811)
-- End Revision

----- CELL X_AUTOBUF -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_AUTOBUF is
  generic(
    Xon   : boolean := true;
    MsgOn : boolean := true;
    LOC            : string  := "UNPLACED";

    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpd_I_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

    PATHPULSE : time := 0 ps;

    BUFFER_TYPE : string := "AUTO"
    );
  port(
    O : out std_ulogic;
    I : in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_AUTOBUF : entity is true;

end X_AUTOBUF;

architecture X_AUTOBUF_V of X_AUTOBUF is
  attribute VITAL_LEVEL0 of
    X_AUTOBUF_V : architecture is true;

  signal I_ipd : std_ulogic := 'X';

begin
  WireDelay    : block
  begin
    VitalWireDelay (I_ipd, I, tipd_I);
  end block;

  INIPROC : process
  begin
    if (BUFFER_TYPE /= "AUTO" and BUFFER_TYPE /= "auto" and
        BUFFER_TYPE /= "BUF" and BUFFER_TYPE /= "buf" and
        BUFFER_TYPE /= "BUFG" and BUFFER_TYPE /= "bufg" and
        BUFFER_TYPE /= "BUFGP" and BUFFER_TYPE /= "bufgp" and
        BUFFER_TYPE /= "BUFH" and BUFFER_TYPE /= "bufh" and
        BUFFER_TYPE /= "BUFIO" and BUFFER_TYPE /= "bufio" and
        BUFFER_TYPE /= "BUFIO2" and BUFFER_TYPE /= "bufioi2" and
        BUFFER_TYPE /= "BUFIO2FB" and BUFFER_TYPE /= "bufioi2fb" and
        BUFFER_TYPE /= "BUFR" and BUFFER_TYPE /= "bufr" and
        BUFFER_TYPE /= "IBUF" and BUFFER_TYPE /= "ibuf" and
        BUFFER_TYPE /= "IBUFG" and BUFFER_TYPE /= "ibufg" and
        BUFFER_TYPE /= "NONE" and BUFFER_TYPE /= "none" and
        BUFFER_TYPE /= "OBUF" and BUFFER_TYPE /= "obuf" ) then

      assert FALSE report "Attribute Syntax Error : BUFFER_TYPE is not AUTO, BUF, BUFG, BUFGP, BUFH, BUFIO, BUFIO2, BUFIO2FB, BUFR, IBUF, IBUFG, NONE, and OBUF." severity error;
       end if;
   wait;
  end process;

  VITALBehavior           : process
    variable O_zd         : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
    variable I_GlitchData : SimprimGlitchDataType;
    variable O_prev       : std_ulogic;
    variable InputGlitch  : boolean := false;
    variable I_ipd_reg    : std_ulogic;
    variable FIRST_TIME   : boolean := true;
  begin
    I_ipd_reg    := To_X01(I_ipd);
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
      O_prev := To_X01(O_zd);
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

end X_AUTOBUF_V;
