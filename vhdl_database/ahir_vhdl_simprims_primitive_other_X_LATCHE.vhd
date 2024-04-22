-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_LATCHE.vhd,v 1.1 2008/06/19 17:05:31 vandanad Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Transparent Data Latch with Gate Enable
-- /___/   /\     Filename : X_LATCHE.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:09 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    02/08/06 - CR 224929 -- FP -- Added Removal Checks
--    09/08/06 - Change generics to XON and MSGON. Add MSGON to timing check (CR423428).
--    05/20/08 - Remove GSR Vital (CR444306)
--    06/03/08 - CR 472154 Removed Vital GSR/PRLD constructs
-- End Revision

----- CELL X_LATCHE -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_LATCHE is
  generic(
      TimingChecksOn : boolean := true;
      XON            : boolean := true;
      MSGON          : boolean := true;
      LOC            : string  := "UNPLACED";

      INIT           : bit     := '0';

      tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_GE : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_RST : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_SET : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_CLK_O  : VitalDelayType01 := (0.100 ns, 0.100 ns);
      tpd_GE_O   : VitalDelayType01 := (0.100 ns, 0.100 ns);
      tpd_I_O    : VitalDelayType01 := (0.100 ns, 0.100 ns);
      tpd_RST_O  : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_SET_O  : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tsetup_GE_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      tsetup_GE_CLK_posedge_negedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_posedge_negedge : VitalDelayType := 0.000 ns;

      thold_GE_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      thold_GE_CLK_posedge_negedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_posedge_negedge : VitalDelayType := 0.000 ns;

      thold_RST_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      thold_SET_CLK_negedge_negedge : VitalDelayType := 0.000 ns;

      trecovery_RST_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      trecovery_SET_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      tremoval_RST_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      tremoval_SET_CLK_negedge_negedge : VitalDelayType := 0.000 ns;

      ticd_CLK : VitalDelayType := 0.000 ns;
      tisd_GE_CLK : VitalDelayType := 0.000 ns;
      tisd_I_CLK : VitalDelayType := 0.000 ns;
      tisd_RST_CLK : VitalDelayType := 0.000 ns;
      tisd_SET_CLK : VitalDelayType := 0.000 ns;

      tpw_CLK_negedge : VitalDelayType := 0.000 ns;
      tpw_CLK_posedge : VitalDelayType := 0.000 ns;
      tpw_RST_posedge : VitalDelayType := 0.000 ns;
      tpw_SET_posedge : VitalDelayType := 0.000 ns
    );

  port(
    O   : out std_ulogic;
    CLK : in  std_ulogic;
    GE  : in  std_ulogic;
    I   : in  std_ulogic;
    RST : in  std_ulogic;
    SET : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_LATCHE : entity is true;
end X_LATCHE;

architecture X_LATCHE_V of X_LATCHE is
--  attribute VITAL_LEVEL1 of
--    X_LATCHE_V : architecture is true;
  signal CLK_resolved  : std_ulogic := 'X';
  signal GE_resolved   : std_ulogic := 'X';
  signal GSR_resolved  : std_ulogic := 'X';
  signal I_resolved    : std_ulogic := 'X';
  signal PRLD_resolved : std_ulogic := 'X';
  signal RST_resolved  : std_ulogic := 'X';
  signal SET_resolved  : std_ulogic := 'X';
  
  signal CLK_ipd : std_ulogic := 'X';
  signal GE_ipd  : std_ulogic := 'X';
  signal I_ipd   : std_ulogic := 'X';
  signal RST_ipd : std_ulogic := 'X';
  signal SET_ipd : std_ulogic := 'X';

  signal CLK_dly : std_ulogic := 'X';
  signal GE_dly  : std_ulogic := 'X';
  signal I_dly   : std_ulogic := 'X';
  signal RST_dly : std_ulogic := 'X';
  signal SET_dly : std_ulogic := 'X';
begin
  CLK_resolved   <= To_X01(CLK);
  GE_resolved    <= To_X01(GE);
  GSR_resolved   <= To_X01(GSR);
  I_resolved     <= To_X01(I);
  PRLD_resolved  <= To_X01(PRLD);
  RST_resolved   <= To_X01(RST);
  SET_resolved   <= To_X01(SET);
  
  WireDelay      : block
  begin
    VitalWireDelay (CLK_ipd, CLK_resolved, tipd_CLK);
    VitalWireDelay (GE_ipd, GE_resolved, tipd_GE);
    VitalWireDelay (I_ipd, I_resolved, tipd_I);
    VitalWireDelay (RST_ipd, RST_resolved, tipd_RST);
    VitalWireDelay (SET_ipd, SET_resolved, tipd_SET);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CLK_dly, CLK_ipd, ticd_CLK);
    VitalSignalDelay (GE_dly, GE_ipd, tisd_GE_CLK);
    VitalSignalDelay (I_dly, I_ipd, tisd_I_CLK);
    VitalSignalDelay (RST_dly, RST_ipd, tisd_RST_CLK);
    VitalSignalDelay (SET_dly, SET_ipd, tisd_SET_CLK);
  end block;

  VITALBehavior        : process (CLK_dly, GE_dly, GSR_resolved, I_dly, PRLD_resolved, RST_dly, SET_dly)
    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_RST : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_SET : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_CLK : std_ulogic          := '0';
    variable Pviol_RST : std_ulogic          := '0';
    variable Pviol_SET : std_ulogic          := '0';

    variable Tmkr_GE_CLK_negedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_I_CLK_negedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RST_CLK_negedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SET_CLK_negedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_GE_CLK_negedge  : std_ulogic          := '0';
    variable Tviol_I_CLK_negedge   : std_ulogic          := '0';
    variable Tviol_RST_CLK_negedge : std_ulogic          := '0';
    variable Tviol_SET_CLK_negedge : std_ulogic          := '0';

    variable Violation    : std_ulogic := '0';
    variable PrevData_O   : std_logic_vector(0 to 4);
    variable O_zd         : std_ulogic := TO_X01(INIT);
    variable O_GlitchData : VitalGlitchDataType;
    variable tmp_PRLD_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

  begin

    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation      => Tviol_I_CLK_negedge,
        TimingData     => Tmkr_I_CLK_negedge,
        TestSignal     => I_dly,
        TestSignalName => "I",
        TestDelay      => 0 ps,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => 0 ps,
        SetupHigh      => tsetup_I_CLK_posedge_negedge,
        SetupLow       => tsetup_I_CLK_negedge_negedge,
        HoldHigh       => thold_I_CLK_posedge_negedge,
        HoldLow        => thold_I_CLK_negedge_negedge,
        CheckEnabled   => TO_X01(((not RST_dly)) and (GE_dly)
                                 and ((not SET_dly))) /= '0',
        RefTransition  => 'F',
        HeaderMsg      => "/X_LATCHE",
        Xon            => XON,
        MsgOn          => MSGON,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_GE_CLK_negedge,
        TimingData     => Tmkr_GE_CLK_negedge,
        TestSignal     => GE_dly,
        TestSignalName => "GE",
        TestDelay      => 0 ps,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => 0 ps,
        SetupHigh      => tsetup_GE_CLK_posedge_negedge,
        SetupLow       => tsetup_GE_CLK_negedge_negedge,
        HoldHigh       => thold_GE_CLK_posedge_negedge,
        HoldLow        => thold_GE_CLK_negedge_negedge,
        CheckEnabled   => TO_X01(((not RST_dly)) and ((O_zd) xor (I_dly))
                                 and ((not SET_dly))) /= '0',
        RefTransition  => 'F',
        HeaderMsg      => "/X_LATCHE",
        Xon            => XON,
        MsgOn          => MSGON,
        MsgSeverity    => warning);
      VitalRecoveryRemovalCheck (
        Violation      => Tviol_RST_CLK_negedge,
        TimingData     => Tmkr_RST_CLK_negedge,
        TestSignal     => RST_dly,
        TestSignalName => "RST",
        TestDelay      => 0 ps,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => 0 ps,
        Recovery       => trecovery_RST_CLK_negedge_negedge,
        Removal        => thold_RST_CLK_negedge_negedge,
        ActiveLow      => false,
        CheckEnabled   => TO_X01(GE_dly) /= '0',
        RefTransition  => 'F',
        HeaderMsg      => "/X_LATCHE",
        Xon            => XON,
        MsgOn          => MSGON,
        MsgSeverity    => warning);
      VitalRecoveryRemovalCheck (
        Violation      => Tviol_SET_CLK_negedge,
        TimingData     => Tmkr_SET_CLK_negedge,
        TestSignal     => SET_dly,
        TestSignalName => "SET",
        TestDelay      => 0 ps,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => 0 ps,
        Recovery       => trecovery_SET_CLK_negedge_negedge,
        Removal        => thold_SET_CLK_negedge_negedge,
        ActiveLow      => false,
        CheckEnabled   => TO_X01(((not RST_dly)) and (GE_dly)) /= '0',
        RefTransition  => 'F',
        HeaderMsg      => "/X_LATCHE",
        Xon            => XON,
        MsgOn          => MSGON,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLK,
        PeriodData     => PInfo_CLK,
        TestSignal     => CLK_dly,
        TestSignalName => "CLK",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow  => tpw_CLK_negedge,
        CheckEnabled   => true,
        HeaderMsg      => "/X_LATCHE",
        Xon            => XON,
        MsgOn          => MSGON,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_RST,
        PeriodData     => PInfo_RST,
        TestSignal     => RST_dly,
        TestSignalName => "RST",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_RST_posedge,
        PulseWidthLow  => 0 ps,
        CheckEnabled   => true,
        HeaderMsg      => "/X_LATCHE",
        Xon            => XON,
        MsgOn          => MSGON,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_SET,
        PeriodData     => PInfo_SET,
        TestSignal     => SET_dly,
        TestSignalName => "SET",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_SET_posedge,
        PulseWidthLow  => 0 ps,
        CheckEnabled   => true,
        HeaderMsg      => "/X_LATCHE",
        Xon            => XON,
        MsgOn          => MSGON,
        MsgSeverity    => warning);
    end if;
    Violation := Tviol_I_CLK_negedge or Tviol_GE_CLK_negedge or
                 Tviol_SET_CLK_negedge or Tviol_RST_CLK_negedge or
                 Pviol_RST or Pviol_SET or
                 Pviol_CLK;

    if((GSR_resolved = '1') or (PRLD_resolved = '1')) then
       O_zd := To_X01(INIT);
    elsif((GSR_resolved = '0') and (PRLD_resolved = '0')) then
       VitalStateTable(
         Result         => O_zd,
         PreviousDataIn => PrevData_O,
         StateTable     => X_LATCHE_O_tab,
         DataIn         => (CLK_dly, I_dly, SET_dly, RST_dly, GE_dly));
       O_zd := Violation xor O_zd;
    end if;

    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (I_dly'last_event, tpd_I_O, (CLK_dly /= '0' and GE_dly /= '0' and RST_dly /= '1' and SET_dly /= '1') and (GSR_resolved = '0' and PRLD_resolved = '0') ),
                        1   => (CLK_dly'last_event, tpd_CLK_O, (GE_dly /= '0' and RST_dly /= '1' and SET_dly /= '1') and (GSR_resolved = '0' and PRLD_resolved = '0')),
                        2   => (GE_dly'last_event, tpd_GE_O, (CLK_dly /= '0' and RST_dly /= '1' and SET_dly /= '1') and (GSR_resolved = '0' and PRLD_resolved = '0')),
                        3   => (SET_dly'last_event, tpd_SET_O, (RST_dly /= '1') and (GSR_resolved = '0' and PRLD_resolved = '0')),
                        4   => (RST_dly'last_event, tpd_RST_O, (GSR_resolved = '0' and PRLD_resolved = '0')),
                        5   => (PRLD_resolved'last_event, tmp_PRLD_O, true)),
      Mode          => VitalTransport,
      Xon           => XON,
      MsgOn         => MSGON,
      MsgSeverity   => warning);
  end process;
end X_LATCHE_V;
