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
-- /___/   /\     Filename : X_IDDR.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:20 PST 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    05/30/06 - CR 232324 -- Added  timing checks for S/R wrt negedge CLK
--    04/07/08 - CR 469973 -- Header Description fix
--    27/05/08 - CR 472154 Removed Vital GSR constructs
--    10/02/08 - CR 489522 fixed false setup/hold msg when "_"ve values are in sdf
--    12/03/08 - CR 498674 added pulldown on R/S.
--    01/21/09 - CR 503784 pulldown on R/S enhancement.
--    06/23/10 - CR 566394 Removed extra recovery/removal checks
-- End Revision


----- CELL X_IDDR -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_IDDR is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables
      tipd_C    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_CE   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_D    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_R    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_S    : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_C_Q1  : VitalDelayType01 := (100 ps, 100 ps);
      tpd_C_Q2  : VitalDelayType01 := (100 ps, 100 ps);

--  VITAL async rest-to-output path delay variables
      tpd_R_Q1 : VitalDelayType01 := (0 ps, 0 ps);
      tpd_R_Q2 : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL async set-to-output path delay variables
      tpd_S_Q1 : VitalDelayType01 := (0 ps, 0 ps);
      tpd_S_Q2 : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL GSR-to-output path delay variable


--  VITAL ticd & tisd variables
      ticd_C     : VitalDelayType   := 0 ps;
      tisd_D_C   : VitalDelayType   := 0 ps;
      tisd_CE_C  : VitalDelayType   := 0 ps;
      tisd_R_C   : VitalDelayType   := 0 ps;
      tisd_S_C   : VitalDelayType   := 0 ps;

--  VITAL Setup/Hold delay variables
      tsetup_CE_C_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE_C_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE_C_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_CE_C_negedge_negedge : VitalDelayType := 0 ps;
      thold_CE_C_posedge_posedge  : VitalDelayType := 0 ps;
      thold_CE_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_CE_C_posedge_negedge : VitalDelayType := 0 ps;
      thold_CE_C_negedge_negedge : VitalDelayType := 0 ps;

      tsetup_D_C_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_D_C_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_D_C_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_D_C_negedge_negedge : VitalDelayType := 0 ps;
      thold_D_C_posedge_posedge  : VitalDelayType := 0 ps;
      thold_D_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_D_C_posedge_negedge : VitalDelayType := 0 ps;
      thold_D_C_negedge_negedge : VitalDelayType := 0 ps;

      tsetup_R_C_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_R_C_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_R_C_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_R_C_negedge_negedge : VitalDelayType := 0 ps;
      thold_R_C_posedge_posedge  : VitalDelayType := 0 ps;
      thold_R_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_R_C_posedge_negedge : VitalDelayType := 0 ps;
      thold_R_C_negedge_negedge : VitalDelayType := 0 ps;

      tsetup_S_C_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_S_C_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_S_C_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_S_C_negedge_negedge : VitalDelayType := 0 ps;
      thold_S_C_posedge_posedge  : VitalDelayType := 0 ps;
      thold_S_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_S_C_posedge_negedge : VitalDelayType := 0 ps;
      thold_S_C_negedge_negedge : VitalDelayType := 0 ps;

-- VITAL pulse width variables
      tpw_C_posedge              : VitalDelayType := 0 ps;
      tpw_C_negedge              : VitalDelayType := 0 ps;
      tpw_R_posedge              : VitalDelayType := 0 ps;
      tpw_S_posedge              : VitalDelayType := 0 ps;

-- VITAL period variables
      tperiod_C_posedge          : VitalDelayType := 0 ps;

-- VITAL recovery time variables
      trecovery_R_C_negedge_posedge   : VitalDelayType := 0 ps;
      trecovery_R_C_negedge_negedge   : VitalDelayType := 0 ps;
      trecovery_S_C_negedge_posedge   : VitalDelayType := 0 ps;
      trecovery_S_C_negedge_negedge   : VitalDelayType := 0 ps;

-- VITAL removal time variables
      tremoval_R_C_negedge_posedge    : VitalDelayType := 0 ps;
      tremoval_R_C_negedge_negedge    : VitalDelayType := 0 ps;
      tremoval_S_C_negedge_posedge    : VitalDelayType := 0 ps;
      tremoval_S_C_negedge_negedge    : VitalDelayType := 0 ps;

      DDR_CLK_EDGE : string := "OPPOSITE_EDGE";
      INIT_Q1      : bit    := '0';
      INIT_Q2      : bit    := '0';
      SRTYPE       : string := "SYNC"
      );

  port(
      Q1          : out std_ulogic;
      Q2          : out std_ulogic;

      C           : in  std_ulogic;
      CE          : in  std_ulogic;
      D           : in  std_ulogic;
      R           : in  std_ulogic := 'L';
      S           : in  std_ulogic := 'L'
    );

  attribute VITAL_LEVEL0 of
    X_IDDR : entity is true;

end X_IDDR;

architecture X_IDDR_V OF X_IDDR is

  attribute VITAL_LEVEL0 of
    X_IDDR_V : architecture is true;


  constant SYNC_PATH_DELAY : time := 100 ps;

  signal C_ipd	        : std_ulogic := 'X';
  signal CE_ipd	        : std_ulogic := 'X';
  signal D_ipd	        : std_ulogic := 'X';
  signal GSR_ipd	: std_ulogic := 'X';
  signal R_ipd		: std_ulogic := 'X';
  signal S_ipd		: std_ulogic := 'X';

  signal C_dly	        : std_ulogic := 'X';
  signal CE_dly	        : std_ulogic := 'X';
  signal D_dly	        : std_ulogic := 'X';
  signal GSR_dly	: std_ulogic := '0';
  signal R_dly		: std_ulogic := 'X';
  signal S_dly		: std_ulogic := 'X';

  signal Q1_zd	        : std_ulogic := 'X';
  signal Q2_zd	        : std_ulogic := 'X';

  signal Q1_viol        : std_ulogic := 'X';
  signal Q2_viol        : std_ulogic := 'X';

  signal Q1_o_reg	: std_ulogic := 'X';
  signal Q2_o_reg	: std_ulogic := 'X';
  signal Q3_o_reg	: std_ulogic := 'X';
  signal Q4_o_reg	: std_ulogic := 'X';

  signal ddr_clk_edge_type	: integer := -999;
  signal sr_type		: integer := -999;
begin

  GSR_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (C_ipd,   C,   tipd_C);
    VitalWireDelay (CE_ipd,  CE,  tipd_CE);
    VitalWireDelay (D_ipd,   D,   tipd_D);
    VitalWireDelay (R_ipd,   R,   tipd_R);
    VitalWireDelay (S_ipd,   S,   tipd_S);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (C_dly,   C_ipd,   ticd_C);
    VitalSignalDelay (CE_dly,  CE_ipd,  tisd_CE_C);
    VitalSignalDelay (D_dly,   D_ipd,   tisd_D_C);
    VitalSignalDelay (R_dly,   R_ipd,   tisd_R_C);
    VitalSignalDelay (S_dly,   S_ipd,   tisd_S_C);
  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process

  begin
      if((DDR_CLK_EDGE = "OPPOSITE_EDGE") or (DDR_CLK_EDGE = "opposite_edge")) then
         ddr_clk_edge_type <= 1;
      elsif((DDR_CLK_EDGE = "SAME_EDGE") or (DDR_CLK_EDGE = "same_edge")) then
         ddr_clk_edge_type <= 2;
      elsif((DDR_CLK_EDGE = "SAME_EDGE_PIPELINED") or (DDR_CLK_EDGE = "same_edge_pipelined")) then
         ddr_clk_edge_type <= 3;
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " DDR_CLK_EDGE ",
             EntityName => "/X_IDDR",
             GenericValue => DDR_CLK_EDGE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " OPPOSITE_EDGE or SAME_EDGE or  SAME_EDGE_PIPELINED.",
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
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " SRTYPE ",
             EntityName => "/X_IDDR",
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
--#####                    q1_q2_q3_q4 reg                       #####
--####################################################################
  prcs_q1q2q3q4_reg:process(C_dly, D_dly, GSR_dly, R_dly, S_dly)
  variable Q1_var : std_ulogic := TO_X01(INIT_Q1);
  variable Q2_var : std_ulogic := TO_X01(INIT_Q2);
  variable Q3_var : std_ulogic := TO_X01(INIT_Q1);
  variable Q4_var : std_ulogic := TO_X01(INIT_Q2);
  begin
     if(GSR_dly = '1') then
         Q1_var := TO_X01(INIT_Q1);
         Q3_var := TO_X01(INIT_Q1);
         Q2_var := TO_X01(INIT_Q2);
         Q4_var := TO_X01(INIT_Q2);
     elsif(GSR_dly = '0') then
        case sr_type is
           when 1 => 
                   if(R_dly = '1') then
                      Q1_var := '0';
                      Q2_var := '0';
                      Q3_var := '0';
                      Q4_var := '0';
                   elsif(((R_dly = '0') or (R_dly = 'L')) and (S_dly = '1')) then
                      Q1_var := '1';
                      Q2_var := '1';
                      Q3_var := '1';
                      Q4_var := '1';
                   elsif(((R_dly = '0')  or (R_dly = 'L')) and ((S_dly = '0') or (S_dly = 'L'))) then
                      if(CE_dly = '1') then
                         if(rising_edge(C_dly)) then
                            Q3_var := Q1_var;
                            Q1_var := D_dly;
                            Q4_var := Q2_var;
                         end if;
                         if(falling_edge(C_dly)) then
                            Q2_var := D_dly;
                         end if;
                      end if;
                   end if;

           when 2 => 
                   if(rising_edge(C_dly)) then
                      if(R_dly = '1') then
                         Q1_var := '0';
                         Q3_var := '0';
                         Q4_var := '0';
                      elsif(((R_dly = '0') or (R_dly = 'L')) and (S_dly = '1')) then
                         Q1_var := '1';
                         Q3_var := '1';
                         Q4_var := '1';
                      elsif(((R_dly = '0')  or (R_dly = 'L')) and ((S_dly = '0') or (S_dly = 'L'))) then
                         if(CE_dly = '1') then
                               Q3_var := Q1_var;
                               Q1_var := D_dly;
                               Q4_var := Q2_var;
                         end if;
                      end if;
                   end if;
                        
                   if(falling_edge(C_dly)) then
                      if(R_dly = '1') then
                         Q2_var := '0';
                      elsif(((R_dly = '0') or (R_dly = 'L')) and (S_dly = '1')) then
                         Q2_var := '1';
                      elsif(((R_dly = '0')  or (R_dly = 'L')) and ((S_dly = '0') or (S_dly = 'L'))) then
                         if(CE_dly = '1') then
                               Q2_var := D_dly;
                         end if;
                      end if;
                   end if;
 
           when others =>
                   null; 
        end case;
     end if;

     q1_o_reg <= Q1_var;
     q2_o_reg <= Q2_var;
     q3_o_reg <= Q3_var;
     q4_o_reg <= Q4_var;

  end process prcs_q1q2q3q4_reg;
--####################################################################
--#####                        q1 & q2  mux                      #####
--####################################################################
  prcs_q1q2_mux:process(q1_o_reg, q2_o_reg, q3_o_reg, q4_o_reg)
  begin
     case ddr_clk_edge_type is
        when 1 => 
                 Q1_zd <= q1_o_reg;
                 Q2_zd <= q2_o_reg;
        when 2 => 
                 Q1_zd <= q1_o_reg;
                 Q2_zd <= q4_o_reg;
       when 3 => 
                 Q1_zd <= q3_o_reg;
                 Q2_zd <= q4_o_reg;
       when others =>
                 null;
     end case;
  end process prcs_q1q2_mux;
--####################################################################

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_tmngchk:process

  variable PInfo_C            : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_C            : std_ulogic          := '0';

  variable PInfo_R            : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_R            : std_ulogic          := '0';

  variable PInfo_S            : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_S            : std_ulogic          := '0';

  variable Tmkr_D_C_posedge   : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_D_C_posedge  : std_ulogic          := '0';

  variable Tmkr_CE_C_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_CE_C_posedge : std_ulogic          := '0';

  variable Tmkr_R_C_posedge   : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_R_C_posedge  : std_ulogic          := '0';
  variable Tmkr_R_C_negedge   : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_R_C_negedge  : std_ulogic          := '0';

  variable Tmkr_S_C_posedge   : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_S_C_posedge  : std_ulogic          := '0';
  variable Tmkr_S_C_negedge   : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_S_C_negedge  : std_ulogic          := '0';

  variable Violation          : std_ulogic          := '0';
  begin
    if (TimingChecksOn) then
      VitalSetupHoldCheck (
        Violation            => Tviol_D_C_posedge,
        TimingData           => Tmkr_D_C_posedge,
        TestSignal           => D_dly,
        TestSignalName       => "D",
        TestDelay            => tisd_D_C,
        RefSignal            => C_dly,
        RefSignalName        => "C",
        RefDelay             => ticd_C,
        SetupHigh            => tsetup_D_C_posedge_posedge,
        SetupLow             => tsetup_D_C_negedge_posedge,
        HoldLow              => thold_D_C_posedge_posedge,
        HoldHigh             => thold_D_C_negedge_posedge,
        CheckEnabled         => TO_X01(((not R_dly)) and (C_dly)
                                       and ((not S_dly))) /= '0',
        RefTransition        => 'R',
        HeaderMsg            => "/X_IDDR",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
      VitalSetupHoldCheck (
        Violation            => Tviol_CE_C_posedge,
        TimingData           => Tmkr_CE_C_posedge,
        TestSignal           => CE_dly,
        TestSignalName       => "CE",
        TestDelay            => tisd_CE_C,
        RefSignal            => C_dly,
        RefSignalName        => "C",
        RefDelay             => ticd_C,
        SetupHigh            => tsetup_CE_C_posedge_posedge,
        SetupLow             => tsetup_CE_C_negedge_posedge,
        HoldLow              => thold_CE_C_posedge_posedge,
        HoldHigh             => thold_CE_C_negedge_posedge,
        CheckEnabled         => TO_X01(((not R_dly)) and ((not S_dly))) /= '0',
        RefTransition        => 'R',
        HeaderMsg            => "/X_IDDR",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
      VitalPeriodPulseCheck (
        Violation            => Pviol_C,
        PeriodData           => PInfo_C,
        TestSignal           => C_dly,
        TestSignalName       => "C",
        TestDelay            => 0 ps,
        Period               => tperiod_C_posedge,
        PulseWidthHigh       => tpw_C_posedge,
        PulseWidthLow        => tpw_C_posedge,
        CheckEnabled         => TO_X01(CE_dly) /= '0',
        HeaderMsg            => "/X_IDDR",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
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
        HeaderMsg            => "/X_IDDR",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);
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
        HeaderMsg            => "/X_IDDR",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning);

        if (SRTYPE = "ASYNC" ) then
           VitalRecoveryRemovalCheck (
              Violation            => Tviol_R_C_posedge,
              TimingData           => Tmkr_R_C_posedge,
              TestSignal           => R_dly,
              TestSignalName       => "R",
              TestDelay            => tisd_R_C,
              RefSignal            => C_dly,
              RefSignalName        => "C",
              RefDelay             => ticd_C,
              Recovery             => trecovery_R_C_negedge_posedge,
              Removal              => tremoval_R_C_negedge_posedge,
              ActiveLow            => false,
              CheckEnabled         => TO_X01(CE_dly) /= '0' and (D_dly /= '0' or Q1_zd /= '0'),
              RefTransition        => 'R',
              HeaderMsg            => "/X_IDDR",
              Xon                  => Xon,
              MsgOn                => true,
              MsgSeverity          => warning);
           if (DDR_CLK_EDGE = "OPPOSITE_EDGE" ) then
              VitalRecoveryRemovalCheck (
                 Violation            => Tviol_R_C_negedge,
                 TimingData           => Tmkr_R_C_negedge,
                 TestSignal           => R_dly,
                 TestSignalName       => "R",
                 TestDelay            => tisd_R_C,
                 RefSignal            => C_dly,
                 RefSignalName        => "C",
                 RefDelay             => ticd_C,
                 Recovery             => trecovery_R_C_negedge_negedge,
                 Removal              => tremoval_R_C_negedge_negedge,
                 ActiveLow            => false,
                 CheckEnabled         => TO_X01(CE_dly) /= '0' and (D_dly /= '0' or Q1_zd /= '0'),
                 RefTransition        => 'F',
                 HeaderMsg            => "/X_IDDR",
                 Xon                  => Xon,
                 MsgOn                => true,
                 MsgSeverity          => warning);
           end if;
           VitalRecoveryRemovalCheck (
              Violation            => Tviol_S_C_posedge,
              TimingData           => Tmkr_S_C_posedge,
              TestSignal           => S_dly,
              TestSignalName       => "S",
              TestDelay            => tisd_S_C,
              RefSignal            => C_dly,
              RefSignalName        => "C",
              RefDelay             => ticd_C,
              Recovery             => trecovery_S_C_negedge_posedge,
              Removal              => thold_S_C_negedge_posedge,
              ActiveLow            => false,
              CheckEnabled         => TO_X01((not R_dly) and CE_dly) /= '0' and D_dly /= '1' and Q2_zd /= '1',
              RefTransition        => 'R',
              HeaderMsg            => "/X_IDDR",
              Xon                  => Xon,
              MsgOn                => true,
              MsgSeverity          => warning);
           if (DDR_CLK_EDGE = "OPPOSITE_EDGE" ) then
              VitalRecoveryRemovalCheck (
                 Violation            => Tviol_S_C_negedge,
                 TimingData           => Tmkr_S_C_negedge,
                 TestSignal           => S_dly,
                 TestSignalName       => "S",
                 TestDelay            => tisd_S_C,
                 RefSignal            => C_dly,
                 RefSignalName        => "C",
                 RefDelay             => ticd_C,
                 Recovery             => trecovery_S_C_negedge_negedge,
                 Removal              => thold_S_C_negedge_negedge,
                 ActiveLow            => false,
                 CheckEnabled         => TO_X01((not R_dly) and CE_dly) /= '0' and D_dly /= '1' and Q2_zd /= '1',
                 RefTransition        => 'F',
                 HeaderMsg            => "/X_IDDR",
                 Xon                  => Xon,
                 MsgOn                => true,
                 MsgSeverity          => warning);
           end if;
        elsif (SRTYPE = "SYNC" ) then
           VitalSetupHoldCheck (
              Violation      => Tviol_R_C_posedge,
              TimingData     => Tmkr_R_C_posedge,
              TestSignal     => R_dly,
              TestSignalName => "R",
              TestDelay      => tisd_R_C,
              RefSignal      => C_dly,
              RefSignalName  => "C",
              RefDelay       => ticd_C,
              SetupHigh      => tsetup_R_C_posedge_posedge,
              SetupLow       => tsetup_R_C_negedge_posedge,
              HoldLow        => thold_R_C_posedge_posedge,
              HoldHigh       => thold_R_C_negedge_posedge,
              CheckEnabled   => TO_X01(((not S_dly)) and ((not R_dly))) /= '0',
              RefTransition  => 'R',
              HeaderMsg      => "/X_IDDR",
              Xon            => Xon,
              MsgOn          => true,
              MsgSeverity    => warning);
           VitalSetupHoldCheck (
              Violation      => Tviol_R_C_negedge,
              TimingData     => Tmkr_R_C_negedge,
              TestSignal     => R_dly,
              TestSignalName => "R",
              TestDelay      => tisd_R_C,
              RefSignal      => C_dly,
              RefSignalName  => "C",
              RefDelay       => ticd_C,
              SetupHigh      => tsetup_R_C_posedge_negedge,
              SetupLow       => tsetup_R_C_negedge_negedge,
              HoldLow        => thold_R_C_posedge_negedge,
              HoldHigh       => thold_R_C_negedge_negedge,
              CheckEnabled   => TO_X01(((not S_dly)) and ((not R_dly))) /= '0',
              RefTransition  => 'F',
              HeaderMsg      => "/X_IDDR",
              Xon            => Xon,
              MsgOn          => true,
              MsgSeverity    => warning);
           VitalSetupHoldCheck (
              Violation      => Tviol_S_C_posedge,
              TimingData     => Tmkr_S_C_posedge,
              TestSignal     => S_dly,
              TestSignalName => "S",
              TestDelay      => tisd_S_C,
              RefSignal      => C_dly,
              RefSignalName  => "C",
              RefDelay       => ticd_C,
              SetupHigh      => tsetup_S_C_posedge_posedge,
              SetupLow       => tsetup_S_C_negedge_posedge,
              HoldLow        => thold_S_C_posedge_posedge,
              HoldHigh       => thold_S_C_negedge_posedge,
              CheckEnabled   => TO_X01(not R_dly) /= '0',
              RefTransition  => 'R',
              HeaderMsg      => "/X_IDDR",
              Xon            => Xon,
              MsgOn          => true,
              MsgSeverity    => warning);
           VitalSetupHoldCheck (
              Violation      => Tviol_S_C_negedge,
              TimingData     => Tmkr_S_C_negedge,
              TestSignal     => S_dly,
              TestSignalName => "S",
              TestDelay      => tisd_S_C,
              RefSignal      => C_dly,
              RefSignalName  => "C",
              RefDelay       => ticd_C,
              SetupHigh      => tsetup_S_C_posedge_negedge,
              SetupLow       => tsetup_S_C_negedge_negedge,
              HoldLow        => thold_S_C_posedge_negedge,
              HoldHigh       => thold_S_C_negedge_negedge,
              CheckEnabled   => TO_X01(not R_dly) /= '0',
              RefTransition  => 'F',
              HeaderMsg      => "/X_IDDR",
              Xon            => Xon,
              MsgOn          => true,
              MsgSeverity    => warning);
          
        end if;
    end if;

    Violation := Pviol_C or Pviol_R or Pviol_S or 
                 Tviol_D_C_posedge  or 
                 Tviol_CE_C_posedge or
                 Tviol_R_C_posedge  or Tviol_R_C_negedge or
                 Tviol_S_C_posedge  or Tviol_R_C_negedge;

    Q1_viol     <= Violation xor Q1_zd;
    Q2_viol     <= Violation xor Q2_zd;

    wait on C_dly, CE_dly, D_dly, GSR_dly, R_dly, S_dly, Q1_zd, Q2_zd;
 
  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable  Q1_GlitchData : VitalGlitchDataType;
  variable  Q2_GlitchData : VitalGlitchDataType;

  begin
     VitalPathDelay01
       (
         OutSignal     => Q1,
         GlitchData    => Q1_GlitchData,
         OutSignalName => "Q1",
         OutTemp       => Q1_viol,
         Paths         => (0 => (C_ipd'last_event, tpd_C_Q1,TRUE),
                           1 => (S_dly'last_event, tpd_S_Q1, (R_dly /= '1')),
                           2 => (R_dly'last_event, tpd_R_Q1, true)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     VitalPathDelay01
       (
         OutSignal     => Q2,
         GlitchData    => Q2_GlitchData,
         OutSignalName => "Q2",
         OutTemp       => Q2_viol,
         Paths         => (0 => (C_ipd'last_event, tpd_C_Q2,TRUE),
                           1 => (S_dly'last_event, tpd_S_Q2, (R_dly /= '1')),
                           2 => (R_dly'last_event, tpd_R_Q2, true)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );

    wait on Q1_viol, Q2_viol;
  end process prcs_output;


end X_IDDR_V;

