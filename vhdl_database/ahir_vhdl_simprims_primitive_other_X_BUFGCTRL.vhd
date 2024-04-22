-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Global Clock Mux Buffer
-- /___/   /\     Filename : X_BUFGCTRL.vhd
-- \   \  /  \    Timestamp : Fri Mar 26 08:18:19 PST 2004
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    11/28/05 - CR 221551 fix.
--    08/13/07 - CR 413180 Initialization mismatch fix for unisims.
--    04/07/08 - CR 469973 -- Header Description fix
--    05/20/08 - Remove GSR Vital (CR444306)
--    05/22/08 - Add init_done to pass initial values (CR 473625).
-- End Revision

----- CELL X_BUFGCTRL -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_BUFGCTRL is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables
      tipd_CE0       : VitalDelayType01 := (0 ps, 0 ps);
      tipd_CE1       : VitalDelayType01 := (0 ps, 0 ps);
      tipd_I0        : VitalDelayType01 := (0 ps, 0 ps);
      tipd_I1        : VitalDelayType01 := (0 ps, 0 ps);
      tipd_IGNORE0   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_IGNORE1   : VitalDelayType01 := (0 ps, 0 ps);
      tipd_S0        : VitalDelayType01 := (0 ps, 0 ps);
      tipd_S1        : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_I0_O       : VitalDelayType01 := (0 ps, 0 ps);
      tpd_I1_O       : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL tisd & tisd variables
      tisd_CE0_I0    : VitalDelayType   := 0.0 ps;
      tisd_CE0_I1    : VitalDelayType   := 0.0 ps;
      tisd_CE1_I0    : VitalDelayType   := 0.0 ps;
      tisd_CE1_I1    : VitalDelayType   := 0.0 ps;

      tisd_I1_I0     : VitalDelayType   := 0.0 ps;
      tisd_I0_I1     : VitalDelayType   := 0.0 ps;

      tisd_IGNORE0_I0     : VitalDelayType   := 0.0 ps;
      tisd_IGNORE1_I1     : VitalDelayType   := 0.0 ps;

      tisd_S0_I0     : VitalDelayType   := 0.0 ps;
      tisd_S0_I1     : VitalDelayType   := 0.0 ps;
      tisd_S1_I0     : VitalDelayType   := 0.0 ps;
      tisd_S1_I1     : VitalDelayType   := 0.0 ps;

      ticd_I0        : VitalDelayType   := 0.0 ps;
      ticd_I1        : VitalDelayType   := 0.0 ps;

--  VITAL Setup/Hold delay variables
      tsetup_CE0_I0_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE0_I0_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE0_I0_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_CE0_I0_negedge_negedge : VitalDelayType := 0 ps;

      thold_CE0_I0_posedge_posedge  : VitalDelayType := 0 ps;
      thold_CE0_I0_negedge_posedge  : VitalDelayType := 0 ps;
      thold_CE0_I0_posedge_negedge  : VitalDelayType := 0 ps;
      thold_CE0_I0_negedge_negedge  : VitalDelayType := 0 ps;

      tsetup_CE0_I1_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE0_I1_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE0_I1_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_CE0_I1_negedge_negedge : VitalDelayType := 0 ps;

      thold_CE0_I1_posedge_posedge  : VitalDelayType := 0 ps;
      thold_CE0_I1_negedge_posedge  : VitalDelayType := 0 ps;
      thold_CE0_I1_posedge_negedge  : VitalDelayType := 0 ps;
      thold_CE0_I1_negedge_negedge  : VitalDelayType := 0 ps;

      tsetup_CE1_I0_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE1_I0_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE1_I0_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_CE1_I0_negedge_negedge : VitalDelayType := 0 ps;

      thold_CE1_I0_posedge_posedge  : VitalDelayType := 0 ps;
      thold_CE1_I0_negedge_posedge  : VitalDelayType := 0 ps;
      thold_CE1_I0_posedge_negedge  : VitalDelayType := 0 ps;
      thold_CE1_I0_negedge_negedge  : VitalDelayType := 0 ps;

      tsetup_CE1_I1_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE1_I1_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE1_I1_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_CE1_I1_negedge_negedge : VitalDelayType := 0 ps;

      thold_CE1_I1_posedge_posedge  : VitalDelayType := 0 ps;
      thold_CE1_I1_negedge_posedge  : VitalDelayType := 0 ps;
      thold_CE1_I1_posedge_negedge  : VitalDelayType := 0 ps;
      thold_CE1_I1_negedge_negedge  : VitalDelayType := 0 ps;

      tsetup_S0_I0_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_S0_I0_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_S0_I0_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_S0_I0_negedge_negedge : VitalDelayType := 0 ps;

      thold_S0_I0_posedge_posedge  : VitalDelayType := 0 ps;
      thold_S0_I0_negedge_posedge  : VitalDelayType := 0 ps;
      thold_S0_I0_posedge_negedge  : VitalDelayType := 0 ps;
      thold_S0_I0_negedge_negedge  : VitalDelayType := 0 ps;

      tsetup_S0_I1_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_S0_I1_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_S0_I1_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_S0_I1_negedge_negedge : VitalDelayType := 0 ps;

      thold_S0_I1_posedge_posedge  : VitalDelayType := 0 ps;
      thold_S0_I1_negedge_posedge  : VitalDelayType := 0 ps;
      thold_S0_I1_posedge_negedge  : VitalDelayType := 0 ps;
      thold_S0_I1_negedge_negedge  : VitalDelayType := 0 ps;

      tsetup_S1_I0_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_S1_I0_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_S1_I0_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_S1_I0_negedge_negedge : VitalDelayType := 0 ps;

      thold_S1_I0_posedge_posedge  : VitalDelayType := 0 ps;
      thold_S1_I0_negedge_posedge  : VitalDelayType := 0 ps;
      thold_S1_I0_posedge_negedge  : VitalDelayType := 0 ps;
      thold_S1_I0_negedge_negedge  : VitalDelayType := 0 ps;

      tsetup_S1_I1_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_S1_I1_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_S1_I1_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_S1_I1_negedge_negedge : VitalDelayType := 0 ps;

      thold_S1_I1_posedge_posedge  : VitalDelayType := 0 ps;
      thold_S1_I1_negedge_posedge  : VitalDelayType := 0 ps;
      thold_S1_I1_posedge_negedge  : VitalDelayType := 0 ps;
      thold_S1_I1_negedge_negedge  : VitalDelayType := 0 ps;

      tsetup_I1_I0_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_I1_I0_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_I1_I0_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_I1_I0_negedge_negedge : VitalDelayType := 0 ps;

      tsetup_I0_I1_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_I0_I1_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_I0_I1_posedge_negedge : VitalDelayType := 0 ps;
      tsetup_I0_I1_negedge_negedge : VitalDelayType := 0 ps;

-- VITAL pulse width variables
      tpw_I0_posedge               : VitalDelayType := 0 ps;
      tpw_I0_negedge               : VitalDelayType := 0 ps;
      tpw_I1_posedge               : VitalDelayType := 0 ps;
      tpw_I1_negedge               : VitalDelayType := 0 ps;


-- VITAL period variable
      tperiod_I0_posedge           : VitalDelayType := 0 ps;
      tperiod_I1_posedge           : VitalDelayType := 0 ps;

      INIT_OUT     : integer := 0;
      PRESELECT_I0 : boolean := false;
      PRESELECT_I1 : boolean := false
      );

  port(
    O		: out std_ulogic;

    CE0		: in  std_ulogic;
    CE1		: in  std_ulogic;
    I0	        : in  std_ulogic;
    I1        	: in  std_ulogic;
    IGNORE0	: in  std_ulogic;
    IGNORE1	: in  std_ulogic;
    S0		: in  std_ulogic;
    S1		: in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_BUFGCTRL : entity is true;

end X_BUFGCTRL;

architecture X_BUFGCTRL_V OF X_BUFGCTRL is

  attribute VITAL_LEVEL0 of
    X_BUFGCTRL_V : architecture is true;


  constant SYNC_PATH_DELAY : time := 100 ps;

  signal CE0_ipd	: std_ulogic := 'X';
  signal CE1_ipd	: std_ulogic := 'X';
  signal I0_ipd	: std_ulogic := 'X';
  signal I1_ipd	: std_ulogic := 'X';
  signal IGNORE0_ipd	: std_ulogic := 'X';
  signal IGNORE1_ipd	: std_ulogic := 'X';
  signal S0_ipd  	: std_ulogic := 'X';
  signal S1_ipd  	: std_ulogic := 'X';

  signal CE0_dly        : std_ulogic := 'X';
  signal CE1_dly        : std_ulogic := 'X';
  signal I0_dly         : std_ulogic := 'X';
  signal I1_dly         : std_ulogic := 'X';
  signal IGNORE0_dly    : std_ulogic := 'X';
  signal IGNORE1_dly    : std_ulogic := 'X';
  signal S0_dly         : std_ulogic := 'X';
  signal S1_dly         : std_ulogic := 'X';

  signal O_zd		: std_ulogic := 'X';

  signal q0             : std_ulogic := 'X';
  signal q1             : std_ulogic := 'X';
  signal q0_enable      : std_ulogic := 'X';
  signal q1_enable      : std_ulogic := 'X';

  signal preslct_i0     : std_ulogic := 'X';
  signal preslct_i1     : std_ulogic := 'X';

  signal i0_int         : std_ulogic := 'X';
  signal i1_int         : std_ulogic := 'X';
  signal init_done      : boolean := false;
begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (CE0_ipd,  CE0, tipd_CE0);
    VitalWireDelay (CE1_ipd,  CE1, tipd_CE1);
    VitalWireDelay (I0_ipd, I0, tipd_I0);
    VitalWireDelay (I1_ipd, I1, tipd_I1);
    VitalWireDelay (IGNORE0_ipd, IGNORE0, tipd_IGNORE0);
    VitalWireDelay (IGNORE1_ipd, IGNORE1, tipd_IGNORE1);
    VitalWireDelay (S0_ipd,  S0, tipd_S0);
    VitalWireDelay (S1_ipd,  S1, tipd_S1);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CE0_dly,  CE0_ipd, tisd_CE0_I0);
    VitalSignalDelay (CE1_dly,  CE1_ipd, tisd_CE1_I1);
    VitalSignalDelay (I0_dly, I0_ipd, ticd_I0);
    VitalSignalDelay (I1_dly, I1_ipd, ticd_I1);
    VitalSignalDelay (IGNORE0_dly, IGNORE0_ipd, tisd_IGNORE0_I0);
    VitalSignalDelay (IGNORE1_dly, IGNORE1_ipd, tisd_IGNORE1_I1);
    VitalSignalDelay (S0_dly,  S0_ipd, tisd_S0_I0);
    VitalSignalDelay (S1_dly,  S1_ipd, tisd_S1_I1);
  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  variable FIRST_TIME : boolean := true;
  variable preslct_i0_var : std_ulogic;
  variable preslct_i1_var : std_ulogic;

  begin
    if(FIRST_TIME) then

      -- check for PRESELECT_I0
      case PRESELECT_I0  is
        when true  => preslct_i0_var := '1';
        when false => preslct_i0_var := '0';
        when others =>
         assert false report
           "*** Attribute Syntax Error: Legal values for PRESELECT_I0 are TRUE or FALSE"
          severity failure;
      end case;

      -- check for PRESELECT_I1
      case PRESELECT_I1  is
        when true  => preslct_i1_var := '1';
        when false => preslct_i1_var := '0';
        when others =>
         assert false report
           "*** Attribute Syntax Error: Legal values for PRESELECT_I0 are TRUE or FALSE"
          severity failure;
      end case;

      -- both preslcts can not be 1 simultaneously 
      if((preslct_i0_var = '1') and (preslct_i1_var = '1')) then
         assert false report
           "*** Attribute Syntax Error: The attributes PRESELECT_I0 and PRESELECT_I1 should not be set to TRUE simultaneously"
          severity failure;
      end if;
        
      -- check for INIT_OUT
      if((INIT_OUT /= 0) and (INIT_OUT /= 1)) then
         assert false report
           "*** Attribute Syntax Error: Legal values for INIT_OUT are 0 or 1 "
          severity failure;
      end if;

      preslct_i0 <= preslct_i0_var;
      preslct_i1 <= preslct_i1_var;
      FIRST_TIME := false;
      init_done <= true;
    end if;
    wait;

  end process prcs_init;


----- *** Start
     
  prcs_clk:process(i0_dly, i1_dly)
  begin
     if(INIT_OUT = 1) then
        i0_int <= NOT i0_dly; 
     else
        i0_int <= i0_dly; 
     end if;

     if(INIT_OUT = 1) then
        i1_int <= NOT i1_dly; 
     else
        i1_int <= i1_dly; 
     end if;
  end process prcs_clk;
--####################################################################
--#####                            I1                          #####
--####################################################################
----- *** Input enable for i1
  prcs_en_i1:process(IGNORE1_dly, i1_int, S1_dly, GSR, q0, init_done)
  variable FIRST_TIME        : boolean    := TRUE;
  begin
      if (((FIRST_TIME) and (init_done)) or (GSR = '1')) then
         q1_enable <= preslct_i1;
         FIRST_TIME := false;
      elsif (GSR = '0') then
         if ((i1_int  = '0') and (IGNORE1_dly = '0')) then 
             q1_enable <= q1_enable;
         elsif((i1_int = '1') or (IGNORE1_dly = '1')) then
             q1_enable <= ((NOT q0) AND (S1_dly));
          end if;
             
      end if;
  end process prcs_en_i1;
    
----- *** Output q1
  prcs_out_i1:process(q1_enable, CE1_dly, i1_int, IGNORE1_dly, GSR, init_done)
  variable FIRST_TIME        : boolean    := TRUE;
  begin
      if (((FIRST_TIME) and (init_done)) or (GSR = '1')) then
         q1 <= preslct_i1;
         FIRST_TIME := false;
      elsif (GSR = '0') then
         if ((i1_int  = '1') and (IGNORE1_dly = '0')) then 
             q1 <= q1;
         elsif((i1_int = '0') or (IGNORE1_dly = '1')) then
             if ((CE0_dly='1' and q0_enable='1') and (CE1_dly='1' and q1_enable='1')) then
                q1 <=  'X';
             else
                q1 <=  CE1_dly AND q1_enable;
             end if;
         end if;
      end if;
  end process prcs_out_i1;

--####################################################################
--#####                            I0                          #####
--####################################################################
----- *** Input enable for i0
  prcs_en_i0:process(IGNORE0_dly, i0_int, S0_dly, GSR, q1, init_done)
  variable FIRST_TIME        : boolean    := TRUE;
  begin
      if (((FIRST_TIME) and (init_done)) or (GSR = '1')) then
         q0_enable <= preslct_i0;
         FIRST_TIME := false;
      elsif (GSR = '0') then
         if ((i0_int  = '0') and (IGNORE0_dly = '0')) then 
             q0_enable <= q0_enable;
         elsif((i0_int = '1') or (IGNORE0_dly = '1')) then
             q0_enable <= ((NOT q1) AND (S0_dly));
          end if;
             
      end if;
  end process prcs_en_i0;
    
----- *** Output q0
  prcs_out_i0:process(q0_enable, CE0_dly, i0_int, IGNORE0_dly, GSR, init_done)
  variable FIRST_TIME        : boolean    := TRUE;
  begin
      if (((FIRST_TIME) and (init_done)) or (GSR = '1')) then
         q0 <= preslct_i0;
         FIRST_TIME := false;
      elsif (GSR = '0') then
         if ((i0_int  = '1') and (IGNORE0_dly = '0')) then 
             q0 <= q0;
         elsif((i0_int = '0') or (IGNORE0_dly = '1')) then
             if ((CE0_dly='1' and q0_enable='1') and (CE1_dly='1' and q1_enable='1')) then
                q0 <=  'X';
             else
                q0 <=  CE0_dly AND q0_enable;
             end if;
         end if;
      end if;
  end process prcs_out_i0;

--####################################################################
--#####                          OUTPUT                          #####
--####################################################################
  prcs_selectout:process(q0, q1, i0_int, i1_int)
  variable tmp_buf : std_logic_vector(1 downto 0);
  begin
    tmp_buf := q1&q0;
    case tmp_buf is
      when "01" => O_zd <= I0_dly;
      when "10" => O_zd <= I1_dly;
      when "00" => 
            if(INIT_OUT = 1) then
              O_zd <= '1';
            elsif(INIT_OUT = 0) then
              O_zd <= '0';
            end if;
      when "XX" => 
              O_zd <= 'X';
      when others =>
    end case;
  end process prcs_selectout;
--####################################################################

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_tmngchk:process

  variable Tviol_CE0_I0_posedge : std_ulogic := '0'; 
  variable Tmkr_CE0_I0_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Tviol_CE0_I1_posedge : std_ulogic := '0'; 
  variable Tmkr_CE0_I1_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Tviol_CE1_I0_posedge : std_ulogic := '0'; 
  variable Tmkr_CE1_I0_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Tviol_CE1_I1_posedge : std_ulogic := '0'; 
  variable Tmkr_CE1_I1_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Tviol_S0_I0_posedge : std_ulogic := '0'; 
  variable Tmkr_S0_I0_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Tviol_S0_I1_posedge : std_ulogic := '0'; 
  variable Tmkr_S0_I1_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Tviol_S1_I0_posedge : std_ulogic := '0'; 
  variable Tmkr_S1_I0_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Tviol_S1_I1_posedge : std_ulogic := '0'; 
  variable Tmkr_S1_I1_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Tviol_I1_I0_posedge : std_ulogic := '0'; 
  variable Tmkr_I1_I0_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Tviol_I0_I1_posedge : std_ulogic := '0'; 
  variable Tmkr_I0_I1_posedge  : VitalTimingDataType := VitalTimingDataInit;

  variable Pviol_I0            : std_ulogic := '0';
  variable PInfo_I0            : VitalPeriodDataType := VitalPeriodDataInit;

  variable Pviol_I1            : std_ulogic := '0';
  variable PInfo_I1            : VitalPeriodDataType := VitalPeriodDataInit;

  variable O_GlitchData        : VitalGlitchDataType;

  begin
     if (TimingChecksOn) then
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE0_I0_posedge,
         TimingData     => Tmkr_CE0_I0_posedge,
         TestSignal     => CE0_dly,
         TestSignalName => "CE0",
         TestDelay      => tisd_CE0_I0,
         RefSignal      => I0_dly,
         RefSignalName  => "I0",
         RefDelay       => ticd_I0,
         SetupHigh      => tsetup_CE0_I0_posedge_posedge,
         SetupLow       => tsetup_CE0_I0_negedge_posedge,
         HoldLow        => thold_CE0_I0_posedge_posedge,
         HoldHigh       => thold_CE0_I0_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE0_I1_posedge,
         TimingData     => Tmkr_CE0_I1_posedge,
         TestSignal     => CE0_dly,
         TestSignalName => "CE0",
         TestDelay      => tisd_CE0_I1,
         RefSignal      => I1_dly,
         RefSignalName  => "I1",
         RefDelay       => ticd_I1,
         SetupHigh      => tsetup_CE0_I1_posedge_posedge,
         SetupLow       => tsetup_CE0_I1_negedge_posedge,
         HoldLow        => thold_CE0_I1_posedge_posedge,
         HoldHigh       => thold_CE0_I1_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE1_I0_posedge,
         TimingData     => Tmkr_CE1_I0_posedge,
         TestSignal     => CE1_dly,
         TestSignalName => "CE1",
         TestDelay      => tisd_CE1_I0,
         RefSignal      => I0_dly,
         RefSignalName  => "I0",
         RefDelay       => ticd_I0,
         SetupHigh      => tsetup_CE1_I0_posedge_posedge,
         SetupLow       => tsetup_CE1_I0_negedge_posedge,
         HoldLow        => thold_CE1_I0_posedge_posedge,
         HoldHigh       => thold_CE1_I0_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_CE1_I1_posedge,
         TimingData     => Tmkr_CE1_I1_posedge,
         TestSignal     => CE1_dly,
         TestSignalName => "CE1",
         TestDelay      => tisd_CE1_I1,
         RefSignal      => I1_dly,
         RefSignalName  => "I1",
         RefDelay       => ticd_I1,
         SetupHigh      => tsetup_CE1_I1_posedge_posedge,
         SetupLow       => tsetup_CE1_I1_negedge_posedge,
         HoldLow        => thold_CE1_I1_posedge_posedge,
         HoldHigh       => thold_CE1_I1_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_I1_I0_posedge,
         TimingData     => Tmkr_I1_I0_posedge,
         TestSignal     => I1_dly,
         TestSignalName => "I1",
         TestDelay      => tisd_I1_I0,
         RefSignal      => I0_dly,
         RefSignalName  => "I0",
         RefDelay       => ticd_I0,
         SetupHigh      => tsetup_I1_I0_posedge_posedge,
         SetupLow       => tsetup_I1_I0_negedge_posedge,
         HoldLow        => 0 ns,
         HoldHigh       => 0 ns,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_I0_I1_posedge,
         TimingData     => Tmkr_I0_I1_posedge,
         TestSignal     => I0_dly,
         TestSignalName => "I0",
         TestDelay      => tisd_I0_I1,
         RefSignal      => I1_dly,
         RefSignalName  => "I1",
         RefDelay       => ticd_I1,
         SetupHigh      => tsetup_I0_I1_posedge_posedge,
         SetupLow       => tsetup_I0_I1_negedge_posedge,
         HoldLow        => 0 ns,
         HoldHigh       => 0 ns,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_S0_I0_posedge,
         TimingData     => Tmkr_S0_I0_posedge,
         TestSignal     => S0_dly,
         TestSignalName => "S0",
         TestDelay      => tisd_S0_I0,
         RefSignal      => I0_dly,
         RefSignalName  => "I0",
         RefDelay       => ticd_I0,
         SetupHigh      => tsetup_S0_I0_posedge_posedge,
         SetupLow       => tsetup_S0_I0_negedge_posedge,
         HoldLow        => thold_S0_I0_posedge_posedge,
         HoldHigh       => thold_S0_I0_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_S0_I1_posedge,
         TimingData     => Tmkr_S0_I1_posedge,
         TestSignal     => S0_dly,
         TestSignalName => "S0",
         TestDelay      => tisd_S0_I1,
         RefSignal      => I1_dly,
         RefSignalName  => "I1",
         RefDelay       => ticd_I1,
         SetupHigh      => tsetup_S0_I1_posedge_posedge,
         SetupLow       => tsetup_S0_I1_negedge_posedge,
         HoldLow        => thold_S0_I1_posedge_posedge,
         HoldHigh       => thold_S0_I1_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_S1_I0_posedge,
         TimingData     => Tmkr_S1_I0_posedge,
         TestSignal     => S1_dly,
         TestSignalName => "S1",
         TestDelay      => tisd_S1_I0,
         RefSignal      => I0_dly,
         RefSignalName  => "I0",
         RefDelay       => ticd_I0,
         SetupHigh      => tsetup_S1_I0_posedge_posedge,
         SetupLow       => tsetup_S1_I0_negedge_posedge,
         HoldLow        => thold_S1_I0_posedge_posedge,
         HoldHigh       => thold_S1_I0_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     VitalSetupHoldCheck
       (
         Violation      => Tviol_S1_I1_posedge,
         TimingData     => Tmkr_S1_I1_posedge,
         TestSignal     => S1_dly,
         TestSignalName => "S1",
         TestDelay      => tisd_S1_I1,
         RefSignal      => I1_dly,
         RefSignalName  => "I1",
         RefDelay       => ticd_I1,
         SetupHigh      => tsetup_S1_I1_posedge_posedge,
         SetupLow       => tsetup_S1_I1_negedge_posedge,
         HoldLow        => thold_S1_I1_posedge_posedge,
         HoldHigh       => thold_S1_I1_negedge_posedge,
         CheckEnabled   => TRUE,
         RefTransition  => 'R',
         HeaderMsg      => InstancePath & "/X_BUFGCTRL",
         Xon            => Xon,
         MsgOn          => MsgOn,
         MsgSeverity    => WARNING
       );
     end if;
-- End of (TimingChecksOn)
--  Output-to-Clock path delay
     VitalPathDelay01
       (
         OutSignal     => O,
         GlitchData    => O_GlitchData,
         OutSignalName => "O",
         OutTemp       => O_zd,
         Paths         => (0 => (I0_dly'last_event, tpd_I0_O, TRUE),
                           1 => (I1_dly'last_event, tpd_I1_O, TRUE)),
         Mode          => OnEvent,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );
      VitalPeriodPulseCheck 
       (
         Violation               => Pviol_I0,
         PeriodData              => PInfo_I0,
         TestSignal              => I0_dly,
         TestSignalName          => "I0",
         TestDelay               => 0 ns,
         Period                  => tperiod_I0_posedge,
         PulseWidthHigh          => tpw_I0_posedge,
         PulseWidthLow           => tpw_I0_negedge,
         CheckEnabled            => TRUE,
         HeaderMsg               => InstancePath &"/X_BUFGCTRL",
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
      );
      VitalPeriodPulseCheck 
       (
         Violation               => Pviol_I1,
         PeriodData              => PInfo_I1,
         TestSignal              => I1_dly,
         TestSignalName          => "I1",
         TestDelay               => 0 ns,
         Period                  => tperiod_I1_posedge,
         PulseWidthHigh          => tpw_I1_posedge,
         PulseWidthLow           => tpw_I1_negedge,
         CheckEnabled            => TRUE,
         HeaderMsg               => InstancePath &"/X_BUFGCTRL",
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
      );
      wait on I0_dly, I1_dly, S0_dly, S1_dly, CE0_dly, CE1_dly,
              IGNORE0_dly, IGNORE1_dly, O_zd;
  end process prcs_tmngchk;

end X_BUFGCTRL_V;

