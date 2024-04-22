-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Timing Simulation Library Component
--  /   /                  Output Fixed or Variable Delay Element
-- /___/   /\     Filename : X_ODELAYE2.vhd
-- \   \  /  \    Timestamp : Tue Nov 24 16:44:21 PST 2009
--  \___\/\___\
--
-- Revision:
--    11/24/09 - Initial version.
--    12/03/10 - CR 582681 - Updated init delay value
--    02/01/11 - CR 592255 - Updated default value of HIGH_PERFORMANCE_MODE.
--    03/01/11 - CR 595286 - Fixed CNTVALUEOUT when in VAR_LOAD_PIPE mode.
--    09/01/11 - CR 623071 - Updated REFCLK_FREQUENCY check message 
--    12/01/11 - CR 636319 - simprim -- updated wire/signal delay vital constructs
-- End Revision

----- CELL X_ODELAYE2 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_ODELAYE2 is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";
      SIM_DELAY_D    : integer	:= 0;

--  VITAL input Pin path delay variables
      tipd_C		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CE		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CINVCTRL	: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CLKIN	: VitalDelayType01 := (0 ps, 0 ps);
      tipd_CNTVALUEIN   : VitalDelayArrayType01 (4 downto 0) := (others => (0 ps, 0 ps));
      tipd_INC		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_LD		: VitalDelayType01 := (0 ps, 0 ps);
      tipd_LDPIPEEN	: VitalDelayType01 := (0 ps, 0 ps);
      tipd_ODATAIN	: VitalDelayType01 := (0 ps, 0 ps);
      tipd_REGRST	: VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_CINVCTRL_DATAOUT : VitalDelayType01 := (0 ps, 0 ps);
      tpd_CLKIN_DATAOUT : VitalDelayType01 := (0 ps, 0 ps);
      tpd_C_DATAOUT   	  : VitalDelayType01 := (100 ps, 100 ps);
      tpd_ODATAIN_DATAOUT : VitalDelayType01 := (0 ps, 0 ps);

      tpd_CINVCTRL_CNTVALUEOUT : VitalDelayArrayType01(4 downto 0) := (others => (0 ps, 0 ps));
      tpd_C_CNTVALUEOUT : VitalDelayArrayType01(4 downto 0) := (others => (0 ps, 0 ps));

--  VITAL GSR-to-output path delay variable


--  VITAL tisd & tisd variables
      tisd_CE_C  : VitalDelayType := 0.0 ps;
      tisd_CLKIN_C    : VitalDelayType := 0.0 ps;
      tisd_CINVCTRL_C : VitalDelayType := 0.0 ps;
      tisd_CNTVALUEIN_C : VitalDelayArrayType(4 downto 0) := (others => 0 ps);
      tisd_INC_C : VitalDelayType := 0.0 ps;
      tisd_LD_C : VitalDelayType := 0.0 ps;
      tisd_ODATAIN_C    : VitalDelayType := 0.0 ps;
      tisd_LDPIPEEN_C : VitalDelayType := 0.0 ps;
      tisd_REGRST_C : VitalDelayType := 0.0 ps;

      ticd_C     : VitalDelayType := 0.0 ps;

--  VITAL Setup/Hold delay variables
      tsetup_CE_C_posedge_posedge : VitalDelayType := 0 ps;
      tsetup_CE_C_negedge_posedge : VitalDelayType := 0 ps;
      thold_CE_C_posedge_posedge  : VitalDelayType := 0 ps;
      thold_CE_C_negedge_posedge  : VitalDelayType := 0 ps;
      tsetup_INC_C_posedge_posedge  : VitalDelayType := 0 ps;
      tsetup_INC_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_INC_C_posedge_posedge   : VitalDelayType := 0 ps;
      thold_INC_C_negedge_posedge   : VitalDelayType := 0 ps;
      tsetup_LD_C_posedge_posedge  : VitalDelayType := 0 ps;
      tsetup_LD_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_LD_C_posedge_posedge   : VitalDelayType := 0 ps;
      thold_LD_C_negedge_posedge   : VitalDelayType := 0 ps;
      tsetup_ODATAIN_C_posedge_posedge  : VitalDelayType := 0 ps;
      tsetup_ODATAIN_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_ODATAIN_C_posedge_posedge   : VitalDelayType := 0 ps;
      thold_ODATAIN_C_negedge_posedge   : VitalDelayType := 0 ps;
      
      tsetup_CNTVALUEIN_C_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0 ps);
      tsetup_CNTVALUEIN_C_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0 ps);
      thold_CNTVALUEIN_C_negedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0 ps);
      thold_CNTVALUEIN_C_posedge_posedge : VitalDelayArrayType(4 downto 0) := (others => 0 ps);

      tsetup_LDPIPEEN_C_posedge_posedge  : VitalDelayType := 0 ps;
      tsetup_LDPIPEEN_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_LDPIPEEN_C_posedge_posedge   : VitalDelayType := 0 ps;
      thold_LDPIPEEN_C_negedge_posedge   : VitalDelayType := 0 ps;

      tsetup_REGRST_C_negedge_posedge : VitalDelayType := 0 ps;
      tsetup_REGRST_C_posedge_posedge : VitalDelayType := 0 ps;
      thold_REGRST_C_negedge_posedge  : VitalDelayType := 0 ps;
      thold_REGRST_C_posedge_posedge  : VitalDelayType := 0 ps;


-- VITAL pulse width variables
      tpw_C_posedge               : VitalDelayType := 0 ps;

-- VITAL period variables
      tperiod_C_posedge           : VitalDelayType := 0 ps;

-- VITAL recovery time variables

-- VITAL removal time variables

      CINVCTRL_SEL		: string	:= "FALSE";
      DELAY_SRC			: string	:= "ODATAIN";
      HIGH_PERFORMANCE_MODE	: string	:= "FALSE";
      ODELAY_TYPE		: string	:= "FIXED";
      ODELAY_VALUE		: integer	:= 0;
      PIPE_SEL			: string	:= "FALSE";
      REFCLK_FREQUENCY		: real		:= 200.0;
      SIGNAL_PATTERN		: string	:= "DATA"
      );

  port(
      CNTVALUEOUT : out std_logic_vector(4 downto 0);
      DATAOUT	  : out std_ulogic;

      C           : in  std_ulogic;
      CE          : in  std_ulogic;
      CINVCTRL    : in std_ulogic;
      CLKIN       : in std_ulogic;
      CNTVALUEIN  : in std_logic_vector(4 downto 0);
      INC         : in  std_ulogic;
      LD	  : in  std_ulogic;
      LDPIPEEN    : in  std_ulogic;
      ODATAIN     : in  std_ulogic;
      REGRST      : in  std_ulogic
      );

  attribute VITAL_LEVEL0 of
    X_ODELAYE2 : entity is true;

end X_ODELAYE2;

architecture X_ODELAYE2_V OF X_ODELAYE2 is

  attribute VITAL_LEVEL0 of
    X_ODELAYE2_V : architecture is true;
  TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>)
         OF VitalTimingDataType;


------------------------------------------------
-- function Odelaye2_InitDelayCount
------------------------------------------------

   function Odelaye2_InitDelayCount(
                   DelayType  : in string;
                   DelayValue : in integer;
                   CounterVal : in  std_logic_vector(4 downto 0)
   ) return integer is

  begin
     if((DelayType = "FIXED") OR (DelayType = "VARIABLE")) then
         return DelayValue;
     elsif((DelayType = "VAR_LOAD" OR (DelayType = "VAR_LOAD_PIPE"))) then
         return SLV_TO_INT(CounterVal); 
     else
         return 0;
     end if;
  end;

------------------------------------------------
-- function CalcTapDelay
------------------------------------------------

   function CalcTapDelay(
                   refclk_freqncy     : in real;
                   max_freqncy        : in real;
                   min_freqncy        : in real
   ) return integer is

  begin
    if((refclk_freqncy <= max_freqncy) and (refclk_freqncy >= min_freqncy)) then
       return 52;
    else 
      return 78;
    end if;
  end;
-------------------- constants --------------------------

  constant	MAX_DELAY_COUNT	: integer := 31;
  constant	MIN_DELAY_COUNT	: integer := 0;

  constant	MAX_REFCLK_FREQUENCYL   : real := 210.0;
  constant	MIN_REFCLK_FREQUENCYL   : real := 190.0;

  constant	MAX_REFCLK_FREQUENCYH   : real := 310.0;
  constant	MIN_REFCLK_FREQUENCYH   : real := 290.0;

  constant      INIT_DELAY              : time := 600 ps; 

  signal	C_ipd		: std_ulogic := 'X';
  signal	CE_ipd		: std_ulogic := 'X';
  signal	CINVCTRL_ipd	: std_ulogic := 'X';
  signal	CLKIN_ipd	: std_ulogic := 'X';
  signal	CNTVALUEIN_ipd	: std_logic_vector(4 downto 0) := (others => '0');
  signal	GSR_ipd		: std_ulogic := 'X';
  signal	INC_ipd		: std_ulogic := 'X';
  signal        LD_ipd          : std_ulogic := 'X';
  signal        LDPIPEEN_ipd    : std_ulogic := 'X';
  signal	ODATAIN_ipd	: std_ulogic := 'X';
  signal	REGRST_ipd	: std_ulogic := 'X';

  signal	C_dly		: std_ulogic := 'X';
  signal	CE_dly		: std_ulogic := 'X';
  signal	CINVCTRL_dly	: std_ulogic := 'X';
  signal	CLKIN_dly	: std_ulogic := 'X';
  signal        CNTVALUEIN_dly  : std_logic_vector(4 downto 0) := (others => '0');
  signal	GSR_dly		: std_ulogic := '0';
  signal	INC_dly		: std_ulogic := 'X';
  signal        LD_dly          : std_ulogic := 'X';
  signal        LDPIPEEN_dly    : std_ulogic := 'X';
  signal	ODATAIN_dly	: std_ulogic := 'X';
  signal	REGRST_dly	: std_ulogic := 'X';

  signal	C_in		: std_ulogic := 'X';


  signal	ODATAOUT_delayed	: std_ulogic := 'X';
--  signal	ODATAOUT_zd		: std_ulogic := 'X';
--  signal	ODATAOUT_viol		: std_ulogic := 'X';

  signal	DATAOUT_zd		: std_ulogic := 'X';
--  signal	DATAOUT_viol		: std_ulogic := 'X';

  signal        CNTVALUEOUT_zd  : std_logic_vector(4 downto 0) := (others => '0');
  signal	oDelay		: time := 0.0 ps; 

  signal	data_mux	: std_ulogic := 'X';
  signal	Violation	: std_ulogic := '0';

-------------- variable declaration -------------------------

  signal	OneTapDelay        : time := CalcTapDelay(REFCLK_FREQUENCY, MAX_REFCLK_FREQUENCYH, MIN_REFCLK_FREQUENCYH) * 1.0 ps; 
  signal	odelay_count       : integer := Odelaye2_InitDelayCount(ODELAY_TYPE, ODELAY_VALUE, "00000");
  signal	CNTVALUEIN_INTEGER : integer := 0;
  signal	cntvalueout_pre	   : std_logic_vector(4 downto 0);
  signal	tap_out		   : std_ulogic := 'X';

  signal   delay_chain_0,  delay_chain_1,  delay_chain_2,  delay_chain_3,
           delay_chain_4,  delay_chain_5,  delay_chain_6,  delay_chain_7,
           delay_chain_8,  delay_chain_9,  delay_chain_10, delay_chain_11,
           delay_chain_12, delay_chain_13, delay_chain_14, delay_chain_15,
           delay_chain_16, delay_chain_17, delay_chain_18, delay_chain_19,
           delay_chain_20, delay_chain_21, delay_chain_22, delay_chain_23,
           delay_chain_24, delay_chain_25, delay_chain_26, delay_chain_27,
           delay_chain_28, delay_chain_29, delay_chain_30, delay_chain_31 : std_ulogic;

  signal   qcntvalueout_reg  : std_logic_vector(4 downto 0) := (others => '0');
  signal   qcntvalueout_mux  : std_logic_vector(4 downto 0) := (others => '0');

begin

  GSR_dly <= GSR;

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin

    CNTVALUEIN_DELAY : for i in 0 to 4 generate
       VitalWireDelay (CNTVALUEIN_ipd(i), CNTVALUEIN(i), tipd_CNTVALUEIN(i));
    end generate CNTVALUEIN_DELAY;

    VitalWireDelay (C_ipd,		C,		tipd_C);
    VitalWireDelay (CE_ipd,		CE,		tipd_CE);
    VitalWireDelay (CINVCTRL_ipd,	CINVCTRL,	tipd_CINVCTRL);
    VitalWireDelay (CLKIN_ipd,		CLKIN,		tipd_CLKIN);
    VitalWireDelay (INC_ipd,		INC,		tipd_INC);
    VitalWireDelay (LD_ipd,		LD,		tipd_LD);
    VitalWireDelay (LDPIPEEN_ipd,	LDPIPEEN,	tipd_LDPIPEEN);
    VitalWireDelay (ODATAIN_ipd,	ODATAIN,	tipd_ODATAIN);
    VitalWireDelay (REGRST_ipd,		REGRST,		tipd_REGRST);
  end block;

  SignalDelay : block
  begin

    CNTVALUEIN_C_DELAY : for i in 4 downto 0 generate
       VitalSignalDelay (CNTVALUEIN_dly(i),CNTVALUEIN_ipd(i),tisd_CNTVALUEIN_C(i));
    end generate CNTVALUEIN_C_DELAY;

    VitalSignalDelay (C_dly,		C_ipd,		ticd_C);
    VitalSignalDelay (CE_dly,		CE_ipd,		tisd_CE_C);
    VitalSignalDelay (CINVCTRL_dly,	CINVCTRL_ipd,	tisd_CINVCTRL_C);
    VitalSignalDelay (CLKIN_dly,	CLKIN_ipd,	tisd_CLKIN_C);
    VitalSignalDelay (INC_dly,		INC_ipd,	tisd_INC_C);
    VitalSignalDelay (LD_dly,		LD_ipd,		tisd_LD_C);
    VitalSignalDelay (LDPIPEEN_dly,	LDPIPEEN_ipd,	tisd_LDPIPEEN_C);
    VitalSignalDelay (ODATAIN_dly,	ODATAIN_ipd,	tisd_ODATAIN_C);
    VitalSignalDelay (REGRST_dly,	REGRST_ipd,	tisd_REGRST_C);
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

  variable odelaytypefixed_var          : boolean := false; 
  variable odelaytypeloadable_pipelined : boolean := false;
  variable odelaytypevariable_var       : boolean := false;
  variable odelaytypevarloadable_var    : boolean := false;

  variable tmp_var : boolean := true;


  begin
     -------- CINVCTRL_SEL check
     if((CINVCTRL_SEL /= "TRUE") and (CINVCTRL_SEL /= "FALSE"))then
          assert false
          report "Attribute Syntax Error: The attribute CINVCTRL_SEL on X_ODELAYE2 must be set to either TRUE or FALSE."
          severity Failure;
     end if;

    --------DELAY_SRC check
     if((DELAY_SRC /= "ODATAIN") and (DELAY_SRC /= "CLKIN"))then
          assert false
          report "Attribute Syntax Error: The attribute DELAY_SRC on X_ODELAYE2 must be set to either ODATAIN or CLKIN."
          severity Failure;
     end if;

     -------- HIGH_PERFORMANCE_MODE check

     if((HIGH_PERFORMANCE_MODE /= "TRUE") and (HIGH_PERFORMANCE_MODE /= "FALSE"))then
          assert false
          report "Attribute Syntax Error: The attribute HIGH_PERFORMANCE_MODE on X_ODELAYE2 must be set to either TRUE or FALSE."
          severity Failure;
     end if;

     -------- ODELAY_TYPE check

     if(ODELAY_TYPE = "FIXED") then
        odelaytypefixed_var          := true;
        odelaytypeloadable_pipelined := false;
        odelaytypevariable_var       := false;
        odelaytypevarloadable_var    := false;
     elsif(ODELAY_TYPE = "VAR_LOAD_PIPE") then
        odelaytypefixed_var          := false;
        odelaytypeloadable_pipelined := true;
        odelaytypevariable_var       := false;
        odelaytypevarloadable_var    := false;
     elsif(ODELAY_TYPE = "VARIABLE") then
        odelaytypefixed_var          := false;
        odelaytypeloadable_pipelined := false;
        odelaytypevariable_var       := true;
        odelaytypevarloadable_var    := false;
     elsif(ODELAY_TYPE = "VAR_LOAD") then
        odelaytypefixed_var          := false;
        odelaytypeloadable_pipelined := false;
        odelaytypevariable_var       := false;
        odelaytypevarloadable_var    := true;
     else
       GenericValueCheckMessage
       (  HeaderMsg  => " Attribute Syntax Warning ",
          GenericName => " ODELAY_TYPE ",
          EntityName => "/X_ODELAYE2",
          GenericValue => ODELAY_TYPE,
          Unit => "",
          ExpectedValueMsg => " The Legal values for this attribute are ",
          ExpectedGenericValue => " FIXED, VAR_LOAD, VAR_LOAD_PIPE or VARIABLE",
          TailMsg => "",
          MsgSeverity => failure 
       );
     end if;


     if((ODELAY_VALUE < MIN_DELAY_COUNT) or (ODELAY_VALUE > MAX_DELAY_COUNT)) then 
        GenericValueCheckMessage
        (  HeaderMsg  => " Attribute Syntax Warning ",
           GenericName => " ODELAY_VALUE ",
           EntityName => "/X_ODELAYE2",
           GenericValue => ODELAY_VALUE,
           Unit => "",
           ExpectedValueMsg => " The Legal values for this attribute are ",
           ExpectedGenericValue => " 0, 1, 2, ..., 30, 31 ",
           TailMsg => "",
           MsgSeverity => failure 
        );
     end if;


     -------- PIPE_SEL check
     if((PIPE_SEL /= "TRUE") and (PIPE_SEL /= "FALSE"))then
          assert false
          report "Attribute Syntax Error: The attribute PIPE_SEL on ODELAYE2 must be set to either TRUE or FALSE."
          severity Failure;
     end if;

     
     -------- REFCLK_FREQUENCY check

     if((REFCLK_FREQUENCY < MIN_REFCLK_FREQUENCYL) or (REFCLK_FREQUENCY > MAX_REFCLK_FREQUENCYH)) then 
         assert false
         report "Attribute Syntax Error: Legal values for REFCLK_FREQUENCY are either between 190.0 and 210.0, or between 290.0 and 310.0"
         severity Failure;
     end if;

     -------- SIGNAL_PATTERN check
     if((SIGNAL_PATTERN /= "CLOCK") and (SIGNAL_PATTERN /= "DATA"))then
         assert false
         report "Attribute Syntax Error: Legal values for SIGNAL_PATTERN are DATA or CLOCK"
         severity Failure;
     end if;

     wait;
  end process prcs_init;
--####################################################################
--#####                Dynamic clock inversion                   #####
--####################################################################
  prcs_dci:process(C_dly , CINVCTRL_dly)
  begin
     if(CINVCTRL_SEL = "TRUE") then
       if(CINVCTRL_dly = '1') then
          C_in <= NOT C_dly;
       else
          C_in <= C_dly;
       end if;
     else
       C_in <= C_dly;
     end if;
  end process prcs_dci;
--####################################################################
--#####                       cntvalueout                        #####
--####################################################################

     cntvalueout_pre <= CONV_STD_LOGIC_VECTOR(odelay_count, 5);

--####################################################################
--#####                     CNTVALUEIN LOAD                      #####
--####################################################################
  prcs_cntvaluein_load_reg:process(C_in, GSR_dly)
  variable odelay_count_var : integer := 0;
  variable FIRST_TIME   : boolean :=true;
  begin
     if((GSR_dly = '1') or (FIRST_TIME))then
        qcntvalueout_reg <= (others => '0');
        FIRST_TIME   := false;
     elsif(GSR_dly = '0') then
        if(rising_edge(C_in)) then
           if(REGRST_dly = '1') then
              qcntvalueout_reg <= (others => '0');
           elsif((REGRST_dly = '0') and (LDPIPEEN_dly = '1')) then
              qcntvalueout_reg <= CNTVALUEIN_dly;
           end if;
        end if;
     end if;
  end process prcs_cntvaluein_load_reg;

  prcs_cntvaluein_load_mux:process(qcntvalueout_reg, CNTVALUEIN_dly)
  begin
     if(PIPE_SEL = "TRUE") then
        qcntvalueout_mux <= qcntvalueout_reg;
     else
        qcntvalueout_mux <= CNTVALUEIN_dly;
     end if;
  end process prcs_cntvaluein_load_mux;

--####################################################################
--#####                  CALCULATE oDelay                        #####
--####################################################################
  prcs_calc_odelay:process(C_in, GSR_dly)
--  variable odelay_count_var : integer := Odelaye2_InitDelayCount(ODELAY_TYPE, ODELAY_VALUE, qcntvalueout_mux);
  variable odelay_count_var : integer := 0;
  variable FIRST_TIME   : boolean :=true;
  variable BaseTime_var : time    := 1 ps ;
  begin
-- CR 595286
     if((ODELAY_TYPE = "VARIABLE") OR (ODELAY_TYPE = "VAR_LOAD") OR (ODELAY_TYPE = "VAR_LOAD_PIPE")) then
       if((GSR_dly = '1') or (FIRST_TIME))then
          odelay_count_var := Odelaye2_InitDelayCount(ODELAY_TYPE, ODELAY_VALUE, qcntvalueout_mux);
          FIRST_TIME   := false;
       elsif(GSR_dly = '0') then
          if(rising_edge(C_in)) then
             if(LD_dly = '1') then
               odelay_count_var := Odelaye2_InitDelayCount(ODELAY_TYPE, ODELAY_VALUE, qcntvalueout_mux);
             elsif((LD_dly = '0') and (CE_dly = '1')) then
                  if(INC_dly = '1') then
                     if (odelay_count_var < MAX_DELAY_COUNT) then
                        odelay_count_var := odelay_count_var + 1;
                     else 
                        odelay_count_var := MIN_DELAY_COUNT;
                     end if;
                  elsif(INC_dly = '0') then
                     if (odelay_count_var > MIN_DELAY_COUNT) then
                         odelay_count_var := odelay_count_var - 1;
                     else
                         odelay_count_var := MAX_DELAY_COUNT;
                     end if;
                         
                  end if; -- INC_in
             end if; -- LD_dly
             odelay_count  <= odelay_count_var;
          end if; -- C_in
       end if; -- GSR_dly

     end if; -- ODELAY_TYPE 
  end process prcs_calc_odelay;

--####################################################################
--#####                      SELECT IDATA_MUX                    #####
--####################################################################
  prcs_data_mux:process(ODATAIN_dly, CLKIN_dly)
  begin
      if(DELAY_SRC = "ODATAIN") then 
            data_mux <= ODATAIN_dly;
      elsif(DELAY_SRC = "CLKIN") then
            data_mux <= CLKIN_dly;
      end if;
  end process prcs_data_mux;
--####################################################################
--#####                      DELAY BUFFERS                       #####
--####################################################################
delay_chain_0  <= transport data_mux;
delay_chain_1  <= transport delay_chain_0  after OneTapDelay;
delay_chain_2  <= transport delay_chain_1  after OneTapDelay;
delay_chain_3  <= transport delay_chain_2  after OneTapDelay;
delay_chain_4  <= transport delay_chain_3  after OneTapDelay;
delay_chain_5  <= transport delay_chain_4  after OneTapDelay;
delay_chain_6  <= transport delay_chain_5  after OneTapDelay;
delay_chain_7  <= transport delay_chain_6  after OneTapDelay;
delay_chain_8  <= transport delay_chain_7  after OneTapDelay;
delay_chain_9  <= transport delay_chain_8  after OneTapDelay;
delay_chain_10 <= transport delay_chain_9  after OneTapDelay;
delay_chain_11 <= transport delay_chain_10  after OneTapDelay;
delay_chain_12 <= transport delay_chain_11  after OneTapDelay;
delay_chain_13 <= transport delay_chain_12  after OneTapDelay;
delay_chain_14 <= transport delay_chain_13  after OneTapDelay;
delay_chain_15 <= transport delay_chain_14  after OneTapDelay;
delay_chain_16 <= transport delay_chain_15  after OneTapDelay;
delay_chain_17 <= transport delay_chain_16  after OneTapDelay;
delay_chain_18 <= transport delay_chain_17  after OneTapDelay;
delay_chain_19 <= transport delay_chain_18  after OneTapDelay;
delay_chain_20 <= transport delay_chain_19  after OneTapDelay;
delay_chain_21 <= transport delay_chain_20  after OneTapDelay;
delay_chain_22 <= transport delay_chain_21  after OneTapDelay;
delay_chain_23 <= transport delay_chain_22  after OneTapDelay;
delay_chain_24 <= transport delay_chain_23  after OneTapDelay;
delay_chain_25 <= transport delay_chain_24  after OneTapDelay;
delay_chain_26 <= transport delay_chain_25  after OneTapDelay;
delay_chain_27 <= transport delay_chain_26  after OneTapDelay;
delay_chain_28 <= transport delay_chain_27  after OneTapDelay;
delay_chain_29 <= transport delay_chain_28  after OneTapDelay;
delay_chain_30 <= transport delay_chain_29  after OneTapDelay;
delay_chain_31 <= transport delay_chain_30  after OneTapDelay;

--####################################################################
--#####                Assign Tap Delays                         #####
--####################################################################
  prcs_AssignDelays:process
  begin
     case odelay_count is
        when 0 =>    tap_out <= delay_chain_0;
        when 1 =>    tap_out <= delay_chain_1;
        when 2 =>    tap_out <= delay_chain_2;
        when 3 =>    tap_out <= delay_chain_3;
        when 4 =>    tap_out <= delay_chain_4;
        when 5 =>    tap_out <= delay_chain_5;
        when 6 =>    tap_out <= delay_chain_6;
        when 7 =>    tap_out <= delay_chain_7;
        when 8 =>    tap_out <= delay_chain_8;
        when 9 =>    tap_out <= delay_chain_9;
        when 10 =>   tap_out <= delay_chain_10;
        when 11 =>   tap_out <= delay_chain_11;
        when 12 =>   tap_out <= delay_chain_12;
        when 13 =>   tap_out <= delay_chain_13;
        when 14 =>   tap_out <= delay_chain_14;
        when 15 =>   tap_out <= delay_chain_15;
        when 16 =>   tap_out <= delay_chain_16;
        when 17 =>   tap_out <= delay_chain_17;
        when 18 =>   tap_out <= delay_chain_18;
        when 19 =>   tap_out <= delay_chain_19;
        when 20 =>   tap_out <= delay_chain_20;
        when 21 =>   tap_out <= delay_chain_21;
        when 22 =>   tap_out <= delay_chain_22;
        when 23 =>   tap_out <= delay_chain_23;
        when 24 =>   tap_out <= delay_chain_24;
        when 25 =>   tap_out <= delay_chain_25;
        when 26 =>   tap_out <= delay_chain_26;
        when 27 =>   tap_out <= delay_chain_27;
        when 28 =>   tap_out <= delay_chain_28;
        when 29 =>   tap_out <= delay_chain_29;
        when 30 =>   tap_out <= delay_chain_30;
        when 31 =>   tap_out <= delay_chain_31;
        when others =>
            tap_out <= delay_chain_0;
     end case;
  wait on  odelay_count, delay_chain_0,  delay_chain_1,  delay_chain_2,  delay_chain_3,
           delay_chain_4,  delay_chain_5,  delay_chain_6,  delay_chain_7,
           delay_chain_8,  delay_chain_9,  delay_chain_10, delay_chain_11,
           delay_chain_12, delay_chain_13, delay_chain_14, delay_chain_15,
           delay_chain_16, delay_chain_17, delay_chain_18, delay_chain_19,
           delay_chain_20, delay_chain_21, delay_chain_22, delay_chain_23,
           delay_chain_24, delay_chain_25, delay_chain_26, delay_chain_27,
           delay_chain_28, delay_chain_29, delay_chain_30, delay_chain_31;

  end process prcs_AssignDelays;


--####################################################################
--#####                      OUTPUT  TAP                         #####
--####################################################################

    CNTVALUEOUT_zd <= cntvalueout_pre;
    DATAOUT_zd     <= tap_out after INIT_DELAY ;


--####################################################################
--#####                         OUTPUT                           #####
--####################################################################
--#####                   TIMING CHECKS & OUTPUT                 #####
--####################################################################
  prcs_tmngchk:process
  variable   Tviol_CE_C_posedge  : std_ulogic          := '0';
  variable   Tmkr_CE_C_posedge   : VitalTimingDataType := VitalTimingDataInit;
  variable   Tviol_INC_C_posedge : std_ulogic          := '0';
  variable   Tmkr_INC_C_posedge : VitalTimingDataType  := VitalTimingDataInit;
  variable   Tviol_LD_C_posedge : std_ulogic          := '0';
  variable   Tmkr_LD_C_posedge : VitalTimingDataType  := VitalTimingDataInit;
  variable   Tviol_LDPIPEEN_C_posedge : std_ulogic          := '0';
  variable   Tmkr_LDPIPEEN_C_posedge : VitalTimingDataType  := VitalTimingDataInit;
  variable   Tviol_REGRST_C_posedge : std_ulogic          := '0';
  variable   Tmkr_REGRST_C_posedge : VitalTimingDataType  := VitalTimingDataInit;
  variable   Tviol_CNTVALUEIN_C_posedge : std_logic_vector(4 downto 0) := (others => '0');
  variable   Tmkr_CNTVALUEIN_C_posedge : VitalTimingDataArrayType(4 downto 0);
  variable   Pviol_C : std_ulogic := '0';
  variable   PInfo_C : VitalPeriodDataType := VitalPeriodDataInit;


--  variable   Violation           : std_ulogic          := '0';

  begin
--  Setup/Hold Check Violations (all input pins)

     if (TimingChecksOn) then
       VitalSetupHoldCheck
         (
           Violation      => Tviol_CE_C_posedge,
           TimingData     => Tmkr_CE_C_posedge,
           TestSignal     => CE_dly,
           TestSignalName => "CE",
           TestDelay      => tisd_CE_C,
           RefSignal      => C_in,
           RefSignalName  => "C",
           RefDelay       => ticd_C,
           SetupHigh      => tsetup_CE_C_posedge_posedge,
           SetupLow       => tsetup_CE_C_negedge_posedge,
           HoldLow        => thold_CE_C_posedge_posedge,
           HoldHigh       => thold_CE_C_negedge_posedge,
           CheckEnabled   => (TO_X01(GSR_dly) = '0'),
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_ODELAYE2",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => WARNING
        );

       VitalSetupHoldCheck
         (
           Violation      => Tviol_INC_C_posedge,
           TimingData     => Tmkr_INC_C_posedge,
           TestSignal     => INC_dly,
           TestSignalName => "INC",
           TestDelay      => tisd_INC_C,
           RefSignal      => C_in,
           RefSignalName  => "C",
           RefDelay       => ticd_C,
           SetupHigh      => tsetup_INC_C_posedge_posedge,
           SetupLow       => tsetup_INC_C_negedge_posedge,
           HoldLow        => thold_INC_C_posedge_posedge,
           HoldHigh       => thold_INC_C_negedge_posedge,
           CheckEnabled   => (TO_X01(GSR_dly) = '0'),
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_ODELAYE2",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => WARNING
        );

       VitalSetupHoldCheck
         (
           Violation      => Tviol_LD_C_posedge,
           TimingData     => Tmkr_LD_C_posedge,
           TestSignal     => LD_dly,
           TestSignalName => "LD",
           TestDelay      => tisd_LD_C,
           RefSignal      => C_in,
           RefSignalName  => "C",
           RefDelay       => ticd_C,
           SetupHigh      => tsetup_LD_C_posedge_posedge,
           SetupLow       => tsetup_LD_C_negedge_posedge,
           HoldLow        => thold_LD_C_posedge_posedge,
           HoldHigh       => thold_LD_C_negedge_posedge,
           CheckEnabled   => (TO_X01(GSR_dly) = '0'),
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_ODELAYE2",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => WARNING
        );

       VitalSetupHoldCheck
         (
           Violation      => Tviol_LDPIPEEN_C_posedge,
           TimingData     => Tmkr_LDPIPEEN_C_posedge,
           TestSignal     => LDPIPEEN_dly,
           TestSignalName => "LDPIPEEN",
           TestDelay      => tisd_LDPIPEEN_C,
           RefSignal      => C_in,
           RefSignalName  => "C",
           RefDelay       => ticd_C,
           SetupHigh      => tsetup_LDPIPEEN_C_posedge_posedge,
           SetupLow       => tsetup_LDPIPEEN_C_negedge_posedge,
           HoldLow        => thold_LDPIPEEN_C_posedge_posedge,
           HoldHigh       => thold_LDPIPEEN_C_negedge_posedge,
           CheckEnabled   => (TO_X01(GSR_dly) = '0'),
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_ODELAYE2",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => WARNING
        );
       VitalSetupHoldCheck
         (
           Violation      => Tviol_REGRST_C_posedge,
           TimingData     => Tmkr_REGRST_C_posedge,
           TestSignal     => REGRST_dly,
           TestSignalName => "REGRST",
           TestDelay      => tisd_REGRST_C,
           RefSignal      => C_in,
           RefSignalName  => "C",
           RefDelay       => ticd_C,
           SetupHigh      => tsetup_REGRST_C_posedge_posedge,
           SetupLow       => tsetup_REGRST_C_negedge_posedge,
           HoldLow        => thold_REGRST_C_posedge_posedge,
           HoldHigh       => thold_REGRST_C_negedge_posedge,
           CheckEnabled   => (TO_X01(GSR_dly) = '0'),
           RefTransition  => 'R',
           HeaderMsg      => InstancePath & "/X_ODELAYE2",
           Xon            => Xon,
           MsgOn          => MsgOn,
           MsgSeverity    => WARNING
        );
        VitalSetupHoldCheck
        (
          Violation => Tviol_CNTVALUEIN_C_posedge(0),
          TimingData => Tmkr_CNTVALUEIN_C_posedge(0),
          TestSignal => CNTVALUEIN_dly(0),
          TestSignalName => "CNTVALUEIN(0)",
          TestDelay => tisd_CNTVALUEIN_C(0),
          RefSignal => C_dly,
          RefSignalName => "C",
          RefDelay => ticd_C,
          SetupHigh => tsetup_CNTVALUEIN_C_posedge_posedge(0),
          HoldHigh => thold_CNTVALUEIN_C_posedge_posedge(0),
          SetupLow => tsetup_CNTVALUEIN_C_negedge_posedge(0),
          HoldLow => thold_CNTVALUEIN_C_negedge_posedge(0),
          CheckEnabled   => TRUE,
          RefTransition  => 'R',
          HeaderMsg      => InstancePath & "/X_ODELAYE2",
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
        VitalSetupHoldCheck
        (
          Violation => Tviol_CNTVALUEIN_C_posedge(1),
          TimingData => Tmkr_CNTVALUEIN_C_posedge(1),
          TestSignal => CNTVALUEIN_dly(1),
          TestSignalName => "CNTVALUEIN(1)",
          TestDelay => tisd_CNTVALUEIN_C(1),
          RefSignal => C_dly,
          RefSignalName => "C",
          RefDelay => ticd_C,
          SetupHigh => tsetup_CNTVALUEIN_C_posedge_posedge(1),
          HoldHigh => thold_CNTVALUEIN_C_posedge_posedge(1),
          SetupLow => tsetup_CNTVALUEIN_C_negedge_posedge(1),
          HoldLow => thold_CNTVALUEIN_C_negedge_posedge(1),
          CheckEnabled   => TRUE,
          RefTransition  => 'R',
          HeaderMsg      => InstancePath & "/X_ODELAYE2",
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
        VitalSetupHoldCheck
        (
          Violation => Tviol_CNTVALUEIN_C_posedge(2),
          TimingData => Tmkr_CNTVALUEIN_C_posedge(2),
          TestSignal => CNTVALUEIN_dly(2),
          TestSignalName => "CNTVALUEIN(2)",
          TestDelay => tisd_CNTVALUEIN_C(2),
          RefSignal => C_dly,
          RefSignalName => "C",
          RefDelay => ticd_C,
          SetupHigh => tsetup_CNTVALUEIN_C_posedge_posedge(2),
          HoldHigh => thold_CNTVALUEIN_C_posedge_posedge(2),
          SetupLow => tsetup_CNTVALUEIN_C_negedge_posedge(2),
          HoldLow => thold_CNTVALUEIN_C_negedge_posedge(2),
          CheckEnabled   => TRUE,
          RefTransition  => 'R',
          HeaderMsg      => InstancePath & "/X_ODELAYE2",
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
        VitalSetupHoldCheck
        (
          Violation => Tviol_CNTVALUEIN_C_posedge(3),
          TimingData => Tmkr_CNTVALUEIN_C_posedge(3),
          TestSignal => CNTVALUEIN_dly(3),
          TestSignalName => "CNTVALUEIN(3)",
          TestDelay => tisd_CNTVALUEIN_C(3),
          RefSignal => C_dly,
          RefSignalName => "C",
          RefDelay => ticd_C,
          SetupHigh => tsetup_CNTVALUEIN_C_posedge_posedge(3),
          HoldHigh => thold_CNTVALUEIN_C_posedge_posedge(3),
          SetupLow => tsetup_CNTVALUEIN_C_negedge_posedge(3),
          HoldLow => thold_CNTVALUEIN_C_negedge_posedge(3),
          CheckEnabled   => TRUE,
          RefTransition  => 'R',
          HeaderMsg      => InstancePath & "/X_ODELAYE2",
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
        VitalSetupHoldCheck
        (
          Violation => Tviol_CNTVALUEIN_C_posedge(4),
          TimingData => Tmkr_CNTVALUEIN_C_posedge(4),
          TestSignal => CNTVALUEIN_dly(4),
          TestSignalName => "CNTVALUEIN(4)",
          TestDelay => tisd_CNTVALUEIN_C(4),
          RefSignal => C_dly,
          RefSignalName => "C",
          RefDelay => ticd_C,
          SetupHigh => tsetup_CNTVALUEIN_C_posedge_posedge(4),
          HoldHigh => thold_CNTVALUEIN_C_posedge_posedge(4),
          SetupLow => tsetup_CNTVALUEIN_C_negedge_posedge(4),
          HoldLow => thold_CNTVALUEIN_C_negedge_posedge(4),
          CheckEnabled   => TRUE,
          RefTransition  => 'R',
          HeaderMsg      => InstancePath & "/X_ODELAYE2",
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
        VitalPeriodPulseCheck
        (
          Violation      => Pviol_C,
          PeriodData     => PInfo_C,
          TestSignal     => C_in,
          TestSignalName => "C",
          TestDelay      => 0 ps,
          Period         => tperiod_C_posedge,
          PulseWidthHigh => 0 ps,
          PulseWidthLow  => 0 ps,
          CheckEnabled   => TRUE,
          HeaderMsg      => InstancePath & "/X_ODELAYE2",
          Xon            => Xon,
          MsgOn          => MsgOn,
          MsgSeverity    => WARNING
        );
     end if;


     Violation <=  Tviol_CE_C_posedge xor 
                   Tviol_CNTVALUEIN_C_posedge(0) xor
                   Tviol_CNTVALUEIN_C_posedge(1) xor
                   Tviol_CNTVALUEIN_C_posedge(2) xor
                   Tviol_CNTVALUEIN_C_posedge(3) xor
                   Tviol_CNTVALUEIN_C_posedge(4) xor
                   Tviol_INC_C_posedge xor
                   Tviol_LD_C_posedge xor
                   Tviol_LDPIPEEN_C_posedge xor
                   Tviol_REGRST_C_posedge;


     wait on C_in, GSR_dly, CE_dly, CNTVALUEIN_dly, INC_dly, LD_dly, LDPIPEEN_dly, REGRST_dly;

  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable  DATAOUT_GlitchData : VitalGlitchDataType;
  variable  DATAOUT_viol       : std_ulogic;
  
  variable tpd_IN_OUT_var  : VitalDelayType01 := (SIM_DELAY_D * 1.0 ps, SIM_DELAY_D * 1.0 ps);
  variable   CNTVALUEOUT0_GlitchData : VitalGlitchDataType;
  variable   CNTVALUEOUT1_GlitchData : VitalGlitchDataType;
  variable   CNTVALUEOUT2_GlitchData : VitalGlitchDataType;
  variable   CNTVALUEOUT3_GlitchData : VitalGlitchDataType;
  variable   CNTVALUEOUT4_GlitchData : VitalGlitchDataType;

  begin

        DATAOUT_viol := Violation xor DATAOUT_zd;

        if((ODELAY_TYPE = "VARIABLE") or (ODELAY_TYPE = "variable")) then
          VitalPathDelay01
            (
              OutSignal     => DATAOUT,
              GlitchData    => DATAOUT_GlitchData,
              OutSignalName => "DATAOUT",
              OutTemp       => DATAOUT_viol,
              Paths         => (0 => (DATAOUT_zd'last_event,  tpd_IN_OUT_var,TRUE)),
              Mode          => VitalTransport,
              Xon           => Xon,
              MsgOn         => MsgOn,
              MsgSeverity   => WARNING
            );
        else
           VitalPathDelay01
             (
               OutSignal     => DATAOUT,
               GlitchData    => DATAOUT_GlitchData,
               OutSignalName => "DATAOUT",
               OutTemp       => DATAOUT_viol,
               Paths         => (0 => (ODATAIN_dly'last_event, tpd_ODATAIN_DATAOUT,TRUE),
                                 1 => (CLKIN_dly'last_event, tpd_CLKIN_DATAOUT,TRUE)),
               Mode          => VitalTransport,
               Xon           => Xon,
               MsgOn         => MsgOn,
               MsgSeverity   => WARNING
             );
        end if;
-----
        VitalPathDelay01
        (
          OutSignal     => CNTVALUEOUT(0),
          GlitchData    => CNTVALUEOUT0_GlitchData,
          OutSignalName => "CNTVALUEOUT(0)",
          OutTemp       => CNTVALUEOUT_zd(0),
          Paths         => (0 => (CINVCTRL_dly'last_event, tpd_CINVCTRL_CNTVALUEOUT(0),TRUE),
                            1 => (C_dly'last_event, tpd_C_CNTVALUEOUT(0),TRUE)),
          Mode          => VitalTransport,
          Xon           => Xon,
          MsgOn         => MsgOn,
          MsgSeverity   => WARNING
        );

        VitalPathDelay01
        (
          OutSignal     => CNTVALUEOUT(1),
          GlitchData    => CNTVALUEOUT1_GlitchData,
          OutSignalName => "CNTVALUEOUT(1)",
          OutTemp       => CNTVALUEOUT_zd(1),
          Paths         => (0 => (CINVCTRL_dly'last_event, tpd_CINVCTRL_CNTVALUEOUT(1),TRUE),
                            1 => (C_dly'last_event, tpd_C_CNTVALUEOUT(1),TRUE)),
          Mode          => VitalTransport,
          Xon           => Xon,
          MsgOn         => MsgOn,
          MsgSeverity   => WARNING
        );

        VitalPathDelay01
        (
          OutSignal     => CNTVALUEOUT(2),
          GlitchData    => CNTVALUEOUT2_GlitchData,
          OutSignalName => "CNTVALUEOUT(2)",
          OutTemp       => CNTVALUEOUT_zd(2),
          Paths         => (0 => (CINVCTRL_dly'last_event, tpd_CINVCTRL_CNTVALUEOUT(2),TRUE),
                            1 => (C_dly'last_event, tpd_C_CNTVALUEOUT(2),TRUE)),
          Mode          => VitalTransport,
          Xon           => Xon,
          MsgOn         => MsgOn,
          MsgSeverity   => WARNING
        );

        VitalPathDelay01
        (
          OutSignal     => CNTVALUEOUT(3),
          GlitchData    => CNTVALUEOUT3_GlitchData,
          OutSignalName => "CNTVALUEOUT(3)",
          OutTemp       => CNTVALUEOUT_zd(3),
          Paths         => (0 => (CINVCTRL_dly'last_event, tpd_CINVCTRL_CNTVALUEOUT(3),TRUE),
                            1 => (C_dly'last_event, tpd_C_CNTVALUEOUT(3),TRUE)),
          Mode          => VitalTransport,
          Xon           => Xon,
          MsgOn         => MsgOn,
          MsgSeverity   => WARNING
        );

        VitalPathDelay01
        (
          OutSignal     => CNTVALUEOUT(4),
          GlitchData    => CNTVALUEOUT4_GlitchData,
          OutSignalName => "CNTVALUEOUT(4)",
          OutTemp       => CNTVALUEOUT_zd(4),
          Paths         => (0 => (CINVCTRL_dly'last_event, tpd_CINVCTRL_CNTVALUEOUT(4),TRUE),
                            1 => (C_dly'last_event, tpd_C_CNTVALUEOUT(4),TRUE)),
          Mode          => VitalTransport,
          Xon           => Xon,
          MsgOn         => MsgOn,
          MsgSeverity   => WARNING
        );

     wait on DATAOUT_zd, CNTVALUEOUT_zd, Violation;
  end process prcs_output;


end X_ODELAYE2_V;

