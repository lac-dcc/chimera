-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_SRL16E.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  16-Bit Shift Register Look-Up-Table with Clock Enable
-- /___/   /\     Filename : X_SRL16E.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:20 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_SRL16E -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_SRL16E is

  generic (
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_A0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A2 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_A3 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CE : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_D : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tpd_A0_Q : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_A1_Q : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_A2_Q : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_A3_Q : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tpd_CLK_Q : VitalDelayType01 := (0.00 ns, 0.00 ns);

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

    INIT : bit_vector := X"0000"
    );

  port (
    Q   : out std_ulogic;
    A0  : in  std_ulogic;
    A1  : in  std_ulogic;
    A2  : in  std_ulogic;
    A3  : in  std_ulogic;
    CE  : in  std_ulogic;
    CLK : in  std_ulogic;
    D   : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_SRL16E : entity is true;
end X_SRL16E;

architecture X_SRL16E_V of X_SRL16E is
  attribute VITAL_LEVEL0 of
    X_SRL16E_V : architecture is true;

  signal A0_ipd  : std_ulogic := 'X';
  signal A1_ipd  : std_ulogic := 'X';
  signal A2_ipd  : std_ulogic := 'X';
  signal A3_ipd  : std_ulogic := 'X';
  signal CE_ipd  : std_ulogic := 'X';
  signal CLK_ipd : std_ulogic := 'X';
  signal D_ipd   : std_ulogic := 'X';

  signal CE_dly  : std_ulogic := 'X';
  signal CLK_dly : std_ulogic := 'X';
  signal D_dly   : std_ulogic := 'X';

  signal Q_zd      : std_ulogic                     := 'X';
  signal SHIFT_REG : std_logic_vector (16 downto 0) := ('X' & To_StdLogicVector(INIT));

begin
  WireDelay        : block
  begin
    VitalWireDelay (A0_ipd, A0, tipd_A0);
    VitalWireDelay (A1_ipd, A1, tipd_A1);
    VitalWireDelay (A2_ipd, A2, tipd_A2);
    VitalWireDelay (A3_ipd, A3, tipd_A3);
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

  VITALReadBehavior     : process (A0_ipd, A1_ipd, A2_ipd, A3_ipd, SHIFT_REG)
    variable ADDR       : std_logic_vector(3 downto 0);
    variable VALID_ADDR : boolean := false;
    variable length     : integer;
  begin
    ADDR                          := (A3_ipd, A2_ipd, A1_ipd, A0_ipd);
    VALID_ADDR                    := ADDR_IS_VALID(SLV => ADDR);

    if (VALID_ADDR) then
      length := SLV_TO_INT(SLV => ADDR);
    else
      length := 16;
    end if;
    Q_zd <= SHIFT_REG(length);
  end process VITALReadBehavior;

  VITALWriteBehavior : process(CLK_dly)
  begin
    if (rising_edge(CLK_dly)) then
      if (CE_dly = '1') then
        SHIFT_REG(15 downto 1) <= SHIFT_REG(14 downto 0) after 100 ps;
        SHIFT_REG(0)           <= D_dly after 100 ps;
      end if;
    end if;
  end process VITALWriteBehavior;

  VITALTiming                     : process (CLK_dly, CE_dly, D_dly, Q_zd)
    variable Tviol_D_CLK_posedge  : std_ulogic := '0';
    variable Tviol_CE_CLK_posedge : std_ulogic := '0';

    variable Tmkr_D_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_CE_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;

    variable PViol_CLK : std_ulogic          := '0';
    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;
    variable Violation : std_ulogic                     := '0';
    
    variable Q_zdt        : std_ulogic := '0';
    variable Q_GlitchData : VitalGlitchDataType;    
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
        HeaderMsg      => "/X_SRL16E",
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
        HeaderMsg      => "/X_SRL16E",
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
        HeaderMsg      => "/X_SRL16E",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;
    Violation                                := Tviol_D_CLK_posedge or Tviol_CE_CLK_posedge or
                                                Pviol_CLK;
    Q_zdt                              := Violation xor Q_zd;
    VitalPathDelay01 (
      OutSignal     => Q,
      GlitchData    => Q_GlitchData,
      OutSignalName => "Q",
      OutTemp       => Q_zdt,
      Paths         => (0 => (CLK_dly'last_event, tpd_CLK_Q, (CE_dly /= '0')),
                        1   => (A0_ipd'last_event, tpd_A0_Q, true),
                        2   => (A1_ipd'last_event, tpd_A1_Q, true),
                        3   => (A2_ipd'last_event, tpd_A2_Q, true),
                        4   => (A3_ipd'last_event, tpd_A3_Q, true)),
      Mode          => VitalInertial,
      Xon           => Xon,
      MsgOn         => MsgOn,
      MsgSeverity   => warning);    
  end process VITALTiming;

end X_SRL16E_V;







