-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_FDDRRSE.vhd,v 1.4 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Dual Data Rate D Flip-Flop with Synchronous Reset and Set and Clock Enable
-- /___/   /\     Filename : X_FDDRRSE.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:08 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    05/27/08 - CR 472154 Removed Vital GSR constructs
--    06/19/08 - Assign GSR_ipd to GSR (CR474587).
-- End Revision

----- CELL X_FDDRRSE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Primitives.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

entity X_FDDRRSE is
  generic(
    TimingChecksOn : boolean := true;
    Xon : boolean := true;
    MsgOn : boolean := true;
    LOC            : string  := "UNPLACED";


    thold_CE_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_CE_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_CE_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_CE_C1_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_D0_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_D0_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_D1_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_D1_C1_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_R_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_R_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_R_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_R_C1_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_S_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_S_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_S_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_S_C1_posedge_posedge : VitalDelayType := 0.000 ns;

    ticd_C0 : VitalDelayType := 0.000 ns;
    ticd_C1 : VitalDelayType := 0.000 ns;

    tipd_C0 : VitalDelayType01 := (0 ps, 0 ps);
    tipd_C1 : VitalDelayType01 := (0 ps, 0 ps);
    tipd_CE : VitalDelayType01 := (0 ps, 0 ps);
    tipd_D0 : VitalDelayType01 := (0 ps, 0 ps);
    tipd_D1 : VitalDelayType01 := (0 ps, 0 ps);
    tipd_R : VitalDelayType01 := (0 ps, 0 ps);
    tipd_S : VitalDelayType01 := (0 ps, 0 ps);

    tisd_CE_C0 : VitalDelayType := 0.000 ns;
    tisd_CE_C1 : VitalDelayType := 0.000 ns;
    tisd_D0_C0 : VitalDelayType := 0.000 ns;
    tisd_D1_C1 : VitalDelayType := 0.000 ns;
    tisd_R_C0 : VitalDelayType := 0.000 ns;
    tisd_R_C1 : VitalDelayType := 0.000 ns;
    tisd_S_C0 : VitalDelayType := 0.000 ns;
    tisd_S_C1 : VitalDelayType := 0.000 ns;

    tpd_C0_Q : VitalDelayType01 := (100 ps, 100 ps);
    tpd_C1_Q : VitalDelayType01 := (100 ps, 100 ps);

    tpw_C0_negedge : VitalDelayType := 0.000 ns;
    tpw_C0_posedge : VitalDelayType := 0.000 ns;
    tpw_C1_negedge : VitalDelayType := 0.000 ns;
    tpw_C1_posedge : VitalDelayType := 0.000 ns;
    tpw_R_posedge : VitalDelayType := 0.000 ns;
    tpw_S_posedge : VitalDelayType := 0.000 ns;

    tsetup_CE_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_CE_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_CE_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_CE_C1_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_D0_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_D0_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_D1_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_D1_C1_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_R_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_R_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_R_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_R_C1_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_S_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_S_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_S_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_S_C1_posedge_posedge : VitalDelayType := 0.000 ns;

    INIT : bit := '0'
    );

  port(
    Q : out std_ulogic;
    
    C0 : in std_ulogic;
    C1 : in std_ulogic;
    CE : in std_ulogic;
    D0 : in std_ulogic;
    D1 : in std_ulogic;
    R : in std_ulogic;
    S : in std_ulogic
    );
  attribute VITAL_LEVEL0 of
    X_FDDRRSE : entity is true;
end X_FDDRRSE;

architecture X_FDDRRSE_V of X_FDDRRSE is

  signal C0_ipd : std_ulogic := 'X';
  signal C1_ipd : std_ulogic := 'X';
  signal CE_ipd : std_ulogic := 'X';
  signal D0_ipd : std_ulogic := 'X';
  signal D1_ipd : std_ulogic := 'X';
  signal GSR_ipd : std_ulogic := '0';
  signal R_ipd : std_ulogic := 'X';
  signal S_ipd : std_ulogic := 'X';

  signal C0_dly : std_ulogic := 'X';
  signal C1_dly : std_ulogic := 'X';
  signal CE_C0_dly : std_ulogic := 'X';
  signal CE_C1_dly : std_ulogic := 'X';
  signal D0_C0_dly : std_ulogic := 'X';
  signal D1_C1_dly : std_ulogic := 'X';
  signal GSR_C0_dly : std_ulogic := '0';
  signal GSR_C1_dly : std_ulogic := '0';
  signal R_C0_dly : std_ulogic := 'X';
  signal R_C1_dly : std_ulogic := 'X';
  signal S_C0_dly : std_ulogic := 'X';
  signal S_C1_dly : std_ulogic := 'X';


begin

  GSR_C0_dly <= GSR;
  GSR_C1_dly <= GSR;
  GSR_ipd <= GSR;

  WireDelay : block
  begin
    VitalWireDelay (C0_ipd, C0, tipd_C0);
    VitalWireDelay (C1_ipd, C1, tipd_C1);
    VitalWireDelay (CE_ipd, CE, tipd_CE);
    VitalWireDelay (D0_ipd, D0, tipd_D0);
    VitalWireDelay (D1_ipd, D1, tipd_D1);
    VitalWireDelay (R_ipd, R, tipd_R);
    VitalWireDelay (S_ipd, S, tipd_S);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (C0_dly, C0_ipd, ticd_C0);
    VitalSignalDelay (C1_dly, C1_ipd, ticd_C1);
    VitalSignalDelay (CE_C0_dly, CE_ipd, tisd_CE_C0);
    VitalSignalDelay (CE_C1_dly, CE_ipd, tisd_CE_C1);
    VitalSignalDelay (D0_C0_dly, D0_ipd, tisd_D0_C0);
    VitalSignalDelay (D1_C1_dly, D1_ipd, tisd_D1_C1);
    VitalSignalDelay (R_C0_dly, R_ipd, tisd_R_C0);
    VitalSignalDelay (R_C1_dly, R_ipd, tisd_R_C1);
    VitalSignalDelay (S_C0_dly, S_ipd, tisd_S_C0);
    VitalSignalDelay (S_C1_dly, S_ipd, tisd_S_C1);
  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------
  VITALBehavior : process

    variable PInfo_C0 : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_C1 : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_R : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_S : VitalPeriodDataType := VitalPeriodDataInit;    

    variable Pviol_C0 : std_ulogic := '0';
    variable Pviol_C1 : std_ulogic := '0';
    variable Pviol_R : std_ulogic := '0';
    variable Pviol_S : std_ulogic := '0';    

    variable Tmkr_R_C0_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_S_C0_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_R_C1_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_S_C1_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_D0_C0_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CE_C0_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_D1_C1_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CE_C1_posedge : VitalTimingDataType := VitalTimingDataInit;

    variable Tviol_S_C0_posedge : std_ulogic := '0';
    variable Tviol_R_C0_posedge : std_ulogic := '0';
    variable Tviol_S_C1_posedge : std_ulogic := '0';
    variable Tviol_R_C1_posedge : std_ulogic := '0';
    variable Tviol_D0_C0_posedge : std_ulogic := '0';
    variable Tviol_CE_C0_posedge : std_ulogic := '0';
    variable Tviol_D1_C1_posedge : std_ulogic := '0';
    variable Tviol_CE_C1_posedge : std_ulogic := '0';

    variable FIRST_TIME : boolean := true;
    variable Q_zd : std_logic := To_X01(INIT);

    variable Q_GlitchData : VitalGlitchDataType;

  begin

    if (FIRST_TIME) then
      Q <= TO_X01(INIT);
      FIRST_TIME := false;
    end if;
    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation => Tviol_D0_C0_posedge,
        TimingData => Tmkr_D0_C0_posedge,
        TestSignal => D0_ipd,
        TestSignalName => "D0",
        TestDelay => tisd_D0_C0,
        RefSignal => C0_dly,
        RefSignalName => "C0",
        RefDelay => ticd_C0,
        SetupHigh => tsetup_D0_C0_posedge_posedge,
        SetupLow => tsetup_D0_C0_negedge_posedge,
        HoldLow => thold_D0_C0_posedge_posedge,
        HoldHigh => thold_D0_C0_negedge_posedge,
        CheckEnabled => (((not GSR_C0_dly) and (not R_C0_dly) and (not S_C0_dly) and CE) /= '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRRSE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_CE_C0_posedge,
        TimingData => Tmkr_CE_C0_posedge,
        TestSignal => CE_ipd,
        TestSignalName => "CE",
        TestDelay => tisd_CE_C0,
        RefSignal => C0_dly,
        RefSignalName => "C0",
        RefDelay => ticd_C0,
        SetupHigh => tsetup_CE_C0_posedge_posedge,
        SetupLow => tsetup_CE_C0_negedge_posedge,
        HoldLow => thold_CE_C0_posedge_posedge,
        HoldHigh => thold_CE_C0_negedge_posedge,
        CheckEnabled => (((not GSR_C0_dly) and (not R_C0_dly) and (not S_C0_dly) and (D0_C0_dly xor Q_zd)) /= '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRRSE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_D1_C1_posedge,
        TimingData => Tmkr_D1_C1_posedge,
        TestSignal => D1_ipd,
        TestSignalName => "D1",
        TestDelay => tisd_D1_C1,
        RefSignal => C1_dly,
        RefSignalName => "C1",
        RefDelay => ticd_C1,
        SetupHigh => tsetup_D1_C1_posedge_posedge,
        SetupLow => tsetup_D1_C1_negedge_posedge,
        HoldLow => thold_D1_C1_posedge_posedge,
        HoldHigh => thold_D1_C1_negedge_posedge,
        CheckEnabled => (((not GSR_C1_dly) and (not R_C1_dly) and (not S_C1_dly) and CE) /= '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRRSE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_CE_C1_posedge,
        TimingData => Tmkr_CE_C1_posedge,
        TestSignal => CE_ipd,
        TestSignalName => "CE",
        TestDelay => tisd_CE_C1,
        RefSignal => C1_dly,
        RefSignalName => "C1",
        RefDelay => ticd_C1,
        SetupHigh => tsetup_CE_C1_posedge_posedge,
        SetupLow => tsetup_CE_C1_negedge_posedge,
        HoldLow => thold_CE_C1_posedge_posedge,
        HoldHigh => thold_CE_C1_negedge_posedge,
        CheckEnabled => (((not GSR_C1_dly) and (not R_C1_dly) and (not S_C1_dly) and (D1_C1_dly xor Q_zd)) /= '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRRSE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);

      VitalSetupHoldCheck (
        Violation => Tviol_R_C0_posedge,
        TimingData => Tmkr_R_C0_posedge,
        TestSignal => R_ipd,
        TestSignalName => "R",
        TestDelay => tisd_R_C0,
        RefSignal => C0_dly,
        RefSignalName => "C0",
        RefDelay => ticd_C0,
        SetupHigh => tsetup_R_C0_posedge_posedge,
        SetupLow => tsetup_R_C0_negedge_posedge,
        HoldLow => thold_R_C0_posedge_posedge,
        HoldHigh => thold_R_C0_negedge_posedge,
        CheckEnabled => (GSR_C0_dly = '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRRSE",
        Xon => Xon,
        MsgOn => true,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_R_C1_posedge,
        TimingData => Tmkr_R_C1_posedge,
        TestSignal => R_ipd,
        TestSignalName => "R",
        TestDelay => tisd_R_C1,
        RefSignal => C1_dly,
        RefSignalName => "C1",
        RefDelay => ticd_C1,
        SetupHigh => tsetup_R_C1_posedge_posedge,
        SetupLow => tsetup_R_C1_negedge_posedge,
        HoldLow => thold_R_C1_posedge_posedge,
        HoldHigh => thold_R_C1_negedge_posedge,
        CheckEnabled => (GSR_C1_dly = '1'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRRSE",
        Xon => Xon,
        MsgOn => true,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_S_C0_posedge,
        TimingData => Tmkr_S_C0_posedge,
        TestSignal => S_ipd,
        TestSignalName => "S",
        TestDelay => tisd_S_C0,
        RefSignal => C0_dly,
        RefSignalName => "C0",
        RefDelay => ticd_C0,
        SetupHigh => tsetup_S_C0_posedge_posedge,
        SetupLow => tsetup_S_C0_negedge_posedge,
        HoldLow => thold_S_C0_posedge_posedge,
        HoldHigh => thold_S_C0_negedge_posedge,
        CheckEnabled => (((not GSR_C0_dly) and (not R_C0_dly)) /= '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRRSE",
        Xon => Xon,
        MsgOn => true,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_S_C1_posedge,
        TimingData => Tmkr_S_C1_posedge,
        TestSignal => S_ipd,
        TestSignalName => "S",
        TestDelay => tisd_S_C1,
        RefSignal => C1_dly,
        RefSignalName => "C1",
        RefDelay => ticd_C1,
        SetupHigh => tsetup_S_C1_posedge_posedge,
        SetupLow => tsetup_S_C1_negedge_posedge,
        HoldLow => thold_S_C1_posedge_posedge,
        HoldHigh => thold_S_C1_negedge_posedge,
        CheckEnabled => (((not GSR_C1_dly) and (not R_C1_dly)) /= '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRRSE",
        Xon => Xon,
        MsgOn => true,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        Violation => Pviol_C0,
        PeriodData => PInfo_C0,
        TestSignal => C0_dly,
        TestSignalName => "C0",
        TestDelay => ticd_C0,
        Period => 0 ns,
        PulseWidthHigh => tpw_C0_posedge,
        PulseWidthLow => tpw_C0_negedge,
        CheckEnabled => true,
        HeaderMsg => "/X_FDDRCPE",
        Xon => Xon,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        Violation => Pviol_C1,
        PeriodData => PInfo_C1,
        TestSignal => C1_dly,
        TestSignalName => "C1",
        TestDelay => ticd_C1,
        Period => 0 ns,
        PulseWidthHigh => tpw_C1_posedge,
        PulseWidthLow => tpw_C1_negedge,
        CheckEnabled => true,
        HeaderMsg => "/X_FDDRCPE",
        Xon => Xon,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        Violation => Pviol_R,
        PeriodData => PInfo_R,
        TestSignal => R_ipd,
        TestSignalName => "R",
        TestDelay => 0 ns,
        Period => 0 ns,
        PulseWidthHigh => tpw_R_posedge,
        PulseWidthLow => 0 ns,
        CheckEnabled => true,
        HeaderMsg => "/X_FDDRCPE",
        Xon => Xon,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        Violation => Pviol_S,
        PeriodData => PInfo_S,
        TestSignal => S_ipd,
        TestSignalName => "S",
        TestDelay => 0 ns,
        Period => 0 ns,
        PulseWidthHigh => tpw_S_posedge,
        PulseWidthLow => 0 ns,
        CheckEnabled => true,
        HeaderMsg => "/X_FDDRCPE",
        Xon => Xon,
        MsgOn => MsgOn,
        MsgSeverity => warning);
    end if;
    if (GSR_ipd'event) then
      if (GSR_ipd = '1') then
	Q_zd := TO_X01(INIT);
      end if;
    end if;
    if ((rising_edge(C0_dly) = true) and (GSR_C0_dly = '0')) then
      if (R_C0_dly = '1') then
        Q_zd := '0';
      elsif (S_C0_dly = '1' ) then
        Q_zd := '1';
      elsif (CE_C0_dly = '1' ) then
        Q_zd := D0_C0_dly;
      end if;
    end if;

    if ((rising_edge(C1_dly) = true) and (GSR_C1_dly = '0')) then
      if (R_C1_dly = '1') then
        Q_zd := '0';
      elsif (S_C1_dly = '1' ) then
        Q_zd := '1';
      elsif (CE_C1_dly = '1') then
        Q_zd := D1_C1_dly;
      end if;
    end if;

    ----------------------
    --  Path Delay Section
    ----------------------

    VitalPathDelay01 (
      OutSignal => Q,
      GlitchData => Q_GlitchData,
      OutSignalName => "Q",
      OutTemp => Q_zd,
      Paths => (0 => (C0_dly'last_event, tpd_C0_Q, true),
                1 => (C1_dly'last_event, tpd_C1_Q, true)),
      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => MsgOn,
      MsgSeverity => warning);

    wait on GSR_ipd, R_ipd, S_ipd, C0_dly, C1_dly, CE_C0_dly, CE_C1_dly, D0_C0_dly, D1_C1_dly, GSR_C0_dly, GSR_C1_dly, R_C0_dly, R_C1_dly, S_C0_dly, S_C1_dly;
  end process VITALBehavior;

end X_FDDRRSE_V;
