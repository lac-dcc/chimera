-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Dual Data Rate Input D Flip-Flop
-- /___/   /\     Filename : X_IDDR2.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:20 PST 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    27/05/08 - CR 472154 Removed Vital GSR constructs
--    08/20/08 - CR 478850 added pulldown on R/S and pullup on CE.
--    01/21/09 - CR 503784 pulldown on R/S enhancement.
--    04/08/09 - CR 517973 Reworked to matched Holistic tests
--    05/01/09 - CR 519905 Fixed negative setup issue
--    01/12/10 - CR 538181 Fixed R/S to take INIT values.
--    05/04/10 - CR 558177 revert the above CR. Holistic tests are failing
-- End Revision

----- CELL X_IDDR2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_IDDR2 is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

-- workaround for scirocco
      tbpd_R_Q0_C0 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tbpd_S_Q0_C0 : VitalDelayType01 := (0.000 ns, 0.000 ns);

      tbpd_R_Q1_C1 : VitalDelayType01 := (0.000 ns, 0.000 ns);
      tbpd_S_Q1_C1 : VitalDelayType01 := (0.000 ns, 0.000 ns);

--  VITAL input Pin path delay variables
      tipd_C0   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_C1   : VitalDelayType01 := (0 ps, 0 ps);  
      tipd_CE   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_D    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_R    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_S    : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_C0_Q0  : VitalDelayType01 := (100 ps, 100 ps);
      tpd_C0_Q1  : VitalDelayType01 := (100 ps, 100 ps);
      tpd_C1_Q0  : VitalDelayType01 := (100 ps, 100 ps);
      tpd_C1_Q1  : VitalDelayType01 := (100 ps, 100 ps);
  
--  VITAL async rest-to-output path delay variables
      tpd_R_Q0 : VitalDelayType01 := (0 ps, 0 ps);
      tpd_R_Q1 : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL async set-to-output path delay variables
      tpd_S_Q0 : VitalDelayType01 := (0 ps, 0 ps);
      tpd_S_Q1 : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL GSR-to-output path delay variable


--  VITAL ticd & tisd variables
      ticd_C0     : VitalDelayType   := 0.0 ps;
      ticd_C1     : VitalDelayType   := 0.0 ps;
      tisd_D_C0   : VitalDelayType   := 0.0 ps;
      tisd_D_C1   : VitalDelayType   := 0.0 ps;
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

      tsetup_D_C0_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_D_C0_negedge_posedge : VitalDelayType := 0 ps;
      thold_D_C0_posedge_posedge  : VitalDelayType := 0 ps;
      thold_D_C0_negedge_posedge  : VitalDelayType := 0 ps;
      tsetup_D_C1_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_D_C1_negedge_posedge : VitalDelayType := 0 ps;
      thold_D_C1_posedge_posedge  : VitalDelayType := 0 ps;
      thold_D_C1_negedge_posedge  : VitalDelayType := 0 ps;

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

      tpw_C0_negedge             : VitalDelayType := 0 ps;
      tpw_C0_posedge             : VitalDelayType := 0 ps;
      tpw_C1_negedge             : VitalDelayType := 0 ps;
      tpw_C1_posedge             : VitalDelayType := 0 ps;
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
      INIT_Q0       : bit    := '0';
      INIT_Q1       : bit    := '0';
      SRTYPE        : string := "SYNC"
      );

  port(
      Q0          : out std_ulogic;
      Q1          : out std_ulogic;

      C0          : in  std_ulogic;
      C1          : in  std_ulogic;
      CE          : in  std_ulogic := 'H';
      D           : in  std_ulogic;
      R           : in  std_ulogic := 'L';
      S           : in  std_ulogic := 'L'
    );

  attribute VITAL_LEVEL0 of
    X_IDDR2 : entity is true;

end X_IDDR2;

architecture X_IDDR2_V OF X_IDDR2 is

  attribute VITAL_LEVEL0 of
    X_IDDR2_V : architecture is true;


  constant SYNC_PATH_DELAY : time := 100 ps;

  signal C0_ipd	        : std_ulogic := 'X';
  signal C1_ipd	        : std_ulogic := 'X';
  signal CE_ipd	        : std_ulogic := 'X';
  signal D_ipd	        : std_ulogic := 'X';
  signal GSR_ipd	: std_ulogic := 'X';
  signal R_ipd		: std_ulogic := 'X';
  signal S_ipd		: std_ulogic := 'X';

  signal C0_dly	        : std_ulogic := 'X';
  signal C1_dly	        : std_ulogic := 'X';
  signal CE_C1_dly	: std_ulogic := 'X';
  signal CE_C0_dly	: std_ulogic := 'X';
  signal D_C0_dly       : std_ulogic := 'X';
  signal D_C1_dly       : std_ulogic := 'X';
  signal GSR_dly	: std_ulogic := '0';
  signal R_dly		: std_ulogic := 'X';
  signal S_dly		: std_ulogic := 'X';

  signal PC0_dly        : std_ulogic := 'X';
  signal PC1_dly        : std_ulogic := 'X';

  signal Q0_zd	        : std_ulogic := 'X';
  signal Q1_zd	        : std_ulogic := 'X';

  signal Q0_viol        : std_ulogic := 'X';
  signal Q1_viol        : std_ulogic := 'X';

  signal q0_o_reg	: std_ulogic := 'X';
  signal q0_c0_o_reg	: std_ulogic := 'X';
  signal q1_o_reg	: std_ulogic := 'X';
  signal q1_c0_o_reg	: std_ulogic := 'X';

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
    VitalWireDelay (D_ipd,   D,   tipd_D);
    VitalWireDelay (R_ipd,   R,   tipd_R);
    VitalWireDelay (S_ipd,   S,   tipd_S);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (C0_dly,  C0_ipd,  ticd_C0);
    VitalSignalDelay (C1_dly,  C1_ipd,  ticd_C1);
    VitalSignalDelay (CE_C0_dly,  CE_ipd,  tisd_CE_C0);
    VitalSignalDelay (CE_C1_dly,  CE_ipd,  tisd_CE_C1);
    VitalSignalDelay (D_C1_dly,  D_ipd,  tisd_D_C1);
    VitalSignalDelay (D_C0_dly,  D_ipd,  tisd_D_C0);
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
          (  HeaderMsg  => " Attribute Syntax Error ",
             GenericName => " DDR_ALIGNMENT ",
             EntityName => "/IDDR2",
             GenericValue => DDR_ALIGNMENT,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " NONE or C0 or C1.",
             TailMsg => "",
             MsgSeverity => ERROR 
         );
      end if;

      if((SRTYPE = "ASYNC") or (SRTYPE = "async")) then
         sr_type <= 1;
      elsif((SRTYPE = "SYNC") or (SRTYPE = "sync")) then
         sr_type <= 2;
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Error ",
             GenericName => " SRTYPE ",
             EntityName => "/IDDR2",
             GenericValue => SRTYPE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " ASYNC or SYNC. ",
             TailMsg => "",
             MsgSeverity => ERROR
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
--#####                    functionality                         #####
--####################################################################
  prcs_func_reg:process(PC0_dly, PC1_dly, GSR_dly, R_dly, S_dly)
  variable FIRST_TIME : boolean := true;
  variable q0_out_var : std_ulogic := TO_X01(INIT_Q0);
  variable q1_out_var : std_ulogic := TO_X01(INIT_Q1);
  variable q0_c0_out_var : std_ulogic := TO_X01(INIT_Q0);
  variable q1_c0_out_var : std_ulogic := TO_X01(INIT_Q1);
  begin
     if((GSR_dly = '1') or (FIRST_TIME)) then
       q0_out_var := TO_X01(INIT_Q0);
       q1_out_var := TO_X01(INIT_Q1);
       q0_c0_out_var := TO_X01(INIT_Q0);
       q1_c0_out_var := TO_X01(INIT_Q1);
       FIRST_TIME := false;
     else
        case sr_type is
           when 1 => 
                   if(R_dly = '1') then
                     q0_out_var := '0';
                     q1_out_var := '0';
                     q1_c0_out_var := '0';
                     q0_c0_out_var := '0';                     
                   elsif(((R_dly = '0') or (R_dly = 'L')) and (S_dly = '1')) then
                     q0_out_var := '1';
                     q1_out_var := '1';
                   elsif(((R_dly = '0')  or (R_dly = 'L')) and ((S_dly = '0') or (S_dly = 'L'))) then
                      if(rising_edge(PC0_dly)) then
                        if(CE_C0_dly = '1') then
                           q0_out_var := D_C0_dly;
                           q0_c0_out_var := q0_out_var;
                           q1_c0_out_var := q1_out_var;
                        end if;
                      end if;
                      if(rising_edge(PC1_dly)) then
                        if(CE_C1_dly = '1') then
                           q1_out_var := D_C1_dly;
                        end if;
                      end if;
                   end if;

           when 2 => 
                   if(rising_edge(PC0_dly)) then
                      if(R_dly = '1') then
                        q0_out_var := '0';
                        q0_c0_out_var := '0';
                        q1_c0_out_var := '0';
                      elsif(((R_dly = '0') or (R_dly = 'L')) and (S_dly = '1')) then
                        q0_out_var := '1';
                      elsif(((R_dly = '0')  or (R_dly = 'L')) and ((S_dly = '0') or (S_dly = 'L'))) then
                         if(CE_C0_dly = '1') then
                           q0_out_var := D_C0_dly;
                           q0_c0_out_var := q0_out_var;
                           q1_c0_out_var := q1_out_var;
                         end if;
                      end if;
                   end if;
                        
                   if(rising_edge(PC1_dly)) then
                      if(R_dly = '1') then
                        q1_out_var := '0';
                      elsif(((R_dly = '0') or (R_dly = 'L')) and (S_dly = '1')) then
                        q1_out_var := '1';
                      elsif(((R_dly = '0')  or (R_dly = 'L')) and ((S_dly = '0') or (S_dly = 'L'))) then
                         if(CE_C1_dly = '1') then
                           q1_out_var := D_C1_dly;
                         end if;
                      end if;
                   end if;
 
           when others =>
                   null; 
        end case;
     end if;
         
     q0_o_reg <= q0_out_var;
     q1_o_reg <= q1_out_var;
     q0_c0_o_reg <= q0_c0_out_var;
     q1_c0_o_reg <= q1_c0_out_var;

  end process prcs_func_reg;
--####################################################################
--#####                        output mux                        #####
--####################################################################
  prcs_output_mux:process(q0_o_reg, q1_o_reg, q0_c0_o_reg, q1_c0_o_reg)
  begin
     case ddr_alignment_type is
       when 1 => 
                 Q0_zd <= q0_o_reg;
                 Q1_zd <= q1_o_reg;
       when 2 => 
                 Q0_zd <= q0_o_reg;
                 Q1_zd <= q1_c0_o_reg;
       when 3 => 
                 Q0_zd <= q0_o_reg;
                 Q1_zd <= q1_c0_o_reg;
       when others =>
                 null;
     end case;
  end process prcs_output_mux;
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

  variable Tmkr_D_C0_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_D_C0_posedge : std_ulogic := '0';

  variable Tmkr_D_C1_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_D_C1_posedge : std_ulogic := '0';

  variable Tmkr_R_C0_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_R_C0_posedge : std_ulogic := '0';

  variable Tmkr_R_C1_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_R_C1_posedge : std_ulogic := '0';

  variable Tmkr_S_C0_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_S_C0_posedge : std_ulogic := '0';

  variable Tmkr_S_C1_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_S_C1_posedge : std_ulogic := '0';

  variable Violation          : std_ulogic          := '0';

  begin
    if (TimingChecksOn) then
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
         HeaderMsg            => InstancePath & "/X_IDDR2",
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
         HeaderMsg            => InstancePath & "/X_IDDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal D =====
       VitalSetupHoldCheck (
         Violation            => Tviol_D_C0_posedge,
         TimingData           => Tmkr_D_C0_posedge,
         TestSignal           => D_C0_dly,
         TestSignalName       => "D",
         TestDelay            => tisd_D_C0,
         RefSignal            => C0_dly,
         RefSignalName        => "C0",
         RefDelay             => ticd_C0,
         SetupHigh            => tsetup_D_C0_posedge_posedge,
         SetupLow             => tsetup_D_C0_negedge_posedge,
         HoldHigh             => thold_D_C0_posedge_posedge,
         HoldLow              => thold_D_C0_negedge_posedge,
         CheckEnabled         => true,
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_IDDR2",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => Error);
--=====  Vital SetupHold Check for signal D =====
       VitalSetupHoldCheck (
         Violation            => Tviol_D_C1_posedge,
         TimingData           => Tmkr_D_C1_posedge,
         TestSignal           => D_C1_dly,
         TestSignalName       => "D",
         TestDelay            => tisd_D_C1,
         RefSignal            => C1_dly,
         RefSignalName        => "C1",
         RefDelay             => ticd_C1,
         SetupHigh            => tsetup_D_C1_posedge_posedge,
         SetupLow             => tsetup_D_C1_negedge_posedge,
         HoldHigh             => thold_D_C1_posedge_posedge,
         HoldLow              => thold_D_C1_negedge_posedge,
         CheckEnabled         => true,
         RefTransition        => 'R',
         HeaderMsg            => InstancePath & "/X_IDDR2",
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
         HeaderMsg            => InstancePath & "/X_IDDR2",
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
         HeaderMsg            => InstancePath & "/X_IDDR2",
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
           HeaderMsg            => InstancePath & "/X_IDDR2",
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
           HeaderMsg            => InstancePath & "/X_IDDR2",
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
           HeaderMsg            => InstancePath & "/X_IDDR2",
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
           HeaderMsg            => InstancePath & "/X_IDDR2",
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
           HeaderMsg            => InstancePath & "/X_IDDR2",
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
            HeaderMsg            => InstancePath & "/X_IDDR2",
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
           HeaderMsg            => InstancePath & "/X_IDDR2",
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
           HeaderMsg            => InstancePath & "/X_IDDR2",
           Xon                  => Xon,
           MsgOn                => true,
           MsgSeverity          => Error);

        end if;
    end if;

    Violation := Pviol_C0 or Pviol_C1 or Pviol_R or Pviol_S or 
                 Tviol_D_C0_posedge or Tviol_D_C1_posedge or
                 Tviol_CE_C0_posedge or Tviol_CE_C1_posedge or
                 Tviol_R_C0_posedge or Tviol_R_C1_posedge or
                 Tviol_S_C0_posedge or Tviol_S_C1_posedge;

    Q0_viol     <= Violation xor Q0_zd;
    Q1_viol     <= Violation xor Q1_zd;

    wait on C0_dly, C1_dly, CE_C0_dly, CE_C1_dly, D_C0_dly, D_C1_dly, GSR_dly, R_dly, S_dly, Q0_zd, Q1_zd;
 
  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable  Q0_GlitchData : VitalGlitchDataType;
  variable  Q1_GlitchData : VitalGlitchDataType;

  begin
     VitalPathDelay01
       (
         OutSignal     => Q0,
         GlitchData    => Q0_GlitchData,
         OutSignalName => "Q0",
         OutTemp       => Q0_viol,
         Paths         => (0 => (C0_dly'last_event, tpd_C0_Q0, (C0_dly = '1')),
                           1 => (C1_dly'last_event, tpd_C1_Q0, (C1_dly = '1')),
                           2 => (S_dly'last_event, tpd_S_Q0, (R_dly /= '1')),
                           3 => (R_dly'last_event, tpd_R_Q0, true)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => Error
       );
     VitalPathDelay01
       (
         OutSignal     => Q1,
         GlitchData    => Q1_GlitchData,
         OutSignalName => "Q1",
         OutTemp       => Q1_viol,
         Paths         => (0 => (C0_dly'last_event, tpd_C0_Q1, (C0_dly = '1')),
                           1 => (C1_dly'last_event, tpd_C1_Q1, (C1_dly = '1')),
                           2 => (S_dly'last_event, tpd_S_Q1, (R_dly /= '1')),
                           3 => (R_dly'last_event, tpd_R_Q1, true)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => Error
       );

    wait on Q0_viol, Q1_viol;
  end process prcs_output;


end X_IDDR2_V;

