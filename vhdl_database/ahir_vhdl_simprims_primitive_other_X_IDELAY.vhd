-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Input Delay Line
-- /___/   /\     Filename : X_IDELAY.vhd
-- \   \  /  \    Timestamp : Thu Mar 17 16:56:02 PST 2005
--  \___\/\___\
--
-- Revision:
--    03/23/04 - Initial version.
--    03/17/05 - Changed SIM_TAPDELAY_VALUE to 75 ps from 78 ps -- CR 204824 --FP
--    06/14/05 - Fixed VitalPathDelay constructs  -- CR 209786 --FP
--    08/08/05 - Made tap count to wrap around  -- CR 213995 --FP
--    07/18/06 - CR 234556 fix. Added SIM_DELAY_D --FP
--    12/29/06 - CR 430648 Simprim fix. For fixed/default, delay is annotated via sdf.
--    04/07/08 - CR 469973 -- Header Description fix
--    27/05/08 - CR 472154 Removed Vital GSR constructs
-- End Revision
----- CELL X_IDELAY -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_IDELAY is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables
      tipd_CE     : VitalDelayType01 := (0 ps, 0 ps);
      tipd_C      : VitalDelayType01 := (0 ps, 0 ps);
      tipd_I      : VitalDelayType01 := (0 ps, 0 ps);
      tipd_INC    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_RST    : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_I_O   : VitalDelayType01 := (100 ps, 100 ps);
      tpd_C_O   : VitalDelayType01 := (100 ps, 100 ps);


--  VITAL tisd & tisd variables
      ticd_C      : VitalDelayType  := 0.0 ps;

--  VITAL Setup/Hold delay variables
      tsetup_CE_C_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE_C_negedge_posedge : VitalDelayType := 0 ps;
      thold_CE_C_posedge_posedge  : VitalDelayType := 0 ps;
      thold_CE_C_negedge_posedge  : VitalDelayType := 0 ps;
      tsetup_I_C_posedge_posedge  : VitalDelayType := 0 ps;
      tsetup_I_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_I_C_posedge_posedge   : VitalDelayType := 0 ps;
      thold_I_C_negedge_posedge   : VitalDelayType := 0 ps;
      tsetup_INC_C_posedge_posedge  : VitalDelayType := 0 ps;
      tsetup_INC_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_INC_C_posedge_posedge   : VitalDelayType := 0 ps;
      thold_INC_C_negedge_posedge   : VitalDelayType := 0 ps;
      tsetup_RST_C_posedge_posedge  : VitalDelayType := 0 ps;
      tsetup_RST_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_RST_C_posedge_posedge   : VitalDelayType := 0 ps;
      thold_RST_C_negedge_posedge   : VitalDelayType := 0 ps;

-- VITAL pulse width variables
      tpw_C_posedge               : VitalDelayType := 0 ps;

-- VITAL period variables
      tperiod_C_posedge           : VitalDelayType := 0 ps;

-- VITAL recovery time variables

-- VITAL removal time variables


      IOBDELAY_TYPE  : string := "DEFAULT";
      IOBDELAY_VALUE : integer := 0;
      SIM_DELAY_D    : integer := 0; 
      SIM_TAPDELAY_VALUE  : integer := 75
      );

  port(
      O      : out std_ulogic;

      C      : in  std_ulogic;
      CE     : in  std_ulogic;
      I      : in  std_ulogic;
      INC    : in  std_ulogic;
      RST    : in  std_ulogic
      );

  attribute VITAL_LEVEL0 of
    X_IDELAY : entity is true;

end X_IDELAY;

architecture X_IDELAY_V OF X_IDELAY is

  attribute VITAL_LEVEL0 of
    X_IDELAY_V : architecture is true;

  ---------------------------------------------------------
  -- Function  str_2_int converts string to integer
  ---------------------------------------------------------
  function str_2_int(str: in string ) return integer is
  variable int : integer;
  variable val : integer := 0;
  variable neg_flg   : boolean := false;
  variable is_it_int : boolean := true;
  begin
    int := 0;
    val := 0;
    is_it_int := true;
    neg_flg   := false;

    for i in  1 to str'length loop
      case str(i) is
         when  '-'
           =>
             if(i = 1) then
                neg_flg := true;
                val := -1;
             end if;
         when  '1'
           =>  val := 1;
         when  '2'
           =>   val := 2;
         when  '3'
           =>   val := 3;
         when  '4'
           =>   val := 4;
         when  '5'
           =>   val := 5;
         when  '6'
           =>   val := 6;
         when  '7'
           =>   val := 7;
         when  '8'
           =>   val := 8;
         when  '9'
           =>   val := 9;
         when  '0'
           =>   val := 0;
         when others
           => is_it_int := false;
        end case;
        if(val /= -1) then
          int := int *10  + val;
        end if;
        val := 0;
    end loop;
    if(neg_flg) then
      int := int * (-1);
    end if;

    if(NOT is_it_int) then
      int := -9999;
    end if;
    return int;
  end;
-----------------------------------------------------------

  constant	SYNC_PATH_DELAY	: time := 0 ps;

  constant	MIN_TAP_COUNT	: integer := 0;
  constant	MAX_TAP_COUNT	: integer := 63;

  signal	C_ipd		: std_ulogic := 'X';
  signal	CE_ipd		: std_ulogic := 'X';
  signal	GSR_ipd		: std_ulogic := 'X';
  signal	I_ipd		: std_ulogic := 'X';
  signal	INC_ipd		: std_ulogic := 'X';
  signal	RST_ipd		: std_ulogic := 'X';

  signal	C_dly		: std_ulogic := 'X';
  signal	CE_dly		: std_ulogic := 'X';
  signal	GSR_dly		: std_ulogic := '0';
  signal	I_dly		: std_ulogic := 'X';
  signal	INC_dly		: std_ulogic := 'X';
  signal	RST_dly		: std_ulogic := 'X';

  signal	O_zd		: std_ulogic := 'X';
  signal	O_viol		: std_ulogic := 'X';

  signal	TapCount	: integer := 0;
  signal	IsTapDelay	: boolean := true; 
  signal	IsTapFixed	: boolean := false; 
  signal	IsTapDefault	: boolean := false; 
  signal	Delay		: time := 0 ps; 

begin

  GSR_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (C_ipd,      C,      tipd_C);
    VitalWireDelay (CE_ipd,     CE,     tipd_CE);
    VitalWireDelay (I_ipd,      I,      tipd_I);
    VitalWireDelay (INC_ipd,    INC,    tipd_INC);
    VitalWireDelay (RST_ipd,    RST,    tipd_RST);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (C_dly,      C_ipd,      ticd_C);
    VitalSignalDelay (CE_dly,     CE_ipd,     ticd_C);
    VitalSignalDelay (I_dly,      I_ipd,      ticd_C);
    VitalSignalDelay (INC_dly,    INC_ipd,    ticd_C);
    VitalSignalDelay (RST_dly,    RST_ipd,    ticd_C);
  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  variable TapCount_var   : integer := 0;
  variable IsTapDelay_var : boolean := true; 
  variable IsTapFixed_var : boolean := false; 
  variable IsTapDefault_var : boolean := false; 
  begin
--     if((IOBDELAY_VALUE = "OFF") or (IOBDELAY_VALUE = "off")) then
--        IsTapDelay_var := false;
--     elsif((IOBDELAY_VALUE = "ON") or (IOBDELAY_VALUE = "on")) then
--        IsTapDelay_var := false;
--     else
--       TapCount_var := str_2_int(IOBDELAY_VALUE); 
       TapCount_var := IOBDELAY_VALUE; 
       If((TapCount_var >= 0) and (TapCount_var <= 63)) then 
         IsTapDelay_var := true;

       else
          GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " IOBDELAY_VALUE ",
             EntityName => "/IOBDELAY_VALUE",
             GenericValue => IOBDELAY_VALUE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " OFF, 1, 2, ..., 62, 63 ",
             TailMsg => "",
             MsgSeverity => failure 
          );
        end if;
--     end if;

     if(IsTapDelay_var) then
        if((IOBDELAY_TYPE = "FIXED") or (IOBDELAY_TYPE = "fixed")) then
           IsTapFixed_var := true;
        elsif((IOBDELAY_TYPE = "VARIABLE") or (IOBDELAY_TYPE = "variable")) then
           IsTapFixed_var := false;
        elsif((IOBDELAY_TYPE = "DEFAULT") or (IOBDELAY_TYPE = "default")) then
           IsTapDefault_var := true;
        else
          GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " IOBDELAY_TYPE ",
             EntityName => "/IOBDELAY_TYPE",
             GenericValue => IOBDELAY_TYPE,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " FIXED or VARIABLE ",
             TailMsg => "",
             MsgSeverity => failure 
          );
        end if; 
     end if; 

     IsTapDelay   <= IsTapDelay_var;
     IsTapFixed   <= IsTapFixed_var;
     IsTapDefault <= IsTapDefault_var;
     TapCount     <= TapCount_var;

     wait;
  end process prcs_init;
--####################################################################
--#####                  CALCULATE DELAY                         #####
--####################################################################
  prcs_refclk:process(C_dly, GSR_dly, RST_dly)
  variable TapCount_var : integer :=0;
  variable FIRST_TIME   : boolean :=true;
  variable BaseTime_var : time    := 1 ps ;
  variable delay_var    : time    := 0 ps ;
  begin
     if(IsTapDelay) then
       if((GSR_dly = '1') or (FIRST_TIME))then
          TapCount_var := TapCount; 
          Delay        <= TapCount_var * SIM_TAPDELAY_VALUE * BaseTime_var; 
          FIRST_TIME   := false;
       elsif(GSR_dly = '0') then
          if(rising_edge(C_dly)) then
             if(RST_dly = '1') then
               TapCount_var := TapCount; 
             elsif((RST_dly = '0') and (CE_dly = '1')) then
-- CR fix CR 213995
                  if(INC_dly = '1') then
                     if (TapCount_var < MAX_TAP_COUNT) then
                        TapCount_var := TapCount_var + 1;
                     else 
                        TapCount_var := MIN_TAP_COUNT;
                     end if;
                  elsif(INC_dly = '0') then
                     if (TapCount_var > MIN_TAP_COUNT) then
                         TapCount_var := TapCount_var - 1;
                     else
                         TapCount_var := MAX_TAP_COUNT;
                     end if;
                         
                  end if; -- INC_dly
             end if; -- RST_dly
             Delay <= TapCount_var *  SIM_TAPDELAY_VALUE * BaseTime_var;
          end if; -- C_dly
       end if; -- GSR_dly

     end if; -- IsTapDelay 
  end process prcs_refclk;

--####################################################################
--#####                      DELAY INPUT                         #####
--####################################################################
  prcs_i:process(I_dly)
  begin
-- 430648 fix
     if((IsTapFixed) or (IsTapDefault)) then
        O_zd <= I_dly;
     else
        O_zd <= transport I_dly after delay;
     end if;
  end process prcs_i;

--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_tmngchk:process
  variable   Tviol_CE_C_posedge      : std_ulogic := '0';
  variable   Tmkr_CE_C_posedge       : VitalTimingDataType := VitalTimingDataInit;
  variable   Violation               : std_ulogic          := '0';

  begin
--  Setup/Hold Check Violations (all input pins)

     if (TimingChecksOn) then
       VitalSetupHoldCheck
         (
           Violation      => Tviol_CE_C_posedge,
           TimingData     => Tmkr_CE_C_posedge,
           TestSignal     => CE,
           TestSignalName => "CE",
           TestDelay      => 0 ns,
           RefSignal      => C_dly,
           RefSignalName  => "C",
           RefDelay       => 0 ns,
           SetupHigh      => tsetup_CE_C_posedge_posedge,
           SetupLow       => tsetup_CE_C_negedge_posedge,
           HoldLow        => thold_CE_C_posedge_posedge,
           HoldHigh       => thold_CE_C_negedge_posedge,
           CheckEnabled   => TRUE,
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_IDELAY",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => WARNING
        );
     end if;

     Violation :=  Tviol_CE_C_posedge;

     O_viol <= Violation xor O_zd;

     wait on C_dly, GSR_dly, RST_dly, O_zd;

  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable tpd_I_O_var : VitalDelayType01 := (SIM_DELAY_D * 1.0 ps, SIM_DELAY_D * 1.0 ps);
  variable  O_GlitchData : VitalGlitchDataType;
  begin 
        if((IOBDELAY_TYPE = "VARIABLE") or (IOBDELAY_TYPE = "variable")) then
          VitalPathDelay01
            (
              OutSignal     => O,
              GlitchData    => O_GlitchData,
              OutSignalName => "O",
              OutTemp       => O_viol,
              Paths         => (0 => (O_viol'last_event, tpd_I_O_var,TRUE)),
              Mode          => VitalTransport,
              Xon           => Xon,
              MsgOn         => MsgOn,
              MsgSeverity   => WARNING
          );
        else
          VitalPathDelay01
            (
              OutSignal     => O,
              GlitchData    => O_GlitchData,
              OutSignalName => "O",
              OutTemp       => O_viol,
              Paths         => (0 => (O_viol'last_event, tpd_I_O,TRUE)),
              Mode          => VitalTransport,
              Xon           => Xon,
              MsgOn         => MsgOn,
              MsgSeverity   => WARNING
          );
        end if;
     wait on O_viol;
  end process prcs_output;


end X_IDELAY_V;

