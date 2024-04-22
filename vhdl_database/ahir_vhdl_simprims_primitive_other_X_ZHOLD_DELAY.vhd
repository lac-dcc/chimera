-------------------------------------------------------------------------------
-- Copyright (c) 1995/2010 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/     Version : 11.1
--  \   \         Description : Xilinx TEST ONLY Simulation Library Component
--  /   /                  Delay Element
-- /___/   /\     Filename : X_ZHOLD_DELAY.vhd
-- \   \  /  \    Timestamp : Thu Apr 29 17:11:57 PDT 2010
--  \___\/\___\
--
-- Revision:
--    04/29/10 - Initial version.
--    06/10/10 - 564856 -- Removed tap delay since the delay is annotated directly
--    04/29/11 - 607742 -- Changed IFF_IDELAY_VALUE to IFF_DELAY_VALUE
--    07/11/11 - 616630 -- Change/Combine attributes
-- End Revision

----- CELL X_ZHOLD_DELAY -----

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_arith.all;


library IEEE;
use IEEE.VITAL_Timing.all;

library simprim;
use simprim.Vcomponents.all;
use simprim.VPACKAGE.all;

entity X_ZHOLD_DELAY is

  generic(

      TimingChecksOn : boolean := true;
      InstancePath   : string  := "*";
      Xon            : boolean := true;
      MsgOn          : boolean := true;
      LOC            : string  := "UNPLACED";
      SIM_DELAY_D	: integer	:= 0;

--  VITAL input Pin path delay variables
      tipd_DLYIN	: VitalDelayType01 := (0 ps, 0 ps);

--  VITAL input -to-output path delay variables
      tpd_DLYIN_DLYFABRIC   	  : VitalDelayType01 := (100 ps, 100 ps);
      tpd_DLYIN_DLYIFF   	  : VitalDelayType01 := (100 ps, 100 ps);


--  VITAL input signal delay variables

      ticd_DLYIN      : VitalDelayType := 0.0 ps;
      ZHOLD_FABRIC              : string        := "DEFAULT";
      ZHOLD_IFF                 : string        := "DEFAULT"
      );

  port(
      DLYFABRIC	  : out std_ulogic;
      DLYIFF	  : out std_ulogic;

      DLYIN       : in  std_ulogic
      );

  attribute VITAL_LEVEL0 of
    X_ZHOLD_DELAY : entity is true;

end X_ZHOLD_DELAY;

architecture X_ZHOLD_DELAY_V OF X_ZHOLD_DELAY is

  attribute VITAL_LEVEL0 of
    X_ZHOLD_DELAY_V : architecture is true;
  TYPE VitalTimingDataArrayType IS ARRAY (NATURAL RANGE <>)
         OF VitalTimingDataType;


-------------------- constants --------------------------

  constant	MAX_DELAY_COUNT		: integer := 31;
  constant	MIN_DELAY_COUNT		: integer := 0;

  constant	MAX_IFF_DELAY_COUNT	: integer := 31;
  constant	MIN_IFF_DELAY_COUNT	: integer := 0;

  constant 	TapDelay        	: time := 200.0 ps; 

  signal	DLYIN_ipd		: std_ulogic := 'X';
  signal	DLYIN_dly		: std_ulogic := 'X';

  signal	DLYFABRIC_zd		: std_ulogic := 'X';
  signal	DLYIFF_zd		: std_ulogic := 'X';

  signal       idelay_count		: integer := 0;
  signal       iff_delay_count		: integer := 0;


-------------- variable declaration -------------------------



begin


  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  WireDelay : block
  begin

    VitalWireDelay (DLYIN_ipd,		DLYIN,		tipd_DLYIN);
  end block;

  SignalDelay : block
  begin
    VitalSignalDelay (DLYIN_dly,	DLYIN_ipd,	ticd_DLYIN);
  end block;

  --------------------
  --  BEHAVIOR SECTION
  --------------------


--####################################################################
--#####                     Initialize                           #####
--####################################################################
  prcs_init:process

  begin

     -------- ZHOLD_FABRIC check
     if(ZHOLD_FABRIC = "DEFAULT") then idelay_count <= 0;
     elsif(ZHOLD_FABRIC = "0")    then idelay_count <= 0;
     elsif(ZHOLD_FABRIC = "1")    then idelay_count <= 1;
     elsif(ZHOLD_FABRIC = "2")    then idelay_count <= 2;
     elsif(ZHOLD_FABRIC = "3")    then idelay_count <= 3;
     elsif(ZHOLD_FABRIC = "4")    then idelay_count <= 4;
     elsif(ZHOLD_FABRIC = "5")    then idelay_count <= 5;
     elsif(ZHOLD_FABRIC = "6")    then idelay_count <= 6;
     elsif(ZHOLD_FABRIC = "7")    then idelay_count <= 7;
     elsif(ZHOLD_FABRIC = "8")    then idelay_count <= 8;
     elsif(ZHOLD_FABRIC = "9")    then idelay_count <= 9;
     elsif(ZHOLD_FABRIC = "10")   then idelay_count <= 10;
     elsif(ZHOLD_FABRIC = "11")   then idelay_count <= 11;
     elsif(ZHOLD_FABRIC = "12")   then idelay_count <= 12;
     elsif(ZHOLD_FABRIC = "13")   then idelay_count <= 13;
     elsif(ZHOLD_FABRIC = "14")   then idelay_count <= 14;
     elsif(ZHOLD_FABRIC = "15")   then idelay_count <= 15;
     elsif(ZHOLD_FABRIC = "16")   then idelay_count <= 16;
     elsif(ZHOLD_FABRIC = "17")   then idelay_count <= 17;
     elsif(ZHOLD_FABRIC = "18")   then idelay_count <= 18;
     elsif(ZHOLD_FABRIC = "19")   then idelay_count <= 19;
     elsif(ZHOLD_FABRIC = "20")   then idelay_count <= 20;
     elsif(ZHOLD_FABRIC = "21")   then idelay_count <= 21;
     elsif(ZHOLD_FABRIC = "22")   then idelay_count <= 22;
     elsif(ZHOLD_FABRIC = "23")   then idelay_count <= 23;
     elsif(ZHOLD_FABRIC = "24")   then idelay_count <= 24;
     elsif(ZHOLD_FABRIC = "25")   then idelay_count <= 25;
     elsif(ZHOLD_FABRIC = "26")   then idelay_count <= 26;
     elsif(ZHOLD_FABRIC = "27")   then idelay_count <= 27;
     elsif(ZHOLD_FABRIC = "28")   then idelay_count <= 28;
     elsif(ZHOLD_FABRIC = "29")   then idelay_count <= 29;
     elsif(ZHOLD_FABRIC = "30")   then idelay_count <= 30;
     elsif(ZHOLD_FABRIC = "31")   then idelay_count <= 31;
     else
          assert false
          report "Attribute Syntax Error: The attribute ZHOLD_FABRIC on X_ZHOLD_DELAY must be set to DEFAULT, 0, ... 31 "
          severity Failure;
     end if;

     -------- ZHOLD_IFF check
     if(ZHOLD_IFF = "DEFAULT") then iff_delay_count <= 0;
     elsif(ZHOLD_IFF = "0")    then iff_delay_count <= 0;
     elsif(ZHOLD_IFF = "1")    then iff_delay_count <= 1;
     elsif(ZHOLD_IFF = "2")    then iff_delay_count <= 2;
     elsif(ZHOLD_IFF = "3")    then iff_delay_count <= 3;
     elsif(ZHOLD_IFF = "4")    then iff_delay_count <= 4;
     elsif(ZHOLD_IFF = "5")    then iff_delay_count <= 5;
     elsif(ZHOLD_IFF = "6")    then iff_delay_count <= 6;
     elsif(ZHOLD_IFF = "7")    then iff_delay_count <= 7;
     elsif(ZHOLD_IFF = "8")    then iff_delay_count <= 8;
     elsif(ZHOLD_IFF = "9")    then iff_delay_count <= 9;
     elsif(ZHOLD_IFF = "10")   then iff_delay_count <= 10;
     elsif(ZHOLD_IFF = "11")   then iff_delay_count <= 11;
     elsif(ZHOLD_IFF = "12")   then iff_delay_count <= 12;
     elsif(ZHOLD_IFF = "13")   then iff_delay_count <= 13;
     elsif(ZHOLD_IFF = "14")   then iff_delay_count <= 14;
     elsif(ZHOLD_IFF = "15")   then iff_delay_count <= 15;
     elsif(ZHOLD_IFF = "16")   then iff_delay_count <= 16;
     elsif(ZHOLD_IFF = "17")   then iff_delay_count <= 17;
     elsif(ZHOLD_IFF = "18")   then iff_delay_count <= 18;
     elsif(ZHOLD_IFF = "19")   then iff_delay_count <= 19;
     elsif(ZHOLD_IFF = "20")   then iff_delay_count <= 20;
     elsif(ZHOLD_IFF = "21")   then iff_delay_count <= 21;
     elsif(ZHOLD_IFF = "22")   then iff_delay_count <= 22;
     elsif(ZHOLD_IFF = "23")   then iff_delay_count <= 23;
     elsif(ZHOLD_IFF = "24")   then iff_delay_count <= 24;
     elsif(ZHOLD_IFF = "25")   then iff_delay_count <= 25;
     elsif(ZHOLD_IFF = "26")   then iff_delay_count <= 26;
     elsif(ZHOLD_IFF = "27")   then iff_delay_count <= 27;
     elsif(ZHOLD_IFF = "28")   then iff_delay_count <= 28;
     elsif(ZHOLD_IFF = "29")   then iff_delay_count <= 29;
     elsif(ZHOLD_IFF = "30")   then iff_delay_count <= 30;
     elsif(ZHOLD_IFF = "31")   then iff_delay_count <= 31;
     else
          assert false
          report "Attribute Syntax Error: The attribute ZHOLD_IFF on X_ZHOLD_DELAY must be set to DEFAULT, 0, ... 31 "
          severity Failure;
     end if;

     wait;
  end process prcs_init;
        
--####################################################################
--#####                      OUTPUT  TAP                         #####
--####################################################################

   DLYFABRIC_zd		<= DLYIN_dly;
   DLYIFF_zd		<= DLYIN_dly;


--####################################################################
--#####                           OUTPUT                         #####
--####################################################################
  prcs_output:process
  variable  DLYFABRIC_GlitchData : VitalGlitchDataType;
  variable  DLYIFF_GlitchData : VitalGlitchDataType;

  begin
     VitalPathDelay01
       (
         OutSignal     => DLYFABRIC,
         GlitchData    => DLYFABRIC_GlitchData,
         OutSignalName => "DLYFABRIC",
         OutTemp       => DLYFABRIC_zd,
         Paths         => (0 => (DLYFABRIC_zd'last_event, tpd_DLYIN_DLYFABRIC, TRUE)),
         Mode          => VitalTransport,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );

     VitalPathDelay01
       (
         OutSignal     => DLYIFF,
         GlitchData    => DLYIFF_GlitchData,
         OutSignalName => "DLYIFF",
         OutTemp       => DLYIFF_zd,
         Paths         => (0 => (DLYIFF_zd'last_event, tpd_DLYIN_DLYIFF, TRUE)),
         Mode          => VitalTransport,
         Xon           => Xon,
         MsgOn         => MsgOn,
         MsgSeverity   => WARNING
       );

     wait on DLYFABRIC_zd, DLYIFF_zd;
  end process prcs_output;


end X_ZHOLD_DELAY_V;
