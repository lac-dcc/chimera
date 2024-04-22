-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Dual Data Rate Output D Flip-Flop
-- /___/   /\     Filename : X_ODDR2.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:20 PST 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    27/05/08 - CR 472154 Removed Vital GSR constructs
--    08/20/08 - CR 478850 added pulldown on R/S and pullup on CE.
--    01/12/09 - IR 503207 Reworked C0/C1 alignments
--    01/30/09 - IR 505640 fix 
--    05/01/09 - CR 519905 Fixed negative setup issue
--    10/08/10 - CR 570949 Fixed 50% duty cycle issue
-- End Revision

----- CELL X_ODDR2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_ODDR2 is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

-- workaround for scirocco
      tbpd_R_Q_C0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tbpd_S_Q_C0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
  
--  VITAL input Pin path delay variables
      tipd_C0   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_C1   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_CE   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_D0   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_D1   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_R    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_S    : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_C0_Q   : VitalDelayType01 := (100 ps, 100 ps);
      tpd_C1_Q   : VitalDelayType01 := (100 ps, 100 ps);

--  VITAL async rest-to-output path delay variables
      tpd_R_Q   : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL async set-to-output path delay variables
      tpd_S_Q   : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL GSR-to-output path delay variable


--  VITAL ticd & tisd variables
      ticd_C0     : VitalDelayType   := 0.0 ps;
      ticd_C1     : VitalDelayType   := 0.0 ps;
      tisd_D0_C0  : VitalDelayType   := 0.0 ps;
      tisd_D1_C0  : VitalDelayType   := 0.0 ps;
      tisd_D0_C1  : VitalDelayType   := 0.0 ps;
      tisd_D1_C1  : VitalDelayType   := 0.0 ps;
      tisd_CE_C0  : VitalDelayType   := 0.0 ps;
      tisd_CE_C1  : VitalDelayType   := 0.0 ps;
      tisd_R_C0   : VitalDelayType   := 0.0 ps;
      tisd_R_C1   : VitalDelayType   := 0.0 ps;
      tisd_S_C0   : VitalDelayType   := 0.0 ps;
      tisd_S_C1   : VitalDelayType   := 0.0 ps;

--  VITAL Setup/Hold delay variables
      tsetup_CE_C0_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_CE_C0_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_CE_C0_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_CE_C0_negedge_posedge  : VitalDelayType := 0.0 ps;
      tsetup_CE_C1_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_CE_C1_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_CE_C1_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_CE_C1_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_D0_C0_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D0_C0_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D0_C0_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D0_C0_negedge_posedge  : VitalDelayType := 0.0 ps;
      tsetup_D1_C0_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D1_C0_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D1_C0_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D1_C0_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_D0_C1_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D0_C1_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D0_C1_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D0_C1_negedge_posedge  : VitalDelayType := 0.0 ps;
      tsetup_D1_C1_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_D1_C1_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_D1_C1_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_D1_C1_negedge_posedge  : VitalDelayType := 0.0 ps;

      tsetup_R_C0_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_R_C0_negedge_posedge : VitalDelayType := 0 ps;
      thold_R_C0_posedge_posedge  : VitalDelayType := 0 ps;
      thold_R_C0_negedge_posedge  : VitalDelayType := 0 ps;
      tsetup_R_C1_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_R_C1_negedge_posedge : VitalDelayType := 0 ps;
      thold_R_C1_posedge_posedge  : VitalDelayType := 0 ps;
      thold_R_C1_negedge_posedge  : VitalDelayType := 0 ps;
  
      tsetup_S_C0_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_S_C0_negedge_posedge : VitalDelayType := 0 ps;
      thold_S_C0_posedge_posedge  : VitalDelayType := 0 ps;
      thold_S_C0_negedge_posedge  : VitalDelayType := 0 ps;
      tsetup_S_C1_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_S_C1_negedge_posedge : VitalDelayType := 0 ps;
      thold_S_C1_posedge_posedge  : VitalDelayType := 0 ps;
      thold_S_C1_negedge_posedge  : VitalDelayType := 0 ps;
  
-- VITAL pulse width variables
      tpw_C0_negedge              : VitalDelayType := 0 ps;
      tpw_C0_posedge              : VitalDelayType := 0 ps;
      tpw_C1_negedge              : VitalDelayType := 0 ps;
      tpw_C1_posedge              : VitalDelayType := 0 ps;
  
      tpw_R_posedge              : VitalDelayType := 0 ps;
      tpw_S_posedge              : VitalDelayType := 0 ps;

-- VITAL period variables
      tperiod_C0_posedge          : VitalDelayType := 0 ps;
      tperiod_C1_posedge          : VitalDelayType := 0 ps;

-- VITAL recovery time variables
      trecovery_R_C0_negedge_posedge   : VitalDelayType := 0 ps;
      trecovery_S_C0_negedge_posedge   : VitalDelayType := 0 ps;
      trecovery_R_C1_negedge_posedge   : VitalDelayType := 0 ps;
      trecovery_S_C1_negedge_posedge   : VitalDelayType := 0 ps;
  
-- VITAL removal time variables
      tremoval_R_C0_negedge_posedge    : VitalDelayType := 0 ps;
      tremoval_S_C0_negedge_posedge    : VitalDelayType := 0 ps;
      tremoval_R_C1_negedge_posedge    : VitalDelayType := 0 ps;
      tremoval_S_C1_negedge_posedge    : VitalDelayType := 0 ps;

      DDR_ALIGNMENT : string := "NONE";
      INIT          : bit    := '0';
      SRTYPE        : string := "SYNC"
      );

  port(
      Q           : out std_ulogic;

      C0          : in  std_ulogic;
      C1          : in  std_ulogic;
      CE          : in  std_ulogic := 'H';
      D0          : in  std_ulogic;
      D1          : in  std_ulogic;
      R           : in  std_ulogic := 'L';
      S           : in  std_ulogic := 'L'
    );

  attribute VITAL_LEVEL0 of
    X_ODDR2 : entity is true;

end X_ODDR2;

architecture X_ODDR2_V OF X_ODDR2 is

  attribute VITAL_LEVEL0 of
    X_ODDR2_V : architecture is true;


  constant SYNC_PATH_DELAY : time := 100 ps;

  signal C0_ipd	        : std_ulogic := 'X';
  signal C1_ipd	        : std_ulogic := 'X';
  signal CE_ipd	        : std_ulogic := 'X';
  signal D0_ipd	        : std_ulogic := 'X';
  signal D1_ipd	        : std_ulogic := 'X';
  signal GSR_ipd	: std_ulogic := 'X';
  signal R_ipd		: std_ulogic := 'X';
  signal S_ipd		: std_ulogic := 'X';

  signal C0_dly	        : std_ulogic := 'X';
  signal C1_dly	        : std_ulogic := 'X';
  signal CE_C0_dly      : std_ulogic := 'X';
  signal CE_C1_dly      : std_ulogic := 'X';
  signal D0_C0_dly      : std_ulogic := 'X';
  signal D0_C1_dly      : std_ulogic := 'X';
  signal D1_C0_dly      : std_ulogic := 'X';
  signal D1_C1_dly      : std_ulogic := 'X';
  signal GSR_dly	: std_ulogic := '0';
  signal R_dly		: std_ulogic := 'X';
  signal S_dly		: std_ulogic := 'X';

  signal PC0_dly        : std_ulogic := 'X';
  signal PC1_dly        : std_ulogic := 'X';

  signal Q_zd		: std_ulogic := 'X';

  signal Q_viol		: std_ulogic := 'X';

  signal ddr_alignment_type	: integer := -999;
  signal sr_type		: integer := -999;

begin

  GSR_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (C0_ipd,  C0,  tipd_C0);
    VitalWireDelay (C1_ipd,  C1,  tipd_C1);
    VitalWireDelay (CE_ipd,  CE,  tipd_CE);
    VitalWireDelay (D0_ipd,  D0,  tipd_D0);
    VitalWireDelay (D1_ipd,  D1,  tipd_D1);
    VitalWireDelay (R_ipd,   R,   tipd_R);
    VitalWireDelay (S_ipd,   S,   tipd_S);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (C0_dly,  C0_ipd,  ticd_C0);
    VitalSignalDelay (C1_dly,  C1_ipd,  ticd_C1);

    VitalSignalDelay (CE_C0_dly,  CE_ipd,  tisd_CE_C0);
    VitalSignalDelay (CE_C1_dly,  CE_ipd,  tisd_CE_C1);

    VitalSignalDelay (D0_C0_dly,  D0_ipd,  tisd_D0_C0);
    VitalSignalDelay (D0_C1_dly,  D0_ipd,  tisd_D0_C1);
    VitalSignalDelay (D1_C0_dly,  D1_ipd,  tisd_D1_C0);
    VitalSignalDelay (D1_C1_dly,  D1_ipd,  tisd_D1_C1);

    VitalSignalDelay (R_dly,   R_ipd,   tisd_R_C0);
    VitalSignalDelay (S_dly,   S_ipd,   tisd_S_C0);
  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------

--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process

  begin
      if((DDR_ALIGNMENT = "NONE") or (DDR_ALIGNMENT = "none")) then
         ddr_alignment_type <= 1;
      elsif((DDR_ALIGNMENT = "C0") or (DDR_ALIGNMENT = "c0")) then
         ddr_alignment_type <= 2;
      elsif((DDR_ALIGNMENT = "C1") or (DDR_ALIGNMENT = "c1")) then
         ddr_alignment_type <= 3;
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Error :",
             GenericName => " DDR_ALIGNMENT ",
             EntityName => "/ODDR2",
             GenericValue => DDR_ALIGNMENT,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " NONE, C0 or C1.",
             TailMsg => "",
             MsgSeverity => failure
         );
      end if;

      if((SRTYPE = "ASYNC") or (SRTYPE = "async")) then
         sr_type <= 1;
      elsif((SRTYPE = "SYNC") or (SRTYPE = "sync")) then
         sr_type <= 2;
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Error :",
             GenericName => " SRTYPE ",
             EntityName => "/ODDR2",
             GenericValue => SRTYPE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " ASYNC or SYNC. ",
             TailMsg => "",
             MsgSeverity => failure
         );
      end if;

     wait;
  end process prcs_init;

--####################################################################
--#####                     Clocks                               #####
--####################################################################
  prcs_clocks:process(C0_dly, C1_dly)
  begin
     if(((DDR_ALIGNMENT = "C0") or (DDR_ALIGNMENT = "c0")) or ((DDR_ALIGNMENT = "NONE") or (DDR_ALIGNMENT = "none"))) then
        PC0_dly <= C0_dly;
     else
        PC0_dly <= C1_dly;
     end if; 

     if(((DDR_ALIGNMENT = "C0") or (DDR_ALIGNMENT = "c0")) or ((DDR_ALIGNMENT = "NONE") or (DDR_ALIGNMENT = "none"))) then
        PC1_dly <= C1_dly;
     else
        PC1_dly <= C0_dly;
     end if; 
  end process prcs_clocks;

--####################################################################
--#####                      functionality                       #####
--####################################################################
  prcs_func_reg:process(PC0_dly, PC1_dly, GSR_dly, R_dly, S_dly)
    variable FIRST_TIME : boolean := true;
    variable q_var         : std_ulogic := TO_X01(INIT);
    variable q_d1_c0_out_var : std_ulogic := TO_X01(INIT);
  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
         q_var         := TO_X01(INIT);
         q_d1_c0_out_var := TO_X01(INIT);
         FIRST_TIME := false;
     else
        case sr_type is
           when 1 => 
                   if(R_dly = '1') then
                      q_var := '0';
                      q_d1_c0_out_var := '0';
                   elsif(((R_dly = '0') or (R_dly = 'L'))and (S_dly = '1')) then
                      q_var := '1';
                      q_d1_c0_out_var := '1';
                   elsif(((R_dly = '0')  or (R_dly = 'L')) and ((S_dly = '0') or (S_dly = 'L'))) then
                      if(rising_edge(PC0_dly)) then
                         if(CE_C0_dly = '1') then
                             q_var := D0_C0_dly;
                             q_d1_c0_out_var := D1_C0_dly;
                         end if;
                      end if;
                      if(rising_edge(PC1_dly)) then
                         if(CE_C1_dly = '1') then
                           if(ddr_alignment_type = 1) then
                             q_var := D1_C1_dly;
                           else
                             q_var := q_d1_c0_out_var;
                           end if;
                         end if;
                      end if;
                   end if;

           when 2 => 
                   if(rising_edge(PC0_dly)) then
                      if(R_dly = '1') then
                         q_var := '0';
                         q_d1_c0_out_var := '0';
                      elsif(((R_dly = '0')  or (R_dly = 'L')) and (S_dly = '1')) then
                         q_var := '1';
                         q_d1_c0_out_var := '1';
                      elsif(((R_dly = '0')  or (R_dly = 'L')) and ((S_dly = '0') or (S_dly = 'L'))) then
                         if(CE_C0_dly = '1') then
                           q_var := D0_C0_dly;
                           q_d1_c0_out_var := D1_C0_dly;
                         end if;
                      end if;
                   end if;
                        
                   if(rising_edge(PC1_dly)) then
                      if(R_dly = '1') then
                         q_var := '0';
                      elsif(((R_dly = '0')  or (R_dly = 'L')) and (S_dly = '1')) then
                         q_var := '1';
                      elsif(((R_dly = '0')  or (R_dly = 'L')) and ((S_dly = '0') or (S_dly = 'L'))) then
                         if(CE_C1_dly = '1') then
                           if(ddr_alignment_type = 1) then
                             q_var := D1_C1_dly;
                           else
                             q_var := q_d1_c0_out_var;
                           end if;
                         end if;
                      end if;
                   end if;
 
           when others =>
                   null; 
        end case;
     end if;

     Q_zd <= q_var;

  end process prcs_func_reg;

--####################################################################

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_tmngchk:process

  variable PInfo_R : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_R : std_ulogic          := '0';

  variable PInfo_S : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_S : std_ulogic          := '0';

  variable Pviol_C0 :  std_ulogic          := '0';
  variable PInfo_C0 :  VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_C1 :  std_ulogic          := '0';
  variable PInfo_C1 :  VitalPeriodDataType := VitalPeriodDataInit;

  variable Tmkr_CE_C0_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_CE_C0_posedge : std_ulogic := '0';

  variable Tmkr_CE_C1_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_CE_C1_posedge : std_ulogic := '0';

  variable Tmkr_D0_C0_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_D0_C0_posedge : std_ulogic := '0';

  variable Tmkr_D0_C1_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_D0_C1_posedge : std_ulogic := '0';

  variable Tmkr_D1_C0_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_D1_C0_posedge : std_ulogic := '0';

  variable Tmkr_D1_C1_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_D1_C1_posedge : std_ulogic := '0';

  variable Tmkr_R_C0_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_R_C0_posedge : std_ulogic := '0';

  variable Tmkr_R_C1_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_R_C1_posedge : std_ulogic := '0';

  variable Tmkr_S_C0_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_S_C0_posedge : std_ulogic := '0';

  variable Tmkr_S_C1_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_S_C1_posedge : std_ulogic := '0';

  variable Violation           : std_ulogic          := '0';

  begin
    if (TimingChecksOn) then
--=====  Vital SetupHold Check for signal CE =====
       VitalSetupHoldCheck (
         Violation            => Tviol_CE_C0_posedge,
         TimingData           => Tmkr_CE_C0_posedge,
         TestSignal           => CE_C0_dly,
         TestSignalName       => "CE",
         TestDelay            => tisd_CE_C0,
         RefSignal            => C0_dly,
         RefSignalName        => "C0",
         RefDelay             => ticd_C0,
         SetupHigh            => tsetup_CE_C0_posedge_posedge,
         SetupLow             => tsetup_CE_C0_negedge_posedge,
         HoldHigh             => thold_CE_C0_posedge_posedge,
         HoldLow              => thold_CE_C0_negedge_posedge,
         CheckEnabled         => true,
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_ODDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal CE =====
       VitalSetupHoldCheck (
         Violation            => Tviol_CE_C1_posedge,
         TimingData           => Tmkr_CE_C1_posedge,
         TestSignal           => CE_C1_dly,
         TestSignalName       => "CE",
         TestDelay            => tisd_CE_C1,
         RefSignal            => C1_dly,
         RefSignalName        => "C1",
         RefDelay             => ticd_C1,
         SetupHigh            => tsetup_CE_C1_posedge_posedge,
         SetupLow             => tsetup_CE_C1_negedge_posedge,
         HoldHigh             => thold_CE_C1_posedge_posedge,
         HoldLow              => thold_CE_C1_negedge_posedge,
         CheckEnabled         => true,
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_ODDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal D0 =====
       VitalSetupHoldCheck (
         Violation            => Tviol_D0_C0_posedge,
         TimingData           => Tmkr_D0_C0_posedge,
         TestSignal           => D0_C0_dly,
         TestSignalName       => "D0",
         TestDelay            => tisd_D0_C0,
         RefSignal            => C0_dly,
         RefSignalName        => "C0",
         RefDelay             => ticd_C0,
         SetupHigh            => tsetup_D0_C0_posedge_posedge,
         SetupLow             => tsetup_D0_C0_negedge_posedge,
         HoldHigh             => thold_D0_C0_posedge_posedge,
         HoldLow              => thold_D0_C0_negedge_posedge,
         CheckEnabled         => true,
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_ODDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal D0 =====
       VitalSetupHoldCheck (
         Violation            => Tviol_D0_C1_posedge,
         TimingData           => Tmkr_D0_C1_posedge,
         TestSignal           => D0_C1_dly,
         TestSignalName       => "D0",
         TestDelay            => tisd_D0_C1,
         RefSignal            => C1_dly,
         RefSignalName        => "C1",
         RefDelay             => ticd_C1,
         SetupHigh            => tsetup_D0_C1_posedge_posedge,
         SetupLow             => tsetup_D0_C1_negedge_posedge,
         HoldHigh             => thold_D0_C1_posedge_posedge,
         HoldLow              => thold_D0_C1_negedge_posedge,
         CheckEnabled         => true,
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_ODDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal D1 =====
       VitalSetupHoldCheck (
         Violation            => Tviol_D1_C0_posedge,
         TimingData           => Tmkr_D1_C0_posedge,
         TestSignal           => D1_C0_dly,
         TestSignalName       => "D1",
         TestDelay            => tisd_D1_C0,
         RefSignal            => C0_dly,
         RefSignalName        => "C0",
         RefDelay             => ticd_C0,
         SetupHigh            => tsetup_D1_C0_posedge_posedge,
         SetupLow             => tsetup_D1_C0_negedge_posedge,
         HoldHigh             => thold_D1_C0_posedge_posedge,
         HoldLow              => thold_D1_C0_negedge_posedge,
         CheckEnabled         => true,
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_ODDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal D1 =====
       VitalSetupHoldCheck (
         Violation            => Tviol_D1_C1_posedge,
         TimingData           => Tmkr_D1_C1_posedge,
         TestSignal           => D1_C1_dly,
         TestSignalName       => "D1",
         TestDelay            => tisd_D1_C1,
         RefSignal            => C1_dly,
         RefSignalName        => "C1",
         RefDelay             => ticd_C1,
         SetupHigh            => tsetup_D1_C1_posedge_posedge,
         SetupLow             => tsetup_D1_C1_negedge_posedge,
         HoldHigh             => thold_D1_C1_posedge_posedge,
         HoldLow              => thold_D1_C1_negedge_posedge,
         CheckEnabled         => true,
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_ODDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);

       --=====  Vital Pulse Width Check for signal C0 =====
       VitalPeriodPulseCheck (
         Violation            => Pviol_C0,
         PeriodData           => PInfo_C0,
         TestSignal           => C0_dly,
         TestSignalName       => "C0",
         TestDelay            => 0 ps,
         Period               => tperiod_C0_posedge,
         PulseWidthHigh       => tpw_C0_posedge,
         PulseWidthLow        => tpw_C0_negedge,
         CheckEnabled         => true,
         HeaderMsg            => InstancePath & "/X_ODDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital Pulse Width Check for signal C1 =====
       VitalPeriodPulseCheck (
         Violation            => Pviol_C1,
         PeriodData           => PInfo_C1,
         TestSignal           => C1_dly,
         TestSignalName       => "C1",
         TestDelay            => 0 ps,
         Period               => tperiod_C1_posedge,
         PulseWidthHigh       => tpw_C1_posedge,
         PulseWidthLow        => tpw_C1_negedge,
         CheckEnabled         => true,
         HeaderMsg            => InstancePath & "/X_ODDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);

       VitalPeriodPulseCheck (
         Violation            => Pviol_R,
         PeriodData           => PInfo_R,
         TestSignal           => R_dly,
         TestSignalName       => "R",
         TestDelay            => 0 ps,
         Period               => 0 ps,
         PulseWidthHigh       => tpw_R_posedge,
         PulseWidthLow        => 0 ps,
         CheckEnabled         => true,
         HeaderMsg            => "/X_IDDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
       VitalPeriodPulseCheck (
         Violation            => Pviol_S,
         PeriodData           => PInfo_S,
         TestSignal           => S_dly,
         TestSignalName       => "S",
         TestDelay            => 0 ps,
         Period               => 0 ps,
         PulseWidthHigh       => tpw_S_posedge,
         PulseWidthLow        => 0 ps,
         CheckEnabled         => true,
         HeaderMsg            => "/X_IDDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
       
       if (SRTYPE = "ASYNC" ) then
--=====  Vital Recovery/Removal Check for signal R =====
         VitalRecoveryRemovalCheck (
           Violation            => Tviol_R_C0_posedge,
           TimingData           => Tmkr_R_C0_posedge,
           TestSignal           => R_dly,
           TestSignalName       => "R",
           TestDelay            => tisd_R_C0,
           RefSignal            => C0_dly,
           RefSignalName        => "C0",
           RefDelay             => ticd_C0,
           Recovery             => trecovery_R_C0_negedge_posedge,
           Removal              => tremoval_R_C0_negedge_posedge,
           ActiveLow            => FALSE,
           CheckEnabled         => true,
           RefTransition        => 'R',
           HeaderMsg            => InstancePath & "/X_ODDR2",
           Xon                  => Xon,
           MsgOn                => true,
           MsgSeverity          => Error);
--=====  Vital Recovery/Removal Check for signal R =====
         VitalRecoveryRemovalCheck (
           Violation            => Tviol_R_C1_posedge,
           TimingData           => Tmkr_R_C1_posedge,
           TestSignal           => R_dly,
           TestSignalName       => "R",
           TestDelay            => tisd_R_C1,
           RefSignal            => C1_dly,
           RefSignalName        => "C1",
           RefDelay             => ticd_C1,
           Recovery             => trecovery_R_C1_negedge_posedge,
           Removal              => tremoval_R_C1_negedge_posedge,
           ActiveLow            => FALSE,
           CheckEnabled         => true,
           RefTransition        => 'R',
           HeaderMsg            => InstancePath & "/X_ODDR2",
           Xon                  => Xon,
           MsgOn                => true,
           MsgSeverity          => Error);
--=====  Vital Recovery/Removal Check for signal S =====
         VitalRecoveryRemovalCheck (
           Violation            => Tviol_S_C0_posedge,
           TimingData           => Tmkr_S_C0_posedge,
           TestSignal           => S_dly,
           TestSignalName       => "S",
           TestDelay            => tisd_S_C0,
           RefSignal            => C0_dly,
           RefSignalName        => "C0",
           RefDelay             => ticd_C0,
           Recovery             => trecovery_S_C0_negedge_posedge,
           Removal              => tremoval_S_C0_negedge_posedge,
           ActiveLow            => FALSE,
           CheckEnabled         => true,
           RefTransition        => 'R',
           HeaderMsg            => InstancePath & "/X_ODDR2",
           Xon                  => Xon,
           MsgOn                => true,
           MsgSeverity          => Error);
--=====  Vital Recovery/Removal Check for signal S =====
         VitalRecoveryRemovalCheck (
           Violation            => Tviol_S_C1_posedge,
           TimingData           => Tmkr_S_C1_posedge,
           TestSignal           => S_dly,
           TestSignalName       => "S",
           TestDelay            => tisd_S_C1,
           RefSignal            => C1_dly,
           RefSignalName        => "C1",
           RefDelay             => ticd_C1,
           Recovery             => trecovery_S_C1_negedge_posedge,
           Removal              => tremoval_S_C1_negedge_posedge,
           ActiveLow            => FALSE,
           CheckEnabled         => true,
           RefTransition        => 'R',
           HeaderMsg            => InstancePath & "/X_ODDR2",
           Xon                  => Xon,
           MsgOn                => true,
           MsgSeverity          => Error);

       elsif (SRTYPE = "SYNC" ) then
--=====  Vital SetupHold Check for signal R =====
         VitalSetupHoldCheck (
           Violation            => Tviol_R_C0_posedge,
           TimingData           => Tmkr_R_C0_posedge,
           TestSignal           => R_dly,
           TestSignalName       => "R",
           TestDelay            => tisd_R_C0,
           RefSignal            => C0_dly,
           RefSignalName        => "C0",
           RefDelay             => ticd_C0,
           SetupHigh            => tsetup_R_C0_posedge_posedge,
           SetupLow             => tsetup_R_C0_negedge_posedge,
           HoldHigh             => thold_R_C0_posedge_posedge,
           HoldLow              => thold_R_C0_negedge_posedge,
           CheckEnabled         => true,
           RefTransition        => 'R',
           HeaderMsg            => InstancePath & "/X_ODDR2",
           Xon                  => Xon,
           MsgOn                => true,
           MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal R =====
         VitalSetupHoldCheck (
            Violation            => Tviol_R_C1_posedge,
            TimingData           => Tmkr_R_C1_posedge,
            TestSignal           => R_dly,
            TestSignalName       => "R",
            TestDelay            => tisd_R_C1,
            RefSignal            => C1_dly,
            RefSignalName        => "C1",
            RefDelay             => ticd_C1,
            SetupHigh            => tsetup_R_C1_posedge_posedge,
            SetupLow             => tsetup_R_C1_negedge_posedge,
            HoldHigh             => thold_R_C1_posedge_posedge,
            HoldLow              => thold_R_C1_negedge_posedge,
            CheckEnabled         => true,
            RefTransition        => 'R',
            HeaderMsg            => InstancePath & "/X_ODDR2",
            Xon                  => Xon,
            MsgOn                => true,
            MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal S =====
         VitalSetupHoldCheck (
           Violation            => Tviol_S_C0_posedge,
           TimingData           => Tmkr_S_C0_posedge,
           TestSignal           => S_dly,
           TestSignalName       => "S",
           TestDelay            => tisd_S_C0,
           RefSignal            => C0_dly,
           RefSignalName        => "C0",
           RefDelay             => ticd_C0,
           SetupHigh            => tsetup_S_C0_posedge_posedge,
           SetupLow             => tsetup_S_C0_negedge_posedge,
           HoldHigh             => thold_S_C0_posedge_posedge,
           HoldLow              => thold_S_C0_negedge_posedge,
           CheckEnabled         => true,
           RefTransition        => 'R',
           HeaderMsg            => InstancePath & "/X_ODDR2",
           Xon                  => Xon,
           MsgOn                => true,
           MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal S =====
         VitalSetupHoldCheck (
           Violation            => Tviol_S_C1_posedge,
           TimingData           => Tmkr_S_C1_posedge,
           TestSignal           => S_dly,
           TestSignalName       => "S",
           TestDelay            => tisd_S_C1,
           RefSignal            => C1_dly,
           RefSignalName        => "C1",
           RefDelay             => ticd_C1,
           SetupHigh            => tsetup_S_C1_posedge_posedge,
           SetupLow             => tsetup_S_C1_negedge_posedge,
           HoldHigh             => thold_S_C1_posedge_posedge,
           HoldLow              => thold_S_C1_negedge_posedge,
           CheckEnabled         => true,
           RefTransition        => 'R',
           HeaderMsg            => InstancePath & "/X_ODDR2",
           Xon                  => Xon,
           MsgOn                => true,
           MsgSeverity          => Error);

        end if;
       
    end if;

    Violation := Tviol_CE_C0_posedge or Tviol_CE_C1_posedge or
                 Tviol_D0_C0_posedge or Tviol_D0_C1_posedge or
                 Tviol_D0_C1_posedge or Tviol_D1_C1_posedge or
                 Pviol_C0 or Pviol_C1;

    Q_viol     <= Violation xor Q_zd;

    wait on C0_dly, C1_dly, CE_C0_dly, CE_C1_dly, D0_C0_dly, D0_C1_dly, D1_C0_dly, D1_C1_dly, GSR_dly, R_dly, S_dly, Q_zd;
 
  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable  Q_GlitchData : VitalGlitchDataType;

  begin
    if (DDR_ALIGNMENT = "C0") then
     VitalPathDelay01
       (
         OutSignal     => Q,
         GlitchData    => Q_GlitchData,
         OutSignalName => "Q",
         OutTemp       => Q_viol,
         Paths         => (0 => (C0_dly'last_event, tpd_C0_Q, (C0_dly = '1')),
                           1 => (C1_dly'last_event, tpd_C0_Q, (C1_dly = '1')),
                           2 => (S_dly'last_event, tpd_S_Q, (R_dly /= '1')),
                           3 => (R_dly'last_event, tpd_R_Q, true)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => Error
       );
    elsif (DDR_ALIGNMENT = "C1") then
     VitalPathDelay01
       (
         OutSignal     => Q,
         GlitchData    => Q_GlitchData,
         OutSignalName => "Q",
         OutTemp       => Q_viol,
         Paths         => (0 => (C0_dly'last_event, tpd_C1_Q, (C0_dly = '1')),
                           1 => (C1_dly'last_event, tpd_C1_Q, (C1_dly = '1')),
                           2 => (S_dly'last_event, tpd_S_Q, (R_dly /= '1')),
                           3 => (R_dly'last_event, tpd_R_Q, true)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => Error
       );
    else
     VitalPathDelay01
       (
         OutSignal     => Q,
         GlitchData    => Q_GlitchData,
         OutSignalName => "Q",
         OutTemp       => Q_viol,
         Paths         => (0 => (C0_dly'last_event, tpd_C0_Q, (C0_dly = '1')),
                           1 => (C1_dly'last_event, tpd_C1_Q, (C1_dly = '1')),
                           2 => (S_dly'last_event, tpd_S_Q, (R_dly /= '1')),
                           3 => (R_dly'last_event, tpd_R_Q, true)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => Error
       );
    end if;
   wait on Q_viol;
  end process prcs_output;

end X_ODDR2_V;

