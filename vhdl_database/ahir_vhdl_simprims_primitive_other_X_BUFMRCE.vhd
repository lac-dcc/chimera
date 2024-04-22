-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/fuji/VITAL/X_BUFMRCE.vhd,v 1.1 2010/04/28 23:09:30 yanx Exp $
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
-- /___/   /\      Filename    : X_BUFMRCE.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: 1.0
-------------------------------------------------------

----- CELL X_BUFMRCE -----

library IEEE;
use IEEE.STD_LOGIC_arith.all;
use IEEE.STD_LOGIC_1164.all;
library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;

use simprim.VPACKAGE.all;

  entity X_BUFMRCE is
    generic (
      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      CE_TYPE : string := "SYNC";
      INIT_OUT : integer := 0;
      tipd_CE : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_I : VitalDelayType01 :=  (0 ps, 0 ps);
      tpd_I_O : VitalDelayType01 := (0 ps, 0 ps);
      thold_CE_I_negedge_negedge : VitalDelayType := 0 ps;
      thold_CE_I_negedge_posedge : VitalDelayType := 0 ps;
      thold_CE_I_posedge_negedge : VitalDelayType := 0 ps;
      thold_CE_I_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE_I_negedge_negedge : VitalDelayType := 0 ps;
      tsetup_CE_I_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE_I_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_CE_I_posedge_posedge : VitalDelayType := 0 ps;
      tisd_CE_I : VitalDelayType := 0 ps;
      ticd_I : VitalDelayType := 0 ps;
      tperiod_I_posedge : VitalDelayType := 0 ps
    );

    port (
      O                    : out std_ulogic;
      CE                   : in std_ulogic;
      I                    : in std_ulogic      
    );
    attribute VITAL_LEVEL0 of X_BUFMRCE :     entity is true;
  end X_BUFMRCE;

  architecture X_BUFMRCE_V of X_BUFMRCE is
    TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>) OF VitalTimingDataType;
    
    constant IN_DELAY : time := 0 ps;
    constant OUT_DELAY : time := 0 ps;
    constant INCLK_DELAY : time := 0 ps;
    constant OUTCLK_DELAY : time := 0 ps;


    signal NCE : STD_ULOGIC := 'X';
    signal GND : STD_ULOGIC := '0';
    signal Z1 : STD_ULOGIC := '1';
    signal O_out1 : STD_ULOGIC := '0';
    signal O_out2 : STD_ULOGIC := '0';

    signal CE_TYPE_BINARY : std_ulogic;
    signal INIT_OUT_BINARY : std_ulogic;
    
    signal O_out : std_ulogic;
    
    signal O_outdelay : std_ulogic;
    
    signal CE_ipd : std_ulogic;
    signal I_ipd : std_ulogic;
    
    signal CE_I_dly : std_ulogic;
    signal I_dly : std_ulogic;
    
    signal CE_indelay : std_ulogic;
    signal I_indelay : std_ulogic;
    
    signal CE_indly : std_ulogic;
    signal I_indly : std_ulogic;
    
    begin
    
    WireDelay : block
    begin
      VitalWireDelay (CE_ipd,CE,tipd_CE);
      VitalWireDelay (I_ipd,I,tipd_I);
    end block;
    
    SignalDelay : block
    begin
      VitalSignalDelay (CE_I_dly,CE_ipd,tisd_CE_I);

      VitalSignalDelay (I_dly,I_ipd,ticd_I);
    end block;
    --Input ports sensitive to single clock
    CE_indelay <= CE_I_dly;
    I_indelay <= I_dly;
    
    B1 : X_BUFGMUX
        port map (
        I0 => I_indelay,
        I1 => GND,
        O =>O_out1,
        s =>NCE);

    B2 : X_BUFGMUX_1
        port map (
        I0 => I_indelay,
        I1 => Z1,
        O =>O_out2,
        s =>NCE);

    I1 : X_INV
        port map (
        I => CE_indelay,
        O => NCE);

    O_out <= O_out2 when INIT_OUT = 1 else O_out1;
    
    
    INIPROC : process
    begin
    -- case CE_TYPE is
      if((CE_TYPE = "SYNC") or (CE_TYPE = "sync")) then
        CE_TYPE_BINARY <= '0';
      elsif((CE_TYPE = "ASYNC") or (CE_TYPE= "async")) then
        CE_TYPE_BINARY <= '1';
      else
        assert FALSE report "Error : CE_TYPE = is not SYNC, ASYNC." severity error;
      end if;
    -- end case;
    case INIT_OUT is
      when  0   =>  INIT_OUT_BINARY <= '0';
      when  1   =>  INIT_OUT_BINARY <= '1';
      when others  =>  assert FALSE report "Error : INIT_OUT is not in range 0 .. 1." severity error;
    end case;
    wait;
    end process INIPROC;
    
    TIMING : process
      variable Tmkr_CE_I_negedge : VitalTimingDataType := VitalTimingDataInit;
      variable Tmkr_CE_I_posedge : VitalTimingDataType := VitalTimingDataInit;
      variable Tviol_CE_I_negedge : std_ulogic := '0';
      variable Tviol_CE_I_posedge : std_ulogic := '0';
      variable O_GlitchData : VitalGlitchDataType;
      variable Pviol_I : STD_ULOGIC := '0';
      variable PInfo_I : VitalPeriodDataType := VitalPeriodDataInit;

      begin

      if (TimingChecksOn) then
        VitalSetupHoldCheck
        (
          Violation => Tviol_CE_I_negedge,
          TimingData => Tmkr_CE_I_negedge,
          TestSignal => CE_I_dly,
          TestSignalName => "CE",
          TestDelay => tisd_CE_I,
          RefSignal => I_dly,
          RefSignalName => "I",
          RefDelay => ticd_I,
          SetupHigh => tsetup_CE_I_posedge_negedge,
          HoldHigh => thold_CE_I_posedge_negedge,
          SetupLow => tsetup_CE_I_negedge_negedge,
          HoldLow => thold_CE_I_negedge_negedge,
          CheckEnabled   => TRUE,
          RefTransition  => 'R',
          HeaderMsg      => InstancePath & "/X_BUFMRCE",
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
        VitalSetupHoldCheck
        (
          Violation => Tviol_CE_I_posedge,
          TimingData => Tmkr_CE_I_posedge,
          TestSignal => CE_I_dly,
          TestSignalName => "CE",
          TestDelay => tisd_CE_I,
          RefSignal => I_dly,
          RefSignalName => "I",
          RefDelay => ticd_I,
          SetupHigh => tsetup_CE_I_posedge_posedge,
          HoldHigh => thold_CE_I_posedge_posedge,
          SetupLow => tsetup_CE_I_negedge_posedge,
          HoldLow => thold_CE_I_negedge_posedge,
          CheckEnabled   => TRUE,
          RefTransition  => 'R',
          HeaderMsg      => InstancePath & "/X_BUFMRCE",
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
      end if;
        VitalPathDelay01
        (
          OutSignal     => O,
          GlitchData    => O_GlitchData,
          OutSignalName => "O",
          OutTemp       => O_out,
          Paths       => (0 => (I_dly'last_event, tpd_I_O,TRUE)),
          Mode          => VitalTransport,
          Xon           => false,
          MsgOn          => false,
          MsgSeverity    => WARNING
        );
        VitalPeriodPulseCheck
        (
          Violation      => Pviol_I,
          PeriodData     => PInfo_I,
          TestSignal     => I_dly,
          TestSignalName => "I",
          TestDelay      => 0 ps,
          Period         => tperiod_I_posedge,
          PulseWidthHigh => 0 ps,
          PulseWidthLow  => 0 ps,
          CheckEnabled   => TRUE,
          HeaderMsg      => InstancePath & "/X_BUFMRCE",
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
      wait on
        O_out,
        CE_I_dly;
    end process TIMING;
  end X_BUFMRCE_V;
