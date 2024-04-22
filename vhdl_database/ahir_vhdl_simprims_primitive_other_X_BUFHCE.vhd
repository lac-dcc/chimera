-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/fuji/VITAL/X_BUFHCE.vhd,v 1.4 2011/01/27 19:56:59 yanx Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  H Clock Buffer with Active High Enable
-- /___/   /\     Filename : X_BUFHCE.vhd
-- \   \  /  \    Timestamp : 
--  \___\/\___\
--
-- Revision:
--    04/08/08 - Initial version.
--    10/19/08 - Recoding to same as BUFGCE according to hardware.
--    01/27/11 - Add CE to O iopath (CR591499)
-- End Revision

----- CELL X_BUFHCE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;
use simprim.VCOMPONENTS.all;

entity X_BUFHCE is
  generic(
      CE_TYPE : string := "SYNC";
      INIT_OUT : integer := 0;
      InstancePath   : string  := "*";
      LOC            : string  := "UNPLACED";
      MsgOn          : boolean := FALSE;
      TimingChecksOn : boolean := TRUE;
      Xon            : boolean := TRUE;
      thold_CE_I_negedge_negedge : VitalDelayType := 0 ps;
      thold_CE_I_negedge_posedge : VitalDelayType := 0 ps;
      thold_CE_I_posedge_negedge : VitalDelayType := 0 ps;
      thold_CE_I_posedge_posedge : VitalDelayType := 0 ps;
      ticd_I : VitalDelayType := 0 ps;
      tipd_CE : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_I : VitalDelayType01 :=  (0 ps, 0 ps);
      tisd_CE_I : VitalDelayType := 0 ps;
      tpd_I_O : VitalDelayType01 := (0 ps, 0 ps);
      tpd_CE_O : VitalDelayType01 := (0 ps, 0 ps);
      tperiod_I_posedge : VitalDelayType := 0 ps;
      tsetup_CE_I_negedge_negedge : VitalDelayType :=  0 ps;
      tsetup_CE_I_negedge_posedge : VitalDelayType :=  0 ps;
      tsetup_CE_I_posedge_negedge : VitalDelayType :=  0 ps;
      tsetup_CE_I_posedge_posedge : VitalDelayType :=  0 ps
    );

  port(
    O : out std_ulogic;
    CE : in std_ulogic;
    I : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_BUFHCE : entity is true;

end X_BUFHCE;

architecture X_BUFHCE_V of X_BUFHCE is

  attribute VITAL_LEVEL0 of
    X_BUFHCE_V : architecture is true;

    signal I_ipd : std_ulogic;
    signal CE_ipd : std_ulogic;
    signal CE_dly :  std_ulogic;
    signal I_dly :  std_ulogic;
    signal o_out :  std_ulogic;
    signal o_out1 :  std_ulogic;
    signal o_out2 :  std_ulogic;
    signal NCE : STD_ULOGIC := 'X';
    signal GND : STD_ULOGIC := '0';
    signal Z1  : STD_ULOGIC := '1';
    signal CE_TYPE_BINARY : std_ulogic;
    signal INIT_OUT_BINARY : std_ulogic;
begin

    INIPROC : process
    begin
    -- case CE_TYPE is
      if((CE_TYPE = "SYNC") or (CE_TYPE = "sync")) then
        CE_TYPE_BINARY <= '0';
      elsif((CE_TYPE = "ASYNC") or (CE_TYPE= "async")) then
        CE_TYPE_BINARY <= '1';
      else
        assert FALSE report "Error : CE_TYPE = is not SYNC, ASYNC." severity error;
      end if;
    -- end case;
    case INIT_OUT is
      when  0   =>  INIT_OUT_BINARY <= '0';
      when  1   =>  INIT_OUT_BINARY <= '1';
      when others  =>  assert FALSE report "Error : INIT_OUT is not in range 0 .. 1." severity error;
    end case;
    wait;
    end process INIPROC;


    B1 : X_BUFGMUX
        port map (
        I0 => I_ipd,
        I1 => GND,
        O =>o_out1,
        s =>NCE);

    B2 : X_BUFGMUX_1
        port map (
        I0 => I_ipd,
        I1 => Z1,
        O =>o_out2,
        s =>NCE);

    I1 : X_INV
        port map (
        I => CE_dly,
        O => NCE);

    o_out <= o_out2 when INIT_OUT = 1 else o_out1;

  WireDelay    : block
  begin
    VitalWireDelay (I_ipd, I, tipd_I);
    VitalWireDelay (CE_ipd, CE, tipd_CE);
  end block;

  SignalDelay : block
  begin
      VitalSignalDelay (CE_dly,CE_ipd,tisd_CE_I);
      VitalSignalDelay (I_dly,I_ipd,ticd_I);
  end block;


  P_TIMING : process (I_dly, CE_dly)
      variable  O_GlitchData : VitalGlitchDataType;
      variable Tmkr_CE_I_posedge : VitalTimingDataType := VitalTimingDataInit;
      variable Tviol_CE_I_posedge : STD_ULOGIC := '0';
                                                                                  
  begin
      if (TimingChecksOn) then
        VitalSetupHoldCheck
      (
        Violation => Tviol_CE_I_posedge,
        TimingData => Tmkr_CE_I_posedge,
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_I,
        RefSignal => I_dly,
        RefSignalName => "I",
        RefDelay => ticd_I,
        SetupHigh => tsetup_CE_I_negedge_posedge,
        HoldLow => tsetup_CE_I_negedge_posedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_BUFHCE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
        );
        VitalSetupHoldCheck
      (
        Violation => Tviol_CE_I_posedge,
        TimingData => Tmkr_CE_I_posedge,
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_I,
        RefSignal => I_dly,
        RefSignalName => "I",
        RefDelay => ticd_I,
        SetupHigh => tsetup_CE_I_posedge_posedge,
        HoldLow => tsetup_CE_I_posedge_posedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_BUFHCE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
        );
        VitalSetupHoldCheck
      (
        Violation => Tviol_CE_I_posedge,
        TimingData => Tmkr_CE_I_posedge,
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_I,
        RefSignal => I_dly,
        RefSignalName => "I",
        RefDelay => ticd_I,
        SetupLow => tsetup_CE_I_negedge_negedge,
        HoldHigh => tsetup_CE_I_negedge_negedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_BUFHCE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
        );
        VitalSetupHoldCheck
      (
        Violation => Tviol_CE_I_posedge,
        TimingData => Tmkr_CE_I_posedge,
        TestSignal => CE_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_I,
        RefSignal => I_dly,
        RefSignalName => "I",
        RefDelay => ticd_I,
        SetupLow => tsetup_CE_I_posedge_negedge,
        HoldHigh => tsetup_CE_I_posedge_negedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_BUFHCE",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
        );
    end if;
    end process P_TIMING;

  P_VITALPathDelay : process (o_out)
    variable O_zd : std_ulogic;
    variable O_GlitchData : VitalGlitchDataType;
  begin
    O_zd := o_out;
    if (O_zd = 'L') then
      O_zd := '0';
    end if;
    VitalPathDelay01
        (
          OutSignal     => O,
          GlitchData    => O_GlitchData,
          OutSignalName => "O",
          OutTemp       => O_out,
          Paths       => (0 => (CE_dly'last_event, tpd_CE_O,TRUE)),
          Mode          => VitalTransport,
          Xon           => false,
          MsgOn          => false,
          MsgSeverity    => WARNING
        );
    VitalPathDelay01 (
      OutSignal           => O,
      GlitchData          => O_GlitchData,
      OutSignalName       => "O",
      OutTemp             => O_zd,
      Paths         => (0 => (I_dly'last_event, tpd_I_O, true)),
      Mode                => VitalTransport,
      Xon                 => false,
      MsgOn               => false,
      MsgSeverity         => warning);
  end process P_VITALPathDelay;

end X_BUFHCE_V;
