-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/blanc/VITAL/X_CAPTURE_VIRTEX6.vhd,v 1.5 2010/01/14 19:35:24 fphillip Exp $
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
-- /___/   /\      Filename    : X_CAPTURE_VIRTEX6.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 1.0
-------------------------------------------------------

----- CELL X_CAPTURE_VIRTEX6 -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

use simprim.VPACKAGE.all;

  entity X_CAPTURE_VIRTEX6 is
    generic (
      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      ONESHOT : boolean := TRUE;
      tipd_CAP : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_CLK : VitalDelayType01 :=  (0 ps, 0 ps);
      thold_CAP_CLK_negedge_posedge : VitalDelayType := 0 ps;
      thold_CAP_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CAP_CLK_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_CAP_CLK_posedge_posedge : VitalDelayType := 0 ps;
      tisd_CAP_CLK : VitalDelayType := 0 ps;
      ticd_CLK : VitalDelayType := 0 ps;
      tperiod_CLK_posedge : VitalDelayType := 0 ps
    );

    port (
      CAP                  : in std_ulogic := 'L';
      CLK                  : in std_ulogic      
    );
    attribute VITAL_LEVEL0 of X_CAPTURE_VIRTEX6 :     entity is true;
  end X_CAPTURE_VIRTEX6;

  architecture X_CAPTURE_VIRTEX6_V of X_CAPTURE_VIRTEX6 is
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

    -- Convert boolean to string
    constant ONESHOT_STRING : string := boolean_to_string(ONESHOT);
    
    signal ONESHOT_BINARY : std_ulogic;
    
    signal CAP_ipd : std_ulogic;
    signal CLK_ipd : std_ulogic;
    
    signal CAP_CLK_dly : std_ulogic;
    signal CLK_dly : std_ulogic;
    
    signal CAP_indelay : std_ulogic;
    signal CLK_indelay : std_ulogic;
    
    signal CAP_indly : std_ulogic;
    signal CLK_indly : std_ulogic;
    
    begin
    
    WireDelay : block
    begin
      VitalWireDelay (CAP_ipd,CAP,tipd_CAP);
      VitalWireDelay (CLK_ipd,CLK,tipd_CLK);
    end block;
    
    SignalDelay : block
    begin
      VitalSignalDelay (CAP_CLK_dly,CAP_ipd,tisd_CAP_CLK);

      VitalSignalDelay (CLK_dly,CLK_ipd,ticd_CLK);
    end block;
  --Input ports sensitive to single clock
  CAP_indelay <= CAP_CLK_dly;
  
  --Input ports sensitive to more than two clocks
  CLK_indelay <= CLK_ipd;
  
  CLK_indly <= CLK_indelay after INCLK_DELAY;
  
  CAP_indly <= CAP_indelay after IN_DELAY;
  
  
  INIPROC : process
  begin
  case ONESHOT is
    when FALSE   =>  ONESHOT_BINARY <= '0';
    when TRUE    =>  ONESHOT_BINARY <= '1';
    when others  =>  assert FALSE report "Error : ONESHOT is neither TRUE nor FALSE." severity error;
  end case;
  wait;
  end process INIPROC;
  
  TIMING : process
    variable Tmkr_CAP_CLK_posedge : VitalTimingDataType := VitalTimingDataInit;
    variable Tviol_CAP_CLK_posedge :  std_ulogic := '0';
    variable Pviol_CLK : STD_ULOGIC := '0';
    variable PInfo_CLK : VitalPeriodDataType := VitalPeriodDataInit;

    begin

    if (TimingChecksOn) then
      VitalSetupHoldCheck
      (
        Violation => Tviol_CAP_CLK_posedge,
        TimingData => Tmkr_CAP_CLK_posedge,
        TestSignal => CAP_CLK_dly,
        TestSignalName => "CAP",
        TestDelay => tisd_CAP_CLK,
        RefSignal => CLK_dly,
        RefSignalName => "CLK",
        RefDelay => ticd_CLK,
        SetupHigh => tsetup_CAP_CLK_posedge_posedge,
        HoldHigh => thold_CAP_CLK_posedge_posedge,
        SetupLow => tsetup_CAP_CLK_negedge_posedge,
        HoldLow => thold_CAP_CLK_negedge_posedge,
        CheckEnabled   => TRUE,
        RefTransition  => 'R',
        HeaderMsg      => InstancePath & "/X_CAPTURE_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
    end if;
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
        HeaderMsg      => InstancePath & "/X_CAPTURE_VIRTEX6",
        Xon            => Xon,
        MsgOn          => MsgOn,
        MsgSeverity    => WARNING
      );
    wait on
      CAP_CLK_dly;
  end process TIMING;
end X_CAPTURE_VIRTEX6_V;
