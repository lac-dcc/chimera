-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                       Dynamically Adjustable Differential Input Delay Buffer
-- /___/   /\     Filename :    X_IBUFDS_DLY_ADJ.vhd
-- \   \  /  \    Timestamp :   Tue Apr 19 08:18:20 PST 2005
--  \___\/\___\
--
-- Revision:
--    04/19/05 - Initial version.
--    06/30/06 - CR 233887 -- Corrected generic ordering
--    08/08/07 - CR 439320 -- Simprim fix -- Added attributes SIM_DELAY0, ... SIM_DELAY16 to fix timing issues
--    09/11/07 - CR 447604 -- When S[2:0]=0, it should correlate to 1 tap
--    04/07/08 - CR 469973 -- Header Description fix
-- End Revision
----- CELL X_IBUFDS_DLY_ADJ -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.VPACKAGE.all;

entity X_IBUFDS_DLY_ADJ is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";
      

--  VITAL input Pin path delay variables
      tipd_I      : VitalDelayType01 := (0 ps, 0 ps);
      tipd_IB     : VitalDelayType01 := (0 ps, 0 ps);
      tipd_S      : VitalDelayArrayType01 (2 downto 0 ) := (others => (0 ps, 0 ps));

--  VITAL clk-to-output path delay variables
      tpd_I_O   : VitalDelayType01 := (0 ps, 0 ps);
      tpd_IB_O  : VitalDelayType01 := (0 ps, 0 ps);
      tpd_S_O   : VitalDelayArrayType01 (2 downto 0 ) := (others => (0 ps, 0 ps));


--  VITAL tisd & tisd variables

--  VITAL Setup/Hold delay variables

-- VITAL pulse width variables

-- VITAL period variables

-- VITAL recovery time variables

-- VITAL removal time variables

      DELAY_OFFSET : string := "OFF";
      DIFF_TERM   : boolean :=  FALSE;
      IOSTANDARD : string := "DEFAULT";
      SIM_DELAY0 : integer := 0;
      SIM_DELAY1 : integer := 0;
      SIM_DELAY2 : integer := 0;
      SIM_DELAY3 : integer := 0;
      SIM_DELAY4 : integer := 0;
      SIM_DELAY5 : integer := 0;
      SIM_DELAY6 : integer := 0;
      SIM_DELAY7 : integer := 0;
      SIM_DELAY8 : integer := 0;
      SIM_DELAY9 : integer := 0;
      SIM_DELAY10 : integer := 0;
      SIM_DELAY11 : integer := 0;
      SIM_DELAY12 : integer := 0;
      SIM_DELAY13 : integer := 0;
      SIM_DELAY14 : integer := 0;
      SIM_DELAY15 : integer := 0;
      SIM_DELAY16 : integer := 0;
      SIM_TAPDELAY_VALUE  : integer := 200;
      SPECTRUM_OFFSET_DELAY : time := 1600 ps
      );

  port(
      O      : out std_ulogic;

      I      : in  std_ulogic;
      IB     : in  std_ulogic;
      S      : in  std_logic_vector (2 downto 0)
      );

  attribute VITAL_LEVEL0 of
    X_IBUFDS_DLY_ADJ : entity is true;

end X_IBUFDS_DLY_ADJ;

architecture X_IBUFDS_DLY_ADJ_V OF X_IBUFDS_DLY_ADJ is

  attribute VITAL_LEVEL0 of
    X_IBUFDS_DLY_ADJ_V : architecture is true;

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

  
  constant      MAX_S		: integer := 3;
  constant      MAX_TAP		: integer := 7;
  constant      MIN_TAP		: integer := 0;

  constant      MSB_S		: integer := MAX_S -1;
  constant      LSB_S		: integer := 0;

  constant	SYNC_PATH_DELAY	: time := 0 ps;


  signal	O_zd		: std_ulogic := 'X';
  signal	O_viol		: std_ulogic := 'X';

  signal	I_int		: std_ulogic := 'X';

  signal	I_ipd		: std_ulogic := 'X';
  signal	IB_ipd		: std_ulogic := 'X';
  signal        S_ipd           : std_logic_vector(MSB_S downto LSB_S);

  signal	INITIAL_DELAY	: time  := 0 ps;
  signal	DELAY   	: time  := 0 ps;

begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (I_ipd, I, tipd_I);
    VitalWireDelay (IB_ipd, IB, tipd_IB);
    S_WireDelay: for i in MSB_S downto LSB_S generate
       VitalWireDelay (S_ipd(i), S(i), tipd_S(i));
    end generate S_WireDelay;
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
     if((DELAY_OFFSET /= "ON") and (DELAY_OFFSET /= "on") and 
        (DELAY_OFFSET /= "OFF") and (DELAY_OFFSET /= "off")) then
           GenericValueCheckMessage
           (  HeaderMsg  => " Attribute Syntax Warning ",
              GenericName => " DELAY_OFFSET ",
              EntityName => "/X_IBUFDS_DLY_ADJ",
              GenericValue => DELAY_OFFSET,
              Unit => "",
              ExpectedValueMsg => " The Legal values for this attribute are ",
              ExpectedGenericValue => " ON or  OFF ",
              TailMsg => "",
              MsgSeverity => failure 
           );
     end if; 

     if((DELAY_OFFSET = "ON") or (DELAY_OFFSET = "on")) then  
-- CR 447604
--        INITIAL_DELAY <= SPECTRUM_OFFSET_DELAY;
        INITIAL_DELAY <= SPECTRUM_OFFSET_DELAY + (SIM_TAPDELAY_VALUE * 1 ps);
     else
--        INITIAL_DELAY <= 0 ps;
        INITIAL_DELAY <=  SIM_TAPDELAY_VALUE * 1 ps;
     end if;
     wait;
  end process prcs_init;
--####################################################################
--#####                  CALCULATE DELAY                         #####
--####################################################################
  prcs_s:process(S_ipd)
  variable TapCount_var : integer := 0;
  variable FIRST_TIME   : boolean :=true;
  variable BaseTime_var : time    := 1 ps ;
  variable delay_var    : time    := 0 ps ;
  variable S_int_var    : integer := 0;
  begin
     S_int_var := SLV_TO_INT(S_ipd);

     if((S_int_var >= MIN_TAP) and (S_int_var <= MAX_TAP)) then
         Delay        <= S_int_var * SIM_TAPDELAY_VALUE * BaseTime_var + INITIAL_DELAY;
     end if;
  end process prcs_s;

  VitalBehavior : process (I_ipd, IB_ipd)
  begin
    if ((I_ipd = '1') and (IB_ipd = '0')) then
      I_int <= TO_X01(I_ipd);
    elsif ((I_ipd = '0') and (IB_ipd = '1')) then
      I_int <= TO_X01(I_ipd);
    end if;
  end process;

--####################################################################
--#####                      DELAY INPUT                         #####
--####################################################################
  prcs_i:process(I_int)
  begin
      O_zd <= transport I_int after delay; 
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


     O_viol <= Violation xor O_zd;

     wait on I_ipd, S_ipd, O_zd;

  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable tpd_I_O_var : VitalDelayType01 := (SIM_DELAY0 * 1.0 ps, SIM_DELAY0 * 1.0 ps);
  variable tpd_IB_O_var : VitalDelayType01 := (SIM_DELAY0 * 1.0 ps, SIM_DELAY0 * 1.0 ps);
  variable  O_GlitchData : VitalGlitchDataType;
  begin
    if(DELAY_OFFSET = "OFF") then
      case S_ipd is
        when "000" => tpd_I_O_var := (SIM_DELAY1 * 1.0 ps, SIM_DELAY1 * 1.0 ps);
        when "001" => tpd_I_O_var := (SIM_DELAY2 * 1.0 ps, SIM_DELAY2 * 1.0 ps);
        when "010" => tpd_I_O_var := (SIM_DELAY3 * 1.0 ps, SIM_DELAY3 * 1.0 ps);
        when "011" => tpd_I_O_var := (SIM_DELAY4 * 1.0 ps, SIM_DELAY4 * 1.0 ps);
        when "100" => tpd_I_O_var := (SIM_DELAY5 * 1.0 ps, SIM_DELAY5 * 1.0 ps);
        when "101" => tpd_I_O_var := (SIM_DELAY6 * 1.0 ps, SIM_DELAY6 * 1.0 ps);
        when "110" => tpd_I_O_var := (SIM_DELAY7 * 1.0 ps, SIM_DELAY7 * 1.0 ps);
        when "111" => tpd_I_O_var := (SIM_DELAY8 * 1.0 ps, SIM_DELAY8 * 1.0 ps);
        when others => null;
      end case;
    elsif (DELAY_OFFSET = "ON") then
      case S_ipd is
        when "000" => tpd_I_O_var := (SIM_DELAY9  * 1.0 ps, SIM_DELAY9  * 1.0 ps);
        when "001" => tpd_I_O_var := (SIM_DELAY10 * 1.0 ps, SIM_DELAY10 * 1.0 ps);
        when "010" => tpd_I_O_var := (SIM_DELAY11 * 1.0 ps, SIM_DELAY11 * 1.0 ps);
        when "011" => tpd_I_O_var := (SIM_DELAY12 * 1.0 ps, SIM_DELAY12 * 1.0 ps);
        when "100" => tpd_I_O_var := (SIM_DELAY13 * 1.0 ps, SIM_DELAY13 * 1.0 ps);
        when "101" => tpd_I_O_var := (SIM_DELAY14 * 1.0 ps, SIM_DELAY14 * 1.0 ps);
        when "110" => tpd_I_O_var := (SIM_DELAY15 * 1.0 ps, SIM_DELAY15 * 1.0 ps);
        when "111" => tpd_I_O_var := (SIM_DELAY16 * 1.0 ps, SIM_DELAY16 * 1.0 ps);
        when others => null;
      end case;
    end if;

     VitalPathDelay01
       (
         OutSignal     => O,
         GlitchData    => O_GlitchData,
         OutSignalName => "O",
         OutTemp       => O_viol,
         Paths         => (0 => (I_ipd'last_event, tpd_I_O_var, true),
                           1 => (IB_ipd'last_event, tpd_I_O_var, true)),
         Mode          => VitalTransport,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );

     wait on O_viol;
  end process prcs_output;


end X_IBUFDS_DLY_ADJ_V;

