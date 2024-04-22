-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_RAMD32.vhd,v 1.4 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Static Dual Port Synchronous RAM 32-Deep by 1-Wide
-- /___/   /\     Filename : X_RAMD32.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:19 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    02/05/09 - Add WADR4_dly to timing check block signal list (CR457308)

----- CELL X_RAMD32 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_RAMD32 is
  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_RADR0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_RADR1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_RADR2 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_RADR3 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_RADR4 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WADR0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WADR1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WADR2 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WADR3 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WADR4 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_WE : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_CLK_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_RADR0_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_RADR1_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_RADR2_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_RADR3_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_RADR4_O : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tsetup_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR0_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR0_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR1_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR1_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR2_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR2_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR3_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR3_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR4_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WADR4_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

      thold_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR0_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR0_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR1_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR1_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR2_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR2_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR3_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR3_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR4_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_WADR4_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_WE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_WE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

      ticd_CLK : VitalDelayType := 0.000 ns;
      tisd_I_CLK : VitalDelayType := 0.000 ns;
      tisd_WADR0_CLK : VitalDelayType := 0.000 ns;
      tisd_WADR1_CLK : VitalDelayType := 0.000 ns;
      tisd_WADR2_CLK : VitalDelayType := 0.000 ns;
      tisd_WADR3_CLK : VitalDelayType := 0.000 ns;
      tisd_WADR4_CLK : VitalDelayType := 0.000 ns;
      tisd_WE_CLK : VitalDelayType := 0.000 ns;

      tperiod_CLK_posedge : VitalDelayType := 0.000 ns;

    INIT : bit_vector(31 downto 0) := X"00000000"
    );

  port (
    O     : out std_ulogic;
    CLK   : in  std_ulogic;
    I     : in  std_ulogic;
    RADR0 : in  std_ulogic;
    RADR1 : in  std_ulogic;
    RADR2 : in  std_ulogic;
    RADR3 : in  std_ulogic;
    RADR4 : in  std_ulogic;
    WADR0 : in  std_ulogic;
    WADR1 : in  std_ulogic;
    WADR2 : in  std_ulogic;
    WADR3 : in  std_ulogic;
    WADR4 : in  std_ulogic;
    WE    : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_RAMD32 : entity is true;

end X_RAMD32;

architecture X_RAMD32_V of X_RAMD32 is
  attribute VITAL_LEVEL0 of
    X_RAMD32_V : architecture is true;

  signal CLK_ipd   : std_ulogic := 'X';
  signal I_ipd     : std_ulogic := 'X';
  signal RADR0_ipd : std_ulogic := 'X';
  signal RADR1_ipd : std_ulogic := 'X';
  signal RADR2_ipd : std_ulogic := 'X';
  signal RADR3_ipd : std_ulogic := 'X';
  signal RADR4_ipd : std_ulogic := 'X';
  signal WADR0_ipd : std_ulogic := 'X';
  signal WADR1_ipd : std_ulogic := 'X';
  signal WADR2_ipd : std_ulogic := 'X';
  signal WADR3_ipd : std_ulogic := 'X';
  signal WADR4_ipd : std_ulogic := 'X';
  signal WE_ipd    : std_ulogic := 'X';


  signal CLK_dly   : std_ulogic := 'X';
  signal I_dly     : std_ulogic := 'X';
  signal WADR0_dly : std_ulogic := 'X';
  signal WADR1_dly : std_ulogic := 'X';
  signal WADR2_dly : std_ulogic := 'X';
  signal WADR3_dly : std_ulogic := 'X';
  signal WADR4_dly : std_ulogic := 'X';
  signal WE_dly    : std_ulogic := 'X';

  signal Violation : std_ulogic := '0';
  signal Q_zd      : std_ulogic;

  signal MEM : std_logic_vector( 32 downto 0 ) := ('X' & To_StdLogicVector(INIT) );
begin
  WireDelay  : block
  begin
    VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
    VitalWireDelay (I_ipd, I, tipd_I);
    VitalWireDelay (RADR0_ipd, RADR0, tipd_RADR0);
    VitalWireDelay (RADR1_ipd, RADR1, tipd_RADR1);
    VitalWireDelay (RADR2_ipd, RADR2, tipd_RADR2);
    VitalWireDelay (RADR3_ipd, RADR3, tipd_RADR3);
    VitalWireDelay (RADR4_ipd, RADR4, tipd_RADR4);
    VitalWireDelay (WADR0_ipd, WADR0, tipd_WADR0);
    VitalWireDelay (WADR1_ipd, WADR1, tipd_WADR1);
    VitalWireDelay (WADR2_ipd, WADR2, tipd_WADR2);
    VitalWireDelay (WADR3_ipd, WADR3, tipd_WADR3);
    VitalWireDelay (WADR4_ipd, WADR4, tipd_WADR4);
    VitalWireDelay (WE_ipd, WE, tipd_WE);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CLK_dly, CLK_ipd, ticd_CLK);
    VitalSignalDelay (I_dly, I_ipd, tisd_I_CLK);
    VitalSignalDelay (WADR0_dly, WADR0_ipd, tisd_WADR0_CLK);
    VitalSignalDelay (WADR1_dly, WADR1_ipd, tisd_WADR1_CLK);
    VitalSignalDelay (WADR2_dly, WADR2_ipd, tisd_WADR2_CLK);
    VitalSignalDelay (WADR3_dly, WADR3_ipd, tisd_WADR3_CLK);
    VitalSignalDelay (WADR4_dly, WADR4_ipd, tisd_WADR4_CLK);
    VitalSignalDelay (WE_dly, WE_ipd, tisd_WE_CLK);
  end block;

  VITALReadBehavior     : process(RADR4_ipd, RADR3_ipd, RADR2_ipd, RADR1_ipd, RADR0_ipd, MEM)
    variable index_rd   : integer := 32 ;
    variable rd_address : std_logic_vector (4 downto 0);
  begin
    rd_address                    := (RADR4_ipd, RADR3_ipd, RADR2_ipd, RADR1_ipd, RADR0_ipd);
    index_rd                      := SLV_TO_INT(SLV => rd_address);
    Q_zd <= MEM(index_RD);
  end process VITALReadBehavior;

  VITALWriteBehavior    : process(CLK_dly, Violation)
    variable index_wr   : integer    := 32;
--    variable Violation  : std_ulogic := '0';
    variable wr_address : std_logic_vector( 4 downto 0);
  begin
    if (rising_edge(CLK_dly)) then
      if (WE_dly = '1') then
        wr_address                   := (WADR4_dly, WADR3_dly, WADR2_dly, WADR1_dly, WADR0_dly);
        index_wr                     := SLV_TO_INT(SLV => wr_address );
        MEM(index_wr) <= (Violation xor I_dly) after 100 ps;
      end if;
    end if;
  end process VITALWriteBehavior;

  VITALTimingCheck                   : process (CLK_dly, I_dly, WADR0_dly, WADR1_dly, WADR2_dly, WADR3_dly, WADR4_dly, WE_dly)
    variable Tviol_I_CLK_posedge     : std_ulogic := '0';
    variable Tviol_WADR0_CLK_posedge : std_ulogic := '0';
    variable Tviol_WADR1_CLK_posedge : std_ulogic := '0';
    variable Tviol_WADR2_CLK_posedge : std_ulogic := '0';
    variable Tviol_WADR3_CLK_posedge : std_ulogic := '0';
    variable Tviol_WADR4_CLK_posedge : std_ulogic := '0';
    variable Tviol_WE_CLK_posedge    : std_ulogic := '0';

    variable Tmkr_I_CLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WADR0_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WADR1_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WADR2_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WADR3_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WADR4_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_WE_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;

    variable PViol_CLK : std_ulogic          := '0';
    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;
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
        HeaderMsg      => "/X_RAMD32",
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
        HeaderMsg      => "/X_RAMD32",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_WADR0_CLK_posedge,
        TimingData     => Tmkr_WADR0_CLK_posedge,
        TestSignal     => WADR0_dly,
        TestSignalName => "WADR0",
        TestDelay      => tisd_WADR0_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_WADR0_CLK_posedge_posedge,
        SetupLow       => tsetup_WADR0_CLK_negedge_posedge,
        HoldLow        => thold_WADR0_CLK_posedge_posedge,
        HoldHigh       => thold_WADR0_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMD32",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_WADR1_CLK_posedge,
        TimingData     => Tmkr_WADR1_CLK_posedge,
        TestSignal     => WADR1_dly,
        TestSignalName => "WADR1",
        TestDelay      => tisd_WADR1_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_WADR1_CLK_posedge_posedge,
        SetupLow       => tsetup_WADR1_CLK_negedge_posedge,
        HoldLow        => thold_WADR1_CLK_posedge_posedge,
        HoldHigh       => thold_WADR1_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMD32",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_WADR2_CLK_posedge,
        TimingData     => Tmkr_WADR2_CLK_posedge,
        TestSignal     => WADR2_dly,
        TestSignalName => "WADR2",
        TestDelay      => tisd_WADR2_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_WADR2_CLK_posedge_posedge,
        SetupLow       => tsetup_WADR2_CLK_negedge_posedge,
        HoldLow        => thold_WADR2_CLK_posedge_posedge,
        HoldHigh       => thold_WADR2_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMD32",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_WADR3_CLK_posedge,
        TimingData     => Tmkr_WADR3_CLK_posedge,
        TestSignal     => WADR3_dly,
        TestSignalName => "WADR3",
        TestDelay      => tisd_WADR3_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_WADR3_CLK_posedge_posedge,
        SetupLow       => tsetup_WADR3_CLK_negedge_posedge,
        HoldLow        => thold_WADR3_CLK_posedge_posedge,
        HoldHigh       => thold_WADR3_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMD32",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);

      VitalSetupHoldCheck (
        Violation      => Tviol_WADR4_CLK_posedge,
        TimingData     => Tmkr_WADR4_CLK_posedge,
        TestSignal     => WADR4_dly,
        TestSignalName => "WADR4",
        TestDelay      => tisd_WADR4_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_WADR4_CLK_posedge_posedge,
        SetupLow       => tsetup_WADR4_CLK_negedge_posedge,
        HoldLow        => thold_WADR4_CLK_posedge_posedge,
        HoldHigh       => thold_WADR4_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(WE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_RAMD32",
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
        HeaderMsg      => "/X_RAMD32",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;
    Violation <= Tviol_I_CLK_posedge or Tviol_WE_CLK_posedge or
                 Tviol_WADR0_CLK_posedge or Tviol_WADR1_CLK_posedge or
                 Tviol_WADR2_CLK_posedge or Tviol_WADR3_CLK_posedge or
                 Tviol_WADR4_CLK_posedge or Pviol_CLK;
  end process VITALTimingCheck;

  VITALScheduleOutput     : process(Q_zd)
    variable O_GlitchData : VitalGlitchDataType;
    variable O_zd         : std_ulogic := 'X';
  begin
    O_zd                               := Q_zd;
    VitalPathDelay01 (
      OutSignal     => O,
      GlitchData    => O_GlitchData,
      OutSignalName => "O",
      OutTemp       => O_zd,
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_O, (WE_dly /= '0') and
                              (RADR0_ipd = WADR0_dly and RADR1_ipd = WADR1_dly and
                               RADR2_ipd = WADR2_dly and RADR3_ipd = WADR3_dly and
                               RADR4_ipd = WADR4_dly )),
                        1   => (RADR0_ipd'last_event, tpd_RADR0_O, true),
                        2   => (RADR1_ipd'last_event, tpd_RADR1_O, true),
                        3   => (RADR2_ipd'last_event, tpd_RADR2_O, true),
                        4   => (RADR3_ipd'last_event, tpd_RADR3_O, true),
                        5   => (RADR4_ipd'last_event, tpd_RADR4_O, true)),
      Mode          => VitalTransport,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process VITALScheduleOutput;
end X_RAMD32_V;

