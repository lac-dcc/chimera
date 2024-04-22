-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_RAMS128.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Static Synchronous RAM 128-Deep by 1-Wide
-- /___/   /\     Filename : X_RAMS128.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:19 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_RAMS128 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_RAMS128 is
  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_ADR0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR2 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR3 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR4 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR5 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_ADR6 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WE : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_ADR0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR1_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR2_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR3_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR4_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR5_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_ADR6_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_CLK_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tsetup_ADR0_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR0_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR1_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR1_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR2_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR2_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR3_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR3_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR4_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR4_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR5_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR5_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR6_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_ADR6_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

      thold_ADR0_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR0_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR1_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR1_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR2_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR2_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR3_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR3_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR4_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR4_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR5_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR5_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR6_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_ADR6_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

      ticd_CLK : VitalDelayType := 0.000 ns;
      tisd_ADR0_CLK : VitalDelayType := 0.000 ns;
      tisd_ADR1_CLK : VitalDelayType := 0.000 ns;
      tisd_ADR2_CLK : VitalDelayType := 0.000 ns;
      tisd_ADR3_CLK : VitalDelayType := 0.000 ns;
      tisd_ADR4_CLK : VitalDelayType := 0.000 ns;
      tisd_ADR5_CLK : VitalDelayType := 0.000 ns;
      tisd_ADR6_CLK : VitalDelayType := 0.000 ns;
      tisd_I_CLK : VitalDelayType := 0.000 ns;
      tisd_WE_CLK : VitalDelayType := 0.000 ns;

      tperiod_CLK_posedge : VitalDelayType := 0.000 ns;

    INIT : bit_vector(127 downto 0) := X"00000000000000000000000000000000"
    );

  port (
    O    : out std_ulogic;
    ADR0 : in  std_ulogic;
    ADR1 : in  std_ulogic;
    ADR2 : in  std_ulogic;
    ADR3 : in  std_ulogic;
    ADR4 : in  std_ulogic;
    ADR5 : in  std_ulogic;
    ADR6 : in  std_ulogic;
    CLK  : in  std_ulogic;
    I    : in  std_ulogic;
    WE   : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_RAMS128 : entity is true;
end X_RAMS128;

architecture X_RAMS128_V of X_RAMS128 is
  attribute VITAL_LEVEL0 of
    X_RAMS128_V : architecture is true;

  signal ADR0_ipd : std_ulogic := 'X';
  signal ADR1_ipd : std_ulogic := 'X';
  signal ADR2_ipd : std_ulogic := 'X';
  signal ADR3_ipd : std_ulogic := 'X';
  signal ADR4_ipd : std_ulogic := 'X';
  signal ADR5_ipd : std_ulogic := 'X';
  signal ADR6_ipd : std_ulogic := 'X';
  signal CLK_ipd  : std_ulogic := 'X';
  signal I_ipd    : std_ulogic := 'X';
  signal WE_ipd   : std_ulogic := 'X';

  signal ADR0_dly : std_ulogic := 'X';
  signal ADR1_dly : std_ulogic := 'X';
  signal ADR2_dly : std_ulogic := 'X';
  signal ADR3_dly : std_ulogic := 'X';
  signal ADR4_dly : std_ulogic := 'X';
  signal ADR5_dly : std_ulogic := 'X';
  signal ADR6_dly : std_ulogic := 'X';
  signal CLK_dly  : std_ulogic := 'X';
  signal I_dly    : std_ulogic := 'X';
  signal WE_dly   : std_ulogic := 'X';

  signal Violation : std_ulogic;
  signal Q_zd      : std_ulogic;

  signal MEM : std_logic_vector( 128 downto 0 ) := ('X' & To_StdLogicVector(INIT) );
begin
  WireDelay  : block
  begin
    VitalWireDelay (ADR0_ipd, ADR0, tipd_ADR0);
    VitalWireDelay (ADR1_ipd, ADR1, tipd_ADR1);
    VitalWireDelay (ADR2_ipd, ADR2, tipd_ADR2);
    VitalWireDelay (ADR3_ipd, ADR3, tipd_ADR3);
    VitalWireDelay (ADR4_ipd, ADR4, tipd_ADR4);
    VitalWireDelay (ADR5_ipd, ADR5, tipd_ADR5);
    VitalWireDelay (ADR6_ipd, ADR6, tipd_ADR6);
    VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
    VitalWireDelay (I_ipd, I, tipd_I);
    VitalWireDelay (WE_ipd, WE, tipd_WE);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (ADR0_dly, ADR0_ipd, tisd_ADR0_CLK);
    VitalSignalDelay (ADR1_dly, ADR1_ipd, tisd_ADR1_CLK);
    VitalSignalDelay (ADR2_dly, ADR2_ipd, tisd_ADR2_CLK);
    VitalSignalDelay (ADR3_dly, ADR3_ipd, tisd_ADR3_CLK);
    VitalSignalDelay (ADR4_dly, ADR4_ipd, tisd_ADR4_CLK);
    VitalSignalDelay (ADR5_dly, ADR5_ipd, tisd_ADR5_CLK);
    VitalSignalDelay (ADR6_dly, ADR6_ipd, tisd_ADR6_CLK);
    VitalSignalDelay (CLK_dly, CLK_ipd, ticd_CLK);
    VitalSignalDelay (I_dly, I_ipd, tisd_I_CLK);
    VitalSignalDelay (WE_dly, WE_ipd, tisd_WE_CLK);
  end block;

  VITALReadBehavior  : process(ADR0_dly, ADR1_dly, ADR2_dly, ADR3_dly, ADR4_dly, ADR5_dly, ADR6_dly, MEM)
    variable Index   : integer := 128 ;
    variable Address : std_logic_vector( 6 downto 0);
  begin
    Address                    := (ADR6_dly, ADR5_dly, ADR4_dly, ADR3_dly, ADR2_dly, ADR1_dly, ADR0_dly);
    Index                      := SLV_TO_INT(SLV => Address);
    Q_zd <= MEM(Index);
  end process VITALReadBehavior;

  VITALWriteBehavior : process(CLK_dly, Violation)
    variable Address : std_logic_vector (6 downto 0);
    variable Index   : integer := 128;
  begin
    if (rising_edge(CLK_dly)) then
      if (WE_dly = '1') then
        Address                := (ADR6_dly, ADR5_dly, ADR4_dly, ADR3_dly, ADR2_dly, ADR1_dly, ADR0_dly);
        Index                  := SLV_TO_INT(SLV => Address);
        MEM(Index) <= (I_dly xor Violation) after 100 ps;
      end if;
    end if;
  end process VITALWriteBehavior;

  VITALTimingCheck                  : process(ADR0_dly, ADR1_dly, ADR2_dly, ADR3_dly, ADR4_dly, ADR5_dly, ADR6_dly, CLK_dly, I_dly, WE_dly)
    variable Tviol_ADR0_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADR1_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADR2_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADR3_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADR4_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADR5_CLK_posedge : std_ulogic := '0';
    variable Tviol_ADR6_CLK_posedge : std_ulogic := '0';
    variable Tviol_I_CLK_posedge    : std_ulogic := '0';
    variable Tviol_WE_CLK_posedge   : std_ulogic := '0';

    variable Tmkr_ADR0_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADR1_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADR2_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADR3_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADR4_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADR5_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_ADR6_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_I_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WE_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;

    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;
    variable PViol_CLK : std_ulogic          := '0';
  begin
    if (TimingChecksOn ) then
      VitalSetupHoldCheck (
        Violation      => Tviol_I_CLK_posedge,
        TimingData     => Tmkr_I_CLK_posedge,
        TestSignal     => I_dly,
        TestSignalName => "I",
        TestDelay      => tisd_I_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_I_CLK_posedge_posedge,
        SetupLow       => tsetup_I_CLK_negedge_posedge,
        HoldLow        => thold_I_CLK_posedge_posedge,
        HoldHigh       => thold_I_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_WE_CLK_posedge,
        TimingData     => Tmkr_WE_CLK_posedge,
        TestSignal     => WE_dly,
        TestSignalName => "WE",
        TestDelay      => tisd_WE_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_WE_CLK_posedge_posedge,
        SetupLow       => tsetup_WE_CLK_negedge_posedge,
        HoldLow        => thold_WE_CLK_posedge_posedge,
        HoldHigh       => thold_WE_CLK_negedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADR0_CLK_posedge,
        TimingData     => Tmkr_ADR0_CLK_posedge,
        TestSignal     => ADR0_dly,
        TestSignalName => "ADR0",
        TestDelay      => tisd_ADR0_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADR0_CLK_posedge_posedge,
        SetupLow       => tsetup_ADR0_CLK_negedge_posedge,
        HoldLow        => thold_ADR0_CLK_posedge_posedge,
        HoldHigh       => thold_ADR0_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADR1_CLK_posedge,
        TimingData     => Tmkr_ADR1_CLK_posedge,
        TestSignal     => ADR1_dly,
        TestSignalName => "ADR1",
        TestDelay      => tisd_ADR1_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADR1_CLK_posedge_posedge,
        SetupLow       => tsetup_ADR1_CLK_negedge_posedge,
        HoldLow        => thold_ADR1_CLK_posedge_posedge,
        HoldHigh       => thold_ADR1_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADR2_CLK_posedge,
        TimingData     => Tmkr_ADR2_CLK_posedge,
        TestSignal     => ADR2_dly,
        TestSignalName => "ADR2",
        TestDelay      => tisd_ADR2_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADR2_CLK_posedge_posedge,
        SetupLow       => tsetup_ADR2_CLK_negedge_posedge,
        HoldLow        => thold_ADR2_CLK_posedge_posedge,
        HoldHigh       => thold_ADR2_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADR3_CLK_posedge,
        TimingData     => Tmkr_ADR3_CLK_posedge,
        TestSignal     => ADR3_dly,
        TestSignalName => "ADR3",
        TestDelay      => tisd_ADR3_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADR3_CLK_posedge_posedge,
        SetupLow       => tsetup_ADR3_CLK_negedge_posedge,
        HoldLow        => thold_ADR3_CLK_posedge_posedge,
        HoldHigh       => thold_ADR3_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADR4_CLK_posedge,
        TimingData     => Tmkr_ADR4_CLK_posedge,
        TestSignal     => ADR4_dly,
        TestSignalName => "ADR4",
        TestDelay      => tisd_ADR4_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADR4_CLK_posedge_posedge,
        SetupLow       => tsetup_ADR4_CLK_negedge_posedge,
        HoldLow        => thold_ADR4_CLK_posedge_posedge,
        HoldHigh       => thold_ADR4_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADR5_CLK_posedge,
        TimingData     => Tmkr_ADR5_CLK_posedge,
        TestSignal     => ADR5_dly,
        TestSignalName => "ADR5",
        TestDelay      => tisd_ADR5_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADR5_CLK_posedge_posedge,
        SetupLow       => tsetup_ADR5_CLK_negedge_posedge,
        HoldLow        => thold_ADR5_CLK_posedge_posedge,
        HoldHigh       => thold_ADR5_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_ADR6_CLK_posedge,
        TimingData     => Tmkr_ADR6_CLK_posedge,
        TestSignal     => ADR6_dly,
        TestSignalName => "ADR6",
        TestDelay      => tisd_ADR6_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_ADR6_CLK_posedge_posedge,
        SetupLow       => tsetup_ADR6_CLK_negedge_posedge,
        HoldLow        => thold_ADR6_CLK_posedge_posedge,
        HoldHigh       => thold_ADR6_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalPeriodPulseCheck (
        Violation      => Pviol_CLK,
        PeriodData     => PInfo_CLK,
        TestSignal     => CLK_dly,
        TestSignalName => "CLK",
        TestDelay      => 0 ps,
        Period         => tperiod_CLK_posedge,
        PulseWidthHigh => 0 ps,
        PulseWidthLow  => 0 ps,
        CheckEnabled   => true,
        HeaderMsg      => "/X_RAMS128",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;
    Violation                                <= Tviol_I_CLK_posedge or Tviol_WE_CLK_posedge or
                                                Tviol_ADR0_CLK_posedge or Tviol_ADR1_CLK_posedge or
                                                Tviol_ADR2_CLK_posedge or Tviol_ADR3_CLK_posedge or
                                                Tviol_ADR4_CLK_posedge or Tviol_ADR5_CLK_posedge or
                                                Tviol_ADR6_CLK_posedge or Pviol_CLK;
  end process VITALTimingCheck;

  VITALPathDelay          : process(Q_zd)
    variable O_zd         : std_ulogic := 'X';
    variable O_GlitchData : VitalGlitchDataType;
  begin
    O_zd                               := Q_zd;
    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_O, (WE_dly /= '0')),
                        1   => (ADR0_dly'last_event, tpd_ADR0_O, true),
                        2   => (ADR1_dly'last_event, tpd_ADR1_O, true),
                        3   => (ADR2_dly'last_event, tpd_ADR2_O, true),
                        4   => (ADR3_dly'last_event, tpd_ADR3_O, true),
                        5   => (ADR4_dly'last_event, tpd_ADR4_O, true),
                        6   => (ADR5_dly'last_event, tpd_ADR5_O, true),
                        7   => (ADR6_dly'last_event, tpd_ADR6_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process VITALPathDelay;
end X_RAMS128_V;

