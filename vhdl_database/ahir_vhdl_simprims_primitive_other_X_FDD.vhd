-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_FDD.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Dual Edge Triggered D Flip-Flop
-- /___/   /\     Filename : X_FDD.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:08 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_FDD -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_FDD is
  generic(
      TimingChecksOn                    : boolean          := true;
      Xon                               : boolean          := true;
      MsgOn                             : boolean          := true;
      LOC                               : string           := "UNPLACED";

      INIT                              : bit              := '0';

      tipd_CE : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_RST : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_SET : VitalDelayType01 := (0.000 ns, 0.000 ns);
  
      tpd_CLK_O : VitalDelayType01 := (0.100 ns, 0.100 ns);
      tpd_RST_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_SET_O : VitalDelayType01 := (0.000 ns, 0.000 ns);    

      thold_CE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_CE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_RST_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_SET_CLK_negedge_posedge : VitalDelayType := 0.000 ns;

      tsetup_CE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_CE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

      trecovery_RST_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      trecovery_SET_CLK_negedge_posedge : VitalDelayType := 0.000 ns;  

      tpw_CLK_negedge : VitalDelayType := 0.000 ns;
      tpw_CLK_posedge : VitalDelayType := 0.000 ns;
      tpw_RST_posedge : VitalDelayType := 0.000 ns;
      tpw_SET_posedge : VitalDelayType := 0.000 ns
      );
  port(
    O                             : out std_ulogic;
    
    CE                            : in  std_ulogic;
    CLK                           : in  std_ulogic;
    I                             : in  std_ulogic;
    RST                           : in  std_ulogic;
    SET                           : in  std_ulogic
    );
  attribute VITAL_LEVEL0 of X_FDD :     entity is true;
end X_FDD;

-- architecture body                    --




architecture X_FDD_V of X_FDD is
--  attribute VITAL_LEVEL1 of X_FDD_V : architecture is true;
  attribute VITAL_LEVEL0 of X_FDD_V : architecture is true;

  signal GSR_resolved : std_ulogic;

  signal I_ipd   : std_ulogic := 'X';
  signal CLK_ipd : std_ulogic := 'X';
  signal CE_ipd  : std_ulogic := 'X';
  signal RST_ipd : std_ulogic := 'X';
  signal SET_ipd : std_ulogic := 'X';

begin

  GSR_resolved  <= To_X01(GSR);

  ---------------------
  --  INPUT PATH DELAYs
  ---------------------
  WireDelay     : block
  begin
    VitalWireDelay (I_ipd, I, tipd_I);
    VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
    VitalWireDelay (CE_ipd, CE, tipd_CE);
    VitalWireDelay (RST_ipd, RST, tipd_RST);
    VitalWireDelay (SET_ipd, SET, tipd_SET);
  end block;
  --------------------
  --  BEHAVIOR SECTION
  --------------------
  VITALBehavior : process (I_ipd, CLK_ipd, CE_ipd, GSR_resolved, RST_ipd, SET_ipd)

    -- timing check results
    variable Tviol_I_CLK_posedge   : std_ulogic          := '0';
    variable Tmkr_I_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_CE_CLK_posedge  : std_ulogic          := '0';
    variable Tmkr_CE_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_RST_CLK_posedge : std_ulogic          := '0';
    variable Tmkr_RST_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_SET_CLK_posedge : std_ulogic          := '0';
    variable Tmkr_SET_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Pviol_CLK             : std_ulogic          := '0';
    variable PInfo_CLK             : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_RST             : std_ulogic          := '0';
    variable PInfo_RST             : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_SET             : std_ulogic          := '0';
    variable PInfo_SET             : VitalPeriodDataType := VitalPeriodDataInit;

    -- functionality results
    variable Violation   : std_ulogic               := '0';
    variable PrevData_O  : std_logic_vector(0 to 6);
    variable I_delayed   : std_ulogic               := 'X';
    variable CLK_delayed : std_ulogic               := 'X';
    variable CE_delayed  : std_ulogic               := 'X';
--    variable Results     : std_logic_vector(1 to 1) := TO_X01(INIT);
--    alias O_zd           : std_logic is Results(1);
    variable O_zd         : std_ulogic := TO_X01(INIT);
    -- output glitch detection variables
    variable O_GlitchData : VitalGlitchDataType;

  begin

    ------------------------
    --  Timing Check Section
    ------------------------
    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation      => Tviol_I_CLK_posedge,
        TimingData     => Tmkr_I_CLK_posedge,
        TestSignal     => I_ipd,
        TestSignalName => "I",
        TestDelay      => 0 ps,
        RefSignal      => CLK_ipd,
        RefSignalName  => "CLK",
        RefDelay       => 0 ps,
        SetupHigh      => tsetup_I_CLK_posedge_posedge,
        SetupLow       => tsetup_I_CLK_negedge_posedge,
        HoldLow        => thold_I_CLK_posedge_posedge,
        HoldHigh       => thold_I_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(((not RST_ipd)) and (CE_ipd)
                                          and ((not SET_ipd))) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_FDD",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_CE_CLK_posedge,
        TimingData     => Tmkr_CE_CLK_posedge,
        TestSignal     => CE_ipd,
        TestSignalName => "CE",
        TestDelay      => 0 ps,
        RefSignal      => CLK_ipd,
        RefSignalName  => "CLK",
        RefDelay       => 0 ps,
        SetupHigh      => tsetup_CE_CLK_posedge_posedge,
        SetupLow       => tsetup_CE_CLK_negedge_posedge,
        HoldLow        => thold_CE_CLK_posedge_posedge,
        HoldHigh       => thold_CE_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(((not RST_ipd)) and ((O_zd) xor (I_ipd)) and ((not SET_ipd))) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_FDD",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalRecoveryRemovalCheck (
        Violation      => Tviol_RST_CLK_posedge,
        TimingData     => Tmkr_RST_CLK_posedge,
        TestSignal     => RST_ipd,
        TestSignalName => "RST",
        TestDelay      => 0 ps,
        RefSignal      => CLK_ipd,
        RefSignalName  => "CLK",
        RefDelay       => 0 ps,
        Recovery       => trecovery_RST_CLK_negedge_posedge,
        Removal        => thold_RST_CLK_negedge_posedge,
        ActiveLow      => false,
        CheckEnabled   => TO_X01(CE_ipd) /= '0' and (I_ipd /= '0' or O_zd /= '0'),
        RefTransition  => 'R',
        HeaderMsg      => "/X_FDD",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalRecoveryRemovalCheck (
        Violation      => Tviol_SET_CLK_posedge,
        TimingData     => Tmkr_SET_CLK_posedge,
        TestSignal     => SET_ipd,
        TestSignalName => "SET",
        TestDelay      => 0 ps,
        RefSignal      => CLK_ipd,
        RefSignalName  => "CLK",
        RefDelay       => 0 ps,
        Recovery       => trecovery_SET_CLK_negedge_posedge,
        Removal        => thold_SET_CLK_negedge_posedge,
        ActiveLow      => false,
        CheckEnabled   => TO_X01((not RST_ipd) and CE_ipd) /= '0' and I_ipd /= '1' and O_zd /= '1',
        RefTransition  => 'R',
        HeaderMsg      => "/X_FDD",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLK,
        PeriodData     => PInfo_CLK,
        TestSignal     => CLK_ipd,
        TestSignalName => "CLK",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_CLK_posedge,
        PulseWidthLow  => tpw_CLK_negedge,
        CheckEnabled   => true,
        HeaderMsg      => "/X_FDD",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_RST,
        PeriodData     => PInfo_RST,
        TestSignal     => RST_ipd,
        TestSignalName => "RST",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_RST_posedge,
        PulseWidthLow  => 0 ps,
        CheckEnabled   => true,
        HeaderMsg      => "/X_FDD",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_SET,
        PeriodData     => PInfo_SET,
        TestSignal     => SET_ipd,
        TestSignalName => "SET",
        TestDelay      => 0 ps,
        Period         => 0 ps,
        PulseWidthHigh => tpw_SET_posedge,
        PulseWidthLow  => 0 ps,
        CheckEnabled   => true,
        HeaderMsg      => "/X_FDD",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;

    -------------------------
    --  Functionality Section
    -------------------------
    Violation   := Tviol_I_CLK_posedge or Pviol_RST or
                 Tviol_CE_CLK_posedge or Tviol_RST_CLK_posedge or
                 Tviol_SET_CLK_posedge or Pviol_SET or Pviol_CLK;

    if(GSR_resolved = '1') then
        O_zd := To_X01(INIT);
    elsif(GSR_resolved = '0') then
       VitalStateTable(
         Result         => O_zd,
         PreviousDataIn => PrevData_O,
         StateTable     => X_FDD_O_tab,
         DataIn         => (CLK_DELAYED, SET_ipd, O_zd, I_delayed, CE_delayed, CLK_ipd, RST_ipd));
       O_zd        := Violation xor O_zd;
       I_delayed   := I_ipd;
       CLK_delayed := CLK_ipd;
       CE_delayed  := CE_ipd;
    end if;
    ----------------------
    --  Path Delay Section
    ----------------------
    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (CLK_ipd'last_event, tpd_CLK_O, (CE_ipd /= '0' and RST_ipd /= '1' and SET_ipd /= '1')),
                1   => (SET_ipd'last_event, tpd_SET_O, (RST_ipd /= '1')),
                2   => (RST_ipd'last_event, tpd_RST_O, true)),
      Mode          => VitalTransport,         
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);

  end process;

end X_FDD_V;
