-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_FDDRCPE.vhd,v 1.4 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Dual Data Rate D Flip-Flop with Asynchronous Clear and Preset and Clock Enable
-- /___/   /\     Filename : X_FDDRCPE.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:08 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    05/27/08 - CR 472154 Removed Vital GSR constructs
--    06/19/08 - Assign GSR_ipd to GSR (CR474587).
-- End Revision

----- CELL X_FDDRCPE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Primitives.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

entity X_FDDRCPE is
  generic(
    TimingChecksOn : boolean := true;
    Xon : boolean := true;
    MsgOn : boolean := true;
    LOC            : string  := "UNPLACED";

    tbpd_CLR_Q_C0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tbpd_PRE_Q_C0 : VitalDelayType01 := (0.000 ns, 0.000 ns);

    thold_CE_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_CE_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_CE_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_CE_C1_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_D0_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_D0_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_D1_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_D1_C1_posedge_posedge : VitalDelayType := 0.000 ns;

    ticd_C0 : VitalDelayType := 0.000 ns;
    ticd_C1 : VitalDelayType := 0.000 ns;

    tipd_C0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_C1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_CE : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_CLR : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_D0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_D1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_PRE : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tisd_CE_C0 : VitalDelayType := 0.000 ns;
    tisd_CE_C1 : VitalDelayType := 0.000 ns;
    tisd_CLR_C0 : VitalDelayType := 0.000 ns;
    tisd_CLR_C1 : VitalDelayType := 0.000 ns;
    tisd_D0_C0 : VitalDelayType := 0.000 ns;
    tisd_D1_C1 : VitalDelayType := 0.000 ns;
    tisd_PRE_C0 : VitalDelayType := 0.000 ns;
    tisd_PRE_C1 : VitalDelayType := 0.000 ns;

    tpd_C0_Q : VitalDelayType01 := (0.100 ns, 0.100 ns);
    tpd_C1_Q : VitalDelayType01 := (0.100 ns, 0.100 ns);
    tpd_CLR_Q : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_PRE_Q : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpw_C0_negedge : VitalDelayType := 0.000 ns;
    tpw_C0_posedge : VitalDelayType := 0.000 ns;
    tpw_C1_negedge : VitalDelayType := 0.000 ns;
    tpw_C1_posedge : VitalDelayType := 0.000 ns;
    tpw_CLR_posedge : VitalDelayType := 0.000 ns;
    tpw_PRE_posedge : VitalDelayType := 0.000 ns;

    trecovery_CLR_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    trecovery_CLR_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    trecovery_PRE_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    trecovery_PRE_C1_negedge_posedge : VitalDelayType := 0.000 ns;

    tremoval_CLR_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    tremoval_CLR_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    tremoval_PRE_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    tremoval_PRE_C1_negedge_posedge : VitalDelayType := 0.000 ns;

    tsetup_CE_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_CE_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_CE_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_CE_C1_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_D0_C0_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_D0_C0_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_D1_C1_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_D1_C1_posedge_posedge : VitalDelayType := 0.000 ns;

    INIT : bit := '0'
    );

  port(
    Q : out std_ulogic;
    
    C0 : in std_ulogic;
    C1 : in std_ulogic;
    CE : in std_ulogic;
    CLR : in std_ulogic;
    D0 : in std_ulogic;
    D1 : in std_ulogic;
    PRE : in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_FDDRCPE : entity is true;
end X_FDDRCPE;

architecture X_FDDRCPE_V of X_FDDRCPE is
-- attribute VITAL_LEVEL1 of X_FDDRCPE_V : architecture is TRUE;

  signal C0_ipd : std_ulogic := 'X';
  signal C1_ipd : std_ulogic := 'X';
  signal CE_ipd : std_ulogic := 'X';
  signal CLR_ipd : std_ulogic := 'X';
  signal D0_ipd : std_ulogic := 'X';
  signal D1_ipd : std_ulogic := 'X';
  signal GSR_ipd : std_ulogic := 'X';
  signal PRE_ipd : std_ulogic := 'X';

  signal C0_dly : std_ulogic := 'X';
  signal C1_dly : std_ulogic := 'X';
  signal CE_C0_dly : std_ulogic := 'X';
  signal CE_C1_dly : std_ulogic := 'X';
  signal CLR_C0_dly : std_ulogic := 'X';
  signal CLR_C1_dly : std_ulogic := 'X';
  signal D0_C0_dly : std_ulogic := 'X';
  signal D1_C1_dly : std_ulogic := 'X';
  signal GSR_C0_dly : std_ulogic := '0';
  signal GSR_C1_dly : std_ulogic := '0';
  signal PRE_C0_dly : std_ulogic := 'X';
  signal PRE_C1_dly : std_ulogic := 'X';


begin

  GSR_C0_dly <= GSR;
  GSR_C1_dly <= GSR;
  GSR_ipd <= GSR;

  WireDelay : block
  begin
    VitalWireDelay (C0_ipd, C0, tipd_C0);
    VitalWireDelay (C1_ipd, C1, tipd_C1);
    VitalWireDelay (CE_ipd, CE, tipd_CE);
    VitalWireDelay (CLR_ipd, CLR, tipd_CLR);
    VitalWireDelay (D0_ipd, D0, tipd_D0);
    VitalWireDelay (D1_ipd, D1, tipd_D1);
    VitalWireDelay (PRE_ipd, PRE, tipd_PRE);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (C0_dly, C0_ipd, ticd_C0);
    VitalSignalDelay (C1_dly, C1_ipd, ticd_C1);
    VitalSignalDelay (CE_C0_dly, CE_ipd, tisd_CE_C0);
    VitalSignalDelay (CE_C1_dly, CE_ipd, tisd_CE_C1);
    VitalSignalDelay (CLR_C0_dly, CLR_ipd, tisd_CLR_C0);
    VitalSignalDelay (CLR_C1_dly, CLR_ipd, tisd_CLR_C1);
    VitalSignalDelay (D0_C0_dly, D0_ipd, tisd_D0_C0);
    VitalSignalDelay (D1_C1_dly, D1_ipd, tisd_D1_C1);
    VitalSignalDelay (PRE_C0_dly, PRE_ipd, tisd_PRE_C0);
    VitalSignalDelay (PRE_C1_dly, PRE_ipd, tisd_PRE_C1);
  end block;

  VITALBehavior : process

    variable PInfo_C0 : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_C1 : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_CLR : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_PRE : VitalPeriodDataType := VitalPeriodDataInit;

    variable Pviol_C0 : std_ulogic := '0';
    variable Pviol_C1 : std_ulogic := '0';
    variable Pviol_CLR : std_ulogic := '0';
    variable Pviol_PRE : std_ulogic := '0';

    variable Tmkr_CLR_C0_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_PRE_C0_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CLR_C1_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_PRE_C1_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_D0_C0_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CE_C0_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_D1_C1_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CE_C1_posedge : VitalTimingDataType := VitalTimingDataInit;

    variable Tviol_CLR_C0_posedge : std_ulogic := '0';
    variable Tviol_PRE_C0_posedge : std_ulogic := '0';
    variable Tviol_CLR_C1_posedge : std_ulogic := '0';
    variable Tviol_PRE_C1_posedge : std_ulogic := '0';
    variable Tviol_D0_C0_posedge : std_ulogic := '0';
    variable Tviol_CE_C0_posedge : std_ulogic := '0';
    variable Tviol_D1_C1_posedge : std_ulogic := '0';
    variable Tviol_CE_C1_posedge : std_ulogic := '0';

    variable FIRST_TIME : boolean := true;
    variable Q_GlitchData : VitalGlitchDataType;
    variable Q_zd : std_logic := To_X01(INIT);

  begin
    if (FIRST_TIME) then
      Q <= TO_X01(INIT);
      FIRST_TIME := false;
    end if;

    if (TimingChecksOn) then
      VitalRecoveryRemovalCheck (
        Violation => Tviol_CLR_C0_posedge,
        TimingData => Tmkr_CLR_C0_posedge,
        TestSignal => C0_dly,
        TestSignalName => "C0",
        TestDelay => ticd_C0,
        RefSignal => CLR_C0_dly,
        RefSignalName => "CLR",
        RefDelay => tisd_CLR_C0,
        Recovery => trecovery_CLR_C0_negedge_posedge,
        Removal => tremoval_CLR_C0_negedge_posedge,
        ActiveLow => false,
        CheckEnabled => (GSR_C0_dly = '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRCPE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalRecoveryRemovalCheck (
        Violation => Tviol_PRE_C0_posedge,
        TimingData => Tmkr_PRE_C0_posedge,
        TestSignal => C0_dly,
        TestSignalName => "C0",
        TestDelay => ticd_C0,
        RefSignal => PRE_C0_dly,
        RefSignalName => "PRE",
        RefDelay => tisd_PRE_C0,
        Recovery => trecovery_PRE_C0_negedge_posedge,
        Removal => tremoval_PRE_C0_negedge_posedge,
        ActiveLow => false,
        CheckEnabled => ((not CLR_C0_dly) and (not GSR_C0_dly)) /= '0',
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRCPE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalRecoveryRemovalCheck (
        Violation => Tviol_CLR_C1_posedge,
        TimingData => Tmkr_CLR_C1_posedge,
        TestSignal => C1_dly,
        TestSignalName => "C1",
        TestDelay => ticd_C1,
        RefSignal => CLR_C1_dly,
        RefSignalName => "CLR",
        RefDelay => tisd_CLR_C1,
        Recovery => trecovery_CLR_C1_negedge_posedge,
        Removal => tremoval_CLR_C1_negedge_posedge,
        ActiveLow => false,
        CheckEnabled => (GSR_C1_dly = '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRCPE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalRecoveryRemovalCheck (
        Violation => Tviol_PRE_C1_posedge,
        TimingData => Tmkr_PRE_C1_posedge,
        TestSignal => C1_dly,
        TestSignalName => "C1",
        TestDelay => ticd_C1,
        RefSignal => PRE_C1_dly,
        RefSignalName => "PRE",
        RefDelay => tisd_PRE_C1,
        Recovery => trecovery_PRE_C1_negedge_posedge,
        Removal => tremoval_PRE_C1_negedge_posedge,
        ActiveLow => false,
        CheckEnabled => (((not CLR_C1_dly) and (not GSR_C1_dly)) /= '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRCPE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_D0_C0_posedge,
        TimingData => Tmkr_D0_C0_posedge,
        TestSignal => D0_C0_dly,
        TestSignalName => "D0",
        TestDelay => tisd_D0_C0,
        RefSignal => C0_dly,
        RefSignalName => "C0",
        RefDelay => ticd_C0,
        SetupHigh => tsetup_D0_C0_posedge_posedge,
        SetupLow => tsetup_D0_C0_negedge_posedge,
        HoldLow => thold_D0_C0_posedge_posedge,
        HoldHigh => thold_D0_C0_negedge_posedge,
        CheckEnabled => (((not GSR_C0_dly) and (not CLR_C0_dly) and (not PRE_C0_dly) and CE) /= '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRCPE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_CE_C0_posedge,
        TimingData => Tmkr_CE_C0_posedge,
        TestSignal => CE_C0_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_C0,
        RefSignal => C0_dly,
        RefSignalName => "C0",
        RefDelay => ticd_C0,
        SetupHigh => tsetup_CE_C0_posedge_posedge,
        SetupLow => tsetup_CE_C0_negedge_posedge,
        HoldLow => thold_CE_C0_posedge_posedge,
        HoldHigh => thold_CE_C0_negedge_posedge,
        CheckEnabled => (((not GSR_C0_dly) and (not CLR_C0_dly) and (not PRE_C0_dly) and (D0_C0_dly xor Q_zd)) /= '0' ),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRCPE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_D1_C1_posedge,
        TimingData => Tmkr_D1_C1_posedge,
        TestSignal => D1_C1_dly,
        TestSignalName => "D1",
        TestDelay => tisd_D1_C1,
        RefSignal => C1_dly,
        RefSignalName => "C1",
        RefDelay => ticd_C1,
        SetupHigh => tsetup_D1_C1_posedge_posedge,
        SetupLow => tsetup_D1_C1_negedge_posedge,
        HoldLow => thold_D1_C1_posedge_posedge,
        HoldHigh => thold_D1_C1_negedge_posedge,
        CheckEnabled => (((not GSR_C1_dly) and (not CLR_C1_dly) and (not PRE_C1_dly) and CE) /= '0'),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRCPE",
        Xon => XOn,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalSetupHoldCheck (
        Violation => Tviol_CE_C1_posedge,
        TimingData => Tmkr_CE_C1_posedge,
        TestSignal => CE_C1_dly,
        TestSignalName => "CE",
        TestDelay => tisd_CE_C1,
        RefSignal => C1_dly,
        RefSignalName => "C1",
        RefDelay => ticd_C1,
        SetupHigh => tsetup_CE_C1_posedge_posedge,
        SetupLow => tsetup_CE_C1_negedge_posedge,
        HoldLow => thold_CE_C1_posedge_posedge,
        HoldHigh => thold_CE_C1_negedge_posedge,
        CheckEnabled => (((not GSR_C1_dly) and (not CLR_C1_dly) and (not PRE_C1_dly) and (D1_C1_dly xor Q_zd)) /= '0' ),
        RefTransition => 'R',
        HeaderMsg => "/X_FDDRCPE",
        Xon => XOn,
        MsgOn => MsgOn,
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
        Violation => Pviol_CLR,
        PeriodData => PInfo_CLR,
        TestSignal => CLR_ipd,
        TestSignalName => "CLR",
        TestDelay => 0 ns,
        Period => 0 ns,
        PulseWidthHigh => tpw_CLR_posedge,
        PulseWidthLow => 0 ns,
        CheckEnabled => true,
        HeaderMsg => "/X_FDDRCPE",
        Xon => Xon,
        MsgOn => MsgOn,
        MsgSeverity => warning);
      VitalPeriodPulseCheck (
        Violation => Pviol_PRE,
        PeriodData => PInfo_PRE,
        TestSignal => PRE_ipd,
        TestSignalName => "PRE",
        TestDelay => 0 ns,
        Period => 0 ns,
        PulseWidthHigh => tpw_PRE_posedge,
        PulseWidthLow => 0 ns,
        CheckEnabled => true,
        HeaderMsg => "/X_FDDRCPE",
        Xon => Xon,
        MsgOn => MsgOn,
        MsgSeverity => warning);
    end if;
    if (GSR_ipd = '1') then
	Q_zd := TO_X01(INIT);
    elsif (GSR_ipd = '0') then
      if (CLR_ipd = '1') then
        Q_zd := '0';
      elsif (PRE_ipd = '1' ) then
        Q_zd := '1';
      elsif ( rising_edge(C0_dly) = true) then
        if (CE_C0_dly = '1' ) then
          Q_zd := D0_C0_dly;
        end if;
      elsif (rising_edge(C1_dly) = true ) then
        if (CE_C1_dly = '1') then
          Q_zd := D1_C1_dly;
        end if;
      end if;
    end if;

    VitalPathDelay01 (
      OutSignal => Q,
      GlitchData => Q_GlitchData,
      OutSignalName => "Q",
      OutTemp => Q_zd,
      Paths => (0 => (C0_dly'last_event, tpd_C0_Q, true),
                1 => (C1_dly'last_event, tpd_C1_Q, true),
                2 => (CLR_ipd'last_event, tpd_CLR_Q, true),
                3 => (PRE_ipd'last_event, tpd_PRE_Q, true)),

      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => MsgOn,
      MsgSeverity => warning);

    

    wait on CLR_ipd, GSR_ipd, PRE_ipd, C0_dly, C1_dly, CE_C0_dly, CE_C1_dly, CLR_C0_dly, CLR_C1_dly, D0_C0_dly, D1_C1_dly, GSR_C0_dly, GSR_C1_dly, PRE_C0_dly, PRE_C1_dly;
  end process VITALBehavior;

end X_FDDRCPE_V;
