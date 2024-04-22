-- $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/vhdsclibs/data/simprims/fuji/VITAL/X_PHASER_REF.vhd,v 1.6 2012/04/26 19:45:09 robh Exp $
-------------------------------------------------------
--  Copyright (c) 2010 Xilinx Inc.
--  All Right Reserved.
-------------------------------------------------------
--
--   ____  ____
--  /   /\/   / 
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      version     : 13.1 
--  \   \          Description : Xilinx Timing Simulation Library Component
--  /   /                        Fujisan PHASER_REF
-- /___/   /\      Filename    : X_PHASER_REF.vhd
-- \   \  /  \      
--  \__ \/\__ \                   
--                                 
--  Revision: Comment:
--  26APR2010 Initial UNI/SIM version from yml
--  02JUL2010 add functionality
--  29SEP2010 update functionality based on rtl
--  28OCT2010 CR580289 ref_clock_input_freq_MHz_min/max < vs <=
--            CR579961 tpw generics 
--  09NOV2010 CR581863 blocking statements, clock counts to lock.
--  11NOV2010 CR582599 warning in place of LOCK
--  16APR2012 655365 else missing from LOCKED process

-------------------------------------------------------

----- CELL X_PHASER_REF -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.STD_LOGIC_TEXTIO.all;

library STD;
use STD.TEXTIO.all;

library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VCOMPONENTS.all;
use simprim.VPACKAGE.all;

  entity X_PHASER_REF is
    generic (
      TimingChecksOn : boolean := TRUE;
      InstancePath   : string  := "*";
      Xon            : boolean := TRUE;
      MsgOn          : boolean := FALSE;
      LOC            : string  := "UNPLACED";
      tipd_CLKIN : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_PWRDWN : VitalDelayType01 :=  (0 ps, 0 ps);
      tipd_RST : VitalDelayType01 :=  (0 ps, 0 ps);
      tperiod_CLKIN_posedge : VitalDelayType := 0 ps;
      tpw_CLKIN_negedge : VitalDelayType := 0 ps;
      tpw_CLKIN_posedge : VitalDelayType := 0 ps;
      tpw_PWRDWN_negedge : VitalDelayType := 0 ps;
      tpw_PWRDWN_posedge : VitalDelayType := 0 ps;
      tpw_RST_negedge : VitalDelayType := 0 ps;
      tpw_RST_posedge : VitalDelayType := 0 ps
    );

    port (
      LOCKED               : out std_ulogic;
      CLKIN                : in std_ulogic;
      PWRDWN               : in std_ulogic;
      RST                  : in std_ulogic      
    );
    attribute VITAL_LEVEL0 of X_PHASER_REF :     entity is true;
  end X_PHASER_REF;

  architecture X_PHASER_REF_V of X_PHASER_REF is
    TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>) OF VitalTimingDataType;
    
    constant IN_DELAY : time := 0 ps;
    constant OUT_DELAY : time := 0 ps;
    constant INCLK_DELAY : time := 0 ps;
    constant OUTCLK_DELAY : time := 0 ps;

    constant MODULE_NAME : string  := "X_PHASER_REF";
    constant REF_CLK_JITTER_MAX : real := 100.000;

    signal LOCKED_out : std_ulogic;
    
    signal LOCKED_outdelay : std_ulogic := '1';
    
    signal CLKIN_ipd : std_ulogic;
    signal PWRDWN_ipd : std_ulogic;
    signal RST_ipd : std_ulogic;
    
    signal CLKIN_dly : std_ulogic;
    signal PWRDWN_dly : std_ulogic;
    signal RST_dly : std_ulogic;
    
    signal CLKIN_in : std_ulogic;
    signal PWRDWN_in : std_ulogic;
    signal RST_in : std_ulogic;
    
    signal CLKIN_indelay : std_ulogic;
    signal PWRDWN_indelay : std_ulogic;
    signal RST_indelay : std_ulogic;
    signal GSR_indelay : std_ulogic;
    
    signal ref_clock_input_period : real := 11.0;
    signal ref_clock_input_freq_MHz : real := 1.68;
    signal time_last_rising_edge : real := 1.0;
    signal last_ref_clock_input_period : real := 13.0;
    signal last_ref_clock_input_freq_MHz : real := 1.69;
    signal same_period_count : integer := 0;
    signal different_period_count : integer := 0;
    signal same_period_count_last : integer := 0;
    signal count_clks : integer := 0;
    signal ref_clock_input_freq_MHz_min : real := 400.000;      -- valid min freq in MHz
    signal ref_clock_input_freq_MHz_max : real := 1066.000;     -- valid max freq in MHz

    begin
    
    WireDelay : block
    begin
      VitalWireDelay (CLKIN_ipd,CLKIN,tipd_CLKIN);
      VitalWireDelay (PWRDWN_ipd,PWRDWN,tipd_PWRDWN);
      VitalWireDelay (RST_ipd,RST,tipd_RST);
    end block;
    
    SignalDelay : block
    begin
    end block;
    
    CLKIN_in <= CLKIN_ipd after INCLK_DELAY;
    
    PWRDWN_in <= PWRDWN_ipd after IN_DELAY;
    RST_in <= RST_ipd after IN_DELAY;
    
    LOCKED_out <= LOCKED_outdelay after OUT_DELAY;
    
    CLKIN_indelay <= CLKIN_in;
    
    PWRDWN_indelay <= PWRDWN_in;
    RST_indelay <= RST_in;
    GSR_indelay <= GSR;
    
    
--    prcs_lock:process(CLKIN_indelay, RST_indelay, PWRDWN_indelay, GSR_indelay)
--    begin
--      if(rising_edge(CLKIN_indelay) and (RST_indelay = '0') and (PWRDWN_indelay = '0') and (GSR_indelay = '0'))then
--          LOCKED_outdelay <= '1';
--      else
--          LOCKED_outdelay <= '0';
--      end if;
--    end process prcs_lock;

    prcs_period_count:process(CLKIN_indelay)
    begin
      if (rising_edge(CLKIN_indelay)) then
        last_ref_clock_input_period <= ref_clock_input_period;
        last_ref_clock_input_freq_MHz <= ref_clock_input_freq_MHz;
        same_period_count_last <= same_period_count;
        ref_clock_input_period <= real(now/1 ps) - time_last_rising_edge;
        ref_clock_input_freq_MHz <= (real(1e6) / (real(now/1 ps) - time_last_rising_edge));
        time_last_rising_edge <= real(now/1 ps);
        if ((RST_indelay = '0') and (PWRDWN_indelay = '0') and 
            (ref_clock_input_period - last_ref_clock_input_period <= REF_CLK_JITTER_MAX) and
            (last_ref_clock_input_period - ref_clock_input_period <= REF_CLK_JITTER_MAX)) then
          if (same_period_count < 6) then 
            same_period_count <= same_period_count + 1;
          end if;
          if ( (same_period_count >= 3) and (same_period_count /= same_period_count_last) and (different_period_count /= 0) ) then
            different_period_count <= 0; --reset different_period_count
          end if;
        else -- detecting different clock-preiod
          different_period_count <= different_period_count + 1;
          if ( (different_period_count >= 1)  and (same_period_count /= 0) ) then
            same_period_count <= 0 ;      --reset same_period_count
          end if;
        end if;
      end if;
    end process prcs_period_count;

    prcs_locked:process(CLKIN_indelay, RST_indelay, PWRDWN_indelay) begin
      if ((RST_indelay = '1') or (PWRDWN_indelay = '1')) then
        LOCKED_outdelay <= '0';
        count_clks <= 0;
      elsif (rising_edge(CLKIN_indelay) and (same_period_count >= 1) and (count_clks < 6)) then
        count_clks <= count_clks + 1;
      elsif (rising_edge(CLKIN_indelay) and (different_period_count >= 1)) then
        LOCKED_outdelay <= '0';
        count_clks <= 0;
      elsif ( (count_clks >= 5) and
           ((ref_clock_input_freq_MHz + last_ref_clock_input_freq_MHz)/2.000 >= ref_clock_input_freq_MHz_min) and
           ((ref_clock_input_freq_MHz + last_ref_clock_input_freq_MHz)/2.000 <= ref_clock_input_freq_MHz_max) ) then 
        LOCKED_outdelay <= '1';
      end if;
    end process prcs_locked;

    prcs_period_check:process(CLKIN_indelay)
    variable message : LINE;
    begin
      if ( rising_edge(CLKIN_indelay) and (count_clks = 5) and 
         ( ((ref_clock_input_freq_MHz + last_ref_clock_input_freq_MHz)/2.000 < ref_clock_input_freq_MHz_min) or
           ((ref_clock_input_freq_MHz + last_ref_clock_input_freq_MHz)/2.000 > ref_clock_input_freq_MHz_max) ) ) then
        Write ( message, STRING'(" Warning: Invalid average CLKIN frequency detected = "));
        Write ( message, (ref_clock_input_freq_MHz + last_ref_clock_input_freq_MHz)/2.000 );
        Write ( message, STRING'(" MHz"));
        Write ( message, LF );
        Write ( message, STRING'("     on "));
        Write ( message, MODULE_NAME );
        Write ( message, STRING'(" instance "));
        Write ( message, STRING'(X_PHASER_REF'path_name));
        Write ( message, STRING'(" at time "));
        Write ( message, now/1 ps );
        Write ( message, STRING'(" ps."));
        Write ( message, LF );
        Write ( message, STRING'(" The valid CLKIN frequency range is: Minimum = "));
        Write ( message, ref_clock_input_freq_MHz_min);
        Write ( message, STRING'(" MHZ"));
        Write ( message, LF );
        Write ( message, STRING'("                                     Maximum = "));
        Write ( message, ref_clock_input_freq_MHz_max);
        Write ( message, STRING'(" MHZ"));
        Write ( message, LF );
        ASSERT FALSE REPORT message.ALL SEVERITY Warning;
        DEALLOCATE (message);
      end if;
    end process prcs_period_check;

    TIMING : process
      variable Pviol_CLKIN : STD_ULOGIC := '0';
      variable Pviol_PWRDWN : STD_ULOGIC := '0';
      variable Pviol_RST : STD_ULOGIC := '0';
      variable PInfo_CLKIN : VitalPeriodDataType := VitalPeriodDataInit;
      variable PInfo_PWRDWN : VitalPeriodDataType := VitalPeriodDataInit;
      variable PInfo_RST : VitalPeriodDataType := VitalPeriodDataInit;

      begin

        VitalPeriodPulseCheck
        (
          Violation      => Pviol_CLKIN,
          PeriodData     => PInfo_CLKIN,
          TestSignal     => CLKIN_dly,
          TestSignalName => "CLKIN",
          TestDelay      => 0 ps,
          Period         => 0 ps,
          PulseWidthHigh => tpw_CLKIN_posedge,
          PulseWidthLow  => tpw_CLKIN_negedge,
          CheckEnabled   => TRUE,
          HeaderMsg      => InstancePath & "/" & MODULE_NAME,
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
        VitalPeriodPulseCheck
        (
          Violation      => Pviol_CLKIN,
          PeriodData     => PInfo_CLKIN,
          TestSignal     => CLKIN_dly,
          TestSignalName => "CLKIN",
          TestDelay      => 0 ps,
          Period         => tperiod_CLKIN_posedge,
          PulseWidthHigh => 0 ps,
          PulseWidthLow  => 0 ps,
          CheckEnabled   => TRUE,
          HeaderMsg      => InstancePath & "/" & MODULE_NAME,
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
        VitalPeriodPulseCheck
        (
          Violation      => Pviol_PWRDWN,
          PeriodData     => PInfo_PWRDWN,
          TestSignal     => PWRDWN_dly,
          TestSignalName => "PWRDWN",
          TestDelay      => 0 ps,
          Period         => 0 ps,
          PulseWidthHigh => tpw_PWRDWN_posedge,
          PulseWidthLow  => tpw_PWRDWN_negedge,
          CheckEnabled   => TRUE,
          HeaderMsg      => InstancePath & "/" & MODULE_NAME,
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
        VitalPeriodPulseCheck
        (
          Violation      => Pviol_RST,
          PeriodData     => PInfo_RST,
          TestSignal     => RST_dly,
          TestSignalName => "RST",
          TestDelay      => 0 ps,
          Period         => 0 ps,
          PulseWidthHigh => tpw_RST_posedge,
          PulseWidthLow  => tpw_RST_negedge,
          CheckEnabled   => TRUE,
          HeaderMsg      => InstancePath & "/" & MODULE_NAME,
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
      wait on
        LOCKED_out;
    end process TIMING;
    LOCKED <= LOCKED_out;

  end X_PHASER_REF_V;
