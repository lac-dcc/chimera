-------------------------------------------------------------------------------
-- Copyright (c) 1995/2004 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                  Differential Signaling Input Buffer for GTs
-- /___/   /\     Filename : X_IBUFDS_GTXE1.vhd
-- \   \  /  \    Timestamp : Thu Sep  4 20:19:41 PDT 2008
--  \___\/\___\
--
-- Revision:
--    09/04/08 - Initial version.
-- End Revision


----- CELL X_IBUFDS_GTXE1 -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_IBUFDS_GTXE1 is

 generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";

--  VITAL input Pin path delay variables
      tipd_CEB  : VitalDelayType01 := (0 ps, 0 ps);
      tipd_I    : VitalDelayType01 := (0 ps, 0 ps);
      tipd_IB   : VitalDelayType01 := (0 ps, 0 ps);

--  VITAL clk-to-output path delay variables
      tpd_CEB_O     : VitalDelayType01 := (0 ps, 0 ps);
      tpd_CEB_ODIV2 : VitalDelayType01 := (0 ps, 0 ps);
      tpd_I_O      : VitalDelayType01 := (0 ps, 0 ps);
      tpd_I_ODIV2  : VitalDelayType01 := (0 ps, 0 ps);
      tpd_IB_O     : VitalDelayType01 := (0 ps, 0 ps);
      tpd_IB_ODIV2 : VitalDelayType01 := (0 ps, 0 ps);


--  VITAL async rest-to-output path delay variables

--  VITAL async set-to-output path delay variables

--  VITAL ticd & tisd variables
      tisd_CEB_I : VitalDelayType   := 0 ps;
      ticd_I     : VitalDelayType   := 0 ps;
      ticd_IB    : VitalDelayType   := 0 ps;

-- VITAL Setup/Hold delay variables

-- VITAL pulse width variables

-- VITAL period variables

      tperiod_I_posedge  : VitalDelayType := 0 ps;
      tperiod_IB_posedge : VitalDelayType := 0 ps;


      CLKCM_CFG	    : boolean       := TRUE;
      CLKRCV_TRST   : boolean       := TRUE;
      REFCLKOUT_DLY : bit_vector    := b"0000000000"
      );

  port(
      O       : out std_ulogic;
      ODIV2   : out std_ulogic;

      CEB     : in  std_ulogic;
      I       : in  std_ulogic;
      IB      : in  std_ulogic
    );

  attribute VITAL_LEVEL0 of
    X_IBUFDS_GTXE1 : entity is true;

end X_IBUFDS_GTXE1;

architecture X_IBUFDS_GTXE1_V OF X_IBUFDS_GTXE1 is

  attribute VITAL_LEVEL0 of
    X_IBUFDS_GTXE1_V : architecture is true;


  constant SYNC_PATH_DELAY : time := 100 ps;
  constant DIVIDE : integer := 2;

  signal CEB_ipd : std_ulogic := 'X';
  signal CEB_dly : std_ulogic := 'X';
  signal I_ipd  : std_ulogic := 'X';
  signal I_dly  : std_ulogic := 'X';
  signal IB_ipd : std_ulogic := 'X';
  signal IB_dly : std_ulogic := 'X';

  signal O_zd     : std_ulogic := 'X';
  signal ODIV2_zd : std_ulogic := 'X';



-- Counters
  signal ce_count         : std_logic_vector(2 downto 0) := (others => '0');
  signal edge_count       : std_logic_vector(2 downto 0) := (others => '0');

-- Flags
  signal allEqual         : std_ulogic := '0';


begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin
    VitalWireDelay (CEB_ipd,  CEB,   tipd_CEB);
    VitalWireDelay (I_ipd,    I,     tipd_I);
    VitalWireDelay (IB_ipd,   IB,    tipd_IB);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (CEB_dly,   CEB_ipd,  tisd_CEB_I);
    VitalSignalDelay (I_dly,     I_ipd,    ticd_I);
    VitalSignalDelay (IB_dly,    IB_ipd,   ticd_IB);

  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process
  variable AttrClkCmCfg_var             : std_ulogic := 'X';
  variable AttrClkRcvTrst_var           : std_ulogic := 'X';


  begin
-----------------------------------------------------------------
-------------------- CLKCM_CFG validity check -------------------
-----------------------------------------------------------------
      if(CLKCM_CFG = false) then
         AttrClkCmCfg_var := '0';
      elsif(CLKCM_CFG = true) then
         AttrClkCmCfg_var := '1';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " CLKCM_CFG ",
             EntityName => "/X_IBUFDS_GTXE1",
             GenericValue => CLKCM_CFG,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " TRUE or FALSE ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;

-----------------------------------------------------------------
-------------------- CLKRCV_TRST validity check -----------------
-----------------------------------------------------------------
      if(CLKRCV_TRST = false) then
         AttrClkRcvTrst_var := '0';
      elsif(CLKRCV_TRST = true) then
         AttrClkRcvTrst_var := '1';
      else
        GenericValueCheckMessage
          (  HeaderMsg  => " Attribute Syntax Warning ",
             GenericName => " CLKRCV_TRST ",
             EntityName => "/X_IBUFDS_GTXE1",
             GenericValue => CLKCM_CFG,
             Unit => "",
             ExpectedValueMsg => " The Legal values for this attribute are ",
             ExpectedGenericValue => " TRUE or FALSE ",
             TailMsg => "",
             MsgSeverity => Failure
         );
      end if;

     wait;
  end process prcs_init;

--####################################################################
--#####         Count the rising edges of the clk                #####
--####################################################################
  prcs_RiseEdgeCount:process(I_dly)
  begin
     if(rising_edge(I_dly)) then
         if(allEqual = '1') then
            edge_count <= "000";
         else
            edge_count <= edge_count + 1;
         end if;
     end if;
  end process prcs_RiseEdgeCount;

-- Generate synchronous reset after DIVIDE number of counts

  prcs_allEqual:process(edge_count)
  variable ce_count_var  : std_logic_vector(2 downto 0) :=  CONV_STD_LOGIC_VECTOR(DIVIDE -1, 3);
  begin
     if(edge_count = ce_count_var) then
        allEqual <= '1'; 
     else
        allEqual <= '0'; 
     end if;
  end process prcs_allEqual;

--####################################################################
--#####          Generate ODIV2                                  #####
--####################################################################

  prcs_SerdesStrobe:process(I_dly)
  begin
     if(rising_edge(I_dly)) then
        ODIV2_zd <= allEqual;
     end if;
  end process prcs_SerdesStrobe;
     
--####################################################################
--#####              Generate O                                  #####
--####################################################################

  O_zd <= I_dly and (not CEB_dly);
     

--####################################################################
--#####                    Timing Checks                         #####
--####################################################################
  prcs_tmngchk:process
    variable PInfo_I            : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_I            : std_ulogic          := '0';
    variable PInfo_IB           : VitalPeriodDataType := VitalPeriodDataInit;
    variable Pviol_IB           : std_ulogic          := '0';

  begin
    if (TimingChecksOn) then
      VitalPeriodPulseCheck (
        Violation            => Pviol_I,
        PeriodData           => PInfo_I,
        TestSignal           => I_dly,
        TestSignalName       => "I",
        TestDelay            => 0 ps,
        Period               => tperiod_I_posedge,
        PulseWidthHigh       => 0 ps,
        PulseWidthLow        => 0 ps,
        CheckEnabled         => TO_X01(CEB_dly) /= '0',
        HeaderMsg            => "/X_IBUFDS_GTXE1",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning
      );
      VitalPeriodPulseCheck (
        Violation            => Pviol_IB,
        PeriodData           => PInfo_IB,
        TestSignal           => IB_dly,
        TestSignalName       => "IB",
        TestDelay            => 0 ps,
        Period               => tperiod_IB_posedge,
        PulseWidthHigh       => 0 ps,
        PulseWidthLow        => 0 ps,
        CheckEnabled         => TO_X01(CEB_dly) /= '0',
        HeaderMsg            => "/X_IBUFDS_GTXE1",
        Xon                  => Xon,
        MsgOn                => true,
        MsgSeverity          => warning
      );
    end if; 
    wait on I_dly, IB_dly;
  end process prcs_tmngchk;
--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
    variable  O_GlitchData       : VitalGlitchDataType;
    variable  ODIV2_GlitchData   : VitalGlitchDataType;
  begin
     VitalPathDelay01
       (
         OutSignal     => O,
         GlitchData    => O_GlitchData,
         OutSignalName => "O",
         OutTemp       => O_zd,
         Paths         => (0 => (I_dly'last_event,   tpd_I_O, true),
                           1 => (IB_dly'last_event,  tpd_IB_O, true),
                           2 => (CEB_dly'last_event, tpd_CEB_O, true)),
         Mode          => VitalTransport,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );

     VitalPathDelay01
       (
         OutSignal     => ODIV2,
         GlitchData    => ODIV2_GlitchData,
         OutSignalName => "ODIV2",
         OutTemp       => ODIV2_zd,
         Paths         => (0 => (I_dly'last_event,   tpd_I_ODIV2, true),
                           1 => (IB_dly'last_event,  tpd_IB_ODIV2, true),
                           2 => (CEB_dly'last_event, tpd_CEB_ODIV2, true)),
         Mode          => VitalTransport,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );


    wait on O_zd, ODIV2_zd;

  end process prcs_output;


end X_IBUFDS_GTXE1_V;

