-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/simprim/VITAL/X_SUH.vhd,v 1.3 2010/01/14 19:43:23 fphillip Exp $
-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Setup Hold Timing Check
-- /___/   /\     Filename : X_SUH.vhd
-- \   \  /  \    Timestamp : Thu Apr  8 10:57:20 PDT 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.

----- CELL X_SUH -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library IEEE;
use IEEE.Vital_Primitives.all;
use IEEE.Vital_Timing.all;

entity X_SUH is
  generic(
    TimingChecksOn : boolean := true;
    Xon            : boolean := true;
    MsgOn          : boolean := true;
   LOC            : string  := "UNPLACED";

      tipd_CE : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_CLK : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tipd_I : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tsetup_I_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_posedge_negedge : VitalDelayType := 0.000 ns;
      tsetup_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

      thold_I_CLK_negedge_negedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_posedge_negedge : VitalDelayType := 0.000 ns;
      thold_I_CLK_posedge_posedge : VitalDelayType := 0.000 ns;

      ticd_CLK : VitalDelayType := 0.000 ns;
      tisd_I_CLK : VitalDelayType := 0.000 ns
    );

  port(
    CE  : in std_ulogic;
    CLK : in std_ulogic;
    I   : in std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_SUH : entity is true;
end X_SUH;

architecture X_SUH_V of X_SUH is
  attribute VITAL_LEVEL1 of
    X_SUH_V : architecture is true;

  signal CE_ipd  : std_ulogic := 'X';
  signal CLK_ipd : std_ulogic := 'X';
  signal I_ipd   : std_ulogic := 'X';

  signal CLK_dly : std_ulogic := 'X';
  signal I_dly   : std_ulogic := 'X';
begin
  WireDelay      : block
  begin
    VitalWireDelay (CE_ipd, CE, tipd_CE);
    VitalWireDelay (CLK_ipd, CLK, tipd_CLK);
    VitalWireDelay (I_ipd, I, tipd_I);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CLK_dly, CLK_ipd, ticd_CLK);
    VitalSignalDelay (I_dly, I_ipd, tisd_I_CLK);
  end block;

  VITALBehavior                  : process (CE_ipd, CLK_dly, I_dly)
    variable Tmkr_I_CLK_negedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tmkr_I_CLK_posedge  : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_I_CLK_negedge : std_ulogic          := '0';
    variable Tviol_I_CLK_posedge : std_ulogic          := '0';
  begin
    if (TimingChecksOn) then
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
        HoldLow        => thold_I_CLK_negedge_posedge,
        HoldHigh       => thold_I_CLK_posedge_posedge,
        CheckEnabled   => TO_X01(CE_ipd) /= '0',
        RefTransition  => 'R',
        HeaderMsg      => "/X_SUH",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
      VitalSetupHoldCheck (
        Violation      => Tviol_I_CLK_negedge,
        TimingData     => Tmkr_I_CLK_negedge,
        TestSignal     => I_dly,
        TestSignalName => "I",
        TestDelay      => tisd_I_CLK,
        RefSignal      => CLK_dly,
        RefSignalName  => "CLK",
        RefDelay       => ticd_CLK,
        SetupHigh      => tsetup_I_CLK_posedge_negedge,
        SetupLow       => tsetup_I_CLK_negedge_negedge,
        HoldLow        => thold_I_CLK_negedge_negedge,
        HoldHigh       => thold_I_CLK_posedge_negedge,
        CheckEnabled   => TO_X01(CE_ipd) /= '0',
        RefTransition  => 'F',
        HeaderMsg      => "/X_SUH",
        Xon            => Xon,
        MsgOn          => true,
        MsgSeverity    => warning);
    end if;
  end process;
end X_SUH_V;
