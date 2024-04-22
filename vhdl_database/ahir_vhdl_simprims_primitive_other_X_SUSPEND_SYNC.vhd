-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/stan/VITAL/X_SUSPEND_SYNC.vhd,v 1.6 2010/08/27 18:43:13 yanx Exp $
-------------------------------------------------------
--  Copyright (c) 2009 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version : 11.1
--  \   \          Description : 
--  /   /                      
-- /___/   /\      Filename    : X_SUSPEND_SYNC.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 1.0
-------------------------------------------------------
-- 08/27/10 - Initial output (CR573666)
-- End Revison
-------------------------------------------------------

----- CELL X_SUSPEND_SYNC -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

use simprim.VPACKAGE.all;

  entity X_SUSPEND_SYNC is
    generic (
      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      tipd_CLK : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_SACK : VitalDelayType01 :=  (0 ps, 0 ps);
      tpd_CLK_SREQ : VitalDelayType01 := (0 ps, 0 ps);
      thold_SACK_CLK_negedge_posedge : VitalDelayType := 0 ps;
      thold_SACK_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_SACK_CLK_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_SACK_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tisd_SACK_CLK : VitalDelayType := 0 ps;
      ticd_CLK : VitalDelayType := 0 ps;
      tperiod_CLK_posedge : VitalDelayType := 0 ps
    );

    port (
      SREQ                 : out std_ulogic := '0';
      CLK                  : in std_ulogic;
      SACK                 : in std_ulogic      
    );
    attribute VITAL_LEVEL0 of X_SUSPEND_SYNC :     entity is true;
  end X_SUSPEND_SYNC;

  architecture X_SUSPEND_SYNC_V of X_SUSPEND_SYNC is
    TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>) OF VitalTimingDataType;
    
    constant IN_DELAY : time := 0 ps;
    constant OUT_DELAY : time := 0 ps;
    constant INCLK_DELAY : time := 0 ps;
    constant OUTCLK_DELAY : time := 0 ps;

    function boolean_to_string(bool: boolean)
    return string is
    begin
      if bool then
        return "TRUE";
      else
        return "FALSE";
      end if;
    end boolean_to_string;

    signal SREQ_out : std_ulogic := '0';
    
    signal SREQ_outdelay : std_ulogic := '0';
    
    signal CLK_ipd : std_ulogic;
    signal SACK_ipd : std_ulogic;
    
    signal CLK_dly : std_ulogic;
    signal SACK_CLK_dly : std_ulogic;
    
    signal CLK_indelay : std_ulogic;
    signal SACK_indelay : std_ulogic;
    
    signal CLK_indly : std_ulogic;
    signal SACK_indly : std_ulogic;
    
    begin
    
    WireDelay : block
    begin
      VitalWireDelay (CLK_ipd,CLK,tipd_CLK);
      VitalWireDelay (SACK_ipd,SACK,tipd_SACK);
    end block;
    
    SignalDelay : block
    begin
      VitalSignalDelay (SACK_CLK_dly,SACK_ipd,tisd_SACK_CLK);

      VitalSignalDelay (CLK_dly,CLK_ipd,ticd_CLK);
    end block;
  --Input ports sensitive to single clock
  SACK_indelay <= SACK_CLK_dly;
  
  CLK_indelay <= CLK_dly;
  
  SREQ_out <= SREQ_outdelay after OUT_DELAY;
  
  CLK_indly <= CLK_indelay after INCLK_DELAY;
  
  SACK_indly <= SACK_indelay after IN_DELAY;
  
  
  TIMING : process
    variable Tmkr_SACK_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_SACK_CLK_posedge :  std_ulogic := '0';
    variable SREQ_GlitchData : VitalGlitchDataType;
    variable Pviol_CLK : STD_ULOGIC := '0';
    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;

    begin

    if (TimingChecksOn) then
      VitalSetupHoldCheck
      (
        Violation => Tviol_SACK_CLK_posedge,
        TimingData => Tmkr_SACK_CLK_posedge,
        TestSignal => SACK_CLK_dly,
        TestSignalName => "SACK",
        TestDelay => tisd_SACK_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_SACK_CLK_posedge_posedge,
        HoldHigh => thold_SACK_CLK_posedge_posedge,
        SetupLow => tsetup_SACK_CLK_negedge_posedge,
        HoldLow => thold_SACK_CLK_negedge_posedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_SUSPEND_SYNC",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
    end if;
      VitalPathDelay01
      (
        OutSignal     => SREQ,
        GlitchData    => SREQ_GlitchData,
        OutSignalName => "SREQ",
        OutTemp       => SREQ_out,
        Paths       => (0 => (CLK_dly'last_event, tpd_CLK_SREQ,TRUE)),
        Mode          => VitalTransport,
        Xon           => false,
        MsgOn          => false,
        MsgSeverity    => WARNING
      );
      VitalPeriodPulseCheck
      (
        Violation      => Pviol_CLK,
        PeriodData     => PInfo_CLK,
        TestSignal     => CLK_dly,
        TestSignalName => "CLK",
        TestDelay      => 0 ps,
        Period         => tperiod_CLK_posedge,
        PulseWidthHigh => 0 ps,
        PulseWidthLow  => 0 ps,
        CheckEnabled   => TRUE,
        HeaderMsg      => InstancePath & "/X_SUSPEND_SYNC",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
    wait on
      SREQ_out,
      SACK_CLK_dly;
  end process TIMING;
end X_SUSPEND_SYNC_V;
