-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_FF_CPLD.vhd,v 1.1 2008/06/19 17:05:31 vandanad Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  D Flip-Flop with Asynchronous Clear and Preset and Clock Enable
-- /___/   /\     Filename : X_FF_CPLD.v
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:04 PST 2004
--  \___\/\___\
--
-- Revision:
--    08/09/06 - Initial version.
--    11/01/06 - Add rst_int and set_int to make the GSR control the table. (CR428149).
-- End Revision

----- CELL X_FF_CPLD -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.VITAL_Timing.all;
use IEEE.VITAL_Primitives.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_FF_CPLD is
  generic(
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
    LOC            : string  := "UNPLACED";

    INIT           : bit     := '0';

    tipd_CE : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_RST : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tipd_SET : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpd_CLK_O : VitalDelayType01 := (0.100 ns, 0.100 ns);
    tpd_RST_O : VitalDelayType01 := (0.000 ns, 0.000 ns);
    tpd_SET_O : VitalDelayType01 := (0.000 ns, 0.000 ns);



    tsetup_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_CE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    tsetup_CE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;

    thold_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_CE_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
    thold_CE_CLK_negedge_posedge : VitalDelayType := 0.000 ns;

    thold_RST_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    thold_SET_CLK_negedge_posedge : VitalDelayType := 0.000 ns;

    trecovery_SET_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    trecovery_RST_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tremoval_SET_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
    tremoval_RST_CLK_negedge_posedge : VitalDelayType := 0.000 ns;

    ticd_CLK : VitalDelayType := 0.000 ns;
    tisd_CE_CLK : VitalDelayType := 0.000 ns;
    tisd_I_CLK : VitalDelayType := 0.000 ns;
    tisd_RST_CLK : VitalDelayType := 0.000 ns;
    tisd_SET_CLK : VitalDelayType := 0.000 ns;

    tperiod_CLK_posedge : VitalDelayType := 0.000 ns;
    tpw_RST_posedge : VitalDelayType := 0.000 ns;
    tpw_SET_posedge : VitalDelayType := 0.000 ns
    );

  port(
    O    : out std_ulogic;

    CE   : in  std_ulogic;
    CLK  : in  std_ulogic;
    I    : in  std_ulogic;
    RST  : in  std_ulogic;
    SET  : in  std_ulogic
    );
  attribute VITAL_LEVEL0 of
    X_FF_CPLD :     entity is true;
end X_FF_CPLD;

architecture X_FF_CPLD_V of X_FF_CPLD is
--  attribute VITAL_LEVEL1 of
--    X_FF_CPLD_V : architecture is true;

  signal CLK_resolved  : std_ulogic;
  signal I_resolved    : std_ulogic;
  signal CE_resolved   : std_ulogic;
  signal GSR_resolved  : std_ulogic;
  signal PRLD_resolved : std_ulogic;
  signal SET_resolved  : std_ulogic;
  signal RST_resolved  : std_ulogic;

  signal CE_ipd  : std_ulogic := 'X';
  signal CLK_ipd : std_ulogic := 'X';
  signal I_ipd   : std_ulogic := 'X';
  signal RST_ipd : std_ulogic := 'X';
  signal SET_ipd : std_ulogic := 'X';

  signal CE_dly  : std_ulogic := 'X';
  signal CLK_dly : std_ulogic := 'X';
  signal I_dly   : std_ulogic := 'X';
  signal RST_dly : std_ulogic := 'X';
  signal SET_dly : std_ulogic := 'X';

  constant zero_delay  : VitalDelayType01 := (0.000 ns, 0.000 ns);

begin
  CLK_resolved  <= To_X01(CLK);
  I_resolved    <= To_X01(I);
  CE_resolved   <= To_X01(CE);
  SET_resolved  <= To_X01(SET);
  RST_resolved  <= To_X01(RST);
  GSR_resolved  <= To_X01(GSR);
  PRLD_resolved <= To_X01(PRLD);
   
  WireDelay : block
  begin
    VitalWireDelay (CE_ipd, CE_resolved, tipd_CE);
    VitalWireDelay (CLK_ipd, CLK_resolved, tipd_CLK);
    VitalWireDelay (I_ipd, I_resolved, tipd_I);
    VitalWireDelay (RST_ipd, RST_resolved, tipd_RST);
    VitalWireDelay (SET_ipd, SET_resolved, tipd_SET);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CE_dly, CE_ipd, tisd_CE_CLK);
    VitalSignalDelay (CLK_dly, CLK_ipd, ticd_CLK);
    VitalSignalDelay (I_dly, I_ipd, tisd_I_CLK);
    VitalSignalDelay (RST_dly, RST_ipd, tisd_RST_CLK);
    VitalSignalDelay (SET_dly, SET_ipd, tisd_SET_CLK);
  end block;

  VITALBehavior                    : process (I_dly, CLK_dly, CE_dly, GSR_resolved, PRLD_resolved, RST_dly, SET_dly)
    variable PInfo_CLK             : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_RST             : VitalPeriodDataType := VitalPeriodDataInit;
    variable PInfo_SET             : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_CLK             : std_ulogic          := '0';
    variable Pviol_RST             : std_ulogic          := '0';
    variable Pviol_SET             : std_ulogic          := '0';

    variable Tmkr_CE_CLK_posedge   : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_I_CLK_posedge    : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_RST_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_SET_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_CE_CLK_posedge  : std_ulogic          := '0';
    variable Tviol_I_CLK_posedge   : std_ulogic          := '0';
    variable Tviol_RST_CLK_posedge : std_ulogic          := '0';
    variable Tviol_SET_CLK_posedge : std_ulogic          := '0';

    variable Violation    : std_ulogic := '0';
    variable PrevData_O   : std_logic_vector(0 to 7);
    variable O_zd         : std_ulogic := TO_X01(INIT);
    variable O_GlitchData : VitalGlitchDataType;
    variable set_int : std_ulogic := '0';
    variable rst_int : std_ulogic := '0';

  begin
    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation            => Tviol_I_CLK_posedge,
        TimingData           => Tmkr_I_CLK_posedge,
        TestSignal           => I_dly,
        TestSignalName       => "I",
        TestDelay            => tisd_I_CLK,
        RefSignal            => CLK_dly,
        RefSignalName        => "CLK",
        RefDelay             => ticd_CLK,
        SetupHigh            => tsetup_I_CLK_posedge_posedge,
        SetupLow             => tsetup_I_CLK_negedge_posedge,
        HoldLow              => thold_I_CLK_posedge_posedge,
        HoldHigh             => thold_I_CLK_negedge_posedge,
        CheckEnabled         => TO_X01(((not RST_dly)) and (CE_dly)
                                       and ((not SET_dly))) /= '0',
        RefTransition        => 'R',
        HeaderMsg            => "/X_FF_CPLD",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
      VitalSetupHoldCheck (
        Violation            => Tviol_CE_CLK_posedge,
        TimingData           => Tmkr_CE_CLK_posedge,
        TestSignal           => CE_dly,
        TestSignalName       => "CE",
        TestDelay            => tisd_CE_CLK,
        RefSignal            => CLK_dly,
        RefSignalName        => "CLK",
        RefDelay             => ticd_CLK,
        SetupHigh            => tsetup_CE_CLK_posedge_posedge,
        SetupLow             => tsetup_CE_CLK_negedge_posedge,
        HoldLow              => thold_CE_CLK_posedge_posedge,
        HoldHigh             => thold_CE_CLK_negedge_posedge,
        CheckEnabled         => TO_X01(((not RST_dly)) and ((O_zd) xor (I_dly)) and ((not SET_dly))) /= '0',
        RefTransition        => 'R',
        HeaderMsg            => "/X_FF_CPLD",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
      VitalRecoveryRemovalCheck (
        Violation            => Tviol_RST_CLK_posedge,
        TimingData           => Tmkr_RST_CLK_posedge,
        TestSignal           => RST_dly,
        TestSignalName       => "RST",
        TestDelay            => tisd_RST_CLK,
        RefSignal            => CLK_dly,
        RefSignalName        => "CLK",
        RefDelay             => ticd_CLK,
        Recovery             => trecovery_RST_CLK_negedge_posedge,
        Removal              => thold_RST_CLK_negedge_posedge,
        ActiveLow            => false,
        CheckEnabled         => TO_X01(CE_dly) /= '0' and I_dly /= '0',
        RefTransition        => 'R',
        HeaderMsg            => "/X_FF_CPLD",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
      VitalRecoveryRemovalCheck (
        Violation            => Tviol_SET_CLK_posedge,
        TimingData           => Tmkr_SET_CLK_posedge,
        TestSignal           => SET_dly,
        TestSignalName       => "SET",
        TestDelay            => tisd_SET_CLK,
        RefSignal            => CLK_dly,
        RefSignalName        => "CLK",
        RefDelay             => ticd_CLK,
        Recovery             => trecovery_SET_CLK_negedge_posedge,
        Removal              => thold_SET_CLK_negedge_posedge,
        ActiveLow            => false,
        CheckEnabled         => TO_X01((not RST_dly) and CE_dly) /= '0' and I_dly /= '1',
        RefTransition        => 'R',
        HeaderMsg            => "/X_FF_CPLD",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
      VitalPeriodPulseCheck (
        Violation            => Pviol_CLK,
        PeriodData           => PInfo_CLK,
        TestSignal           => CLK_dly,
        TestSignalName       => "CLK",
        TestDelay            => 0 ps,
        Period               => tperiod_CLK_posedge,
        PulseWidthHigh       => 0 ps,
        PulseWidthLow        => 0 ps,
        CheckEnabled         => TO_X01(CE_dly) /= '0',
        HeaderMsg            => "/X_FF_CPLD",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
      VitalPeriodPulseCheck (
        Violation            => Pviol_RST,
        PeriodData           => PInfo_RST,
        TestSignal           => RST_dly,
        TestSignalName       => "RST",
        TestDelay            => 0 ps,
        Period               => 0 ps,
        PulseWidthHigh       => tpw_RST_posedge,
        PulseWidthLow        => 0 ps,
        CheckEnabled         => true,
        HeaderMsg            => "/X_FF_CPLD",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
      VitalPeriodPulseCheck (
        Violation            => Pviol_SET,
        PeriodData           => PInfo_SET,
        TestSignal           => SET_dly,
        TestSignalName       => "SET",
        TestDelay            => 0 ps,
        Period               => 0 ps,
        PulseWidthHigh       => tpw_SET_posedge,
        PulseWidthLow        => 0 ps,
        CheckEnabled         => true,
        HeaderMsg            => "/X_FF_CPLD",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
    end if;
    Violation := Tviol_I_CLK_posedge or Pviol_RST or
                 Tviol_CE_CLK_posedge or Tviol_RST_CLK_posedge or
                 Tviol_SET_CLK_posedge or Pviol_SET or Pviol_CLK;


    if((GSR_resolved = '1') or (PRLD_resolved = '1')) then
      if (INIT = '1') then
         set_int := '1';
         rst_int := '0';
      else
         set_int := '0';
         rst_int := '1';
      end if;
    else 
         set_int := SET_dly;
         rst_int := RST_dly;
    end if;

       
       VitalStateTable(
         Result                 => O_zd,
         PreviousDataIn         => PrevData_O,
         StateTable             => X_FF_CPLD_O_tab,
         DataIn                 => (CLK_dly, I_dly, CE_dly, set_int, rst_int, O_zd));

       O_zd      := Violation xor O_zd;

    VitalPathDelay01 (
      OutSignal              => O,
      GlitchData             => O_GlitchData,
      OutSignalName          => "O",
      OutTemp                => O_zd,
      Paths                  => (0 => (CLK_dly'last_event, tpd_CLK_O, (CE_dly /= '0' and
 RST_dly /= '1' and SET_dly /= '1' and GSR_resolved = '0' and PRLD_resolved = '0')),
                                 1 => (SET_dly'last_event, tpd_SET_O, (RST_dly /= '1' and GSR_resolved = '0' and PRLD_resolved = '0')),
                                 2 => (RST_dly'last_event, tpd_RST_O, (GSR_resolved = '0' and PRLD_resolved = '0')),
                                 3 => (GSR_resolved'last_event, zero_delay, true),
                                 4 => (PRLD_resolved'last_event, zero_delay, true)),                                 
                              
      Mode                   => VitalTransport,
      Xon                    => Xon,
      MsgOn                  => MsgOn,
      MsgSeverity            => warning);
  end process;
end X_FF_CPLD_V;
