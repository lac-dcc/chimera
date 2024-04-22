-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/rainier/VITAL/X_SRLC32E.vhd,v 1.3 2010/01/14 19:38:17 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /           32-Bit Shift Register Look-Up-Table with Carry and Clock Enable
-- /___/   /\     Filename : X_SRLC32E.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:20 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/15/05 - Initial version.
--    11/11/05 - Use SLV_TO_INT to decode the address.
--               Add Q31_zd to pathdelay block (CR 218909).
--    01/07/06 - Add LOC (CR 222733)
--    05/10/07 - Add violation to VITALPathDelay process (CR 438179).
-- End Revision

----- CELL X_SRLC32E -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_SRLC32E is

  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_A : VitalDelayArrayType01(4 downto 0) := (others => (0.000 ns, 0.000 ns));
      tipd_CE : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_D : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_A_Q : VitalDelayArrayType01(4 downto 0) := (others => (0.000 ns, 0.000 ns));
      tpd_CLK_Q : VitalDelayType01 := (0.100 ns, 0.100 ns);
      tpd_CLK_Q31 : VitalDelayType01 := (0.100 ns, 0.100 ns);

      tsetup_CE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_CE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_D_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_D_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

      thold_CE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_CE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
      thold_D_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_D_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

      ticd_CLK : VitalDelayType := 0.000 ns;
      tisd_CE_CLK : VitalDelayType := 0.000 ns;
      tisd_D_CLK : VitalDelayType := 0.000 ns;

      tperiod_CLK_posedge : VitalDelayType := 0.000 ns;

    INIT : bit_vector := X"00000000"
    );

  port (
    Q   : out std_ulogic;
    Q31 : out std_ulogic;
    A   : in  std_logic_vector(4 downto 0);
    CE  : in  std_ulogic;
    CLK : in  std_ulogic;
    D   : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_SRLC32E : entity is true;
end X_SRLC32E;

architecture X_SRLC32E_V of X_SRLC32E is
  attribute VITAL_LEVEL0 of
    X_SRLC32E_V : architecture is true;

  signal A_ipd  : std_logic_vector(4 downto 0) := "XXXXX";
  signal CE_ipd  : std_ulogic := 'X';
  signal CLK_ipd : std_ulogic := 'X';
  signal D_ipd   : std_ulogic := 'X';

  signal CE_dly  : std_ulogic := 'X';
  signal CLK_dly : std_ulogic := 'X';
  signal D_dly   : std_ulogic := 'X';

  signal Q_zd      : std_ulogic                     := 'X';
  signal Q31_zd    : std_ulogic                     := 'X';
  signal SHIFT_REG : std_logic_vector (31 downto 0) :=  To_StdLogicVector(INIT);
  signal Violation : std_ulogic := '0';
begin
  WireDelay        : block
  begin
    A_DELAY       : for i in 4 downto 0 generate
    VitalWireDelay (A_ipd(i), A(i), tipd_A(i));
    end generate A_DELAY;
    VitalWireDelay (CE_ipd, CE, tipd_CE);
    VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
    VitalWireDelay (D_ipd, D, tipd_D);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CE_dly, CE_ipd, tisd_CE_CLK);
    VitalSignalDelay (CLK_dly, CLK_ipd, ticd_CLK);
    VitalSignalDelay (D_dly, D_ipd, tisd_D_CLK);
  end block;

    Q_zd   <= SHIFT_REG(SLV_TO_INT(SLV =>A));
    Q31_zd   <= SHIFT_REG(31);

  WriteBehavior : process(CLK_dly)
  begin
    if (CLK_dly'event AND CLK_dly = '1') then
      if (CE_dly = '1') then
        SHIFT_REG(31 downto 0) <= (SHIFT_REG(30 downto 0) & D_dly);
      end if;
    end if;
  end process WriteBehavior;

  VITALTiming                     : process (CLK_dly, CE_dly, D_dly)
    variable Tviol_D_CLK_posedge  : std_ulogic := '0';
    variable Tviol_CE_CLK_posedge : std_ulogic := '0';

    variable Tmkr_D_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CE_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;

    variable PViol_CLK : std_ulogic          := '0';
    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;
  begin
    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation      => Tviol_D_CLK_posedge,
        TimingData     => Tmkr_D_CLK_posedge,
        TestSignal     => D_dly,
        TestSignalName => "D",
        TestDelay      => tisd_D_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_D_CLK_posedge_posedge,
        SetupLow       => tsetup_D_CLK_negedge_posedge,
        HoldLow        => thold_D_CLK_posedge_posedge,
        HoldHigh       => thold_D_CLK_negedge_posedge,
        CheckEnabled   => TO_X01(CE_dly) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_SRLC32E",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_CE_CLK_posedge,
        TimingData     => Tmkr_CE_CLK_posedge,
        TestSignal     => CE_dly,
        TestSignalName => "CE",
        TestDelay      => tisd_CE_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_CE_CLK_posedge_posedge,
        SetupLow       => tsetup_CE_CLK_negedge_posedge,
        HoldLow        => thold_CE_CLK_posedge_posedge,
        HoldHigh       => thold_CE_CLK_negedge_posedge,
        CheckEnabled   => true,
        RefTransition  => 'R',
        HeaderMsg      => "/X_SRLC32E",
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
        HeaderMsg      => "/X_SRLC32E",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;
    Violation                       <= Tviol_D_CLK_posedge or Tviol_CE_CLK_posedge or
                                       Pviol_CLK;
  end process VITALTiming;

  VITALPathDelay            : process (Q_zd, Q31_zd, Violation)
    variable Q_zdt          : std_ulogic := '0';
    variable Q31_zdt        : std_ulogic := '0';
    variable Q_GlitchData   : VitalGlitchDataType;
    variable Q31_GlitchData : VitalGlitchDataType;
  begin
    Q_zdt                                := Q_zd;
    Q31_zdt                              := Q31_zd;
    Q_zdt                                := Violation xor Q_zdt;
    Q31_zdt                              := Violation xor Q31_zdt;
    VitalPathDelay01 (
      OutSignal     => Q,
      GlitchData    => Q_GlitchData,
      OutSignalName => "Q",
      OutTemp       => Q_zdt,
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_Q, (CE_dly /= '0')),
                        1  => (A_ipd(0)'last_event, tpd_A_Q(0), true),
                        2  => (A_ipd(1)'last_event, tpd_A_Q(1), true),
                        3  => (A_ipd(2)'last_event, tpd_A_Q(2), true),
                        4  => (A_ipd(3)'last_event, tpd_A_Q(3), true),
                        5  => (A_ipd(4)'last_event, tpd_A_Q(4), true)),
      Mode          => VitalInertial,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
    VitalPathDelay01 (
      OutSignal     => Q31,
      GlitchData    => Q31_GlitchData,
      OutSignalName => "Q31",
      OutTemp       => Q31_zdt,
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_Q31, (CE_dly /= '0'))),
      Mode          => VitalInertial,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);
  end process VITALPathDelay;
end X_SRLC32E_V;

