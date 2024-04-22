-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Regional Clock Buffer
-- /___/   /\     Filename : X_BUFR.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:19 PST 2004
--  \___\/\___\
-- Revision:
--    03/23/04 - Initial version.
--    04/04/2005 - Add SIM_DEVICE paramter to support rainier. CE pin has 4 clock
--                 latency for Virtex 4 and none for Rainier
--    06/30/2005 - CR # 211199 -- removed sync path delay. Made delayed start only
--                 depend on CE (not CLR)
--    07/25/05 - Updated names to Virtex5
--    08/31/05 - Add ce_en to sensitivity list of i_in which make ce asynch.
--    05/23/06 - Add clk_count =0 and first_time=true when CE = 0 (CR 232206).
--    08/09/06 - Initial output to 0 (CR 217760).
--    27/05/08 - CR 472154 Removed Vital GSR constructs
--    04/01/09 - CR 517236 -- Added VIRTEX6 support
--    01/10/10 - Add FUJI
--    06/09/10 - Change FUJI to 7_SERIES
--    08/18/10 - Change  7_SERIES to 7SERIES (CR571653)
--    08/09/11 - Add 7SERIES  to ce_en logic (CR620544)
--    03/15/12 - Match with hardware (CR 650440)
-- End Revision


----- CELL X_BUFR -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_BUFR is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables
      tipd_CE   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_I    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_CLR  : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
--    06/30/2005 - CR # 211199 -- 
--    tpd_I_O   : VitalDelayType01 := (100 ps, 100 ps);
      tpd_I_O   : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL async rest-to-output path delay variables
      tpd_CLR_O : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL GSR-to-output path delay variable


--  VITAL tisd & tisd variables
      tisd_CLR_I : VitalDelayType   := 0.0 ps;
      ticd_I     : VitalDelayType   := 0.0 ps;

--  VITAL Setup/Hold delay variables
      tsetup_CE_I_posedge_posedge   : VitalDelayType := 0 ps;
      tsetup_CE_I_posedge_negedge   : VitalDelayType := 0 ps;
      tsetup_CE_I_negedge_posedge   : VitalDelayType := 0 ps;
      tsetup_CE_I_negedge_negedge   : VitalDelayType := 0 ps;

      thold_CE_I_posedge_posedge   : VitalDelayType := 0 ps;
      thold_CE_I_posedge_negedge   : VitalDelayType := 0 ps;
      thold_CE_I_negedge_posedge   : VitalDelayType := 0 ps;
      thold_CE_I_negedge_negedge   : VitalDelayType := 0 ps;

-- VITAL pulse width variables
      tpw_I_posedge              : VitalDelayType := 0 ps;
      tpw_I_negedge              : VitalDelayType := 0 ps;
      tpw_CLR_posedge            : VitalDelayType := 0 ps;

-- VITAL period variables
      tperiod_I_posedge          : VitalDelayType := 0 ps;

-- VITAL recovery time variables
      trecovery_CLR_I_negedge_posedge : VitalDelayType := 0 ps;

-- VITAL removal time variables
      tremoval_CLR_I_negedge_posedge : VitalDelayType := 0 ps;

      BUFR_DIVIDE   : string := "BYPASS";
      SIM_DEVICE    : string := "VIRTEX4"
      );

  port(
      O           : out std_ulogic;

      CE          : in  std_ulogic;
      CLR         : in  std_ulogic;
      I           : in  std_ulogic
      );

  attribute VITAL_LEVEL0 of
    X_BUFR : entity is true;

end X_BUFR;

architecture X_BUFR_V OF X_BUFR is

  attribute VITAL_LEVEL0 of
    X_BUFR_V : architecture is true;


--    06/30/2005 - CR # 211199 -- 
--  constant SYNC_PATH_DELAY : time := 100 ps;

  signal CE_ipd	        : std_ulogic := 'X';
  signal GSR_ipd	: std_ulogic := '0';
  signal I_ipd	        : std_ulogic := 'X';
  signal CLR_ipd	: std_ulogic := 'X';

  signal CE_dly       	: std_ulogic := 'X';
  signal GSR_dly	: std_ulogic := '0';
  signal I_dly       	: std_ulogic := 'X';
  signal CLR_dly	: std_ulogic := 'X';

  signal O_zd	        : std_logic := '0';
  signal O_viol	        : std_ulogic := '0';

  signal q4_sig	        : std_ulogic := 'X';
  signal ce_en	        : std_ulogic;
  signal i_ce	        : std_ulogic;

  signal divide   	: boolean    := false;
  signal divide_by	: integer    := -1;
  signal FIRST_TOGGLE_COUNT     : integer    := -1;
  signal SECOND_TOGGLE_COUNT    : integer    := -1;

begin

  GSR_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (CE_ipd,  CE,  tipd_CE);
    VitalWireDelay (I_ipd,   I,   tipd_I);
    VitalWireDelay (CLR_ipd, CLR, tipd_CLR);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CE_dly,   CE_ipd,   ticd_I);
    VitalSignalDelay (I_dly,    I_ipd,    ticd_I);
    VitalSignalDelay (CLR_dly,  CLR_ipd,  tisd_CLR_I);
  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  variable FIRST_TOGGLE_COUNT_var  : integer    := -1;
  variable SECOND_TOGGLE_COUNT_var : integer    := -1;
  variable ODD                     : integer    := -1;
  variable divide_var  	   : boolean    := false;
  variable divide_by_var           :  integer    := -1;

  begin
      if(BUFR_DIVIDE = "BYPASS") then
         divide_var := false;
      elsif(BUFR_DIVIDE = "1") then
         divide_var    := true;
         divide_by_var := 1;
         FIRST_TOGGLE_COUNT_var  := 1;
         SECOND_TOGGLE_COUNT_var := 1;
      elsif(BUFR_DIVIDE = "2") then
         divide_var    := true;
         divide_by_var := 2;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 2;
      elsif(BUFR_DIVIDE = "3") then
         divide_var    := true;
         divide_by_var := 3;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(BUFR_DIVIDE = "4") then
         divide_var    := true;
         divide_by_var := 4;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(BUFR_DIVIDE = "5") then
         divide_var    := true;
         divide_by_var := 5;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(BUFR_DIVIDE = "6") then
         divide_var    := true;
         divide_by_var := 6;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(BUFR_DIVIDE = "7") then
         divide_var    := true;
         divide_by_var := 7;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 8;
      elsif(BUFR_DIVIDE = "8") then
         divide_var    := true;
         divide_by_var := 8;
         FIRST_TOGGLE_COUNT_var  := 8;
         SECOND_TOGGLE_COUNT_var := 8;
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " BUFR_DIVIDE ",
             EntityName => "/BUFR",
             GenericValue => BUFR_DIVIDE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " BYPASS, 1, 2, 3, 4, 5, 6, 7 or 8 ",
             TailMsg => "",
             MsgSeverity => ERROR 
         );
      end if;

     if (SIM_DEVICE /= "VIRTEX4" and SIM_DEVICE /= "VIRTEX5" and SIM_DEVICE /= "VIRTEX6" and SIM_DEVICE /= "7SERIES") then
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " SIM_DEVICE ",
             EntityName => "/BUFR",
             GenericValue => SIM_DEVICE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " VIRTEX4 VIRTEX5 VIRTEX6 or 7SERIES ",
             TailMsg => "",
             MsgSeverity => ERROR
         );
      end if;

      FIRST_TOGGLE_COUNT  <= FIRST_TOGGLE_COUNT_var; 
      SECOND_TOGGLE_COUNT <= SECOND_TOGGLE_COUNT_var; 

      divide    <= divide_var;
      divide_by <= divide_by_var;

     wait;
  end process prcs_init;
--####################################################################
--#####                      CLOCK_ENABLE                        #####
--####################################################################
   prcs_ce:process(I_Dly, GSR_dly)
   variable fall_i_count : integer    := 0;
   variable q4_var       : std_ulogic := '0';
   variable q3_var       : std_ulogic := '0';
   variable q2_var       : std_ulogic := '0';
   variable q1_var       : std_ulogic := '0';
   begin
--    06/30/2005 - CR # 211199 -- removed CLR_dly dependency
      if(GSR_dly = '1')  then
         q4_var := '0';
         q3_var := '0';
         q2_var := '0';
         q1_var := '0';
      elsif(GSR_dly = '0') then
         if(falling_edge(I_dly)) then
          if ((SIM_DEVICE = "VIRTEX5") or (SIM_DEVICE = "VIRTEX6") or (SIM_DEVICE = "7SERIES")) then
             q4_var := CE_dly;
          else
            q4_var := q3_var;
            q3_var := q2_var;
            q2_var := q1_var;
            q1_var := CE_dly;
          end if;
         end if;
  
         q4_sig	 <= q4_var;
      end if;
   end process prcs_ce;

   ce_en <= CE_dly when ((SIM_DEVICE = "VIRTEX5") or (SIM_DEVICE = "VIRTEX6") or (SIM_DEVICE = "7SERIES")) else q4_sig;
   i_ce  <= I_dly and ce_en;

--####################################################################
--#####                       CLK-I                              #####
--####################################################################
  P_1: if (SIM_DEVICE = "VIRTEX4") generate

  prcs_I1:process(I_dly, GSR_dly, CLR_dly, ce_en)
  variable clk_count      : integer := 0;
  variable toggle_count   : integer := 0;
  variable first          : boolean := true;
  variable FIRST_TIME     : boolean := true;
  begin
       if(divide) then
          if((GSR_dly = '1') or (CLR_dly = '1')) then
            O_zd       <= '0';
            clk_count  := 0;
            FIRST_TIME := true;
          elsif((GSR_dly = '0') and (CLR_dly = '0')) then
             if(ce_en = '1') then
                if((I_dly='1') and (FIRST_TIME)) then
                    O_zd <= '1';
                    first        := true;
                    toggle_count := FIRST_TOGGLE_COUNT;
                    FIRST_TIME := false;
                elsif ((I_dly'event) and ( FIRST_TIME = false)) then
                    if(clk_count = toggle_count) then
                       O_zd <= not O_zd;
                       clk_count := 0;
                       first := not first;
                       if(first = true) then
                         toggle_count := FIRST_TOGGLE_COUNT;
                       else
                         toggle_count := SECOND_TOGGLE_COUNT;
                       end if;
                    end if;
                 end if;
 
                 if (FIRST_TIME = false) then
                       clk_count := clk_count + 1;
                end if;
             else
                 clk_count := 0;
                 FIRST_TIME := true;
             end if;
          end if;
       else
          O_zd <= I_dly;
       end if;
  end process prcs_I1;
  end generate P_1;   

  P_2: if (SIM_DEVICE = "VIRTEX5" or SIM_DEVICE= "VIRTEX6" or SIM_DEVICE = "7SERIES") generate

  prcs_I2:process(i_ce, GSR_dly, CLR_dly)
  variable clk_count      : integer := 0;
  variable toggle_count   : integer := 0;
  variable first          : boolean := true;
  variable FIRST_TIME     : boolean := true;
  begin
      if(divide) then
          if((GSR_dly = '1') or (CLR_dly = '1')) then
            O_zd       <= '0';
            clk_count  := 0;
            FIRST_TIME := true;
          elsif((GSR_dly = '0') and (CLR_dly = '0')) then
              if((i_ce='1') and (FIRST_TIME)) then
                    O_zd <= '1';
                    first        := true;
                    toggle_count := FIRST_TOGGLE_COUNT;
                    FIRST_TIME := false;
              elsif ((i_ce'event) and ( FIRST_TIME = false)) then
                    if(clk_count = toggle_count) then
                       O_zd <= not O_zd;
                       clk_count := 0;
                       first := not first;
                       if(first = true) then
                         toggle_count := FIRST_TOGGLE_COUNT;
                       else
                         toggle_count := SECOND_TOGGLE_COUNT;
                       end if;
                    end if;
              end if;
 
              if (FIRST_TIME = false) then
                       clk_count := clk_count + 1;
              end if;
          end if;
       else
          O_zd <= I_dly;
       end if;
  end process prcs_I2;
  end generate P_2; 

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_tmngchk:process
--  Pin Timing Violations (all input pins)
     variable	Tviol_CE_I_posedge	: STD_ULOGIC := '0';
     variable	Tmkr_CE_I_posedge	: VitalTimingDataType := VitalTimingDataInit;
     variable   Violation               : std_ulogic          := '0';

     begin

--  Setup/Hold Check Violations (all input pins)

     if (TimingChecksOn) then
       VitalSetupHoldCheck
         (
           Violation      => Tviol_CE_I_posedge,
           TimingData     => Tmkr_CE_I_posedge,
           TestSignal     => CE,
           TestSignalName => "CE",
           TestDelay      => 0 ns,
           RefSignal      => I_dly,
           RefSignalName  => "I",
           RefDelay       => 0 ns,
           SetupHigh      => tsetup_CE_I_posedge_posedge,
           SetupLow       => tsetup_CE_I_negedge_posedge,
           HoldLow        => thold_CE_I_posedge_posedge,
           HoldHigh       => thold_CE_I_negedge_posedge,
           CheckEnabled   => TRUE,
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_BUFR",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => WARNING
         );
--=====================================================
     end if;  -- End of (TimingChecksOn)

     Violation :=  Tviol_CE_I_posedge;

     O_viol <= Violation xor O_zd; 

     wait on
       O_zd,
       I_dly,
       CLR_dly,
       CE_dly;
  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
--  Output Pin glitch declaration
     variable  O_GlitchData : VitalGlitchDataType;
  begin

--  Output-to-Clock path delay
     VitalPathDelay01
       (
         OutSignal     => O,
         GlitchData    => O_GlitchData,
         OutSignalName => "O",
         OutTemp       => O_viol,
         Paths         => (0 => (I_dly'last_event, tpd_I_O,TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
     
     wait on O_viol;
  end process prcs_output;


end X_BUFR_V;

