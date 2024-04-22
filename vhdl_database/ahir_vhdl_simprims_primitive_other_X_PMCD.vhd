-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Phase-Matched Clock Divider
-- /___/   /\     Filename : X_PMCD.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:21 PST 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    06/20/07 - generate clka1d2 clka1d4 clka1d8 in same block to remove delta delay (CR440337)
--    04/03/08 - CR 467565 -- Div clocks toggle before REL goes high when EN_REL=TRUE
-- End Revision

----- CELL X_PMCD -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_PMCD is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables
      tipd_CLKA : VitalDelayType01 := (0 ps, 0 ps);
      tipd_CLKB : VitalDelayType01 := (0 ps, 0 ps);
      tipd_CLKC : VitalDelayType01 := (0 ps, 0 ps);
      tipd_CLKD : VitalDelayType01 := (0 ps, 0 ps);
      tipd_REL  : VitalDelayType01 := (0 ps, 0 ps);
      tipd_RST  : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_CLKA_CLKA1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKA_CLKA1D2 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKA_CLKA1D4 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKA_CLKA1D8 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKB_CLKA1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKC_CLKA1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKD_CLKA1 : VitalDelayType01 := (100 ps, 100 ps);

      tpd_CLKA_CLKB1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKB_CLKB1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKC_CLKB1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKD_CLKB1 : VitalDelayType01 := (100 ps, 100 ps);

      tpd_CLKA_CLKC1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKB_CLKC1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKC_CLKC1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKD_CLKC1 : VitalDelayType01 := (100 ps, 100 ps);

      tpd_CLKA_CLKD1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKB_CLKD1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKC_CLKD1 : VitalDelayType01 := (100 ps, 100 ps);
      tpd_CLKD_CLKD1 : VitalDelayType01 := (100 ps, 100 ps);

      tpd_REL_CLKA1D2  : VitalDelayType01 := (0 ps, 0 ps);
      tpd_REL_CLKA1D4  : VitalDelayType01 := (0 ps, 0 ps);
      tpd_REL_CLKA1D8  : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL async rest-to-output path delay variables
      tpd_RST_CLKA1 : VitalDelayType01 := (0 ps, 0 ps);
      tpd_RST_CLKA1D2 : VitalDelayType01 := (0 ps, 0 ps);
      tpd_RST_CLKA1D4 : VitalDelayType01 := (0 ps, 0 ps);
      tpd_RST_CLKA1D8 : VitalDelayType01 := (0 ps, 0 ps);

      tpd_RST_CLKB1 : VitalDelayType01 := (0 ps, 0 ps);

      tpd_RST_CLKC1 : VitalDelayType01 := (0 ps, 0 ps);

      tpd_RST_CLKD1 : VitalDelayType01 := (0 ps, 0 ps);


--  tbpd
      tbpd_RST_CLKD1_CLKD  : VitalDelayType01 := (0.0 ps, 0.0 ps);
      tbpd_RST_CLKC1_CLKC  : VitalDelayType01 := (0.0 ps, 0.0 ps);
      tbpd_RST_CLKB1_CLKB  : VitalDelayType01 := (0.0 ps, 0.0 ps);
      tbpd_RST_CLKA1_CLKA  : VitalDelayType01 := (0.0 ps, 0.0 ps);
      tbpd_RST_CLKA1D2_CLKA  : VitalDelayType01 := (0.0 ps, 0.0 ps);
      tbpd_RST_CLKA1D4_CLKA  : VitalDelayType01 := (0.0 ps, 0.0 ps);
      tbpd_RST_CLKA1D8_CLKA  : VitalDelayType01 := (0.0 ps, 0.0 ps);

--  VITAL tisd & tisd variables

      tisd_REL_CLKA       : VitalDelayType   := 0.0 ps;

      tisd_RST_CLKA  : VitalDelayType   := 0.0 ps;
      tisd_RST_CLKB  : VitalDelayType   := 0.0 ps;
      tisd_RST_CLKC  : VitalDelayType   := 0.0 ps;
      tisd_RST_CLKD  : VitalDelayType   := 0.0 ps;

      tisd_RST_REL   : VitalDelayType   := 0.0 ps;

      ticd_CLKA      : VitalDelayType   := 0.0 ps;
      ticd_CLKB      : VitalDelayType   := 0.0 ps;
      ticd_CLKC      : VitalDelayType   := 0.0 ps;
      ticd_CLKD      : VitalDelayType   := 0.0 ps;

      ticd_REL       : VitalDelayType   := 0.0 ps;

--  VITAL Setup/Hold delay variables
      tsetup_REL_CLKA_posedge_posedge : VitalDelayType := 0.0 ps;
      tsetup_REL_CLKA_negedge_posedge : VitalDelayType := 0.0 ps;
      thold_REL_CLKA_posedge_posedge  : VitalDelayType := 0.0 ps;
      thold_REL_CLKA_negedge_posedge  : VitalDelayType := 0.0 ps;

-- VITAL pulse width variables
      tpw_CLKA_posedge              : VitalDelayType := 0 ps;
      tpw_CLKA_negedge              : VitalDelayType := 0 ps;

      tpw_CLKB_posedge              : VitalDelayType := 0 ps;
      tpw_CLKB_negedge              : VitalDelayType := 0 ps;

      tpw_CLKC_posedge              : VitalDelayType := 0 ps;
      tpw_CLKC_negedge              : VitalDelayType := 0 ps;

      tpw_CLKD_posedge              : VitalDelayType := 0 ps;
      tpw_CLKD_negedge              : VitalDelayType := 0 ps;

      tpw_REL_posedge               : VitalDelayType := 0 ps;
      tpw_REL_negedge               : VitalDelayType := 0 ps;

      tpw_RST_posedge               : VitalDelayType := 0 ps;
      tpw_RST_negedge               : VitalDelayType := 0 ps;

-- VITAL period variables
      tperiod_CLKA_posedge          : VitalDelayType := 0 ps;
      tperiod_CLKB_posedge          : VitalDelayType := 0 ps;
      tperiod_CLKC_posedge          : VitalDelayType := 0 ps;
      tperiod_CLKD_posedge          : VitalDelayType := 0 ps;

-- VITAL recovery time variables

      trecovery_RST_CLKA_negedge_posedge : VitalDelayType := 0 ps;
      trecovery_RST_CLKB_negedge_posedge : VitalDelayType := 0 ps;
      trecovery_RST_CLKC_negedge_posedge : VitalDelayType := 0 ps;
      trecovery_RST_CLKD_negedge_posedge : VitalDelayType := 0 ps;

      trecovery_RST_REL_negedge_posedge : VitalDelayType := 0 ps;

-- VITAL removal time variables

      tremoval_RST_CLKA_negedge_posedge : VitalDelayType := 0 ps;
      tremoval_RST_CLKB_negedge_posedge : VitalDelayType := 0 ps;
      tremoval_RST_CLKC_negedge_posedge : VitalDelayType := 0 ps;
      tremoval_RST_CLKD_negedge_posedge : VitalDelayType := 0 ps;

      tremoval_RST_REL_negedge_posedge : VitalDelayType := 0 ps;

      EN_REL           : boolean := FALSE;
      RST_DEASSERT_CLK : string  := "CLKA"
      );

  port(
      CLKA1   : out std_ulogic;
      CLKA1D2 : out std_ulogic;
      CLKA1D4 : out std_ulogic;
      CLKA1D8 : out std_ulogic;
      CLKB1   : out std_ulogic;
      CLKC1   : out std_ulogic;
      CLKD1   : out std_ulogic;

      CLKA    : in  std_ulogic;
      CLKB    : in  std_ulogic;
      CLKC    : in  std_ulogic;
      CLKD    : in  std_ulogic;
      REL     : in  std_ulogic;
      RST     : in  std_ulogic
      );

  attribute VITAL_LEVEL0 of
    X_PMCD : entity is true;

end X_PMCD;

architecture X_PMCD_V OF X_PMCD is

  attribute VITAL_LEVEL0 of
    X_PMCD_V : architecture is true;


  constant SYNC_PATH_DELAY	: time := 100 ps;

  signal CLKA_ipd		: std_ulogic := 'X';
  signal CLKB_ipd		: std_ulogic := 'X';
  signal CLKC_ipd		: std_ulogic := 'X';
  signal CLKD_ipd		: std_ulogic := 'X';

  signal REL_ipd		: std_ulogic := 'X';
  signal RST_ipd		: std_ulogic := 'X';

  signal CLKA_dly		: std_ulogic := 'X';
  signal CLKB_dly		: std_ulogic := 'X';
  signal CLKC_dly		: std_ulogic := 'X';
  signal CLKD_dly		: std_ulogic := 'X';

  signal REL_dly		: std_ulogic := 'X';
  signal RST_dly		: std_ulogic := 'X';

  signal CLKA1_zd		: std_ulogic := 'X';
  signal CLKA1D2_zd		: std_ulogic := 'X';
  signal CLKA1D4_zd		: std_ulogic := 'X';
  signal CLKA1D8_zd		: std_ulogic := 'X';
  signal CLKB1_zd		: std_ulogic := 'X';
  signal CLKC1_zd		: std_ulogic := 'X';
  signal CLKD1_zd		: std_ulogic := 'X';

  signal rel_clk_sel		: integer    := 0;
  signal rst_active    		: boolean;
  signal r1_out        		: std_ulogic;
  signal rdiv_out      		: std_ulogic;
  signal active_clk    		: std_ulogic := 'X';

  signal Violation_CLKA1        : std_ulogic := '0';
  signal Violation_CLKB1        : std_ulogic := '0';
  signal Violation_CLKC1        : std_ulogic := '0';
  signal Violation_CLKD1        : std_ulogic := '0';

  signal GSR_dly		: std_ulogic := '0';

begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (CLKA_ipd, CLKA, tipd_CLKA);
    VitalWireDelay (CLKB_ipd, CLKB, tipd_CLKB);
    VitalWireDelay (CLKC_ipd, CLKC, tipd_CLKC);
    VitalWireDelay (CLKD_ipd, CLKD, tipd_CLKD);
    VitalWireDelay (REL_ipd,  REL,  tipd_REL);
    VitalWireDelay (RST_ipd,  RST,  tipd_RST);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CLKA_dly, CLKA_ipd, ticd_CLKA);
    VitalSignalDelay (CLKB_dly, CLKB_ipd, ticd_CLKB);
    VitalSignalDelay (CLKC_dly, CLKC_ipd, ticd_CLKC);
    VitalSignalDelay (CLKD_dly, CLKD_ipd, ticd_CLKD);
    VitalSignalDelay (REL_dly,  REL_ipd,  tisd_REL_CLKA);
    VitalSignalDelay (RST_dly,  RST_ipd,  tisd_RST_CLKA);
  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  variable FIRST_TIME : boolean := true;
  begin
      if((RST_DEASSERT_CLK = "clka") or (RST_DEASSERT_CLK = "CLKA")) then
         rel_clk_sel <= 1;
      elsif((RST_DEASSERT_CLK = "clkb") or (RST_DEASSERT_CLK = "CLKB")) then
         rel_clk_sel <= 2;
      elsif((RST_DEASSERT_CLK = "clkc") or (RST_DEASSERT_CLK = "CLKC")) then
         rel_clk_sel <= 3;
      elsif((RST_DEASSERT_CLK = "clkd") or (RST_DEASSERT_CLK = "CLKD")) then
         rel_clk_sel <= 4;
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " RST_DEASSERT_CLK ",
             EntityName => "/X_PMCD",
             GenericValue => RST_DEASSERT_CLK,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " CLKA, CLKB, CLKC or CLKD ",
             TailMsg => "",
             MsgSeverity => ERROR
         );
      end if;

      if(EN_REL = true) then
         rst_active <= false;
      elsif(EN_REL = false) then
         rst_active <= true;
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " EN_REL ",
             EntityName => "/X_PMCD",
             GenericValue => EN_REL,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => "True or False",
             TailMsg => "",
             MsgSeverity => ERROR
         );
      end if;
     wait;
  end process prcs_init;
--####################################################################
--#####                           CLKA                           #####
--####################################################################
  prcs_clka:process(CLKA1_zd, CLKA1D2_zd, CLKA1D4_zd, CLKA1D8_zd,
                    CLKA_dly, r1_out, rdiv_out, GSR_dly)
  variable first_time : boolean := true;
  begin
     if(GSR_dly = '1') then
         CLKA1_zd <= '0';
         CLKA1D2_zd <= '0';
         CLKA1D4_zd <= '0';
         CLKA1D8_zd <= '0';
     elsif(GSR_dly = '0') then

        if((first_time) and ((CLKA_dly = '0') or CLKA_dly = '1')) then
          CLKA1_zd <= CLKA_dly;
          CLKA1D2_zd <= CLKA_dly;
          CLKA1D4_zd <= CLKA_dly;
          CLKA1D8_zd <= CLKA_dly;
          first_time := false;
        end if;

        if(r1_out = '0') then
            CLKA1_zd <= CLKA_dly;
        elsif (r1_out = '1') then
          CLKA1_zd <= '0';
        end if;

        if(rdiv_out = '1') then
           CLKA1D2_zd <= '0';
           CLKA1D4_zd <= '0';
           CLKA1D8_zd <= '0';
        elsif(rdiv_out = '0') then
          if(rising_edge(CLKA_dly)) then
            CLKA1D2_zd <= NOT CLKA1D2_zd;
            if (CLKA1D2_zd = '0') then
                CLKA1D4_zd <= NOT CLKA1D4_zd;
                if (CLKA1D4_zd = '0') then
                    CLKA1D8_zd <= NOT CLKA1D8_zd;
                end if;
             end if;
          end if;
        end if;
     end if;

  end process prcs_clka;
--####################################################################
--#####                           CLKB                           #####
--####################################################################
 prcs_clkb:process(CLKB_dly, r1_out, GSR_dly)
  variable first_time : boolean := true;
  begin
     if((GSR_dly = '1') or (r1_out = '1')) then
          CLKB1_zd <= '0';
     elsif ((GSR_dly = '0') and (r1_out = '0')) then
--         if(CLKB_dly'event) then
           CLKB1_zd <= CLKB_dly;
--         end if;
     end if;
  end process prcs_clkb;
--####################################################################
--#####                           CLKC                           #####
--####################################################################
 prcs_clkc:process(CLKC_dly, r1_out, GSR_dly)
  variable first_time : boolean := true;
  begin
     if((GSR_dly = '1') or (r1_out = '1')) then
          CLKC1_zd <= '0';
     elsif ((GSR_dly = '0') and (r1_out = '0')) then
--         if(CLKC_dly'event) then
           CLKC1_zd <= CLKC_dly;
--         end if;
     end if;
  end process prcs_clkc;
--####################################################################
--#####                           CLKD                           #####
--####################################################################
 prcs_clkd:process(CLKD_dly, r1_out, GSR_dly)
  variable first_time : boolean := true;
  begin
     if((GSR_dly = '1') or (r1_out = '1')) then
          CLKD1_zd <= '0';
     elsif ((GSR_dly = '0') and (r1_out = '0')) then
--         if(CLKD_dly'event) then
           CLKD1_zd <= CLKD_dly;
--         end if;
     end if;
  end process prcs_clkd;
--####################################################################
--#####                       RST CLK SEL                        #####
--####################################################################
  prcs_rel_clk_mux:process(CLKA_dly, CLKB_dly, CLKC_dly, CLKD_dly)
  begin
      case rel_clk_sel is
             when 1 => active_clk <= CLKA_dly;
             when 2 => active_clk <= CLKB_dly;
             when 3 => active_clk <= CLKC_dly;
             when 4 => active_clk <= CLKD_dly;
             when others => null;
      end case;
  end process prcs_rel_clk_mux;

--####################################################################
--#####                     RELEASE SIGNAL                       #####
--####################################################################
  prcs_act_rel:process(active_clk, REL_dly, RST_dly, GSR_dly)
  variable released      : boolean := false;
  variable r1_released   : boolean := false;
  variable rdiv_released : boolean := false;
  variable start_rel_clk_count : boolean := false;
  variable rel_clk_count : integer := 0;
  variable path_1_clk_count : integer := 0;
  variable path_1        : std_ulogic := '1';
  variable path_2        : std_ulogic := '1';

  begin
      if((GSR_dly = '1') or (RST_dly = '1')) then
          released      := false;
          r1_released   := false;
          rdiv_released := false;
          rel_clk_count := 0;
          start_rel_clk_count := false;
          r1_out   <= '1';
          rdiv_out <= '1';
          path_1_clk_count := 0;
          path_1 := '1';
          path_2 := '1';
      elsif ((GSR_dly = '0') and (RST_dly = '0')) then
         if(rst_active) then
           if(not released) then
             if(rising_edge(active_clk)) then
              start_rel_clk_count := true;
             end if;
             if(active_clk'event and start_rel_clk_count) then
               rel_clk_count := rel_clk_count + 1;
             end if;
             if(rel_clk_count >= 1) then
                rdiv_out <= '0';
             end if;
             if(rel_clk_count >= 2) then
                r1_out   <= '0';
                released := true;
             end if;
           end if;
         elsif(not rst_active) then
           if(not r1_released) then
             if(rising_edge(active_clk)) then
              start_rel_clk_count := true;
             end if;
             if(active_clk'event and start_rel_clk_count) then
               rel_clk_count := rel_clk_count + 1;
             end if;
             if(rel_clk_count >= 2) then
                r1_out <= '0';
                r1_released := true;
             end if;
           end if;
           if(not rdiv_released) then
             if(rising_edge(active_clk)) then
               path_1_clk_count := path_1_clk_count + 1;
               if(path_1_clk_count >=  1) then
                path_1 := '0';
               end if;
             end if;

             if(rising_edge(REL_dly)) then
                path_2 := '0';
             end if;

             if((path_1 = '0') and (path_2 = '0')) then
                rdiv_out <= '0';
                rdiv_released := true;
             end if;
           end if;
         end if;
      end if;
  end process prcs_act_rel;
--####################################################################

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_tmngchk:process
  variable Tmkr_REL_CLKA_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_REL_CLKA_posedge : std_ulogic          := '0';
  variable Tmkr_RST_CLKA_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_RST_CLKA_posedge : std_ulogic          := '0';
  variable Tmkr_RST_CLKB_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_RST_CLKB_posedge : std_ulogic          := '0';
  variable Tmkr_RST_CLKC_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_RST_CLKC_posedge : std_ulogic          := '0';
  variable Tmkr_RST_CLKD_posedge  : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_RST_CLKD_posedge : std_ulogic          := '0';
  variable Tmkr_RST_REL_posedge   : VitalTimingDataType := VitalTimingDataInit;
  variable Tviol_RST_REL_posedge  : std_ulogic          := '0';

  variable Pviol_CLKA : std_ulogic          := '0';
  variable PInfo_CLKA : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_CLKB : std_ulogic          := '0';
  variable PInfo_CLKB : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_CLKC : std_ulogic          := '0';
  variable PInfo_CLKC : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_CLKD : std_ulogic          := '0';
  variable PInfo_CLKD : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_REL  : std_ulogic          := '0';
  variable PInfo_REL  : VitalPeriodDataType := VitalPeriodDataInit;
  variable Pviol_RST  : std_ulogic          := '0';
  variable PInfo_RST  : VitalPeriodDataType := VitalPeriodDataInit;

  begin
    if(TimingChecksOn) then

     VitalSetupHoldCheck
       (
         Violation      => Tviol_REL_CLKA_posedge,
         TimingData     => Tmkr_REL_CLKA_posedge,
         TestSignal     => REL,
         TestSignalName => "REL",
         TestDelay      => 0 ns,
         RefSignal      => CLKA_dly,
         RefSignalName  => "CLKA",
         RefDelay       => 0 ns,
         SetupHigh      => tsetup_REL_CLKA_posedge_posedge,
         SetupLow       => tsetup_REL_CLKA_negedge_posedge,
         HoldLow        => thold_REL_CLKA_posedge_posedge,
         HoldHigh       => thold_REL_CLKA_negedge_posedge,
         CheckEnabled   => GSR_dly  /= '1',
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_PMCD",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING);
--===================================================== 
       VitalRecoveryRemovalCheck (
         Violation            => Tviol_RST_CLKA_posedge,
         TimingData           => Tmkr_RST_CLKA_posedge,
         TestSignal           => RST_dly,
         TestSignalName       => "RST",
         TestDelay            => tisd_RST_CLKA,
         RefSignal            => CLKA_dly,
         RefSignalName        => "CLKA",
         RefDelay             => ticd_CLKA,
         Recovery             => trecovery_RST_CLKA_negedge_posedge,
         Removal              => tremoval_RST_CLKA_negedge_posedge,
         ActiveLow            => FALSE,
         CheckEnabled         => GSR_dly  /= '1',
         RefTransition        => 'R',
         HeaderMsg            => "/X_PMCD",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
--===================================================== 
       VitalRecoveryRemovalCheck (
         Violation            => Tviol_RST_CLKB_posedge,
         TimingData           => Tmkr_RST_CLKB_posedge,
         TestSignal           => RST_dly,
         TestSignalName       => "RST",
         TestDelay            => tisd_RST_CLKB,
         RefSignal            => CLKB_dly,
         RefSignalName        => "CLKB",
         RefDelay             => ticd_CLKB,
         Recovery             => trecovery_RST_CLKB_negedge_posedge,
         Removal              => tremoval_RST_CLKB_negedge_posedge,
         ActiveLow            => FALSE,
         CheckEnabled         => GSR_dly  /= '1',
         RefTransition        => 'R',
         HeaderMsg            => "/X_PMCD",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
--===================================================== 
       VitalRecoveryRemovalCheck (
         Violation            => Tviol_RST_CLKC_posedge,
         TimingData           => Tmkr_RST_CLKC_posedge,
         TestSignal           => RST_dly,
         TestSignalName       => "RST",
         TestDelay            => tisd_RST_CLKC,
         RefSignal            => CLKC_dly,
         RefSignalName        => "CLKC",
         RefDelay             => ticd_CLKC,
         Recovery             => trecovery_RST_CLKC_negedge_posedge,
         Removal              => tremoval_RST_CLKC_negedge_posedge,
         ActiveLow            => FALSE,
         CheckEnabled         => GSR_dly  /= '1',
         RefTransition        => 'R',
         HeaderMsg            => "/X_PMCD",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
--===================================================== 
       VitalRecoveryRemovalCheck (
         Violation            => Tviol_RST_CLKD_posedge,
         TimingData           => Tmkr_RST_CLKD_posedge,
         TestSignal           => RST_dly,
         TestSignalName       => "RST",
         TestDelay            => tisd_RST_CLKD,
         RefSignal            => CLKD_dly,
         RefSignalName        => "CLKD",
         RefDelay             => ticd_CLKD,
         Recovery             => trecovery_RST_CLKD_negedge_posedge,
         Removal              => tremoval_RST_CLKD_negedge_posedge,
         ActiveLow            => FALSE,
         CheckEnabled         => GSR_dly  /= '1',
         RefTransition        => 'R',
         HeaderMsg            => "/X_PMCD",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
--===================================================== 
       VitalRecoveryRemovalCheck (
         Violation            => Tviol_RST_REL_posedge,
         TimingData           => Tmkr_RST_REL_posedge,
         TestSignal           => RST_dly,
         TestSignalName       => "RST",
         TestDelay            => tisd_RST_REL,
         RefSignal            => REL_dly,
         RefSignalName        => "REL",
         RefDelay             => ticd_REL,
         Recovery             => trecovery_RST_REL_negedge_posedge,
         Removal              => tremoval_RST_REL_negedge_posedge,
         ActiveLow            => FALSE,
         CheckEnabled         => GSR_dly  /= '1',
         RefTransition        => 'R',
         HeaderMsg            => "/X_PMCD",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
--===================================================== 
       VitalPeriodPulseCheck (
         Violation            => Pviol_CLKA,
         PeriodData           => PInfo_CLKA,
         TestSignal           => CLKA_dly,
         TestSignalName       => "CLKA",
         TestDelay            => 0 ps,
         Period               => tperiod_CLKA_posedge,
         PulseWidthHigh       => tpw_CLKA_posedge,
         PulseWidthLow        => tpw_CLKA_negedge,
         CheckEnabled         => (GSR_dly  /= '1' and RST_dly /= '1'),
         HeaderMsg            => "/X_PMCD",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
--===================================================== 
       VitalPeriodPulseCheck (
         Violation            => Pviol_CLKB,
         PeriodData           => PInfo_CLKB,
         TestSignal           => CLKB_dly,
         TestSignalName       => "CLKB",
         TestDelay            => 0 ps,
         Period               => tperiod_CLKB_posedge,
         PulseWidthHigh       => tpw_CLKB_posedge,
         PulseWidthLow        => tpw_CLKB_negedge,
         CheckEnabled         => (GSR_dly  /= '1' and RST_dly /= '1'),
         HeaderMsg            => "/X_PMCD",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
--===================================================== 
       VitalPeriodPulseCheck (
         Violation            => Pviol_CLKC,
         PeriodData           => PInfo_CLKC,
         TestSignal           => CLKC_dly,
         TestSignalName       => "CLKC",
         TestDelay            => 0 ps,
         Period               => tperiod_CLKC_posedge,
         PulseWidthHigh       => tpw_CLKC_posedge,
         PulseWidthLow        => tpw_CLKC_negedge,
         CheckEnabled         => (GSR_dly  /= '1' and RST_dly /= '1'),
         HeaderMsg            => "/X_PMCD",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
--===================================================== 
       VitalPeriodPulseCheck (
         Violation            => Pviol_CLKD,
         PeriodData           => PInfo_CLKD,
         TestSignal           => CLKD_dly,
         TestSignalName       => "CLKD",
         TestDelay            => 0 ps,
         Period               => tperiod_CLKD_posedge,
         PulseWidthHigh       => tpw_CLKD_posedge,
         PulseWidthLow        => tpw_CLKD_negedge,
         CheckEnabled         => (GSR_dly  /= '1' and RST_dly /= '1'),
         HeaderMsg            => "/X_PMCD",
         Xon                  => Xon,
         MsgOn                => true,
         MsgSeverity          => warning);
--===================================================== 
     VitalPeriodPulseCheck
       (
         Violation      => Pviol_REL,
         PeriodData     => PInfo_REL,
         TestSignal     => REL_dly,
         TestSignalName => "REL",
         TestDelay      => 0 ns,
         Period         => 0 ns,
         PulseWidthHigh => tpw_REL_posedge,
         PulseWidthLow  => tpw_REL_negedge,
         CheckEnabled   => TRUE,
         HeaderMsg      => "/X_PMCD",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING);
--===================================================== 
     VitalPeriodPulseCheck
       (
         Violation      => Pviol_RST,
         PeriodData     => PInfo_RST,
         TestSignal     => RST_dly,
         TestSignalName => "RST",
         TestDelay      => 0 ns,
         Period         => 0 ns,
         PulseWidthHigh => tpw_RST_posedge,
         PulseWidthLow  => tpw_RST_negedge,
         CheckEnabled   => TRUE,
         HeaderMsg      => "/X_PMCD",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING);
    end if;

    Violation_CLKA1 <= Tviol_REL_CLKA_posedge or Tviol_RST_CLKA_posedge or Pviol_CLKA or Pviol_RST;
    Violation_CLKB1 <= Tviol_RST_CLKB_posedge or Pviol_CLKB or Pviol_RST;
    Violation_CLKC1 <= Tviol_RST_CLKC_posedge or Pviol_CLKC or Pviol_RST;
    Violation_CLKD1 <= Tviol_RST_CLKD_posedge or Pviol_CLKD or Pviol_RST;

    wait on CLKA_dly, CLKB_dly, CLKC_dly, CLKD_dly,
            REL_dly, RST_dly, GSR_dly;
  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable CLKA1_GlitchData	: VitalGlitchDataType;
  variable CLKA1D2_GlitchData	: VitalGlitchDataType;
  variable CLKA1D4_GlitchData	: VitalGlitchDataType;
  variable CLKA1D8_GlitchData	: VitalGlitchDataType;
  variable CLKB1_GlitchData	: VitalGlitchDataType;
  variable CLKC1_GlitchData	: VitalGlitchDataType;
  variable CLKD1_GlitchData	: VitalGlitchDataType;
  variable CLKA1_zd_viol_var	: std_ulogic := '0';
  variable CLKA1D2_zd_viol_var	: std_ulogic := '0';
  variable CLKA1D4_zd_viol_var	: std_ulogic := '0';
  variable CLKA1D8_zd_viol_var	: std_ulogic := '0';
  variable CLKB1_zd_viol_var	: std_ulogic := '0';
  variable CLKC1_zd_viol_var	: std_ulogic := '0';
  variable CLKD1_zd_viol_var	: std_ulogic := '0';
  begin

    CLKA1_zd_viol_var   := Violation_CLKA1  xor CLKA1_zd;
    CLKA1D2_zd_viol_var := Violation_CLKA1  xor CLKA1D2_zd;
    CLKA1D4_zd_viol_var := Violation_CLKA1  xor CLKA1D4_zd;
    CLKA1D8_zd_viol_var := Violation_CLKA1  xor CLKA1D8_zd;
    CLKB1_zd_viol_var   := Violation_CLKB1  xor CLKB1_zd;
    CLKC1_zd_viol_var   := Violation_CLKC1  xor CLKC1_zd;
    CLKD1_zd_viol_var   := Violation_CLKD1  xor CLKD1_zd;

    VitalPathDelay01 (
      OutSignal  => CLKA1,
      GlitchData => CLKA1_GlitchData,
      OutSignalName => "CLKA1",
      OutTemp => CLKA1_zd_viol_var,
      Paths => (0 => (CLKA1_zd'last_event, tpd_CLKA_CLKA1, RST_dly /= '1'),
                1 => (RST_dly'last_event,  tpd_RST_CLKA1,  RST_dly  = '1')),
      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => True,
      MsgSeverity => WARNING
      );
    VitalPathDelay01 (
      OutSignal  => CLKB1,
      GlitchData => CLKB1_GlitchData,
      OutSignalName => "CLKB1",
      OutTemp => CLKB1_zd_viol_var,
      Paths => (0 => (CLKB1_zd'last_event, tpd_CLKB_CLKB1, RST_dly /= '1'),
                1 => (RST_dly'last_event,  tpd_RST_CLKB1,  RST_dly  = '1')),
      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => True,
      MsgSeverity => WARNING
      );
    VitalPathDelay01 (
      OutSignal  => CLKC1,
      GlitchData => CLKC1_GlitchData,
      OutSignalName => "CLKC1",
      OutTemp => CLKC1_zd_viol_var,
      Paths => (0 => (CLKC1_zd'last_event, tpd_CLKC_CLKC1, RST_dly /= '1'),
                1 => (RST_dly'last_event,  tpd_RST_CLKC1,  RST_dly  = '1')),
      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => True,
      MsgSeverity => WARNING
      );
    VitalPathDelay01 (
      OutSignal  => CLKD1,
      GlitchData => CLKD1_GlitchData,
      OutSignalName => "CLKD1",
      OutTemp => CLKD1_zd_viol_var,
      Paths => (0 => (CLKD1_zd'last_event, tpd_CLKD_CLKD1, RST_dly /= '1'),
                1 => (RST_dly'last_event,  tpd_RST_CLKD1,  RST_dly  = '1')),
      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => True,
      MsgSeverity => WARNING
      );
    VitalPathDelay01 (
      OutSignal  => CLKA1D2,
      GlitchData => CLKA1D2_GlitchData,
      OutSignalName => "CLKA1D2",
      OutTemp => CLKA1D2_zd_viol_var,
      Paths => (0 => (CLKA1D2_zd'last_event, tpd_CLKA_CLKA1D2, RST_dly /= '1'),
                1 => (REL_dly'last_event,  tpd_REL_CLKA1D2,  RST_dly /= '1'),
                2 => (RST_dly'last_event,  tpd_RST_CLKA1D2,  RST_dly  = '1')),
      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => True,
      MsgSeverity => WARNING
      );
    VitalPathDelay01 (
      OutSignal  => CLKA1D4,
      GlitchData => CLKA1D4_GlitchData,
      OutSignalName => "CLKA1D4",
      OutTemp => CLKA1D4_zd_viol_var,
      Paths => (0 => (CLKA1D4_zd'last_event, tpd_CLKA_CLKA1D4, RST_dly /= '1'),
                1 => (REL_dly'last_event,  tpd_REL_CLKA1D4,  RST_dly /= '1'),
                2 => (RST_dly'last_event,  tpd_RST_CLKA1D4,  RST_dly  = '1')),
      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => True,
      MsgSeverity => WARNING
      );
    VitalPathDelay01 (
      OutSignal  => CLKA1D8,
      GlitchData => CLKA1D8_GlitchData,
      OutSignalName => "CLKA1D8",
      OutTemp => CLKA1D8_zd_viol_var,
      Paths => (0 => (CLKA1D8_zd'last_event, tpd_CLKA_CLKA1D8, RST_dly /= '1'),
                1 => (REL_dly'last_event,  tpd_REL_CLKA1D8,  RST_dly /= '1'),
                2 => (RST_dly'last_event,  tpd_RST_CLKA1D8,  RST_dly  = '1')),
      Mode => VitalTransport,
      Xon => Xon,
      MsgOn => True,
      MsgSeverity => WARNING
      );
     wait on CLKA1_zd, CLKA1D2_zd, CLKA1D4_zd, CLKA1D8_zd,
             CLKB1_zd, CLKC1_zd, CLKD1_zd;
  end process prcs_output;


end X_PMCD_V;

